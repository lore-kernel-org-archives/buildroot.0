From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 14:42:32 +0200
Subject: [Buildroot] [PATCH v2] package/cryptopp: add a target build
 configuration
In-Reply-To: <20200727122336.151322-1-kamel.bouhara@bootlin.com>
References: <20200727122336.151322-1-kamel.bouhara@bootlin.com>
Message-ID: <20200727124232.GX19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kamel, All,

On 2020-07-27 14:23 +0200, Kamel Bouhara spake thusly:
> Currently only a host build is supported for cryptopp, this add a new
> configuration and build support for the make target.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
> Changes in v2:
> 	- Fixed indentations issue
> 	- Removed unrequired Config.in.host
> 	- Added a depends on !BR2_STATIC_LIBS to build only in dynamic
> 	configuration.

Why can't we build a static library?

[--SNIP--]
> diff --git a/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch b/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch
> new file mode 100644
> index 0000000000..e7edc76313
> --- /dev/null
> +++ b/package/cryptopp/0001-Add-fully-qualified-SONAME-to-shared-object-for-Linu.patch
> @@ -0,0 +1,27 @@
> +From 78eb43f50978ffd780cf31b1cea6736dadc6b155 Mon Sep 17 00:00:00 2001
> +From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> +Date: Mon, 6 Jul 2020 17:10:55 +0200
> +Subject: [PATCH] Add fully-qualified SONAME to shared object for Linux
> +
> +From: http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html
> +
> +Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> +---
> + GNUmakefile | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/GNUmakefile b/GNUmakefile
> +index e7b7b3a6..730e2a6f 100755
> +--- a/GNUmakefile
> ++++ b/GNUmakefile
> +@@ -1256,6 +1256,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
> + 	$(CHMOD) 0755 $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
> + ifeq ($(HAS_SOLIB_VERSION),1)
> + 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
> ++	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)

Why do we need that?

> + 	$(LDCONF) $(DESTDIR)$(LIBDIR)

Note that in corss-compilation, running ldconfig is flawed, and we have
explcitly idable its use. See commit 9c4072348 (Makefile: drop ldconfig
handling).

As a consequence, you want to explcitly configure with LDCONF=/bin/true,
see for example package/e2fsprogs/e2fsprogs.mk (for the target variant)
(Nothe that a few other packages do something similar as well)

Which means that with your patch and without a call to ldconfig, the .so
symlink will no longer exist, and so it will no longer be possible to
link against the library.

Note that the host variant is not OK either, because not all systems
have ldconfig on the host either... See 64d4b34073 (e2fsprogs: do not
use ldconfig when building the host variant).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
