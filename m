From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Apr 2014 18:33:49 +0200
Subject: [Buildroot] [RFC] pkg-autotools: check if host-pkgconf should
 be part of the dependencies
In-Reply-To: <1398105498-7055-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1398105498-7055-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <535699ED.9010203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/04/14 20:38, Thomas Petazzoni wrote:
> There is a good number of autotools-based packages that use the
> PKG_CHECK_MODULES() in their configure.{ac,in} file, and the presence
> of this macro indicates that the package should depend on
> host-pkgconf. However, we very often fail at adding this dependency,
> and discover later that it is necessary.
> 
> In order to prevent that from happening, this commit proposes to add a
> post-patch hook that looks if PKG_CHECK_MODULES is used in the
> configure.{ac,in} file, and if it is, it verifies that host-pkgconf is
> part of the current package dependencies. If not, it aborts the build
> with an error message.

 Instead of post-patch, I think that pre-configure is more appropriate.

 Also, perhaps this could be done as a BR2_INSTRUMENTATION_SCRIPTS
instead of a hard-coded check. The autobuilders would obviously have to
enable that script. It's nicer to have such tests of buildroot itself
isolated from the user's build. We can probably invent a lot more checks
like that, which may potentially have an important impact on build time.

 That said, it's a lot more difficult as an instrumentation script
because then you don't have access to the make variables. You'd have to
run a recursive 'make printvars' to get them.

> 
> Note that adding this dependency cannot be done automatically, because
> by the time the makefiles are parsed, the source code for the packages
> are not extracted, so we can't look at configure.{in,ac} to
> automatically add the host-pkgconf dependency. The only thing we can
> do is what this patch does: a check during the build itself.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This is purely an RFC patch, I just tested it on one package (the
> recently added 'smack' package), which was lacking this host-pkgconf
> dependency.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-autotools.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index a646612..842a7c3 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -230,6 +230,17 @@ $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
>  $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
>  endif
>  
> +define CHECK_PKG_CONFIG_HOOK
> +	$(Q)if grep -q PKG_CHECK_MODULES $$($$(PKG)_SRCDIR)/configure.{ac,in}; then \
> +		if test -z "$$(filter host-pkgconf,$$($$(PKG)_DEPENDENCIES))" ; then \
> +			echo "ERROR: package $$(PKG) uses PKG_CHECK_MODULES but does not depend on host-pkgconf" ; \
> +			exit 1 ; \
> +		fi ; \
> +	fi
> +endef

 If defined like this, the CHECK_PKG_CONFIG_HOOK variable will be
redefined for every package... So I think it's better to move it outside
of the inner-generic-package macro (removing the double dollars).

 Yes, the same is true of UPDATE_CONFIG_HOOK, AUTORECONF_HOOK and
LIBTOOL_PATCH_HOOK - but that's historical accident :-)

 Finally, perhaps it would be better to search for 'pkg-config' in the
configure script itself, rather than configure.{ac,in}. The
PKG_CHECK_MODULES may be hidden in one of the m4 files, or pkg-config may
be used by some custom code instead. Obviously, that means it must be
done after AUTORECONF_HOOK so it _must_ be in a pre-configure hook (not
post-patch and not instrumentation).


 Regards,
 Arnout


> +
> +$(2)_POST_PATCH_HOOKS += CHECK_PKG_CONFIG_HOOK
> +
>  #
>  # Build step. Only define it if not already defined by the package .mk
>  # file.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
