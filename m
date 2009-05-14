From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 May 2009 19:25:26 +0200
Subject: [Buildroot] [PATCH 4/5] cups: fix -fstack-protector configure check
In-Reply-To: <1242321927-10185-3-git-send-email-jacmet@sunsite.dk>
References: <1242321927-10185-1-git-send-email-jacmet@sunsite.dk>
	<1242321927-10185-2-git-send-email-jacmet@sunsite.dk>
	<1242321927-10185-3-git-send-email-jacmet@sunsite.dk>
Message-ID: <1242321927-10185-4-git-send-email-jacmet@sunsite.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script failed to detect toolchains without stack protector
support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups-fix-stack-protector-check.patch |   25 +++++++++++++++++++++
 package/cups/cups.mk                              |    3 +-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 package/cups/cups-fix-stack-protector-check.patch

diff --git a/package/cups/cups-fix-stack-protector-check.patch b/package/cups/cups-fix-stack-protector-check.patch
new file mode 100644
index 0000000..1db35ff
--- /dev/null
+++ b/package/cups/cups-fix-stack-protector-check.patch
@@ -0,0 +1,25 @@
+[PATCH]: use AC_TRY_LINK for stack protector check
+
+Actually try to link an executable to test for stack protector support,
+as gcc seems to accept the -fstack-protector argument even when it's
+compiled with --disable-libssp (but linking fails with a error
+finding -lssp_nonshared).
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ config-scripts/cups-compiler.m4 |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: cups-1.3.9/config-scripts/cups-compiler.m4
+===================================================================
+--- cups-1.3.9.orig/config-scripts/cups-compiler.m4
++++ cups-1.3.9/config-scripts/cups-compiler.m4
+@@ -109,7 +109,7 @@ if test -n "$GCC"; then
+ 	AC_MSG_CHECKING(if GCC supports -fstack-protector)
+ 	OLDCFLAGS="$CFLAGS"
+ 	CFLAGS="$CFLAGS -fstack-protector"
+-	AC_TRY_COMPILE(,,
++	AC_TRY_LINK(,,
+ 		OPTIM="$OPTIM -fstack-protector"
+ 		AC_MSG_RESULT(yes),
+ 		AC_MSG_RESULT(no))
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index d1bf0fa..9051e0d 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -74,6 +74,7 @@ $(CUPS_DIR)/.unpacked: $(DL_DIR)/$(CUPS_SOURCE)
 	touch $@
 
 $(CUPS_DIR)/.configured: $(CUPS_DIR)/.unpacked
+	cd $(CUPS_DIR) && $(AUTOCONF)
 	(cd $(CUPS_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -109,7 +110,7 @@ $(CUPS_DIR)/.installed: $(CUPS_DIR)/.compiled
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/bin/cups-config
 	touch $@
 
-cups: uclibc $(CUPS_DEPENDENCIES) $(CUPS_DIR)/.installed
+cups: uclibc host-autoconf $(CUPS_DEPENDENCIES) $(CUPS_DIR)/.installed
 
 cups-source: $(DL_DIR)/$(CUPS_SOURCE)
 
-- 
1.6.2
