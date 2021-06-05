From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Jun 2021 23:00:16 +0200
Subject: [Buildroot] [PATCH] scipts/autobuild-run: properly import
 urllib2.URLError
Message-ID: <20210605210016.1157351-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 37766e9 (scripts/autobuild-run: add a retry loop to not fail on
urllib URLError) introduced an import of URLError, but that raises
exceptions in both python2 and python3:

    $ python2 -c 'import urllib2.URLError as URLError'
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
    ImportError: No module named URLError

    $ python3 -c 'import urllib.error.URLError as URLError'
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
    ModuleNotFoundError: No module named 'urllib.error.URLError'; 'urllib.error' is not a package

The working solution is to import from:

    $ python2 -c 'from urllib2 import URLError; raise URLError(None)'
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
    urllib2.URLError: <urlopen error None>

    $ python3 -c 'from urllib.error import URLError; raise URLError(None)'
    Traceback (most recent call last):
      File "<string>", line 1, in <module>
    urllib.error.URLError: <urlopen error None>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 84e4d40..346928f 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -151,12 +151,12 @@ if sys.hexversion >= 0x3000000:
     import configparser
     import urllib.request as _urllib
     import urllib.parse as urlparse
-    import urllib.error.URLError as URLError
+    from urllib.error import URLError
 else:
     import ConfigParser as configparser
     import urllib2 as _urllib
     import urlparse
-    import urllib2.URLError as URLError
+    from urllib2 import URLError
 
 urlopen = _urllib.urlopen
 urlopen_closing = lambda uri: contextlib.closing(urlopen(uri))
-- 
2.25.1
