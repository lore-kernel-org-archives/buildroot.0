From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 14:34:20 +0100
Subject: [Buildroot] [PATCH-for-master 1/2] package/meson: don't install
 cross-compilation.conf during target-finalize
In-Reply-To: <20190225211147.14947-2-patrickdepinguin@gmail.com>
References: <20190225211147.14947-1-patrickdepinguin@gmail.com>
 <20190225211147.14947-2-patrickdepinguin@gmail.com>
Message-ID: <69ef7d20-206f-cfd0-10db-8f94e3a23bb7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/02/2019 22:11, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> package/meson installs a cross-compilation.conf file in
> $(HOST_DIR)/etc/meson, via TARGET_FINALIZE_HOOKS.
> 
> package/pkg-cmake.mk installs a toolchainfile.cmake in
> $(HOST_DIR)/share/buildroot, via TOOLCHAIN_POST_INSTALL_STAGING_HOOKS.
> 
> Both files have a similar concept, they describe some flags/paths needed for
> compilation using respective build systems. One difference is that the meson
> file is added for external compilation, from the SDK, while the cmake file
> is used internally in Buildroot.
> 
> The 'problem' of using TARGET_FINALIZE_HOOKS for the meson file, is that it
> installs a 'host' file from target-finalize, which is conceptually incorrect
> and breaks the invariant that only TARGET_DIR is changed on a subsequent
> 'make' when everything was already built (i.e. only target-finalize is run).
> 
> This can easily be fixed, by using the same hook as cmake uses, i.e.
> TOOLCHAIN_POST_INSTALL_STAGING_HOOKS.
> 
> Note that actually even for cmake, TOOLCHAIN_POST_INSTALL_STAGING_HOOKS is
> not the best hook to install a host file. A better hook would have been
> TOOLCHAIN_POST_INSTALL_HOOKS, but this triggers only for 'host' packages,
> and 'toolchain' is treated as a 'target' package.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 Applied to master (with a bit more text as proposed), thanks.

> ---
>  package/meson/meson.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index d76541cc93..aba7382cc9 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -65,6 +65,7 @@ define HOST_MESON_INSTALL_CROSS_CONF
>  	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
>  endef
>  
> -TARGET_FINALIZE_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
> +TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += HOST_MESON_INSTALL_CROSS_CONF

 check-package now complains that you're setting a variable that doesn't start
with MESON_, so I moved this to pkg-meson.mk (like for cmake).

> +TOOLCHAIN_INSTALL_STAGING = YES

 It would make sense to move this to toolchain.mk. I'll send a patch for that.

 Regards,
 Arnout
