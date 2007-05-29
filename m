From: David Claffey <david.claffey@rcn.com>
Date: Tue, 29 May 2007 16:52:27 -0400
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <20070512103155.GF24585@aon.at>
References: <46432A7D.6050808@rcn.com> <46433B79.50101@rcn.com>
	<1178893909.11554.75.camel@localhost.localdomain>
	<20070511154059.GA4710@aon.at> <46449A01.6010701@rcn.com>
	<20070512103155.GF24585@aon.at>
Message-ID: <465C928B.3040801@rcn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Can you please try to apply
> $(BR2_BOARD_PATH)/kernel-patches/linux-$(LINUX_HEADERS_VERSION)*.patch*
> in kernel-headers-new.makefile and after successful verification send
> the patch to me? TIA

Finally got a chance to do a fresh build. This simple patch now pulls in custom
device-specific kernel patches at kernel-header build time, as you suggested.
However, it differs from target/linux26.mk where the patch files are not
filtered by "linux-$(LINUX_HEADERS_VERSION)*".  Not sure if this will affect
other builds.

--- toolchain/kernel-headers/kernel-headers-new.makefile        (revision 18607)
+++ toolchain/kernel-headers/kernel-headers-new.makefile        (working copy)
@@ -30,6 +30,7 @@
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
toolchain/kernel-headers \
                linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
+       toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
$(BR2_BOARD_PATH)/kernel-patches linux-$(LINUX_HEADERS_VERSION)*.patch{,.gz,.bz2}
 ifeq ($(BR2_PACKAGE_OPENSWAN),y)
        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
                linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
