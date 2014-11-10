From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 13:50:34 +0100
Subject: [Buildroot] [PATCH] uClibc: ARC: enable generic string
	implementations
In-Reply-To: <1415616842-7640-1-git-send-email-abrodkin@synopsys.com>
References: <1415616842-7640-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20141110135034.2e03b27c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 10 Nov 2014 13:54:02 +0300, Alexey Brodkin wrote:
> With enabled generic optimized string routines we see significant
> improvement of some LMbench results.
> 
> For example:
> ===========
> libc bcopy unaligned
> ...
> 8.39 - 6.76  (UCLIBC_HAS_STRING_GENERIC_OPT=no)
> 8.39 - 23.86 (UCLIBC_HAS_STRING_GENERIC_OPT=yes)
> ===========
> 
> Since I've only did measurements on ARC and it has been ebabled for ARC
> for years I'm sure it doesn't break anything in either during toolchian
> building or in run-time.
> 
> That's why I'm keeping it as arch-specific change.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Anton Kolesov <anton.kolesov@synopsys.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/uclibc/uclibc.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 419a4d1..3412efd 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -66,6 +66,7 @@ ifeq ($(UCLIBC_TARGET_ARCH),arc)
>  UCLIBC_ARC_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_ARC_TYPE))
>  define UCLIBC_ARC_TYPE_CONFIG
>  	$(call KCONFIG_ENABLE_OPT,$(UCLIBC_ARC_TYPE),$(@D)/.config)
> +	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_STRING_GENERIC_OPT,$(@D)/.config)

I personally don't like to see such a change done in an architecture
specific way, if the feature is not architecture specific. So we should
evaluate if this works on other architectures, see what is the binary
footprint for this feature, and then decide if we want to enable it by
default in our uClibc configurations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
