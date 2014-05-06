From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 May 2014 19:59:20 +0200
Subject: [Buildroot] [PATCH] infra: relax the check on
 BR2_TOOLCHAIN_BUILDROOT_VENDOR
In-Reply-To: <1399393667-15009-1-git-send-email-arnout@mind.be>
References: <1399393667-15009-1-git-send-email-arnout@mind.be>
Message-ID: <20140506195920.697ab409@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Tue,  6 May 2014 18:27:47 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> 65c2400f introduced BR2_TOOLCHAIN_BUILDROOT_VENDOR and a check that it
> is not empty or 'unknown'. However, when a .config file from before
> that commit exists, this makes it impossible to run *config in order
> to set a value. Catch-22.
> 
> To break the cycle, remove the check when running one of the config
> targets.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/Makefile.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index c34a3bf..da8b768 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -26,7 +26,8 @@ else
>  TARGET_VENDOR = buildroot
>  endif
>  
> -# Sanity checks
> +# Sanity checks - but not when we try to reconfigure
> +ifeq ($(filter menuconfig xconfig gconfig nconfig config defconfig oldconfig silentoldconfig %_defconfig,$(MAKECMDGOALS)),)

What about using $(noconfig_targets) here, like is done in the main
Makefile?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
