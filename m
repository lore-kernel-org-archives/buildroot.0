From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Feb 2013 20:43:00 +0100
Subject: [Buildroot] [PATCH] arch/arm: fix-up the ARM Kconfig warning
In-Reply-To: <1360263888-5806-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 7 Feb 2013 20:04:48 +0100")
References: <1360263888-5806-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87r4krlxkr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Kconfig does not accepts that a symbol that is part of a choice
 Yann> be affected a default value.

 Yann> Fix this by introducing a dummy EABI symbol., and nake the real
 Yann> EABI symbol a prompt-less option that depends on !OABI.

Thanks, committed with small fixups (s/nake/make and below).


 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Peter Korsgaard <jacmet@uclibc.org>
 Yann> Cc: Arnout Vandecappelle <arnout@mind.be>
 Yann> ---
 Yann>  arch/Config.in.arm |    7 ++++---
 Yann>  1 files changed, 4 insertions(+), 3 deletions(-)

 Yann> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
 Yann> index 37152c0..ecb45ab 100644
 Yann> --- a/arch/Config.in.arm
 Yann> +++ b/arch/Config.in.arm
 Yann> @@ -76,7 +76,7 @@ choice
 Yann>  	  Note:
 Yann>  	    Using OABI is discouraged.
 
 Yann> -config BR2_ARM_EABI
 Yann> +config BR2_ARM_EABI_DUMMY

I renamed this to BR2_ARM_EABI_CHOICE

 Yann>  	bool "EABI"
 Yann>  config BR2_ARM_OABI
 Yann>  	bool "OABI"
 Yann> @@ -84,8 +84,9 @@ config BR2_ARM_OABI
 Yann>  endchoice
 
 Yann>  config BR2_ARM_EABI
 Yann> -	default y
 Yann> -	depends on !BR2_DEPRECATED
 Yann> +	def_bool y
 Yann> +	depends on BR2_arm || BR2_armeb

The entire file is only sourced for arm || armeb, so this can be
dropped.

-- 
Bye, Peter Korsgaard
