From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 18:34:57 +0100
Subject: [Buildroot] [PATCH 08/10] package/gawk: add optional support for
	libsigsegv
In-Reply-To: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456076099-19607-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libsigsegv was compiled before, gawk will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/gawk | grep NEEDED
  0x0000000000000001 (NEEDED)             Shared library: [libsigsegv.so.2]
[...]

The build system offers no option to en-/disable libsigsegv support:
http://git.savannah.gnu.org/cgit/gawk.git/tree/m4/libsigsegv.m4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gawk/gawk.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 507ea6d..da9be95 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -16,6 +16,10 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GAWK_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
+GAWK_DEPENDENCIES += libsigsegv
+endif
+
 # --with-mpfr requires an argument so just let
 # configure find it automatically
 ifeq ($(BR2_PACKAGE_MPFR),y)
-- 
2.7.0
