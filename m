From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 18:43:11 +0100
Subject: [Buildroot] [PATCH] package/fail2ban: fix python3 2to3
 dependency
In-Reply-To: <618874172809ae3de7cd82f6b27141c1ba13c806.1581943931.git.baruch@tkos.co.il>
References: <618874172809ae3de7cd82f6b27141c1ba13c806.1581943931.git.baruch@tkos.co.il>
Message-ID: <20200218184311.25806bcb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 14:52:11 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> The 2to3 utility is needed in the patch phase. Use the correct
> dependency for that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/dd8e225e2a49cfa6735bed11459007003a37c137/
> http://autobuild.buildroot.net/results/e688c3652bd474ac682984e2e5947701942f0f57/
> 
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/fail2ban/fail2ban.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
> index 6f023b48a181..0f8e5ab6e694 100644
> --- a/package/fail2ban/fail2ban.mk
> +++ b/package/fail2ban/fail2ban.mk
> @@ -14,7 +14,7 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  define FAIL2BAN_PYTHON_2TO3
>  	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
>  endef
> -FAIL2BAN_DEPENDENCIES += host-python3
> +FAIL2BAN_PATCH_DEPENDENCIES += host-python3
>  FAIL2BAN_POST_PATCH_HOOKS += FAIL2BAN_PYTHON_2TO3

I don't think this solves the problem. Indeed, patch dependencies are
special. When you do:

FAIL2BAN_PATCH_DEPENDENCIES += host-python3

You're in fact adding a dependency of fail2ban-patch on
host-python3-patch, and not on host-python3.

See in pkg-generic.mk:

$$($(2)_TARGET_PATCH):  | $$(patsubst %,%-patch,$$($(2)_FINAL_PATCH_DEPENDENCIES))

See the nice patsubst here ? :-)

And this intentional, and really needed for some Linux extensions
(Xenomai ? RTAI ? don't remember which one of the two).

So for this fail2ban thing, I guess the easier is to move the 2to3
execution to a PRE_CONFIGURE_HOOKS, with a good comment above.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
