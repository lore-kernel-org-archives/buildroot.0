From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 May 2015 00:01:02 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150506094236.114894a2@free-electrons.com>
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
Message-ID: <20150507000102.1c814d69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 May 2015 09:42:36 +0200, Thomas Petazzoni wrote:

> >       x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/45858c9754b8aa017a58f3f74463b28042fdf9cb/
> >      powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/c479c9a9f1ba2271ece2f316cc7b6c2c9d39e60d/
> 
> Weird stuff happening:
> 
> libtool:   error: unrecognised option: '-DHAVE_CONFIG_H'
> libtool:   error: unrecognised option: '-DHAVE_CONFIG_H'

I've analyzed this one. It happens when host-autoconf-archive is built
before snmpp. The problem is that snmpp defines and uses its own
ACX_PTHREAD m4 macro, and host-autoconf-archive as well. But they don't
behave in the same way: snmpp macro's define PTHREAD_CXX, but not
host-autoconf-archive's one. Then CXX is empty, which leads to the
above failure.

The exact same problem was solved by Romain on the ola package in
commit 884af65fd5ddc548f19a26162f905a32ef0b53b3. However, I am not too
happy with the solution: it consists in tweaking the ola configure.ac
script so that it can work with either the ola-provided ACX_PTHREAD
macro or the host-autoconf-archive provided ACX_PTHREAD macro.

I researched a bit, and it is apparently normal for the macros
in /usr/share/aclocal/ to take precedence over the ones defined in the
local m4/ directory.

My suggestion would therefore be to change host-autoconf-archive to
install in a path that isn't in the standard include path of
autoreconf/aclocal. This way, no package doing AUTORECONF = YES would
be "polluted" by the presence of host-autoconf-archive. And only those
few packages that actually need host-autoconf-archive can add the
relevant -I option to AUTORECONF_OPTS. I've tested that installing
host-autoconf-archive to a custom location works, but I haven't tested
the other part of the solution.

Thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
