From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 May 2011 10:18:46 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain/crosstool-NG: fix up ct-ng
	config file to saner defaults
In-Reply-To: <1306015542-5208-4-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Sun, 22 May 2011 00:05:42 +0200")
References: <1306015542-5208-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1306015542-5208-4-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87d3jb407t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Jacmet on IRC reported some build failures for different targets.
 Yann> They were of two kinds:
 Yann>  - missing/unknown stack unwinding support
 Yann>  - missing *_chk functions

 Yann> The first is about configure not being able to automagically determine
 Yann> if stack unwinding support is available for the target. The second is
 Yann> about fortified build forgetting to build the fortified functions.
 Yann> This applies to both glibc and eglibc.

 Yann> After some discussions on IRC with Jacmet, it appears that we can
 Yann> safely assume both of the following:
 Yann>  - virtually all targets of buildroot will have stack unwinding support
 Yann>  - we do not care about fortified builds (so far)

 Yann> So, update the bundled crosstool-NG .config file to saner defaults:
 Yann>  - force unwind support
 Yann>  - disable fortified builds

 Yann> Reported-by: Peter Korsgaard <jacmet@sunsite.dk>
 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
 Yann> ---
 Yann>  toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   12 ++++++++++++
 Yann>  1 files changed, 12 insertions(+), 0 deletions(-)

 Yann> diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 Yann> index b506651..8319fc3 100644
 Yann> --- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 Yann> +++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 Yann> @@ -328,6 +328,18 @@ $(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE) $(CONFIG_DIR)/.config
 Yann>  endif # LIBC is uClibc
 
 Yann>  #--------------
 Yann> +# glibc/eglibc specific options
 Yann> +ifeq ($(BR2_TOOLCHAIN_CTNG_glibc)$(BR2_TOOLCHAIN_CTNG_eglibc),y)
 Yann> +
 Yann> +# Force unwind support
 Yann> +CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_GLIBC_FORCE_UNWIND) is not set:\1=y:;
 Yann> +
 Yann> +# Force non-fortified build
 Yann> +CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_ENABLE_FORTIFIED_BUILD)=y:# \1 is not set:;

Does that build for you? For me it fails with:

sed -r -e ' s:^(CT_INSTALL_DIR_RO)=y:# \1 is not set:; s:^(|# )(CT_ARCH_[BL]E).*:# \2 is not set:; s:^# (CT_ARCH_LE) is not set:\1=y:; s:^(|# )(CT_ARCH_(32|64)).*:# \2 is not set:; s:^# (CT_ARCH_) is not set:\1=y:; s:^(CT_TARGET_VENDOR)=.*:\1="unknown":; s:^(CT_TARGET_ALIAS)=.*:\1="arm-linux":; s:^(CT_CC_PKGVERSION)="(.*)":\1="crosstool-NG 1.11.3 - buildroot 2011.05-rc1-00005-ge83c4f6":; s:^# (CT_ARCH_USE_MMU) is not set:\1=y:; s:^(CT_CC_LANG_CXX)=.*:# \1 is not set:; s:^(CT_ARCH_ARCH)=.*:\1="armv5te":; s:^(CT_ARCH_TUNE)=.*:\1="arm926ej-s":; s:^(CT_ARCH_FLOAT_HW)=y:# \1 is not set:; s:^# (CT_ARCH_FLOAT_SW) is not set:\1=y:; s:^(|# )(CT_THREADS_NONE).*:# \2 is not set:; s:^(|# )(CT_THREADS_LINUXTHREADS).*:# \2 is not set:; s:^(|# )(CT_THREADS_NPTL).*:# \2 is not set:; s:^(|# )(CT_THREADS_NPTL).*:\2=y:; s:^# (CT_LIBC_GLIBC_FORCE_UNWIND) is not set:\1=y:; s:^(CT_LIBC_ENABLE_FORTIFIED_BUILD)=y:' /home/peko/source/buildroot/output/build/crosstool-ng-1.11.3/.config

sed: -e expression #1, char 892: unterminated `s' command

E.G. the replace part of the 'Force non-fortified build' line gets
removed as # is the comment character in makefiles. The fix is simply to
use \#.

I'll fix that up when I commit.

-- 
Bye, Peter Korsgaard
