From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 30 Dec 2010 10:02:51 -0600
Subject: [Buildroot] [Bug 3007] kexec doesn't build: Missing regdef.h
	file
In-Reply-To: <20101228225917.F10AC8EE38@busybox.osuosl.org>
References: <bug-3007-163@https.bugs.busybox.net/>
	<20101228225917.F10AC8EE38@busybox.osuosl.org>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBDFA@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of bugzilla at busybox.net
> Sent: Tuesday, December 28, 2010 4:59 PM
> To: buildroot at uclibc.org
> Subject: [Buildroot] [Bug 3007] kexec doesn't build: Missing regdef.h
> file
> 
> https://bugs.busybox.net/show_bug.cgi?id=3007
> 
> --- Comment #1 from Andy Kennedy <andy.kennedy@adtran.com>  ---
> After further playing, I have found that for kexec to build properly,
> one needs
> to bring the regdef.h file from the Linux Kernel (in the case of mips
> that
> would be:  arch/mips/include/asm/regdef.h)  There are some interesting
> ifdef's
> around sections of the one that is under the toolchain included files.
> There
> are about 3 different versions of this file -- the one in the kernel
> source is
> the only one I can make work with kexec.
> 
> Andy
> 
> --
> Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
> ------- You are receiving this mail because: -------
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

The following patch is against Gustavo's latest toolchain_rebuild.


--- a/package/Makefile.package.in       2010-12-30 09:57:01.000000000
-0600
+++ b/package/Makefile.package.in       2010-12-30 00:47:21.000000000
-0600
@@ -260,6 +260,11 @@
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER =
$($(NOHOSTPKG)_NAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
        @$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)")
+ifeq ($(BR2_ARCH),"mips")
+       $(Q)if test "$($(NOHOSTPKG)_NAME)" == "kexec" ; then \
+         cp -f
output/toolchain/linux-$(BR2_DEFAULT_KERNEL_HEADERS)/arch/mips/include/a
sm/regdef.h $(@D)/kexec/arch/mips/include ; \
+       fi
+endif
        $(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR)
$($(PKG)_PATCH))
        $(Q)( \
        if test -d $($(PKG)_DIR_PREFIX)/$($(NOHOSTPKG)_NAME); then \



There's a lot of hard-coded links in it, but I don't know the whole
build system enough to use the environmental variables.

Gustavo -- if you want to "fix" this patch and plug it in to your
branch, that'd be great ;).


Andy
