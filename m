From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 22:57:19 +0100
Subject: [Buildroot] [RFC v1 04/14] autotools infrastructure: support
 out of tree build
In-Reply-To: <1358725943-31485-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358725943-31485-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5101AE3F.1040105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 00:52, Thomas Petazzoni wrote:
> All autotools packages are supposed to support out of tree build, so
> we mark this at the package infrastructure level, and adjust the
> infrastructure to execute the configure script from the build
> directory.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   package/pkg-autotools.mk |   27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 843239d..bd87253 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -78,8 +78,6 @@ ifndef $(2)_SUBDIR
>    endif
>   endif
>
> -$(2)_SRCSUBDIR = $$($(2)_SRCDIR)/$($(2)_SUBDIR)
> -
>   $(2)_CONF_ENV			?=
>   $(2)_CONF_OPT			?=
>   $(2)_MAKE_ENV			?=
> @@ -91,6 +89,7 @@ $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
>   $(2)_CLEAN_OPT			?= clean
>   $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
>   $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
> +$(2)_SUPPORTS_OUT_OF_TREE        = YES

  Out of tree build may be broken for some packages, so I would make this 
?= YES.

>
>
>   #
> @@ -103,11 +102,11 @@ ifeq ($(5),target)
>
>   # Configure package for target
>   define $(2)_CONFIGURE_CMDS
> -	(cd $$($$(PKG)_SRCSUBDIR)&&  rm -rf config.cache&&  \
> +	(cd $$($$(PKG)_BUILDDIR)&&  rm -rf config.cache&&  \
>   	$$(TARGET_CONFIGURE_OPTS) \
>   	$$(TARGET_CONFIGURE_ARGS) \
>   	$$($$(PKG)_CONF_ENV) \
> -	./configure \
> +	$$($$(PKG)_SRCDIR)/$$($$(PKG)_SUBDIR)/configure \
>   		--target=$$(GNU_TARGET_NAME) \
>   		--host=$$(GNU_TARGET_NAME) \
>   		--build=$$(GNU_HOST_NAME) \

  Hm, not sure I like this. The build system may refer to something 
outside the subdir and may get confused by the changed path. So I'd do an 
mkdir -p of $($(PKG)_BUILDDIR)/$($(PKG)_SUBDIR) and build there.



  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
