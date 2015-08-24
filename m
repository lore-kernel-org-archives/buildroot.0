From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Aug 2015 12:27:51 +0100
Subject: [Buildroot] [PATCH v2] package/libcgroup: allow to build
	cgroup-tools
In-Reply-To: <1440413393-11023-1-git-send-email-bgolaszewski@baylibre.com>
References: <1440413393-11023-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <55DAFFB7.5040308@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On 08/24/2015 11:49 AM, Bartosz Golaszewski wrote:
> Add a new config option that allows to build cgroup-tools - a set of
> command-line utils for managing cgroups.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v2:
> - prefix package option with package name
> - use if/endif instead of depends on for libcgroup dependence
> 
> v1:
> http://lists.busybox.net/pipermail/buildroot/2015-August/137816.html
> 
>  package/libcgroup/Config.in    | 9 +++++++++
>  package/libcgroup/libcgroup.mk | 7 ++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
> index b7a84e0..7852567 100644
> --- a/package/libcgroup/Config.in
> +++ b/package/libcgroup/Config.in
> @@ -9,5 +9,14 @@ config BR2_PACKAGE_LIBCGROUP
>  
>  	  http://libcg.sourceforge.net/
>  
> +if BR2_PACKAGE_LIBCGROUP
> +
> +config BR2_PACKAGE_LIBCGROUP_TOOLS
> +	bool "build cgroup-tools"
> +	help
> +	  Include a set of command-line tools for managing cgroups.
> +
> +endif
> +
>  comment "libcgroup needs an (e)glibc toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
> diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
> index ace2744..a4c3084 100644
> --- a/package/libcgroup/libcgroup.mk
> +++ b/package/libcgroup/libcgroup.mk
> @@ -20,10 +20,15 @@ LIBCGROUP_CONF_ENV = \
>  	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS"
>  
>  LIBCGROUP_CONF_OPTS = \
> -	--disable-tools \
>  	--disable-daemon \
>  	--disable-initscript-install
>  
> +ifeq ($(BR2_PACKAGE_LIBCGROUP_TOOLS),y)
> +LIBCGROUP_CONF_OPTS += --enable-tools
> +else
> +LIBCGROUP_CONF_OPTS += --disable-tools
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  LIBCGROUP_DEPENDENCIES += linux-pam
>  LIBCGROUP_CONF_OPTS += --enable-pam
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Regards,

Vincent.
