From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Oct 2008 14:52:53 +0200
Subject: [Buildroot] [RFC] Avoid make distclean to remove packages
	from	rootfs
In-Reply-To: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
References: <e4c675870810220506q31952b43ta544bfbdcec64c4e@mail.gmail.com>
Message-ID: <20081022125253.GB25329@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 22, 2008 at 02:06:09PM +0200, Roberto A. Foglietta wrote:
>2008/10/21 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>> 2008/10/21 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
>>> Hi to all,
>>>
>>>  I never used buildroot before 5 days ago but it seems to me that once
>>> a package has been activated in menuconfig a way to remove it from
>>> rootfs is saving .configs, make distclean; make (i.e.: I compiled Xorg
>>> modular and then I move on tinyx but tinyx keyboard was not working
>>> because some incompatible craps remained on the rootfs).
>
> [cut]
>
>>  A solution could be:
>>
>>  1) make checks for previous .config and un-install all removed packages (*)
>>  2) make saves the current .config into
>> project_build_$ARCH/$project_name/previous.config
>>  3) people who lose some rootfs customization do it because they
>> choose to remove packages (their fault)
>>
>>  (*) supposing all packages have a make uninstall which correctly work
>> otherwise N patches would be delivered to achieve this result.
>>
>
> A proof of concept of the proposed general solution is attached as
>solution for bug report n.5564

First, bash scripts are not acceptable. The "binary" is something from
ulf.
>
> http://busybox.net/bugs/view.php?id=5564
>
> as you can see checkconfig.sh could be expanded to work on .config
>changes and acts accordingly

no, this is not the proper thing to do.

Your solution #1 is already done.
Solutiln #2 would be to just

index 0325132..19aa785 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -195,7 +195,7 @@ ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
 else
-	echo "CONFIG_INITRAMFS_SOURCE=\"\"" >> $(LINUX26_DIR)/.config
+	echo "# CONFIG_INITRAMFS_SOURCE is not set" >>
$(LINUX26_DIR)/.config
 endif
 ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
 	# precedence for a small initramfs


and your #3 is definitely not correct.

What you seem to be referring to above is that that if you unselect a
package, it is not automagically -clean and -dircleaned, IIUC.
Short of just rm -rf *_${YOURARCH}* && make, you could run the
respective -clean target. Note that alot of them do not cleanup properly
anyway, i.e. need improvement.
