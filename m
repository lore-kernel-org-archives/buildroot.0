From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Sep 2016 01:21:50 +0200
Subject: [Buildroot] [PATCH 3/4] php: fix pthread detection
In-Reply-To: <1473632768-53238-3-git-send-email-fabrice.fontaine@orange.com>
References: <1473632768-53238-1-git-send-email-fabrice.fontaine@orange.com>
 <1473632768-53238-3-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <27c90840-3293-b11f-1774-dc918e126527@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-09-16 00:26, Fabrice Fontaine wrote:
> Following suggestion of Yann Morin, move fix on pthread detection in a
> detected patch and add more comment on issue: without this fix, thread
> safety option (--enable-maintainer-zts) will not work

 This commit message makes no sense. I guess you wanted to say that in this v2,
you split off the pthread detection into a separate patch. But that should be in
a non-commit comment (see below).

 Better use the comment you added below as the commit message.

> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

 You can add below your Sob

---
v2: move to a separate patch (Yann Morin)

> ---
>  package/php/php.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 97e3396..c4ff249 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -47,6 +47,20 @@ define PHP_BUILDCONF
>  endef
>  PHP_PRE_CONFIGURE_HOOKS += PHP_BUILDCONF
>  
> +# PHP assumes pthreads are not working when cross-compiling, indeed configure
> +# sets pthreads_working to no if cross_compiling is set to yes (line 5888)
> +# If pthreads_working is set to no, thread safety option
> +# (--enable-maintainer-zts) will not be available
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +PHP_CONF_ENV += ac_cv_pthreads_lib=pthread
> +
> +define PHP_FIX_THREADS_DETECTION
> +	$(SED) 's/pthreads_working\=no/pthreads_working\=yes/' $(@D)/configure
> +endef

 I'd prefer an upstreamable patch that fixes the issue. The problem is that the
configure script violates a rule of AC_CACHE_VAL: "The commands-to-set-it must
have no side effects except for setting the variable cache-id, see below". But
they also set pthreads_working, which is wrong. It completely defeats the
purpose of the cache.

 So what should be done is to remove the pthreads_working assignments from the
AC_CACHE_CHECK functions, and replace them with:

if [ "x$ac_cv_pthreads_cflags" != "x" -o "x$ac_cv_pthreads_lib" != "x" ]; then
	pthreads_working=yes
fi


 Regards,
 Arnout


> +
> +PHP_PRE_CONFIGURE_HOOKS += PHP_FIX_THREADS_DETECTION
> +endif
> +
>  ifeq ($(BR2_ENDIAN),"BIG")
>  PHP_CONF_ENV += ac_cv_c_bigendian_php=yes
>  else
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
