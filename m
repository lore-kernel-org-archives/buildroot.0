From: Hugues FRUCHET <hugues.fruchet@st.com>
Date: Mon, 17 Jul 2017 10:07:07 +0000
Subject: [Buildroot] [RFC v1] libv4l: build utils only on MMU (with fork
 support) platforms
In-Reply-To: <20170711172624.7516-1-ps.report@gmx.net>
References: <20170711172624.7516-1-ps.report@gmx.net>
Message-ID: <70ff5d21-0466-c470-cac3-e00c524c93b0@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I have tested on STM32 platform running Cortex F family having no MMU, 
shared libraries are disabled (no dlopen) and no fork supported on our 
setup.

libv4lconvert should not have been built at all, because entire lib/ 
folder build is conditional to shared library support:
* configure.ac
AM_CONDITIONAL([WITH_LIBV4L],       [test x$enable_libv4l    != xno -a 
x$enable_shared != xno])
* Makefile.am
[...]
+if WITH_LIBV4L
+SUBDIRS += lib
+endif

But checking your log I see that --enable-shared is set, so it seems 
that you are supporting shared libraries on no-MMU platform but without 
fork() support, is my understanding correct ?

What you can do to fix build is to force disabling of libs inside libv4l 
package:

package/libv4l/libv4l.mk
+ifeq ($(BR2_USE_MMU),)
+LIBV4L_CONF_OPTS += --disable-libv4l
+endif

Hoping that helps.

Best regards,
Hugues.

On 07/11/2017 07:26 PM, Peter Seiderer wrote:
> Fixes [1]:
> 
>      CXXLD    v4l2-compliance
>    .../output/build/libv4l-1.12.5/lib/libv4lconvert/.libs/libv4lconvert.so: undefined reference to `fork'
>    collect2: error: ld returned 1 exit status
> 
> [1] http://autobuild.buildroot.net/results/7e8/7e8fbd99a8c091d7bbeedd16066297682bbe29fe
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> The libv4l build for noMMU platforms was enabled with commit 'package/libv4l:
> allow build of v4l2 utilities on noMMU platforms' (see [2]). But libv4lconvert uses
> fork internally, so all utils linking against fail to build. Fix this by disabling
> the utils on noMMU platforms (so keep building all libraries).
> 
> Alternatives would be:
> 
> - disable libv4l on all noMMU platforms (not only the utils), revert a part
>    of commit [2]
> 
> - create a patch to disable only libv4lconvert (and all dependend utils)
>    on noMMU platforms
> 
> [2] https://git.buildroot.net/buildroot/commit/?id=f837251785e9389f53d695ddb8a094707865171b
> ---
>   package/libv4l/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
> index e7f78dc70f..61c290f251 100644
> --- a/package/libv4l/Config.in
> +++ b/package/libv4l/Config.in
> @@ -19,6 +19,7 @@ comment "libv4l JPEG support not enabled"
>   
>   config BR2_PACKAGE_LIBV4L_UTILS
>   	bool "v4l-utils tools"
> +	depends on BR2_USE_MMU # fork(), used in libv4lconvert linked by various utils eg. v4l2-compliance
>   	help
>   	  v4l-utils is a collection of various video4linux and DVB utilities.
>   	  Enable this if you want to build the following tools:
> 
