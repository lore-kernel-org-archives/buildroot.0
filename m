From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Wed, 7 Jul 2010 16:19:44 +0200
Subject: [Buildroot] Crosstool/Buildroot integration issue
Message-ID: <BLU0-SMTP11A24568AF672F1DE458A4E7B30@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas

I know you've been working on improving the integration of crosstool and buildroot recently.  Thank you - I really appreciate it, but I'd like to point out an extra detail that may have been missed so far, and looking at toolchain/external-toolchain/ext-tool.mk in the git trunk, I think this still is missing.

Crosstool generates character set libraries in the 'sys-root/usr/lib/gconv' folder, but these are not being copied across into the target folder when all the other libraries are copied.  These means that certain applications that rely on these libraries don't function correctly.  It's a simple two line patch to the bottom of ext-tool.mk:
 
  mkdir -p $(TARGET_DIR)/lib
+ mkdir -p $(TARGET_DIR)/usr/lib
  @echo "Copy external toolchain libraries to target..."
  $(Q)for libs in $(LIB_EXTERNAL_LIBS); do \
  $(call copy_toolchain_lib_root,$(ARCH_SYSROOT_DIR),$$libs,/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
  done
  $(Q)for libs in $(USR_LIB_EXTERNAL_LIBS); do \
  $(call copy_toolchain_lib_root,$(ARCH_SYSROOT_DIR),$$libs,/usr/lib,$(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
+ $(Q)cp -dr $(ARCH_SYSROOT_DIR)/usr/lib/gconv $(TARGET_DIR)/usr/lib
  done
  @echo "Copy external toolchain sysroot to staging..."
  $(Q)$(call copy_toolchain_sysroot,$(SYSROOT_DIR),$(ARCH_SYSROOT_DIR),$(ARCH_SUBDIR))

I'm afraid I've not attached it as a proper patch since I'm not at my desk currently and can't form an "official" git patch.  However, if you wish me to, then let me know and I will be happy to do so.

Thanks
Andy
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100707/2ae46a5f/attachment.html>
