From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Mar 2014 20:29:20 -0300
Subject: [Buildroot] [PATCH 2/2] slang: multiple fixes
In-Reply-To: <1396049360-5683-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396049360-5683-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1396049360-5683-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a gentoo patch to fix the wicked slsh link line that ended in the
bizarre prefix/exec_prefix/DESTDIR trickery.
Also fixes:
http://autobuild.buildroot.net/results/c3f/c3fb5337a4bdf87baead64106427c4929241c58d/

Also be explicit with enabling/disabling libpng, pcre, readline and zlib
support since they get picked up from the host if header files are
around because of the problem known as "absolute paths" when trying to
autodetect.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/slang/slang-01-slsh-libs.patch | 17 +++++++++++++
 package/slang/slang.mk                 | 44 ++++++++++++++++++++--------------
 2 files changed, 43 insertions(+), 18 deletions(-)
 create mode 100644 package/slang/slang-01-slsh-libs.patch

diff --git a/package/slang/slang-01-slsh-libs.patch b/package/slang/slang-01-slsh-libs.patch
new file mode 100644
index 0000000..e8b6e6d
--- /dev/null
+++ b/package/slang/slang-01-slsh-libs.patch
@@ -0,0 +1,17 @@
+Link against sources instead of installation paths that aren't DESTDIRed.
+Patch taken from gentoo portage, upstream status unknown, author
+probably Diego Petten?.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/slsh/Makefile.in
++++ b/slsh/Makefile.in
+@@ -80,7 +80,7 @@
+ $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
+ 	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(SRC_LIBS)
+ $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
+-	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(INST_LIBS)
++	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(SRC_LIBS)
+ $(OBJDIR)/slsh.o: $(OBJDIR) slsh.c slsh.h config.h Makefile
+ 	cd $(OBJDIR) && $(CC) -c $(CFLAGS) $(SLANG_SRCINC) $(DEFS) $(SRCDIR)/slsh.c
+ $(OBJDIR)/readline.o: $(OBJDIR) readline.c slsh.h config.h Makefile
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index d943de3..ad1155d 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -13,27 +13,35 @@ SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
 SLANG_MAKE = $(MAKE1)
 
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-	SLANG_DEPENDENCIES = ncurses
+# Absolute path hell, sigh...
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+	SLANG_CONF_OPT += --with-png=$(STAGING_DIR)/usr
+	SLANG_DEPENDENCIES += libpng
+else
+	SLANG_CONF_OPT += --with-png=no
+endif
+ifeq ($(BR2_PACKAGE_PCRE),y)
+	SLANG_CONF_OPT += --with-pcre=$(STAGING_DIR)/usr
+	SLANG_DEPENDENCIES += pcre
+else
+	SLANG_CONF_OPT += --with-pcre=no
+endif
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	SLANG_CONF_OPT += --with-z=$(STAGING_DIR)/usr
+	SLANG_DEPENDENCIES += zlib
 else
-	SLANG_CONF_OPT = ac_cv_path_nc5config=no
+	SLANG_CONF_OPT += --with-z=no
 endif
 
-# The installation location of the slang library
-# does not take into account the DESTDIR directory.
-# So SLANG_INST_LIB is initialized with -L/usr/lib/
-# and slang may be linked with host's libdl.so (if any)
-# Therefore, we have to pass correct installation paths.
-SLANG_INSTALL_STAGING_OPT = \
-	prefix=$(STAGING_DIR)/usr \
-	exec_prefix=$(STAGING_DIR)/usr \
-	DESTDIR=$(STAGING_DIR) \
-	install
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+	SLANG_DEPENDENCIES += ncurses
+else
+	SLANG_CONF_OPT += ac_cv_path_nc5config=no
+endif
 
-SLANG_INSTALL_TARGET_OPT = \
-	prefix=$(STAGING_DIR)/usr \
-	exec_prefix=$(STAGING_DIR)/usr \
-	DESTDIR=$(TARGET_DIR) \
-	install
+ifeq ($(BR2_PACKAGE_READLINE),y)
+	SLANG_CONF_OPT += --with-readline=gnu
+	SLANG_DEPENDENCIES += readline
+endif
 
 $(eval $(autotools-package))
-- 
1.8.3.2
