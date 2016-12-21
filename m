From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2016 10:09:02 +0100
Subject: [Buildroot] [PATCH] valgrind: Force -fno-stack-protector in
 CFLAGS
In-Reply-To: <1482293424-4043-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1482293424-4043-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20161221100902.4758fe7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 22:10:24 -0600, Matt Weber wrote:
> From: Brandon Maier <brandon.maier@rockwellcollins.com>
> 
> Valgrind must be compiled with no stack protection. Valgrind defaults
> CFLAGS to -fno-stack-protector, but Buildroot's CFLAGS overrides it.
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/valgrind/valgrind.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index 087a381..b9cd947 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -27,7 +27,11 @@ VALGRIND_AUTORECONF = YES
>  # and pass the right -march option, so they take precedence over
>  # Valgrind's wrongfully detected value.
>  ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> -VALGRIND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -march=$(BR2_GCC_TARGET_ARCH)"
> +VALGRIND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector -march=$(BR2_GCC_TARGET_ARCH)"
> +else
> +# Valgrind must be compiled with no stack protection. Valgrind defaults
> +# CFLAGS to -fno-stack-protector, but Buildroot's CFLAGS overrides it.
> +VALGRIND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector"
>  endif

I think you should state "Buildroot *may* override it". Indeed, we
only pass -fstack-protector if you have
BR2_SSP_{REGULAR,STRONG,BR2_SSP_ALL} enabled.

Other than that, could you refactor this the following way:

# Valgrind must be compiled with no stack protection, so forcefully
# pass -fno-stack-protector to override what Buildroot may have in
# TARGET_CFLAGS if SSP support is enabled.
VALGRIND_CFLAGS = \
	$(TARGET_CFLAGS) \
	-fno-stack-protector

# blblabla mips stuff
ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
VALGRIND_CFLAGS += -march=$(BR2_GCC_TARGET_ARCH)
endif

VALGRIND_CONF_ENV = CFLAGS="$(VALGRIND_CFLAGS)"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
