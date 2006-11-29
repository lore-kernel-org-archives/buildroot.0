From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 29 Nov 2006 10:00:19 +0100
Subject: [Buildroot] [PATCH] Upgrade mpg123 to 0.61
In-Reply-To: <1164770794.4016.77.camel@dv>
References: <1164770794.4016.77.camel@dv>
Message-ID: <20061129090019.GD26441@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 28, 2006 at 10:26:34PM -0500, Pavel Roskin wrote:
>mpg123 0.59r is unsuitable for crosscompiling due to its makefile
>organization.  Upgrade it to 0.61.  Download the package from the
>preferred SourceForge mirror.  Use configure script.  mpg123 is now in
>src directory.
>
>Index: package/mpg123/mpg123.mk
>===================================================================
>--- package/mpg123/mpg123.mk	(revision 16709)
>+++ package/mpg123/mpg123.mk	(working copy)
>@@ -4,14 +4,14 @@
> #
> #############################################################
> 
>-MPG123_VERSION=0.59r
>+MPG123_VERSION=0.61
> 
> # Don't alter below this line unless you (think) you know
> # what you are doing! Danger, Danger!
> 
> MPG123_SOURCE=mpg123-$(MPG123_VERSION).tar.gz
> MPG123_CAT:=$(ZCAT)
>-MPG123_SITE=http://www.mpg123.de/mpg123
>+MPG123_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
> MPG123_DIR=$(BUILD_DIR)/${shell basename $(MPG123_SOURCE) .tar.gz}

Can you perhaps do away with this shell hackery?

> MPG123_WORKDIR=$(BUILD_DIR)/mpg123-$(MPG123_VERSION)
> 
>@@ -22,13 +22,28 @@
> 	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> 	touch $(MPG123_DIR)/.unpacked
> 
>-$(MPG123_WORKDIR)/mpg123:	$(MPG123_DIR)/.unpacked
>+$(MPG123_DIR)/.configured: $(MPG123_DIR)/.unpacked
>+	(cd $(MPG123_DIR); rm -rf config.cache; \
>+		$(TARGET_CONFIGURE_OPTS) \
>+		CFLAGS="$(TARGET_CFLAGS)" \
>+		./configure \
>+		--target=$(GNU_TARGET_NAME) \
>+		--host=$(GNU_TARGET_NAME) \
>+		--build=$(GNU_HOST_NAME) \
>+		--prefix=/usr \
>+		--libexecdir=/usr/lib \
>+		--sysconfdir=/etc \
>+		--localstatedir=/var \

Does this want $(DISABLE_NLS) resp any other flags to disable eventual
bloat?

thanks,
>+	);
>+	touch $(MPG123_DIR)/.configured
>+
>+$(MPG123_WORKDIR)/src/mpg123:	$(MPG123_DIR)/.configured
> 	rm -f $@
>-	$(MAKE) CC=$(TARGET_CC) -C $(MPG123_WORKDIR) linux
>+	$(MAKE) -C $(MPG123_WORKDIR)
> 
>-$(MPG123_WORKDIR)/.installed: 	$(MPG123_WORKDIR)/mpg123
>+$(MPG123_WORKDIR)/.installed: 	$(MPG123_WORKDIR)/src/mpg123
> 	mkdir -p $(TARGET_DIR)/usr/bin
>-	cp -f $(MPG123_WORKDIR)/mpg123 $(TARGET_DIR)/usr/bin
>+	cp -f $(MPG123_WORKDIR)/src/mpg123 $(TARGET_DIR)/usr/bin
> 	$(STRIP) --strip-all $(TARGET_DIR)/usr/bin/mpg123
> 	touch $(MPG123_WORKDIR)/.installed
