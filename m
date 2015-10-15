From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Oct 2015 00:01:08 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rtmpdump: Fix librtmp.pc
 defaulting to OpenSSL
In-Reply-To: <1444934013-500-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444934013-500-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151016000108.2e4ffd83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 15 Oct 2015 20:33:32 +0200, Bernd Kuhls wrote:

> diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
> index 613f1cd..5709cdb 100644
> --- a/package/rtmpdump/rtmpdump.mk
> +++ b/package/rtmpdump/rtmpdump.mk
> @@ -25,6 +25,10 @@ RTMPDUMP_CRYPTO = OPENSSL
>  else
>  # no crypto
>  RTMPDUMP_CRYPTO =
> +define RTMPDUMP_FIX_MAKEFILE
> +	$(SED) "s/CRYPTO=.*//g" $(@D)/librtmp/Makefile
> +endef
> +RTMPDUMP_POST_PATCH_HOOKS += RTMPDUMP_FIX_MAKEFILE
>  endif
>  
>  RTMPDUMP_CFLAGS = $(TARGET_CFLAGS)

This is the wrong fix. We are already passing CRYPTO= when no crypto
library is used. The only problem is that we are only passing it at
build time, while the .pc file is generated from .pc.in at install
time. So all we need to do is pass CRYPTO also at install time. My
proposal is therefore:

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index 613f1cd..a59ec9c 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -35,22 +35,25 @@ else
 RTMPDUMP_SHARED = "SHARED="
 endif
 
+RTMPDUMP_MAKE_FLAGS = \
+       CRYPTO=$(RTMPDUMP_CRYPTO) \
+       prefix=/usr \
+       $(RTMPDUMP_SHARED)
+
 define RTMPDUMP_BUILD_CMDS
-       $(MAKE) CRYPTO=$(RTMPDUMP_CRYPTO) \
-               prefix=/usr \
+       $(MAKE) $(RTMPDUMP_MAKE_FLAGS) \
                XCFLAGS="$(RTMPDUMP_CFLAGS)" \
                XLDFLAGS="$(TARGET_LDFLAGS)" \
                CROSS_COMPILE="$(TARGET_CROSS)" \
-               $(RTMPDUMP_SHARED) \
                -C $(@D)/librtmp
 endef
 
 define RTMPDUMP_INSTALL_STAGING_CMDS
-       $(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR) $(RTMPDUMP_SHARED)
+       $(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR) $(RTMPDUMP_MAKE_FLAGS)
 endef
 
 define RTMPDUMP_INSTALL_TARGET_CMDS
-       $(MAKE) prefix=/usr -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR) $(RTMPDUMP_SHARED)
+       $(MAKE) -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR) $(RTMPDUMP_MAKE_FLAGS)
 endef
 
 $(eval $(generic-package))

I tested it, it works for me. If it does for you, can you submit it as
a proper patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
