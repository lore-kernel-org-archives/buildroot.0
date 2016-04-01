From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  1 Apr 2016 10:07:10 +0200
Subject: [Buildroot] [PATCH 3/3] dropbear: use libtomath & libtomcrypt
In-Reply-To: <1459498030-19700-1-git-send-email-francois.perrad@gadz.org>
References: <1459498030-19700-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1459498030-19700-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dropbear/0001-fix-linking.patch | 36 +++++++++++++++++++++++++++++++++
 package/dropbear/dropbear.mk            |  7 +++++++
 2 files changed, 43 insertions(+)
 create mode 100644 package/dropbear/0001-fix-linking.patch

diff --git a/package/dropbear/0001-fix-linking.patch b/package/dropbear/0001-fix-linking.patch
new file mode 100644
index 0000000..93925eb
--- /dev/null
+++ b/package/dropbear/0001-fix-linking.patch
@@ -0,0 +1,36 @@
+fix linking
+
+see https://github.com/mkj/dropbear/pull/28
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+diff --git a/Makefile.in b/Makefile.in
+index d9bfdfa..0356b0f 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -16,12 +16,12 @@ endif
+ STATIC_LTC=libtomcrypt/libtomcrypt.a
+ STATIC_LTM=libtommath/libtommath.a
+ 
+-LIBTOM_LIBS=@LIBTOM_LIBS@
++LIBTOM_LIBS=-ltomcrypt -ltommath
+ 
+ ifeq (@BUNDLED_LIBTOM@, 1)
+ LIBTOM_DEPS=$(STATIC_LTC) $(STATIC_LTM) 
+ CFLAGS+=-I$(srcdir)/libtomcrypt/src/headers/
+-LIBTOM_LIBS=$(STATIC_LTC) $(STATIC_LTM) 
++LDFLAGS+=-L ./libtomcrypt -L ./libtommath
+ endif
+ 
+ COMMONOBJS=dbutil.o buffer.o dbhelpers.o \
+@@ -84,7 +84,7 @@ INSTALL=@INSTALL@
+ CPPFLAGS=@CPPFLAGS@
+ CFLAGS+=-I. -I$(srcdir) $(CPPFLAGS) @CFLAGS@
+ LIBS+=@LIBS@
+-LDFLAGS=@LDFLAGS@
++LDFLAGS+=@LDFLAGS@
+ 
+ EXEEXT=@EXEEXT@
+ 
+-- 
+
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 32e2167..f664c8d 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -12,6 +12,13 @@ DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
 
+ifeq ($(BR2_PACKAGE_LIBTOMMATH)$(BR2_PACKAGE_LIBTOMCRYPT),yy)
+DROPBEAR_DEPENDENCIES += libtommath libtomcrypt
+DROPBEAR_CONF_OPTS += --disable-bundled-libtom
+else
+DROPBEAR_CONF_OPTS += --enable-bundled-libtom
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
 # Build dbclient, and create a convenience symlink named ssh
 DROPBEAR_PROGRAMS += dbclient
-- 
2.5.0
