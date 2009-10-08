From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Oct 2009 19:45:44 +0200
Subject: [Buildroot] Patch: parted support
In-Reply-To: <20091008153036.GV25852@moomers.org>
References: <20091008153036.GV25852@moomers.org>
Message-ID: <20091008174543.GA2266@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 08, 2009 at 10:30:36AM -0500, Igor Serebryany wrote:
>This patch adds GNU parted to buildroot. It's against the 2009.08
>release.  The makefile could probaby be improved significantly, for
>instance enabling readline support if it's present in buildroot. But it
>works for now, and I've tested it under i686 and x86_64.
>
>Most of the credit should go to Marco Lazzarotto (m.lazzarotto at
>robox.it) who originally wrote the makefile. I simply modified it to use
>the latest version.
>
>To apply: "cd buildroot-2009.08; patch -p1 < parted.patch".
>
>--Igor

>diff -rpuN buildroot-2009.08/package/Config.in buildroot-2009.08.new/package/Config.in
>--- buildroot-2009.08/package/Config.in	2009-09-01 03:44:24.000000000 -0500
>+++ buildroot-2009.08.new/package/Config.in	2009-10-08 09:56:23.000000000 -0500
>@@ -264,6 +264,7 @@ source "package/memtester/Config.in"
> source "package/mtd/Config.in"
> source "package/ntfs-3g/Config.in"
> source "package/ntfsprogs/Config.in"
>+source "package/parted/Config.in"
> source "package/pciutils/Config.in"
> source "package/pcmcia/Config.in"
> source "package/setserial/Config.in"
>diff -rpuN buildroot-2009.08/package/parted/Config.in buildroot-2009.08.new/package/parted/Config.in
>--- buildroot-2009.08/package/parted/Config.in	1969-12-31 18:00:00.000000000 -0600
>+++ buildroot-2009.08.new/package/parted/Config.in	2009-10-08 09:55:48.000000000 -0500
>@@ -0,0 +1,6 @@
>+config BR2_PACKAGE_PARTED
>+	bool "parted"
>+	default n
>+	help
>+		GNU parted
>+		http://ftp.gnu.org/gnu/parted
>diff -rpuN buildroot-2009.08/package/parted/parted.mk buildroot-2009.08.new/package/parted/parted.mk
>--- buildroot-2009.08/package/parted/parted.mk	1969-12-31 18:00:00.000000000 -0600
>+++ buildroot-2009.08.new/package/parted/parted.mk	2009-10-08 09:55:48.000000000 -0500
>@@ -0,0 +1,70 @@
>+#############################################################
>+#
>+# parted
>+#
>+#############################################################
>+PARTED_VERSION:=1.9.0

nowadays packages have to be written differently, like (completely
untested):
cat >package/parted/parted.mk<<EOF
#############################################################
#
# parted
#
#############################################################

PARTED_VERSION:=1.9.0
PARTED_SOURCE:=parted-$(PARTED_VERSION).tar.gz
PARTED_SITE:=$(BR2_GNU_MIRROR)/parted
PARTED_CONF_OPT=$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
ifeq ($(BR2_ENABLE_DEBUG),y)
PARTED_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR)
INSTALLCMD='./install-sh -c' \
			  install
else
PARTED_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR)
INSTALLCMD='./install-sh -c' \
			  STRIPPROG="$(TARGET_STRIP)" install-strip
endif
PARTED_CONF_OPT:= \
	$(if $(BR2_PACKAGE_READLINE),,--without-readline) \
	--disable-dynamic-loading \
	--without-included-regex

$(eval $(call AUTOTARGETS,package,parted))
EOF

Can you please try to use this type of makefile?
See package/rsync/rsync.mk and others as examples.

TIA,

>+PARTED_SOURCE:=parted-$(PARTED_VERSION).tar.gz
>+PARTED_SITE:=http://ftp.gnu.org/gnu/parted/
>+PARTED_DIR:=$(BUILD_DIR)/parted-$(PARTED_VERSION)
>+PARTED_BINARY:=parted/parted
>+PARTED_TARGET_BINARY:=sbin/parted
>+PARTED_COMPILE_OPT:=--without-readline --disable-dynamic-loading --disable-nls --without-included-regex --disable-shared
>+
>+$(DL_DIR)/$(PARTED_SOURCE):
>+	$(WGET) -P $(DL_DIR) $(PARTED_SITE)/$(PARTED_SOURCE)
>+
>+$(PARTED_DIR)/.source: $(DL_DIR)/$(PARTED_SOURCE)
>+	$(ZCAT) $(DL_DIR)/$(PARTED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>+	touch $@
>+	
>+parted-source: $(DL_DIR)/$(PARTED_SOURCE)
>+
>+$(PARTED_DIR)/.unpacked: $(DL_DIR)/$(PARTED_SOURCE)
>+	$(ZCAT) $(DL_DIR)/$(PARTED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>+	toolchain/patch-kernel.sh $(PARTED_DIR) package/parted/ parted\*.patch
>+	touch $@
>+
>+$(PARTED_DIR)/.configured: $(PARTED_DIR)/.unpacked
>+	(cd $(PARTED_DIR); rm -rf config.cache; \
>+		$(TARGET_CONFIGURE_OPTS) \
>+		$(TARGET_CONFIGURE_ARGS) \
>+		CFLAGS="$(TARGET_CFLAGS)" \
>+		./configure \
>+		--target=$(GNU_TARGET_NAME) \
>+		--host=$(GNU_TARGET_NAME) \
>+		--build=$(GNU_HOST_NAME) \
>+		--prefix=/ \
>+		--sbindir=/sbin \
>+		$(PARTED_COMPILE_OPT) \
>+		)
>+		touch $@
>+
>+$(PARTED_DIR)/$(PARTED_BINARY): $(PARTED_DIR)/.configured
>+	$(MAKE) CC=$(TARGET_CC) -C $(PARTED_DIR)
>+
>+$(TARGET_DIR)/$(PARTED_TARGET_BINARY): $(PARTED_DIR)/$(PARTED_BINARY)
>+	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) -C $(PARTED_DIR) install-exec
>+	rm -rf $(TARGET_DIR)/usr/man
>+	rm -rf $(TARGET_DIR)/usr/include
>+
>+parted: uclibc e2fsprogs $(TARGET_DIR)/$(PARTED_TARGET_BINARY)
>+
>+parted-source: $(DL_DIR)/$(PARTED_SOURCE)
>+
>+parted-clean:
>+	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) -C $(PARTED_DIR) uninstall
>+	-$(MAKE) -C $(PARTED_DIR) clean
>+
>+parted-dirclean:
>+	rm -rf $(PARTED_DIR)
>+
>+#############################################################
>+#
>+# Toplevel Makefile options
>+#
>+#############################################################
>+
>+ifeq ($(strip $(BR2_PACKAGE_PARTED)),y)
>+TARGETS+=parted
>+endif
