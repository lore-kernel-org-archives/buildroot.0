From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Apr 2017 14:41:37 +0200
Subject: [Buildroot] [PATCH v2] gst-plugins-base: fix handling of
	freetype
In-Reply-To: <20170411225913.22072-1-ricardo.martincoski@gmail.com>
References: <20170406224619.65661d4e@free-electrons.com>
 <20170411225913.22072-1-ricardo.martincoski@gmail.com>
Message-ID: <79e11a71-3ed9-3d90-9ea8-8ddf77d7c395@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-04-17 00:59, Ricardo Martincoski wrote:
> In 2010 commit 32d319e6f "gst-plugins-base: ensure <stdint.h> is used"
> introduced a typo (missing backslash) that made the code ineffective.
> 
> It can be confirmed by looking at the output of:
> $ make printvars | grep '^GST_PLUGINS_BASE_CONF_ENV\|^FT2_CONFIG'
> FT2_CONFIG=/bin/false ac_cv_header_stdint_t="stdint.h"
> GST_PLUGINS_BASE_CONF_ENV=
> 
> Add the missing backslash to fix the code.
> While at it, fix the indentation to use one tab instead of two.
> 
> The (end of the) diff of config.log confirms the code is still needed
> when the host has freetype-config installed:
[snip]
> @@ -2818,7 +2815,6 @@
>  ac_cv_prog_cxx_g='yes'
>  ac_cv_prog_make_make_set='yes'
>  ac_cv_stdint_message='using gnu compiler i686-pc-linux-gnu-gcc (Sourcery CodeBench Lite 2012.09-62) 4.7.2'
> -ac_cv_stdint_result='(assuming C99 compatible system)'

 Apparently the ac_cv_header_stdint_t assigment wasn't really needed then,
because it hasn't changed. But OK, that's for a separate patch.

>  ac_cv_sys_file_offset_bits='no'
>  ac_cv_sys_largefile_CC='no'
>  ac_cv_sys_largefile_source='no'
> @@ -2965,9 +2961,9 @@
>  EXEEXT=''
>  FFLAGS=' -Os '
>  FGREP='/bin/grep -F'
> -FT2_CFLAGS='-I/usr/include/freetype2'
> -FT2_CONFIG='/usr/bin/freetype-config'
> -FT2_LIBS='-lfreetype'
> +FT2_CFLAGS=''
> +FT2_CONFIG='/bin/false'
> +FT2_LIBS=''
>  GCOV=''
>  GCOV_CFLAGS=''
>  GCOV_LIBS=''
> 
> Detected by check-package.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
> index fc3b2036a..735314365 100644
> --- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
> +++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
> @@ -14,9 +14,9 @@ GST_PLUGINS_BASE_LICENSE_FILES = COPYING COPYING.LIB
>  # freetype is only used by examples, but if it is not found
>  # and the host has a freetype-config script, then the host
>  # include dirs are added to the search path causing trouble

 Note that the autobuilders don't catch this because they don't have
freetype-config installed...

 Regards,
 Arnout

> -GST_PLUGINS_BASE_CONF_ENV =
> -		FT2_CONFIG=/bin/false \
> -		ac_cv_header_stdint_t="stdint.h"
> +GST_PLUGINS_BASE_CONF_ENV = \
> +	FT2_CONFIG=/bin/false \
> +	ac_cv_header_stdint_t="stdint.h"
>  
>  GST_PLUGINS_BASE_CONF_OPTS = \
>  	--disable-examples \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
