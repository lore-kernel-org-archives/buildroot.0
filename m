From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 15:45:06 +0100
Subject: [Buildroot] [PATCH v5 12/36] package/efl/libefl: fix
 framebuffer support
In-Reply-To: <1445720476-21517-13-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-13-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025144506.GI11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> From: Vicente Bergas <vicencb@gmail.com>
> 
> From [1]:
> When running terminology, a message appears in eina_module_load with:
> could not dlopen("/usr/lib/ecore_evas/engines/fb/v-1.15/module.so",
> Error relocating /usr/lib/ecore_evas/engines/fb/v-1.15/module.so:
> ecore_fb_ts_shutdown: symbol not found): RTLD_NOW
> It seems like the EAPI macro has no effect...
> 
> A patch from Ross Vandegrift has been posted on enlightenment mailing
> list [2], but it's not yet an upstream patch.
> 
> [1] http://sourceforge.net/p/enlightenment/mailman/message/34493376
> [2] http://sourceforge.net/p/enlightenment/mailman/message/34492801

Then you should fold this into the previous patch that adds the
framebuffer option.

Regards,
Yann E. MORIN.

> Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> [Romain: use a git formated patch and add a commit log]
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v4: move the patch to libefl
>     improve the commit log
> v3: new patch
> ---
>  ...ecore_fb_private.h-define-EAPI-before-use.patch | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
> 
> diff --git a/package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch b/package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
> new file mode 100644
> index 0000000..81d14f9
> --- /dev/null
> +++ b/package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
> @@ -0,0 +1,64 @@
> +From 2fb4fdf641e67e49b87a3524038a694c8dd0ba4e Mon Sep 17 00:00:00 2001
> +From: Vicente Bergas <vicencb@gmail.com>
> +Date: Fri, 9 Oct 2015 23:35:20 +0200
> +Subject: [PATCH] ecore_fb_private.h: define EAPI before use
> +
> +From [1]:
> +When running terminology, a message appears in eina_module_load with:
> +could not dlopen("/usr/lib/ecore_evas/engines/fb/v-1.15/module.so",
> +Error relocating /usr/lib/ecore_evas/engines/fb/v-1.15/module.so:
> +ecore_fb_ts_shutdown: symbol not found): RTLD_NOW
> +It seems like the EAPI macro has no effect...
> +
> +A patch from Ross Vandegrift has been posted on enlightenment mailing
> +list [2], but it's not yet an upstream patch.
> +
> +[1] http://sourceforge.net/p/enlightenment/mailman/message/34493376
> +[2] http://sourceforge.net/p/enlightenment/mailman/message/34492801
> +
> +Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> +[Romain:
> +  - Add a commit log
> +  - Add a link to the enlightenment mailing list
> +  - Add Vicente's SoB line]
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
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
> +2.4.3
> +
> -- 
> 2.4.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
