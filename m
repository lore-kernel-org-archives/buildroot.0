From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 12:25:52 +0200
Subject: [Buildroot] [PATCH] itop: new package
In-Reply-To: <20180329195247.24360-1-alexandre.belloni@bootlin.com> (Alexandre
 Belloni's message of "Thu, 29 Mar 2018 21:52:47 +0200")
References: <20180329195247.24360-1-alexandre.belloni@bootlin.com>
Message-ID: <87bmf57tcf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

 > itop is a simple top-like interrupt load monitor. It can be useful to
 > debug interrupt issues.

 > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

 > +++ b/package/itop/Config.in
 > @@ -0,0 +1,4 @@
 > +config BR2_PACKAGE_ITOP
 > +	bool "itop"
 > +	help
 > +	  itop is a simple top-like interrupt load monitor

No upstream URL? The Debian package refers to hunz.org, which seems to
have expired.

https://github.com/kargig/itop looks similar, but is written in perl.

 > +++ b/package/itop/itop.mk
 > @@ -0,0 +1,21 @@
 > +################################################################################
 > +#
 > +# itop
 > +#
 > +################################################################################
 > +
 > +ITOP_VERSION = 0.1
 > +ITOP_SITE = http://http.debian.net/debian/pool/main/i/itop
 > +ITOP_SOURCE = itop_$(ITOP_VERSION).orig.tar.gz

For packages in Debian we normally use snapshot.debian.org - E.G. see
sysvinit.mk. Looking at the changelog, it sounds like we should parhaps
include the Debian patches (the .diff.gz) for those fixes:

http://metadata.ftp-master.debian.org/changelogs/main/i/itop/itop_0.1-4_changelog


> +ITOP_LICENSE = GPL-2.0
 > +ITOP_LICENSE_FILES = COPYING
 > +
 > +define ITOP_BUILD_CMDS
 > +	(cd $(@D) && $(TARGET_CC) -o itop src/itop.c)

Please also add TARGET_CFLAGS and TARGET_LDFLAGS.

> +endef
 > +
 > +define ITOP_INSTALL_TARGET_CMDS
 > +	$(INSTALL) -m 0755 -D $(@D)/itop $(TARGET_DIR)/bin/itop

The Debian package installs into /usr/bin, any reason to put it in /bin?

-- 
Bye, Peter Korsgaard
