From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Aug 2013 15:02:42 -0300
Subject: [Buildroot] [PATCH] ltrace: disable libunwind for uClibc toolchains
Message-ID: <1376330562-5123-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltrace requires that libunwind is built with backtrace() support.
For the internal uClibc toolchain we don't enable it, and for external
uClibc toolchains we can't know.
It's also unavailable for static uClibc toolchains.
So just disable libunwind support for uClibc toolchains in general.
Fixes:
http://autobuild.buildroot.net/results/ee0/ee037a19590fb85c64f97f78f74bcfd4d7766706/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ltrace/ltrace.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 7b8d859..55930b8 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -13,4 +13,15 @@ LTRACE_CONF_OPT = --disable-werror
 LTRACE_LICENSE = GPLv2
 LTRACE_LICENSE_FILES = COPYING
 
+# ltrace can use libunwind only if libc has backtrace() support
+# We don't normally do so for uClibc and we can't know if it's external
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)
+LTRACE_CONF_OPT += --with-libunwind=yes
+LTRACE_DEPENDENCIES += libunwind
+else
+LTRACE_CONF_OPT += --with-libunwind=no
+endif
+endif
+
 $(eval $(autotools-package))
-- 
1.8.1.5
