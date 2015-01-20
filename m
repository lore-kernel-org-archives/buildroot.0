From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 20 Jan 2015 14:24:21 +0000
Subject: [Buildroot] [PATCH] lightning: add -lintl only when needed
Message-ID: <1421763861-38874-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding -lintl to LIBS causes a failure in the configure phase when using
a toolchain which already has locale support because the intl library is
not present in the staging area. We fix this by adding -lintl only when
is needed.

This is the configure error:

checking whether the C compiler works... no
configure: error: in
`/br/output/build/lightning-2.0.5':
configure: error: C compiler cannot create executables
See `config.log' for more details

This is the message in the config.log:

configure:3351: /br/output/host/usr/bin/mips-linux-gnu-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
conftest.c -lintl >&5
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/4.9.1/../../../../mips-linux-gnu/bin/ld:
cannot find -lintl
collect2: error: ld returned 1 exit status

Fixes:
  http://autobuild.buildroot.net/results/280/28006ab35379a9b7f380d40b99a760bec1b69e84/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lightning/Config.in    |    1 +
 package/lightning/lightning.mk |    5 ++++-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index 8caf39f..cd5ab96 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_LIGHTNING_DISASSEMBLER
 	bool "enable disassembler"
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on !BR2_aarch64 && !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
 	help
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 00fed73..33831e2 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -17,7 +17,10 @@ ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
 LIGHTNING_CONF_OPTS += --enable-disassembler
 # binutils libraries are not explicitly linked against gettext
-LIGHTNING_CONF_ENV += $(if $(BR2_PACKAGE_GETTEXT),LIBS=-lintl)
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+LIGHTNING_DEPENDENCIES += gettext
+LIGHTNING_CONF_ENV += LIBS=-lintl
+endif
 endif
 
 $(eval $(autotools-package))
-- 
1.7.1
