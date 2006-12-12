From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 12 Dec 2006 17:59:32 +0100
Subject: [Buildroot] [PATCH] Add libraw1394 to buildroot
In-Reply-To: <20061212163513.GA1105@tuxedo.home.lan>
References: <20061212163513.GA1105@tuxedo.home.lan>
Message-ID: <20061212165932.GA32047@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 12, 2006 at 05:35:14PM +0100, Lars Munch wrote:
>Hi all
>
>The attached patch adds libraw1394-1.2.1 to buildroot. libraw1394 is a
>library for direct access to IEEE 1394 bus.

A few comments below..
>
>Please apply.
>
>-- Lars Munch
>
>

>Index: buildroot/package/libraw1394/libraw1394.mk
>===================================================================
>--- buildroot/package/libraw1394/libraw1394.mk	(revision 0)
>+++ buildroot/package/libraw1394/libraw1394.mk	(revision 0)
>@@ -0,0 +1,60 @@
>+#############################################################
>+#
>+# libraw1394
>+#
>+#############################################################
>+
>+LIBRAW1394_VERSION:=1.2.1
>+LIBRAW1394_SOURCE:=libraw1394-$(LIBRAW1394_VERSION).tar.gz
>+LIBRAW1394_SITE:=http://www.linux1394.org/dl
>+LIBRAW1394_DIR:=$(BUILD_DIR)/libraw1394-$(LIBRAW1394_VERSION)
>+
>+$(DL_DIR)/$(LIBRAW1394_SOURCE):
>+	$(WGET) -P $(DL_DIR) $(LIBRAW1394_SITE)/$(LIBRAW1394_SOURCE)
>+
>+$(LIBRAW1394_DIR)/.source: $(DL_DIR)/$(LIBRAW1394_SOURCE)
>+	$(ZCAT) $(DL_DIR)/$(LIBRAW1394_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>+	touch $(LIBRAW1394_DIR)/.source
>+
>+$(LIBRAW1394_DIR)/.configured: $(LIBRAW1394_DIR)/.source
>+	(cd $(LIBRAW1394_DIR); \
>+		$(TARGET_CONFIGURE_OPTS) \
>+		CFLAGS="$(TARGET_CFLAGS)" \

Please make sure to use the HOSTCC and/or HOSTCXX the user gave us.
I don't have plain "gcc" nor "g++", but have to specify
make HOSTCC=... HOSTCXX=...
so packages that need the host-compiler pickup the right compiler.

I didn't look if libraw1394 is umong these packages, so this might not
apply for this particular package. Please double-check.

>+		./configure \
>+			--target=$(GNU_TARGET_NAME) \
>+			--host=$(GNU_TARGET_NAME) \
>+			--build=$(GNU_HOST_NAME) \
>+			--prefix=$(STAGING_DIR) \
>+	);
>+	touch $(LIBRAW1394_DIR)/.configured;
>+
>+$(LIBRAW1394_DIR)/.compiled: $(LIBRAW1394_DIR)/.configured
>+	$(MAKE) -C $(LIBRAW1394_DIR)
>+	touch $(LIBRAW1394_DIR)/.compiled
>+
>+$(STAGING_DIR)/lib/libraw1394.so: $(LIBRAW1394_DIR)/.compiled
>+	make -C $(LIBRAW1394_DIR)/src install
>+
>+$(TARGET_DIR)/usr/lib/libraw1394.so: $(STAGING_DIR)/lib/libraw1394.so
>+	cp -dpf $(STAGING_DIR)/lib/libraw1394.so* $(TARGET_DIR)/usr/lib/
>+
>+libraw1394: uclibc $(TARGET_DIR)/usr/lib/libraw1394.so
>+
>+libraw1394-source: $(DL_DIR)/$(LIBRAW1394_SOURCE)
>+
>+libraw1394-clean:
>+	rm $(TARGET_DIR)/usr/lib/libraw1394.so*
>+	-$(MAKE) -C $(LIBRAW1394_DIR) clean

Can we please settle on the convention that
foo-clean uninstalls itself from the target-dir?

TIA,
