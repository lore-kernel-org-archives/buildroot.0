From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 18:29:39 +0100
Subject: [Buildroot] [PATCH] docs/manual: clarify hooks and dependencies
 build order
In-Reply-To: <f60d91e668f9c6cedccc0a9afbf84e020e8e40e0.1582810201.git.baruch@tkos.co.il>
References: <f60d91e668f9c6cedccc0a9afbf84e020e8e40e0.1582810201.git.baruch@tkos.co.il>
Message-ID: <20200227182939.043baf2e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Thu, 27 Feb 2020 15:30:01 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> As explained in commit bdc9364ffae ("package/fail2ban: The
> (host-python3) 2to3 utility needs to be present"), hooks before
> _PRE_CONFIGURE_HOOKS can't rely on package dependencies build artefacts.
> Mention this point in hooks documentation.
> 
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  docs/manual/adding-packages-hooks.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
> index 0ce79f8907f8..c80f5cb52d32 100644
> --- a/docs/manual/adding-packages-hooks.txt
> +++ b/docs/manual/adding-packages-hooks.txt
> @@ -59,6 +59,14 @@ endef
>  LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
>  ----------------------
>  
> +[[hooks-order]]
> +==== Hooks run order
> +Hooks up to, and including, +LIBFOO_POST_PATCH_HOOKS+ might run before
> ++LIBFOO_DEPENDENCIES+ finish building. You can not rely on build artefacts of
> +dependency packages in these early hooks. +LIBFOO_PRE_CONFIGURE_HOOKS+ and
> +later hooks will run only when +LIBFOO_DEPENDENCIES+ have been built. As a
> +result, you can use dependencies build artefacts in these later hooks.

I appreciate the idea of clarifying things that were not clear, but
this new paragraph seems like it just clarifies the one specific point
you faced, while we should ideally clarify the global picture. I.e
clarify DOWNLOAD_DEPENDENCIES, EXTRACT_DEPENDENCIES, PATCH_DEPENDENCIES
and regular DEPENDENCIES.

Also, I don't think we should say that PATCH_HOOKS might run before
DEPENDENCIES finish building. But rather than hooks are executed as
part of the step they belong to. And then how the steps are sequenced
with the regard to the various dependency types we support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
