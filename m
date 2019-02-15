From: Artem Panfilov <panfilov.artyom@gmail.com>
Date: Sat, 16 Feb 2019 02:20:58 +0300
Subject: [Buildroot] [PATCH 1/2] package/pcre2: add JIT support option
Message-ID: <20190215232059.31440-1-panfilov.artyom@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add JIT support option.

Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
---
 package/pcre2/Config.in | 8 ++++++++
 package/pcre2/pcre2.mk  | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/package/pcre2/Config.in b/package/pcre2/Config.in
index bb576c75a1..007dd960c6 100644
--- a/package/pcre2/Config.in
+++ b/package/pcre2/Config.in
@@ -23,4 +23,12 @@ config BR2_PACKAGE_PCRE2_32
 	  This option builds the 32-bits pcre2 library, i.e
 	  'libpcre2-32'
 
+config BR2_PACKAGE_PCRE2_JIT
+	bool "enable JIT support"
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm  || BR2_armeb || \
+		BR2_aarch64 || BR2_mips || BR2_mipsel || \
+		BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_sparc
+	help
+	  This option enables JIT support
+
 endif
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index ee3cacb9aa..6d103c2b9b 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -16,6 +16,12 @@ PCRE2_CONF_OPTS += --enable-pcre2-8
 PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_16),--enable-pcre2-16,--disable-pcre2-16)
 PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_32),--enable-pcre2-32,--disable-pcre2-32)
 
+ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
+PCRE2_CONF_OPTS += --enable-jit
+else
+PCRE2_CONF_OPTS += --disable-jit
+endif
+
 # disable fork usage if not available
 ifeq ($(BR2_USE_MMU),)
 PCRE2_CONF_OPTS += --disable-pcre2grep-callout
-- 
2.19.1
