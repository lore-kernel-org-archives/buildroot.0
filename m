From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 12:41:31 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libungif
In-Reply-To: <20070723082356.E77ACA6602@busybox.net>
References: <20070723082356.E77ACA6602@busybox.net>
Message-ID: <20070723104131.GC7044@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 01:23:56AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-23 01:23:54 -0700 (Mon, 23 Jul 2007)
>New Revision: 19203

>Added: trunk/buildroot/package/libungif/libungif.mk
>===================================================================
>--- trunk/buildroot/package/libungif/libungif.mk	                        (rev 0)
>+++ trunk/buildroot/package/libungif/libungif.mk	2007-07-23 08:23:54 UTC (rev 19203)
>@@ -0,0 +1,69 @@
>+#############################################################
>+#
>+# libungif
>+#
>+#############################################################
>+LIBUNGIF_VER:=4.1.4

again..

>+LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VER).tar.bz2
>+LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libungif/$(LIBUNGIF_SOURCE)
>+LIBUNGIF_DIR:=$(BUILD_DIR)/libungif-$(LIBUNGIF_VER)
>+LIBUNGIF_CAT:=$(BZCAT)
>+LIBUNGIF_BINARY:=libungif.so.$(LIBUNGIF_VER)
>+LIBUNGIF_TARGET_BINARY:=usr/lib/libungif.so
>+
>+$(DL_DIR)/$(LIBUNGIF_SOURCE):
>+	$(WGET) -P $(DL_DIR) $(LIBUNGIF_SITE)/$(LIBUNGIF_SOURCE)
>+
>+$(LIBUNGIF_DIR)/.unpacked: $(DL_DIR)/$(LIBUNGIF_SOURCE)
>+	$(LIBUNGIF_CAT) $(DL_DIR)/$(LIBUNGIF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>+	toolchain/patch-kernel.sh $(LIBUNGIF_DIR) package/libungif/ libungif-$(LIBUNGIF_VER)\*.patch\*
>+	$(CONFIG_UPDATE) $(LIBUNGIF_DIR)
>+	touch $@
>+
>+$(LIBUNGIF_DIR)/.configured: $(LIBUNGIF_DIR)/.unpacked
>+	(cd $(LIBUNGIF_DIR); rm -rf config.cache; \
>+		$(TARGET_CONFIGURE_OPTS) \
>+		CFLAGS="$(TARGET_CFLAGS)" \
>+		LDFLAGS="$(TARGET_LDFLAGS)" \

.. and again
>+		./configure \
>+		--target=$(GNU_TARGET_NAME) \
>+		--host=$(GNU_TARGET_NAME) \
>+		--build=$(GNU_HOST_NAME) \
>+		--sysconfdir=/etc \
>+		--enable-shared \
>+		--enable-static \
>+		--prefix=/usr \
>+		--without-x \
>+	);
>+	touch $@
