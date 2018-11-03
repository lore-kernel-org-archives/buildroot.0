From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:56:00 +0100
Subject: [Buildroot] [PATCH 1/1] qt5base: fix build on Aarch64_be a53
In-Reply-To: <20181020125851.23827-1-fontaine.fabrice@gmail.com>
References: <20181020125851.23827-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103145600.689bfa7a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat, 20 Oct 2018 14:58:51 +0200, Fabrice Fontaine wrote:
> Build on Aarch64_be a53 with binutils gold linker in version 2.28 fails:
> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64_be-linux-gnu/7.3.1/../../../../aarch64_be-linux-gnu/bin/ld.gold: internal error in update_erratum_insn, at /home/tcwg-buildslave/workspace/tcwg-make-release/builder_arch/amd64/label/tcwg-x86_64-build/target/aarch64_be-linux-gnu/snapshots/binutils-gdb.git~users~linaro~binutils-2_28-branch/gold/aarch64.cc:998
> 
> This error is related to 843419 erratum:
>  - https://lore.kernel.org/patchwork/patch/847483/
>  - http://sourceware-org.1504.n7.nabble.com/PATCH-gold-Fix-aarch64-fix-errata-and-relocate-erratum-stubs-internal-error-td465738.html
> 
> Issue is that old versions of GNU gold are known to produce broken code
> with --fix-cortex-a53-843419 as explained in:
>  - https://sourceware.org/ml/binutils-cvs/2015-06/msg00188.html
>  - https://sourceware.org/bugzilla/show_bug.cgi?id=21491
> 
> Issue has been fixed in:
>  - https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e70c0b5f07daf63474e805f8d0a45152fcd60468
> 
> We don't know if ARM64_ERRATUM_843419 is enabled or disabled when
> we're using GNU gold so we don't know if we have to pass
> --fix-cortex-a53-843419 or --no-fix-cortex-a53-843419 to the linker.
> 
> We don't know either what is the version of binutils used by an external
> toolchain.
> 
> So, disable gold linker through the -no-use-gold-linker option of the
> configure script to fix the issue
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/eb55bf44622697039a4ced510ee2d45b950d0a08
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index ab2b883fc4..d3c6c31d45 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -27,6 +27,12 @@ QT5BASE_CONFIGURE_OPTS += \
>  	-no-pch \
>  	-shared
>  
> +# internal error in update_erratum_insn on Aarch64 a53 with gold before
> +# binutils 2.29: https://sourceware.org/bugzilla/show_bug.cgi?id=21491
> +ifeq ($(BR2_aarch64_be)$(BR2_cortex_a53)$(BR2_TOOLCHAIN_USES_GLIBC),yyy)

I have a few questions:

 - I'm not sure what makes this bug specific to AArch64 Big Endian.
   Reading the links you pointed in the commit log, it seems like a
   generic AArch64 bug, which could affect both LE and BE
   configurations. Did I miss something ?

 - What makes this bug specific to glibc ?

Overall, I think we should instead:

 - Introduce a BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21491 hidden option in
   toolchain/Config.in, next to BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
   that we already have.

 - Select this option from the known external toolchains that are
   affected by the issue, and in package/binutils/Config.in.host for
   all affected binutils versions.

And then use that in qt5base.mk to work around the problem.

Of course, this would leave users of custom external toolchains out in
the blue, but it is already the case with
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615 anyway. Perhaps we will have to
ask for the binutils version used in custom external toolchains, if
this sort of issue annoys too many people.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
