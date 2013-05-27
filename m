From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 01:00:59 +0200
Subject: [Buildroot] [PATCH 1/6] bzip2: improve the packaging
In-Reply-To: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369695664-5670-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of doing some nasty SED tricks, use a patch that modifies the
bzip2 build system to make it a little bit nicer. Those SEDs were made
differently for the host and target packages, which is contrary to the
logic of not having any difference in the source tree between the host
build and the target build.

This commit also makes sure that bzip2.mk behaves properly in a
BR2_PREFER_STATIC_LIB=y context.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bzip2/bzip2-improve-build-system.patch |   84 ++++++++++++++++++++++
 package/bzip2/bzip2.mk                         |   92 ++++++++----------------
 2 files changed, 115 insertions(+), 61 deletions(-)
 create mode 100644 package/bzip2/bzip2-improve-build-system.patch

diff --git a/package/bzip2/bzip2-improve-build-system.patch b/package/bzip2/bzip2-improve-build-system.patch
new file mode 100644
index 0000000..90099aa
--- /dev/null
+++ b/package/bzip2/bzip2-improve-build-system.patch
@@ -0,0 +1,84 @@
+Improve bzip2 build system
+
+This patch makes a number of improvements to the bzip2 build system:
+
+ * Remove the BIGFILE variable that was used to force largefile
+   support. Now, the user of the Makefile is supposed to pass
+   -D_FILE_OFFSET_BITS=64 when largefile support is desired.
+
+ * Use override CFLAGS += so that additional CFLAGS can be passed on
+   the command line.
+
+ * Removed "forced" CFLAGS -O2, -g and -Winline. We don't want them by
+   default, and want the build system to use its own ones.
+
+ * When creating the symbolic links bzegrep, bzfgrep, bzless and
+   bzcmp, don't link them to an absolute path, or they'll point to
+   some path on the build machine.
+
+ * Provide an install target for the shared library, which creates the
+   appropriate symbolic links.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -20,8 +20,7 @@
+ RANLIB=ranlib
+ LDFLAGS=
+ 
+-BIGFILES=-D_FILE_OFFSET_BITS=64
+-CFLAGS=-Wall -Winline -O2 -g $(BIGFILES)
++override CFLAGS += -Wall
+ 
+ # Where you want it installed when you do 'make install'
+ PREFIX=/usr/local
+@@ -90,14 +89,14 @@
+ 	cp -f libbz2.a $(PREFIX)/lib
+ 	chmod a+r $(PREFIX)/lib/libbz2.a
+ 	cp -f bzgrep $(PREFIX)/bin/bzgrep
+-	ln -s -f $(PREFIX)/bin/bzgrep $(PREFIX)/bin/bzegrep
+-	ln -s -f $(PREFIX)/bin/bzgrep $(PREFIX)/bin/bzfgrep
++	ln -s -f bzgrep $(PREFIX)/bin/bzegrep
++	ln -s -f bzgrep $(PREFIX)/bin/bzfgrep
+ 	chmod a+x $(PREFIX)/bin/bzgrep
+ 	cp -f bzmore $(PREFIX)/bin/bzmore
+-	ln -s -f $(PREFIX)/bin/bzmore $(PREFIX)/bin/bzless
++	ln -s -f bzmore $(PREFIX)/bin/bzless
+ 	chmod a+x $(PREFIX)/bin/bzmore
+ 	cp -f bzdiff $(PREFIX)/bin/bzdiff
+-	ln -s -f $(PREFIX)/bin/bzdiff $(PREFIX)/bin/bzcmp
++	ln -s -f bzdiff $(PREFIX)/bin/bzcmp
+ 	chmod a+x $(PREFIX)/bin/bzdiff
+ 	cp -f bzgrep.1 bzmore.1 bzdiff.1 $(PREFIX)/man/man1
+ 	chmod a+r $(PREFIX)/man/man1/bzgrep.1
+Index: b/Makefile-libbz2_so
+===================================================================
+--- a/Makefile-libbz2_so
++++ b/Makefile-libbz2_so
+@@ -23,8 +23,7 @@
+ 
+ SHELL=/bin/sh
+ CC=gcc
+-BIGFILES=-D_FILE_OFFSET_BITS=64
+-CFLAGS=-fpic -fPIC -Wall -Winline -O2 -g $(BIGFILES)
++override CFLAGS += -fpic -fPIC -Wall
+ 
+ OBJS= blocksort.o  \
+       huffman.o    \
+@@ -37,8 +36,11 @@
+ all: $(OBJS)
+ 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.6 $(OBJS)
+ 	$(CC) $(CFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.6
+-	rm -f libbz2.so.1.0
+-	ln -s libbz2.so.1.0.6 libbz2.so.1.0
++
++install:
++	install -m 0755 -D libbz2.so.1.0.6 $(PREFIX)/lib/libbz2.so.1.0.6
++	ln -sf libbz2.so.1.0.6 $(PREFIX)/lib/libbz2.so
++	ln -sf libbz2.so.1.0.6 $(PREFIX)/lib/libbz2.so.1.0
+ 
+ clean: 
+ 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.6 libbz2.so.1.0 bzip2-shared
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index b3e4ad3..5f8c35e 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -10,67 +10,45 @@ BZIP2_INSTALL_STAGING = YES
 BZIP2_LICENSE = bzip2 license
 BZIP2_LICENSE_FILES = LICENSE
 
-define BZIP2_FIX_MAKEFILE
-	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
-	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION)) \
-	    libbz2.so,g" $(@D)/Makefile-libbz2_so
-	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(@D)/Makefile
-	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(@D)/Makefile-libbz2_so
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define BZIP2_BUILD_SHARED_CMDS
+	$(TARGET_MAKE_ENV)
+		$(MAKE) -C $(@D) -f Makefile-libbz2_so $(TARGET_CONFIGURE_OPTS)
 endef
