From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Dec 2015 16:52:55 +0100
Subject: [Buildroot] [PATCH] openvmtools: enable for uClibc toolchains
In-Reply-To: <20151204165330.GA5268@waldemar-brodkorb.de>
References: <20151204165330.GA5268@waldemar-brodkorb.de>
Message-ID: <56630857.9060704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Waldemar, all,

On 04-12-15 17:53, Waldemar Brodkorb wrote:
> Since uClibc-ng 1.0.9 openvmtools can be compiled as
> the missing euidaccess function was added.

 We actually still support older uClibc-based toolchains, including an internal
one based on 0.9.33.2, custom external ones (buildroot or crosstool-NG) that may
also be based on that, custom external ones based on -ng pre-1.0.9, and the
Blackfin toolchains.

 This comment is not specific for this patch but rather applies to all packages
that will work with -ng but not with 0.9.33.2, and there are ever more of those.

 There are several things we can do here:

- Ignore it and let the user deal with the build failure.

- Ignore it and add a comment in the Config.in, so that the user at least is
warned. See e.g. rt-tests. This is not a great solution either because the user
will not see the comment when there is another package that selects openvmtools.

- Depend on an internal -ng toolchain. That sucks pretty hard because you'll
often want to build the toolchain once and then use it as an external toolchain.

- Kill 0.9.33.2 and depend on an internal toolchain. See above.

- Give a more explicit warning in the custom external toolchain and in the
0.9.33.x and snapshot uClibc version choices that some packages may fail to
build. This should be combined with an explicit exclusion of the Blackfin
binaries (not necessary for openvmtools since it depends on MMU).

- Explicitly exclude non-ng toolchains. We can add a hidden symbol for that, and
add -ng as a separate option for the custom external toolchain. For this
particular patch, that doesn't solve the issue however because it will still
fail with uclibc-ng 1.0.8.


 I don't think any of these options is perfect, but the last one is the least
bad IMO.


 Note that we probably already have a bunch of packages that have this problem,
because the only uClibc-based toolchains that we test in the autobuilders are
Buildroot-generated, except for the Blackfin ones.

 We probably should kill the non-ng options in the uclibc package as well. We
also should make it more explicit in the documentation of the custom external
toolchains that you're on your own.


 Otherwise, the patch looks good to me though :-)

 Regards,
 Arnout

> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/openvmtools/Config.in |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
> index 64bf65c..528ddbe 100644
> --- a/package/openvmtools/Config.in
> +++ b/package/openvmtools/Config.in
> @@ -6,7 +6,6 @@ config BR2_PACKAGE_OPENVMTOOLS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	depends on BR2_ENABLE_LOCALE
> -	depends on !BR2_TOOLCHAIN_USES_UCLIBC
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBDNET
>  	help
> @@ -41,14 +40,13 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
>  	help
>  	  Support for PAM in openvmtools
>  
> -comment "PAM support needs an (e)glibc toolchain w/ dynamic library"
> +comment "PAM support needs an (e)glibc or uClibc toolchain w/ dynamic library"
>  	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
>  
>  endif
>  
> -comment "openvmtools needs an (e)glibc or musl toolchain w/ wchar, threads, RPC, locale"
> +comment "openvmtools needs a toolchain w/ wchar, threads, RPC, locale"
>  	depends on BR2_i386 || BR2_x86_64
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE || \
> -		BR2_TOOLCHAIN_USES_UCLIBC
> +		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
