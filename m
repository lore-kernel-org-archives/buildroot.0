From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Mar 2016 16:53:16 +0100
Subject: [Buildroot] [PATCH v2 06/17] uclibc: gcc >= 4.9 can build a
 thumb/thread uclibc
In-Reply-To: <1458335299-27409-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <56ED75EC.7050409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/16 22:08, Thomas Petazzoni wrote:
> Older gcc were not capable of building a uClibc library, with threads
> enabled, in Thumb1. However, the issues have been fixed since gcc 4.9,
> so this commit narrows down the condition to just gcc 4.7 and 4.8.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/uclibc/uclibc.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index c981d80..ad94494 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -75,8 +75,10 @@ define UCLIBC_ARM_ABI_CONFIG
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_EABI,$(@D)/.config)
>   endef
>
> -# Thumb build is broken with threads, build in ARM mode
> -ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
> +# Thumb1 build is broken with threads with old gcc versions (4.7 and
> +# 4.8). Since all cores supporting Thumb1 also support ARM, we use ARM
> +# code in this case.
> +ifeq ($(BR2_GCC_VERSION_4_7_X)$(BR2_GCC_VERSION_4_8_X):$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),y:yy)

  This line is a bit long so would be nicer to split off into separate 
variables. This kind of logic is also much easier to do (and certainly easier to 
understand) in Kconfig than in the make language - like we had for BX before you 
removed it.

  However, that is something for another patch, so my Rev-by stands.

  Regards,
  Arnout

>   UCLIBC_EXTRA_CFLAGS += -marm
>   endif
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
