From: M. Edward (Ed) Borasky <znmeb@cesmail.net>
Date: Wed, 22 Nov 2006 13:09:27 -0800
Subject: [Buildroot] svn commit: trunk/buildroot/target:  cpio
In-Reply-To: <20061122191059.B1AFF485C5@busybox.net>
References: <20061122191059.B1AFF485C5@busybox.net>
Message-ID: <4564BC87.50704@cesmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aldot at uclibc.org wrote:
> Author: aldot
> Date: 2006-11-22 11:10:59 -0800 (Wed, 22 Nov 2006)
> New Revision: 16631
>
> Log:
> - add a simple cpio target, to be used with an initramfs.
>   Thanks to Goetz Bock
>
>
> Added:
>    trunk/buildroot/target/cpio/
>    trunk/buildroot/target/cpio/Config.in
>    trunk/buildroot/target/cpio/cpioroot.mk
>
> Modified:
>    trunk/buildroot/target/Config.in
>
>
> Changeset:
> Modified: trunk/buildroot/target/Config.in
> ===================================================================
> --- trunk/buildroot/target/Config.in	2006-11-22 18:40:06 UTC (rev 16630)
> +++ trunk/buildroot/target/Config.in	2006-11-22 19:10:59 UTC (rev 16631)
> @@ -8,6 +8,7 @@
>  source "target/jffs2/Config.in"
>  source "target/squashfs/Config.in"
>  source "target/tar/Config.in"
> +source "target/cpio/Config.in"
>  source "target/iso9660/Config.in"
>  
>  comment "bootloader for target device"
>
> Added: trunk/buildroot/target/cpio/Config.in
> ===================================================================
> --- trunk/buildroot/target/cpio/Config.in	2006-11-22 18:40:06 UTC (rev 16630)
> +++ trunk/buildroot/target/cpio/Config.in	2006-11-22 19:10:59 UTC (rev 16631)
> @@ -0,0 +1,6 @@
> +config BR2_TARGET_ROOTFS_CPIO
> +       bool "cpio the root filesystem"
> +       default n
> +       help
> +         Build a cpio archive of the root filesystem
> +
>
> Added: trunk/buildroot/target/cpio/cpioroot.mk
> ===================================================================
> --- trunk/buildroot/target/cpio/cpioroot.mk	2006-11-22 18:40:06 UTC (rev 16630)
> +++ trunk/buildroot/target/cpio/cpioroot.mk	2006-11-22 19:10:59 UTC (rev 16631)
> @@ -0,0 +1,45 @@
> +#############################################################
> +#
> +# cpio to archive target filesystem
> +#
> +#############################################################
> +
> +CPIO_TARGET:=$(IMAGE).cpio
> +
> +cpioroot-init:
> +       ln -s sbin/init $(TARGET_DIR)/init
> +
> +cpioroot: host-fakeroot makedevs cpioroot-init
> +       - at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
> +       @rm -rf $(TARGET_DIR)/usr/man
> +       @rm -rf $(TARGET_DIR)/usr/info
> +       -/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
> +       # Use fakeroot to pretend all target binaries are owned by root
> +       rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
> +       touch $(STAGING_DIR)/.fakeroot.00000
> +       cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
> +       echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
> +       # Use fakeroot to pretend to create all needed device nodes
> +       echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
> +               >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
> +       # Use fakeroot so tar believes the previous fakery
> +       echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_TARGET)" \
> +               >> $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
> +       chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
> +       $(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
> +       #- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(CPIO_TARGET))
> +
> +cpioroot-source:
> +
> +cpioroot-clean:
> +
> +cpioroot-dirclean:
> +
> +#############################################################
> +#
> +# Toplevel Makefile options
> +#
> +#############################################################
> +ifeq ($(strip $(BR2_TARGET_ROOTFS_CPIO)),y)
> +TARGETS+=cpioroot
> +endif
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>   
See bug http://bugs.uclibc.org/view.php?id=1099

I posted a new version of "cpioroot.mk" -- the one that downloaded a few 
minutes ago has leading spaces in a place that snarls "make".

-- 
M. Edward (Ed) Borasky, FBG, AB, PTA, PGS, MS, MNLP, NST, ACMC(P)
http://borasky-research.blogspot.com/

If God had meant for carrots to be eaten cooked, He would have given rabbits fire.
