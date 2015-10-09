From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 9 Oct 2015 23:32:36 +0200
Subject: [Buildroot] efl: fix framebuffer support
In-Reply-To: <1444074105-2110-2-git-send-email-vicencb@gmail.com>
References: <5609AA80.6040106@openwide.fr>
 <1444074105-2110-1-git-send-email-vicencb@gmail.com>
 <1444074105-2110-2-git-send-email-vicencb@gmail.com>
Message-ID: <56183274.3060402@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

Le 05/10/2015 21:41, Vicente Bergas a ?crit :
> Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> ---
>  ...ecore_fb_private.h-define-EAPI-before-use.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
> 
> diff --git a/package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch b/package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
> new file mode 100644
> index 0000000..6303930
> --- /dev/null
> +++ b/package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
> @@ -0,0 +1,42 @@
> +ecore_fb_private.h: define EAPI before use
> +

Your patch needs probably a commit log and your SoB line, see:

http://buildroot.uclibc.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

Don't forget to add a link to the enlightenment mailing list where the initial
patch has been posted.
(http://sourceforge.net/p/enlightenment/mailman/message/34492801)

Also, it would be great if you can provide a git formatted patch in order to
ease the patch maintenance. (not mandatory though).

For now, I'll fixes that locally.

Best regards,
Romain

> +---
> + src/lib/ecore_fb/ecore_fb_private.h | 17 +++++++++++++++++
> + 1 file changed, 17 insertions(+)
> +
> +diff --git a/src/lib/ecore_fb/ecore_fb_private.h b/src/lib/ecore_fb/ecore_fb_private.h
> +index f7dc0c6..f54c8d2 100644
> +--- a/src/lib/ecore_fb/ecore_fb_private.h
> ++++ b/src/lib/ecore_fb/ecore_fb_private.h
> +@@ -33,6 +33,20 @@
> + 
> + #include <Ecore_Fb.h>
> + 
> ++#ifdef EAPI
> ++# undef EAPI
> ++#endif
> ++
> ++#ifdef __GNUC__
> ++# if __GNUC__ >= 4
> ++#  define EAPI __attribute__ ((visibility("default")))
> ++# else
> ++#  define EAPI
> ++# endif
> ++#else
> ++# define EAPI
> ++#endif
> ++
> + /* ecore_fb_li.c */
> + struct _Ecore_Fb_Input_Device
> + {
> +@@ -92,4 +106,7 @@ void ecore_fb_vt_shutdown(void);
> + #define TS_GET_CAL 0x8014660a
> + #endif
> +   
> ++#undef EAPI
> ++#define EAPI
> ++
> + #endif
> +-- 
> +2.6.0
> +
> 
