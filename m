From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Nov 2015 07:37:46 +0100
Subject: [Buildroot] [PATCH] makefile: remove LD_LIBRARY_PATH from the
 environment
In-Reply-To: <1446086895-28252-1-git-send-email-mathstuf@gmail.com>
References: <1445722754-3477-1-git-send-email-mathstuf@gmail.com>
 <1446086895-28252-1-git-send-email-mathstuf@gmail.com>
Message-ID: <5645853A.3040002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29-10-15 03:48, Ben Boeckel wrote:
> If system tools are selected, the host's lib/ directory may shadow
> libraries from the system which are configured differently and do not
> have all of the symbols required by the system tool.
> 
> Since buildroot uses rpath everywhere, LD_LIBRARY_PATH should not be
> necessary anyways.
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 As I mentioned in a discussion with Yann (don't remember if it was on IRC or on
the list), I think we should apply this now no master to see what the
autobuilders say. We currently break the build on Fedora 23 for any
configuration including libattr, which IMHO is worse than the (probably small)
number of host-tools that are missing rpath.

 If we apply this patch _now_, we still have a few weeks to look at autobuild
results and handle the fallout.

 Note that all the host tools that are mentioned in Config.in.host will have to
be tested manually. Anybody up for that? Also the boot loaders will have to be
tested manually since they're not handled by the autobuilders.

 Regards,
 Arnout

> ---
>  package/Makefile.in | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 8a592d4..10f3a47 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -298,12 +298,10 @@ HOST_CONFIGURE_OPTS = \
>  	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>  	PKG_CONFIG_SYSROOT_DIR="/" \
>  	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
> -	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
>  	INTLTOOL_PERL=$(PERL)
>  
>  HOST_MAKE_ENV = \
>  	PATH=$(BR_PATH) \
> -	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib$(if $(LD_LIBRARY_PATH),:$(LD_LIBRARY_PATH))" \
>  	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>  	PKG_CONFIG_SYSROOT_DIR="/" \
>  	PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
