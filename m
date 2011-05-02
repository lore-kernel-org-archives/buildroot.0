From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 May 2011 21:15:27 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: bump gcc 4.5 series to
	verion 4.5.3
In-Reply-To: <1304359982-15984-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Mon, 2 May 2011 15:13:01 -0300")
References: <1304359982-15984-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8739kwud68.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

 Gustavo> ---
 Gustavo>  toolchain/gcc/4.5.2/850-arm-pr44392.patch          |   70 --------------------
 Gustavo>  .../gcc/{4.5.2 => 4.5.3}/100-uclibc-conf.patch     |    0
 Gustavo>  .../{4.5.2 => 4.5.3}/301-missing-execinfo_h.patch  |    0
 Gustavo>  .../gcc/{4.5.2 => 4.5.3}/302-c99-snprintf.patch    |    0
 Gustavo>  .../305-libmudflap-susv3-legacy.patch              |    0
 Gustavo>  .../810-arm-softfloat-libgcc.patch                 |    0
 Gustavo>  .../{4.5.2 => 4.5.3}/820-arm-unbreak-armv4t.patch  |    0
 Gustavo>  .../gcc/{4.5.2 => 4.5.3}/830-arm-pr43440.patch     |    0
 Gustavo>  .../powerpc-link-with-math-lib.patch.conditional   |    0
 Gustavo>  toolchain/gcc/Config.in                            |    2 +-
 Gustavo>  toolchain/gcc/gcc-uclibc-4.x.mk                    |    2 +-
 Gustavo>  11 files changed, 2 insertions(+), 72 deletions(-)
 Gustavo>  delete mode 100644 toolchain/gcc/4.5.2/850-arm-pr44392.patch
 Gustavo>  rename toolchain/gcc/{4.5.2 => 4.5.3}/100-uclibc-conf.patch (100%)
 Gustavo>  rename toolchain/gcc/{4.5.2 => 4.5.3}/301-missing-execinfo_h.patch (100%)
 Gustavo>  rename toolchain/gcc/{4.5.2 => 4.5.3}/302-c99-snprintf.patch (100%)
 Gustavo>  rename toolchain/gcc/{4.5.2 => 4.5.3}/305-libmudflap-susv3-legacy.patch (100%)
 Gustavo>  rename toolchain/gcc/{4.5.2 => 4.5.3}/810-arm-softfloat-libgcc.patch (100%)
 Gustavo>  rename toolchain/gcc/{4.5.2 => 4.5.3}/820-arm-unbreak-armv4t.patch (100%)
 Gustavo>  rename toolchain/gcc/{4.5.2 => 4.5.3}/830-arm-pr43440.patch (100%)
 Gustavo>  rename toolchain/gcc/{4.5.2 => 4.5.3}/powerpc-link-with-math-lib.patch.conditional (100%)

 Gustavo> diff --git a/toolchain/gcc/4.5.2/850-arm-pr44392.patch b/toolchain/gcc/4.5.2/850-arm-pr44392.patch
 Gustavo> deleted file mode 100644
 Gustavo> index 4ad6c44..0000000
 Gustavo> --- a/toolchain/gcc/4.5.2/850-arm-pr44392.patch
 Gustavo> +++ /dev/null
 Gustavo> @@ -1,70 +0,0 @@
 -> From d0557763b0713a4c006bd2405eede3924569cafd Mon Sep 17 00:00:00 2001
 Gustavo> -From: Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
 Gustavo> -Date: Mon, 5 Jul 2010 11:28:49 +0100
 Gustavo> -Subject: [PATCH 2/2] Fix PR44392
 Gustavo> -
 Gustavo> ----
 Gustavo> - gcc/config/arm/arm.md |   43 +++++++++++++++++++------------------------
 Gustavo> - 1 files changed, 19 insertions(+), 24 deletions(-)
 Gustavo> -
 Gustavo> -diff --git a/gcc/config/arm/arm.md b/gcc/config/arm/arm.md
 Gustavo> -index 2096ec6..f0348f3 100644
 Gustavo> ---- a/gcc/config/arm/arm.md
 Gustavo> -+++ b/gcc/config/arm/arm.md
 Gustavo> -@@ -11318,34 +11318,29 @@
 Gustavo> - (define_expand "bswapsi2"
 Gustavo> -   [(set (match_operand:SI 0 "s_register_operand" "=r")
 Gustavo> -   	(bswap:SI (match_operand:SI 1 "s_register_operand" "r")))]
 Gustavo> --"TARGET_EITHER"
 Gustavo> -+"TARGET_EITHER && (arm_arch6 || !optimize_size)"
 Gustavo> - "
 Gustavo> --  if (!arm_arch6)
 Gustavo> --    {
 Gustavo> --      if (!optimize_size)
 Gustavo> --	{
 Gustavo> --	  rtx op2 = gen_reg_rtx (SImode);
 Gustavo> --	  rtx op3 = gen_reg_rtx (SImode);
 Gustavo> -+    if (!arm_arch6)
 Gustavo> -+      {
 Gustavo> -+	rtx op2 = gen_reg_rtx (SImode);
 Gustavo> -+	rtx op3 = gen_reg_rtx (SImode);
 Gustavo> - 
 Gustavo> --	  if (TARGET_THUMB)
 Gustavo> --	    {
 Gustavo> --	      rtx op4 = gen_reg_rtx (SImode);
 Gustavo> --	      rtx op5 = gen_reg_rtx (SImode);
 Gustavo> -+	if (TARGET_THUMB)
 Gustavo> -+	  {
 Gustavo> -+	    rtx op4 = gen_reg_rtx (SImode);
 Gustavo> -+	    rtx op5 = gen_reg_rtx (SImode);
 Gustavo> - 
 Gustavo> --	      emit_insn (gen_thumb_legacy_rev (operands[0], operands[1],
 Gustavo> --					       op2, op3, op4, op5));
 Gustavo> --	    }
 Gustavo> --	  else
 Gustavo> --	    {
 Gustavo> --	      emit_insn (gen_arm_legacy_rev (operands[0], operands[1],
 Gustavo> --					     op2, op3));
 Gustavo> --	    }
 Gustavo> -+	    emit_insn (gen_thumb_legacy_rev (operands[0], operands[1],
 Gustavo> -+					     op2, op3, op4, op5));
 Gustavo> -+	  }
 Gustavo> -+	else
 Gustavo> -+	  {
 Gustavo> -+	    emit_insn (gen_arm_legacy_rev (operands[0], operands[1],
 Gustavo> -+					   op2, op3));
 Gustavo> -+	  }
 Gustavo> - 
 Gustavo> --	  DONE;
 Gustavo> --	}
 Gustavo> --      else
 Gustavo> --	FAIL;
 Gustavo> --    }
 Gustavo> -+	DONE;
 Gustavo> -+      }
 Gustavo> -   "
 Gustavo> - )
 Gustavo> - 
 Gustavo> --- 
 Gustavo> -1.6.2
 Gustavo> -
 Gustavo> diff --git a/toolchain/gcc/4.5.2/100-uclibc-conf.patch b/toolchain/gcc/4.5.3/100-uclibc-conf.patch
 Gustavo> similarity index 100%
 Gustavo> rename from toolchain/gcc/4.5.2/100-uclibc-conf.patch
 Gustavo> rename to toolchain/gcc/4.5.3/100-uclibc-conf.patch
 Gustavo> diff --git a/toolchain/gcc/4.5.2/301-missing-execinfo_h.patch b/toolchain/gcc/4.5.3/301-missing-execinfo_h.patch
 Gustavo> similarity index 100%
 Gustavo> rename from toolchain/gcc/4.5.2/301-missing-execinfo_h.patch
 Gustavo> rename to toolchain/gcc/4.5.3/301-missing-execinfo_h.patch
 Gustavo> diff --git a/toolchain/gcc/4.5.2/302-c99-snprintf.patch b/toolchain/gcc/4.5.3/302-c99-snprintf.patch
 Gustavo> similarity index 100%
 Gustavo> rename from toolchain/gcc/4.5.2/302-c99-snprintf.patch
 Gustavo> rename to toolchain/gcc/4.5.3/302-c99-snprintf.patch
 Gustavo> diff --git a/toolchain/gcc/4.5.2/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.5.3/305-libmudflap-susv3-legacy.patch
 Gustavo> similarity index 100%
 Gustavo> rename from toolchain/gcc/4.5.2/305-libmudflap-susv3-legacy.patch
 Gustavo> rename to toolchain/gcc/4.5.3/305-libmudflap-susv3-legacy.patch
 Gustavo> diff --git a/toolchain/gcc/4.5.2/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.5.3/810-arm-softfloat-libgcc.patch
 Gustavo> similarity index 100%
 Gustavo> rename from toolchain/gcc/4.5.2/810-arm-softfloat-libgcc.patch
 Gustavo> rename to toolchain/gcc/4.5.3/810-arm-softfloat-libgcc.patch
 Gustavo> diff --git a/toolchain/gcc/4.5.2/820-arm-unbreak-armv4t.patch b/toolchain/gcc/4.5.3/820-arm-unbreak-armv4t.patch
 Gustavo> similarity index 100%
 Gustavo> rename from toolchain/gcc/4.5.2/820-arm-unbreak-armv4t.patch
 Gustavo> rename to toolchain/gcc/4.5.3/820-arm-unbreak-armv4t.patch
 Gustavo> diff --git a/toolchain/gcc/4.5.2/830-arm-pr43440.patch b/toolchain/gcc/4.5.3/830-arm-pr43440.patch
 Gustavo> similarity index 100%
 Gustavo> rename from toolchain/gcc/4.5.2/830-arm-pr43440.patch
 Gustavo> rename to toolchain/gcc/4.5.3/830-arm-pr43440.patch
 Gustavo> diff --git a/toolchain/gcc/4.5.2/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.5.3/powerpc-link-with-math-lib.patch.conditional
 Gustavo> similarity index 100%
 Gustavo> rename from toolchain/gcc/4.5.2/powerpc-link-with-math-lib.patch.conditional
 Gustavo> rename to toolchain/gcc/4.5.3/powerpc-link-with-math-lib.patch.conditional
 Gustavo> diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
 Gustavo> index 17b21b8..fcdcc19 100644
 Gustavo> --- a/toolchain/gcc/Config.in
 Gustavo> +++ b/toolchain/gcc/Config.in
 Gustavo> @@ -57,7 +57,7 @@ config BR2_GCC_VERSION
 Gustavo>  	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
 Gustavo>  	default "4.3.5"     if BR2_GCC_VERSION_4_3_X
 Gustavo>  	default "4.4.6"     if BR2_GCC_VERSION_4_4_X
 Gustavo> -	default "4.5.2"     if BR2_GCC_VERSION_4_5_X
 Gustavo> +	default "4.5.3"     if BR2_GCC_VERSION_4_5_X
 Gustavo>  	default "4.6.0"     if BR2_GCC_VERSION_4_6_X
 Gustavo>  	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 Gustavo> diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
 Gustavo> index ebcca53..568aa1a 100644
 Gustavo> --- a/toolchain/gcc/gcc-uclibc-4.x.mk
 Gustavo> +++ b/toolchain/gcc/gcc-uclibc-4.x.mk
 Gustavo> @@ -44,7 +44,7 @@ EXTRA_GCC_CONFIG_OPTIONS+=--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
 Gustavo>  endif
 
 Gustavo>  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
 Gustavo> -# Workaround until it's fixed in 4.5.2 or later
 Gustavo> +# Workaround until it's fixed in 4.5.4 or later
 Gustavo>  ifeq ($(ARCH),powerpc)
 Gustavo>  ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
 Gustavo>  GCC_OPTSPACE=--disable-target-optspace
 Gustavo> -- 
 Gustavo> 1.7.3.4

 Gustavo> _______________________________________________
 Gustavo> buildroot mailing list
 Gustavo> buildroot at busybox.net
 Gustavo> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
