From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 18:39:56 +0100
Subject: [Buildroot] [PATCH v5 16/19] infra-libtool: inform libtool that
 STAGING_DIR is reachable at runtime
In-Reply-To: <1482241596-31688-17-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-17-git-send-email-jezz@sysmic.org>
Message-ID: <e62db7e1-373d-7c7e-1a94-48fc03df3cd6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-12-16 14:46, J?r?me Pouiller wrote:
> When installing binaries to $TARGET_DIR, libtool add `$STAGING_DIR{,/usr}/lib'
                                                      ^s
> to RPATH. This is annoying to create reproducible binaries. This patch just
> inform libtool that these paths are reachable on runtime and it is necessary to
        ^s                                      at                  ^not
> add then to RPATH.
      them
> 
> Notice `$lt_cv_sys_lib_dlsearch_path_spec' was introduced in libtool v2.0.
> Packages with libtool v1.5 continue to include `$STAGING_DIR{,/usr}/lib' in
> their RPATH. The few packages that use libtool v1.5 have to be patched
> individually in order to make them reproducible (adding AUTORECONF=YES should
> be sufficient in most cases).

 Again, this is also solved by Wolfgang's rpath series.

> 
> Note, instead of providing $lt_cv_sys_lib_dlsearch_path_spec, Yocto patch
> libtool:
>    http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>


Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(tested on a static arm musl build with about 20 packages)

 Since this is already handled by Wolgang's rpath series, this patch could be
dropped. However, it is not invasive and it solves the problem earlier, so I vot
to keep it.

 Regards,
 Arnout

> ---
>  package/Makefile.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 688d5b1..6a341f2 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -355,6 +355,7 @@ TARGET_CONFIGURE_ARGS = \
>  	ac_cv_func_calloc_0_nonnull=yes \
>  	ac_cv_func_realloc_0_nonnull=yes \
>  	lt_cv_sys_lib_search_path_spec="" \
> +	lt_cv_sys_lib_dlsearch_path_spec="/lib /usr/lib $(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
>  	$(BR2_AC_CV_C_BIGENDIAN) \
>  	$(BR2_GT_CV_FUNC_GNUGETTEXT_LIBC)
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
