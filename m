From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 23:45:43 +0200
Subject: [Buildroot] [PATCH] ifstat: new package
In-Reply-To: <20190905160229.29645-1-francois.perrad@gadz.org>
References: <20190905160229.29645-1-francois.perrad@gadz.org>
Message-ID: <20190915234543.1aea9b8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Thu,  5 Sep 2019 18:02:29 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

The last release of this tool is from 2004. Do we really want yet
another network statistics tool that is unmaintained ?

Have you tried using "iftop" (already in Buildroot), or "netstat -i",
or iptraf-ng (already in Buildroot), or bmon (already in Buildroot),
or... see https://www.binarytides.com/linux-commands-monitor-network/.

> diff --git a/package/ifstat/0001-install-without-strip-flag.patch b/package/ifstat/0001-install-without-strip-flag.patch
> new file mode 100644
> index 000000000..217681f0a
> --- /dev/null
> +++ b/package/ifstat/0001-install-without-strip-flag.patch
> @@ -0,0 +1,26 @@
> +From 63533db706244d8b43e242349fcf32866ea10ab6 Mon Sep 17 00:00:00 2001
> +From: Francois Perrad <francois.perrad@gadz.org>
> +Date: Thu, 5 Sep 2019 17:11:53 +0200
> +Subject: [PATCH] install without strip flag
> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +---
> + Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 486fe3e..5d17383 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -66,7 +66,7 @@ install: install-$(TARGET) install- at LIBTARGET@
> + 
> + install-$(TARGET): $(TARGET)
> + 	$(INSTALL) -d -m 755 $(bindir)
> +-	$(INSTALL) -s -m 755 $(TARGET) $(bindir)/$(TARGET)
> ++	$(INSTALL) -m 755 $(TARGET) $(bindir)/$(TARGET)
> + 	$(INSTALL) -d -m 755 $(mandir)/man1
> + 	$(INSTALL) -m 644 ifstat.1 $(mandir)/man1/ifstat.1

Actually, this should be fixed to also use $(DESTDIR)$(bindir) instead
of $(bindir). Ditto for the man page.

> diff --git a/package/ifstat/ifstat.mk b/package/ifstat/ifstat.mk
> new file mode 100644
> index 000000000..9a911739c
> --- /dev/null
> +++ b/package/ifstat/ifstat.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# ifstat
> +#
> +################################################################################
> +
> +IFSTAT_VERSION = 1.1
> +IFSTAT_SITE = http://gael.roualland.free.fr/ifstat
> +IFSTAT_LICENSE = GPL

The license is GPL-2.0+

> +IFSTAT_LICENSE_FILES = COPYING
> +
> +IFSTAT_CONF_OPTS = --prefix=$(TARGET_DIR)/usr --exec_prefix=$(TARGET_DIR)/usr

If you fix the Makefile.in to use $(DESTDIR), then the default
autotools infra will work. Also, the option is normally --exec-prefix,
not --exec_prefix.

But again, I'm wondering about the usefulness of packaging a tool that
hasn't been maintained since 2004, while there are plenty of other
tools doing the same job.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
