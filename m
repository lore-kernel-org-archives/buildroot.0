From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  1 May 2018 22:05:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: remove libnsl linking with
 Glibc.
Message-ID: <20180501200508.13974-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnsl has been deprecated from Glibc and no other libc provide it.
Also there is no libnsl package in Buildroot yet, so remove -lnsl for
all toolchains.

libnsl is now a library that can be packaged later if needed. [1]

Note: Fedora 28 has switched to the new libnsl library that bring
IPV6 support. [2]

[1] https://github.com/thkukuk/libnsl.git
[2] https://fedoraproject.org/wiki/Changes/NISIPv6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/exim/exim.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 37eab501a4..bc3a8eefd5 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -72,13 +72,13 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 endef
 endif
 
-# only glibc provides libnsl, remove -lnsl for all other toolchains
+# libnsl has been deprecated from Glibc and no other libc provide it.
+# There is no libnsl package in Buildroot yet.
+# Remove -lnsl for all toolchains.
 # http://bugs.exim.org/show_bug.cgi?id=1564
-ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
 	$(SED) 's/-lnsl//g' $(@D)/OS/Makefile-Linux
 endef
-endif
 
 # musl does not provide struct ip_options nor struct ip_opts (but it is
 # available with both glibc and uClibc)
-- 
2.14.3
