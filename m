From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 28 Jun 2020 22:16:12 +0200
Subject: [Buildroot] [PATCH] package/glibc: disable Werror for gcc 10 build
Message-ID: <20200628201612.3130899-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently glibc 2.30 is build by default with Werror enabled but it
has only been tested with compiler version available at the time of
the release [1] (gcc 6.2 up to gcc 9.2.1). It's recommended to use
those version with glibc 2.30.

For the same reason why we remove Werror in packages's compiler
flags. Building with Werror is not bulletproof when we start
using a newer compiler that introduce new warnings.
This is the case here with gcc 10, as reported by Yegor Yefremov
[2].

Fixing compiler warnings would require backporting many patches [3]
not even backported by Glibc maintainers to the 2.30 stable
branch. Instead, disable Werror by using --disable-werror.
Most (if not all) gcc 10 warnings will be fixed with Glibc 2.31.

[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=INSTALL;h=62e78725f57080a1cb638cccd28ca3c2ffc5a22c#l466
[2] http://lists.busybox.net/pipermail/buildroot/2020-June/285715.html
[3] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=cba932a5a9e91cffd7f4172d7e91f9b2efb1f84b
    https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=de18a7061c9bdff73d66502c55d6a3ea671fc6d9
    https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=49348beafe9ba150c9bd48595b3f372299bddbb0
    https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=70c6e15654928c603c6d24bd01cf62e7a8e2ce9b
    https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=c7bf5ceab6ec776ac7350d3b0190776bf532ac54
    https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=e1d559f337de2c8ab68a6749dfe873477c883807

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/glibc/glibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 76fae1f9f7..1881cf0cdc 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -131,6 +131,7 @@ define GLIBC_CONFIGURE_CMDS
 		$(if $(BR2_x86_64),--enable-lock-elision) \
 		--with-pkgversion="Buildroot" \
 		--disable-profile \
+		--disable-werror \
 		--without-gd \
 		--enable-obsolete-rpc \
 		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
-- 
2.25.4