+endif
 
-BZIP2_POST_PATCH_HOOKS += BZIP2_FIX_MAKEFILE
-
-define BZIP2_NOLARGEFILE_FIX_MAKEFILE
-	$(SED) "s,^BIGFILES,#BIGFILES,g" $(@D)/Makefile
-	$(SED) "s,^BIGFILES,#BIGFILES,g" $(@D)/Makefile-libbz2_so
+define BZIP2_BUILD_CMDS
+	$(TARGET_MAKE_ENV)
+		$(MAKE) -C $(@D) libbz2.a bzip2 bzip2recover $(TARGET_CONFIGURE_OPTS)
+	$(BZIP2_BUILD_SHARED_CMDS)
 endef
 
-ifneq ($(BR2_LARGEFILE),y)
-BZIP2_POST_PATCH_HOOKS += BZIP2_NOLARGEFILE_FIX_MAKEFILE
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define BZIP2_INSTALL_STAGING_SHARED_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-f Makefile-libbz2_so PREFIX=$(STAGING_DIR)/usr -C $(@D) install
+endef
 endif
 
-define BZIP2_BUILD_CMDS
-	$(TARGET_MAKE_ENV) \
-	$(MAKE) -C $(@D) -f Makefile-libbz2_so \
-	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)"
-	$(TARGET_MAKE_ENV) \
-	$(MAKE) -C $(@D) \
-	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)" \
-	libbz2.a bzip2 bzip2recover
+define BZIP2_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		PREFIX=$(STAGING_DIR)/usr -C $(@D) install
+	$(BZIP2_INSTALL_STAGING_SHARED_CMDS)
 endef
 
-define BZIP2_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
-	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/lib
-	cp $(@D)/libbz2.so.$(BZIP2_VERSION) $(STAGING_DIR)/usr/lib/
-	cp $(@D)/libbz2.a $(STAGING_DIR)/usr/lib/
-	(cd $(STAGING_DIR)/usr/lib/; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1; \
-	)
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define BZIP2_INSTALL_TARGET_SHARED_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-f Makefile-libbz2_so PREFIX=$(TARGET_DIR)/usr -C $(@D) install
 endef
+endif
 
 # make sure busybox doesn't get overwritten by make install
 define BZIP2_INSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,bzip2 bunzip2 bzcat)
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
-	cp $(@D)/libbz2.so.$(BZIP2_VERSION) $(TARGET_DIR)/usr/lib/
-	(cd $(TARGET_DIR)/usr/lib; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1; \
-		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so; \
-	)
-	(cd $(TARGET_DIR)/usr/bin; \
-		ln -snf bzip2 bunzip2; \
-		ln -snf bzip2 bzcat; \
-		ln -snf bzdiff bzcmp; \
-		ln -snf bzmore bzless; \
-		ln -snf bzgrep bzegrep; \
-		ln -snf bzgrep bzfgrep; \
-	)
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		PREFIX=$(TARGET_DIR)/usr -C $(@D) install
+	$(BZIP2_INSTALL_TARGET_SHARED_CMDS)
 endef
 
 define BZIP2_CLEAN_CMDS
@@ -83,24 +61,16 @@ define BZIP2_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-define HOST_BZIP2_FIX_MAKEFILE
-	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
-	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION) \
-	    libbz2.so,g" $(@D)/Makefile-libbz2_so
-	$(SED) "s:-O2:$(HOST_CFLAGS):" $(@D)/Makefile
-	$(SED) "s:-O2:$(HOST_CFLAGS):" $(@D)/Makefile-libbz2_so
-endef
-
-HOST_BZIP2_POST_PATCH_HOOKS += HOST_BZIP2_FIX_MAKEFILE
-
 define HOST_BZIP2_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) -f Makefile-libbz2_so
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) libbz2.a bzip2 bzip2recover
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) -f Makefile-libbz2_so
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) libbz2.a bzip2 bzip2recover
 endef
 
 define HOST_BZIP2_INSTALL_CMDS
 	$(HOST_MAKE_ENV) \
-	$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
+		$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
1.7.9.5
