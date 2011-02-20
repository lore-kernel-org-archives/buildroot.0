From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Feb 2011 19:59:33 +0100
Subject: [Buildroot] [PATCH] Fix uninstallation of non-staged packages
In-Reply-To: <1298226465-28124-1-git-send-email-bjorn.forsman@gmail.com>
References: <1298226465-28124-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20110220195933.0daac66f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bjorn,

On Sun, 20 Feb 2011 19:27:45 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> Packages without $(PKG)_INSTALL_STAGING=YES currently fail to
> uninstall themselves with 'make pkg-uninstall'. For a real life
> example of the error, try uninstalling 'at' or 'dropbear'.
> 
> This patch fixes the issue by only uninstalling packages from staging
> if $(PKG)_INSTALL_STAGING==YES.
> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
>  package/Makefile.package.in |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 92ce4e2..1482284 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -321,8 +321,10 @@ $(BUILD_DIR)/%/.stamp_cleaned:
>  # Uninstall package from target and staging
>  $(BUILD_DIR)/%/.stamp_uninstalled:
>  	@$(call MESSAGE,"Uninstalling")
> +ifeq ($$($(2)_INSTALL_STAGING),YES)
>  	$($(PKG)_UNINSTALL_STAGING_CMDS)
>  	rm -f $($(PKG)_TARGET_INSTALL_STAGING)
> +endif

I understand the problem, but I don't think that the solution works.
The $(BUILD_DIR)/%/.stamp_* targets are defined *outside* of the
GENTARGETS_INNER macro, so $(2) in your code has no value.

The uninstallation step should probably be split in 3 different stamp
files: one for host, one for staging, one for target. Then in
GENTARGETS_INNER, then <pkg>-uninstall target would depend
on .stamp_target_uninstalled && .stamp_staging_uninstalled,
or .stamp_target_uninstalled only, or .stamp_host_uninstalled only.

However, all the uninstall code is due to be removed/reworked when we
merge the package work on Lionel. But quite some work remains to clean
it up, so I can't say when it's going to be ready.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
