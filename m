From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 4 May 2012 21:17:56 +0200
Subject: [Buildroot] [PATCH] Package downloads: allow restricting to
	primary site only
In-Reply-To: <2fcc145e1eef0f8bc468.1333743535@beantl019720>
References: <2fcc145e1eef0f8bc468.1333743535@beantl019720>
Message-ID: <CAAXf6LVuopxvpMi9_zGJsXtmMoo1ku20YFsNdJ1OKpwD_P=GWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 6, 2012 at 10:18 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> This patch adds a new config option BR2_PRIMARY_SITE_ONLY that, when set,
> restricts package downloads to the specified BR2_PRIMARY_SITE. If the package
> is not present on the primary site, the download fails.
>
> This is useful for project developers who want to ensure that the project can
> be built even if the upstream tarball locations disappear.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> ?Config.in ? ? ? ? ? ? ? ? ? | ?12 ++++++++++++
> ?package/Makefile.package.in | ? 7 +++++--
> ?2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/Config.in b/Config.in
> --- a/Config.in
> +++ b/Config.in
> @@ -119,6 +119,16 @@ config BR2_PRIMARY_SITE
> ? ? ? ? ?NOTE: This works for all packages using the central package
> ? ? ? ? ?infrastructure (generic, autotools, cmake, ...)
>
> +config BR2_PRIMARY_SITE_ONLY
> + ? ? ? bool "Only allow downloads from primary download site"
> + ? ? ? help
> + ? ? ? ? If this option is enabled, downloads will only be attempted from the
> + ? ? ? ? primary download site. Other locations, like the package's official
> + ? ? ? ? download location or the backup download site, will not be
> + ? ? ? ? considered.
> +
> +if !BR2_PRIMARY_SITE_ONLY
> +
> ?config BR2_BACKUP_SITE
> ? ? ? ?string "Backup download site"
> ? ? ? ?default "http://sources.buildroot.net/"
> @@ -175,6 +185,8 @@ config BR2_DEBIAN_MIRROR
> ? ? ? ? ?Usually, just add your country code like XX here:
> ? ? ? ? ?http://ftp.XX.debian.org
>
> +endif
> +
> ?endmenu
>
> ?config BR2_JLEVEL
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -269,8 +269,8 @@ endef
> ?################################################################################
> ?# DOWNLOAD -- Download helper. Will try to download source from:
> ?# 1) BR2_PRIMARY_SITE if enabled
> -# 2) Download site
> -# 3) BR2_BACKUP_SITE if enabled
> +# 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
> +# 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
> ?#
> ?# Argument 1 is the source location
> ?# Argument 2 is the source filename
> @@ -290,6 +290,9 @@ define DOWNLOAD_INNER
> ? ? ? ? ? ? ? ? ? ? ? ?*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
> ? ? ? ? ? ? ? ?esac ; \
> ? ? ? ?fi ; \
> + ? ? ? if test "$(BR2_PRIMARY_SITE_ONLY)" = "y" ; then \
> + ? ? ? ? ? ? ? exit 1 ; \
> + ? ? ? fi ; \
> ? ? ? ?if test -n "$(1)" ; then \
> ? ? ? ? ? ? ? ?case "$($(PKG)_SITE_METHOD)" in \
> ? ? ? ? ? ? ? ? ? ? ? ?git) $($(DL_MODE)_GIT) && exit ;; \

bump
