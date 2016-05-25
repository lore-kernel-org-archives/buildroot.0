From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 25 May 2016 10:38:11 +0200
Subject: [Buildroot] Bug 8856 analysis
Message-ID: <CAGm1_ksSwJkpo=GbbWSgaEY6CiXKSPbNSaLEUhY37ZZTeFpfqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

bug URL: https://bugs.busybox.net/show_bug.cgi?id=8856

as soon as I've seen this bug, I've asked Charles, under what
circumstances he discovered this issue. It turned out, that Charles
was trying to add python-circus package to BR. Circus is a process
manager and has a web management GUI, that uses tornado as web server.
And Python 2 has been chosen as an interpreter.

I've installed circus myself and saw the problem. circusd
uses following code:

#!/usr/bin/python
# EASY-INSTALL-ENTRY-SCRIPT: 'circus==0.13.0','console_scripts','circusd'
__requires__ = 'circus==0.13.0'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('circus==0.13.0', 'console_scripts', 'circusd')()
    )

This code checks package requirements of all needed Python packages at
run-time. Tornado itself is working without backports.ssl-* package.
In Python 3.4 there
are no problems, as backports.ssl-* is required only for Python < 3.2
(tornado's setup.py). This behavior is now fixed in [1].

This is tornados code for handling certifi and match-hostname stuff:

try:
    import ssl
except ImportError:
    # ssl is not available on Google App Engine
    ssl = None

try:
    import certifi
except ImportError:
    # certifi is optional as long as we have ssl.create_default_context.
    if ssl is None or hasattr(ssl, 'create_default_context'):
        certifi = None
    else:
        raise

if PY3:
    xrange = range

if hasattr(ssl, 'match_hostname') and hasattr(ssl,
'CertificateError'):  # python 3.2+
    ssl_match_hostname = ssl.match_hostname
    SSLCertificateError = ssl.CertificateError
elif ssl is None:
    ssl_match_hostname = SSLCertificateError = None  # type: ignore
else:
    import backports.ssl_match_hostname
    ssl_match_hostname = backports.ssl_match_hostname.match_hostname
    SSLCertificateError =
backports.ssl_match_hostname.CertificateError  # type: ignore

As you can see, it is all optional. python-certifi is still in
required section though with following comment:

    if sys.version_info < (3, 4):
        install_requires.append('singledispatch')
        # Certifi is also optional on 2.7.9+, although making our dependencies
        # conditional on micro version numbers seems like a bad idea
        # until we have more declarative metadata.
        install_requires.append('certifi')

So I suggest following fix:

1. add [1] to BR. This would eleiminate the need for ssl-hostname
backport package, as this functionality is already implemented in both
Python versions and it is not even used in python-circus
2. select python-certifi for both Python 2 and 3. It is rather small
and it is already in BR
3. now python-circus can be used in both environments

[1] https://github.com/tornadoweb/tornado/commit/24e7d3d1526ad915887062a8463dbd200ef97958

Yegor
