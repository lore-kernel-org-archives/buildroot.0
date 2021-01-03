From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 22:45:50 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/quickjs: link with libatomic
In-Reply-To: <20210103201959.4035-2-ps.report@gmx.net>
References: <20210103201959.4035-1-ps.report@gmx.net>
 <20210103201959.4035-2-ps.report@gmx.net>
Message-ID: <20210103214550.GS2997@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-01-03 21:19 +0100, Peter Seiderer spake thusly:
> Link with libatomic if available.
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/e0766eef95a2559d51e58d1a81a9c40df84ae509
> 
>   .../build/quickjs-2020-11-08/quickjs.c:12229: undefined reference to `__atomic_fetch_xor_1'
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

But see below for a small nit...

> ---
>  ...ile-add-optional-link-with-libatomic.patch | 30 +++++++++++++++++++
>  package/quickjs/quickjs.mk                    |  6 +++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch
> 
> diff --git a/package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch b/package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch
> new file mode 100644
> index 0000000000..12f4eb2338
> --- /dev/null
> +++ b/package/quickjs/0001-Makefile-add-optional-link-with-libatomic.patch
> @@ -0,0 +1,30 @@
> +From 2cf2aa34d5d55a4eedb1aedd4d56d89d24870230 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sun, 3 Jan 2021 21:11:44 +0100
> +Subject: [PATCH] Makefile: add optional link with libatomic
> +
> +Add optional libatomic linking if available to fix:
> +
> +  .../build/quickjs-2020-11-08/quickjs.c:12229: undefined reference to `__atomic_fetch_xor_1'
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index e6ae827..22ad496 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -177,7 +177,7 @@ endif
> + HOST_LIBS=-lm -ldl -lpthread
> + LIBS=-lm
> + ifndef CONFIG_WIN32
> +-LIBS+=-ldl -lpthread
> ++LIBS+=-ldl -lpthread $(LIBATOMIC)
> + endif

I've changed that to be a generic variable, not tied to -latomic:

    LIBS+=$(EXTRA_LIBS)

Do not forget to send the patch upstream. ;-)

Regards,
Yann E. MORIN.

> + $(OBJDIR):
> +-- 
> +2.29.2
> +
> diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
> index 1a2e63278f..389ed71133 100644
> --- a/package/quickjs/quickjs.mk
> +++ b/package/quickjs/quickjs.mk
> @@ -10,8 +10,12 @@ QUICKJS_SITE = https://bellard.org/quickjs
>  QUICKJS_LICENSE = MIT
>  QUICKJS_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +QUICKJS_LIBATOMIC += -latomic
> +endif
> +
>  define QUICKJS_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +	$(TARGET_MAKE_ENV) LIBATOMIC=$(QUICKJS_LIBATOMIC) $(MAKE) -C $(@D) \
>  		CROSS_PREFIX="$(TARGET_CROSS)" \
>  		all
>  endef
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
