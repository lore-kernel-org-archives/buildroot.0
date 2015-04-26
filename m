From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 20:26:50 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/libgsm: new package
Message-ID: <1430072810-27772-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: - fixed typo
v2: - added hash
    - updated 0001-cross.patch to reflect libgsm version
    - added license info (Thomas)
    - optimized license infos (Thomas)

 package/Config.in               |    1 +
 package/libgsm/0001-cross.patch |  205 +++++++++++++++++++++++++++++++++++++++
 package/libgsm/Config.in        |    6 ++
 package/libgsm/libgsm.hash      |    2 +
 package/libgsm/libgsm.mk        |   41 ++++++++
 5 files changed, 255 insertions(+)
 create mode 100644 package/libgsm/0001-cross.patch
 create mode 100644 package/libgsm/Config.in
 create mode 100644 package/libgsm/libgsm.hash
 create mode 100644 package/libgsm/libgsm.mk

diff --git a/package/Config.in b/package/Config.in
index da185be..744ebc6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -670,6 +670,7 @@ menu "Audio/Sound"
 	source "package/libcdio/Config.in"
 	source "package/libcue/Config.in"
 	source "package/libcuefile/Config.in"
+	source "package/libgsm/Config.in"
 	source "package/libid3tag/Config.in"
 	source "package/liblo/Config.in"
 	source "package/libmad/Config.in"
diff --git a/package/libgsm/0001-cross.patch b/package/libgsm/0001-cross.patch
new file mode 100644
index 0000000..b10f88b
--- /dev/null
+++ b/package/libgsm/0001-cross.patch
@@ -0,0 +1,205 @@
+Fix compilation problems.
+
+Downloaded from
+https://projects.archlinux.org/svntogit/packages.git/plain/trunk/gsm.patch?h=packages/gsm
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/Makefile	2006-04-26 15:14:26.000000000 -0400
++++ b/Makefile	2010-06-19 16:53:25.000000000 -0400
+@@ -44,7 +44,7 @@
+ # CCFLAGS 	= -c -O
+ 
+ CC		= gcc -ansi -pedantic
+-CCFLAGS 	= -c -O2 -DNeedFunctionPrototypes=1
++CCFLAGS 	= -c -O2 -fPIC -DNeedFunctionPrototypes=1
+ 
+ LD 		= $(CC)
+ 
+@@ -96,11 +96,11 @@
+ #  Other tools
+ 
+ SHELL		= /bin/sh
+-LN		= ln
++LN		= ln -s -f
+ BASENAME 	= basename
+ AR		= ar
+ ARFLAGS		= cr
+-RMFLAGS		=
++RMFLAGS		= -f
+ FIND		= find
+ COMPRESS 	= compress
+ COMPRESSFLAGS 	= 
+@@ -139,7 +139,7 @@
+ 
+ # Targets
+ 
+-LIBGSM	= $(LIB)/libgsm.a
++LIBGSMSO = $(LIB)/libgsm.so
+ 
+ TOAST	= $(BIN)/toast
+ UNTOAST	= $(BIN)/untoast
+@@ -257,7 +257,7 @@
+ # Install targets
+ 
+ GSM_INSTALL_TARGETS =	\
+-		$(GSM_INSTALL_LIB)/libgsm.a		\
++		$(GSM_INSTALL_LIB)/libgsm.so		\
+ 		$(GSM_INSTALL_INC)/gsm.h		\
+ 		$(GSM_INSTALL_MAN)/gsm.3		\
+ 		$(GSM_INSTALL_MAN)/gsm_explode.3	\
+@@ -279,7 +279,7 @@
+ 
+ # Target rules
+ 
+-all:		$(LIBGSM) $(TOAST) $(TCAT) $(UNTOAST)
++all:		$(LIBGSMSO) $(TOAST) $(TCAT) $(UNTOAST)
+ 		@-echo $(ROOT): Done.
+ 
+ tst:		$(TST)/lin2cod $(TST)/cod2lin $(TOAST) $(TST)/test-result
+@@ -299,24 +299,23 @@
+ 
+ # The basic API: libgsm
+ 
+-$(LIBGSM):	$(LIB) $(GSM_OBJECTS)
+-		-rm $(RMFLAGS) $(LIBGSM)
+-		$(AR) $(ARFLAGS) $(LIBGSM) $(GSM_OBJECTS)
+-		$(RANLIB) $(LIBGSM)
+-
++$(LIBGSMSO): $(LIB) $(GSM_OBJECTS)
++	$(LD) -shared -Wl,-soname,libgsm.so.1 -o $@.1.0.14 $(GSM_OBJECTS)
++	$(LN) libgsm.so.1.0.14 $(LIBGSMSO).1
++	$(LN) libgsm.so.1.0.14 $(LIBGSMSO)
+ 
+ # Toast, Untoast and Tcat -- the compress-like frontends to gsm.
+ 
+-$(TOAST):	$(BIN) $(TOAST_OBJECTS) $(LIBGSM)
+-		$(LD) $(LFLAGS) -o $(TOAST) $(TOAST_OBJECTS) $(LIBGSM) $(LDLIB)
++$(TOAST):	$(BIN) $(TOAST_OBJECTS) $(LIBGSMSO)
++		$(LD) $(LFLAGS) -o $(TOAST) $(TOAST_OBJECTS) $(LIBGSMSO) $(LDLIB)
+ 
+ $(UNTOAST):	$(BIN) $(TOAST)
+ 		-rm $(RMFLAGS) $(UNTOAST)
+-		$(LN) $(TOAST) $(UNTOAST)
++		$(LN) toast $(UNTOAST)
+ 
+ $(TCAT):	$(BIN) $(TOAST)
+ 		-rm $(RMFLAGS) $(TCAT)
+-		$(LN) $(TOAST) $(TCAT)
++		$(LN) toast $(TCAT)
+ 
+ 
+ # The local bin and lib directories
+@@ -351,53 +350,54 @@
+ 		fi
+ 
+ $(TOAST_INSTALL_BIN)/toast:	$(TOAST)
+-		-rm $@
++		-rm $(RMFLAGS) $@
+ 		cp $(TOAST) $@
+ 		chmod 755 $@
+ 
+ $(TOAST_INSTALL_BIN)/untoast:	$(TOAST_INSTALL_BIN)/toast
+-		-rm $@
+-		ln $? $@
++		-rm $(RMFLAGS) $@
++		$(LN) toast $@
+ 
+ $(TOAST_INSTALL_BIN)/tcat:	$(TOAST_INSTALL_BIN)/toast
+-		-rm $@
+-		ln $? $@
++		-rm $(RMFLAGS) $@
++		$(LN) toast $@
+ 
+ $(TOAST_INSTALL_MAN)/toast.1:	$(MAN)/toast.1
+-		-rm $@
++		-rm $(RMFLAGS) $@
+ 		cp $? $@
+ 		chmod 444 $@
+ 
+ $(GSM_INSTALL_MAN)/gsm.3:	$(MAN)/gsm.3
+-		-rm $@
++		-rm $(RMFLAGS) $@
+ 		cp $? $@
+ 		chmod 444 $@
+ 
+ $(GSM_INSTALL_MAN)/gsm_option.3:	$(MAN)/gsm_option.3
+-		-rm $@
++		-rm $(RMFLAGS) $@
+ 		cp $? $@
+ 		chmod 444 $@
+ 
+ $(GSM_INSTALL_MAN)/gsm_explode.3:	$(MAN)/gsm_explode.3
+-		-rm $@
++		-rm $(RMFLAGS) $@
+ 		cp $? $@
+ 		chmod 444 $@
+ 
+ $(GSM_INSTALL_MAN)/gsm_print.3:	$(MAN)/gsm_print.3
+-		-rm $@
++		-rm $(RMFLAGS) $@
+ 		cp $? $@
+ 		chmod 444 $@
+ 
+ $(GSM_INSTALL_INC)/gsm.h:	$(INC)/gsm.h
+-		-rm $@
+-		cp $? $@
+-		chmod 444 $@
+-
+-$(GSM_INSTALL_LIB)/libgsm.a:	$(LIBGSM)
+-		-rm $@
++		-rm $(RMFLAGS) $@
+ 		cp $? $@
+ 		chmod 444 $@
+ 
++$(GSM_INSTALL_LIB)/libgsm.so:	$(LIBGSMSO)
++		-rm $(RMFLAGS) $@ $@.1 $@.1.0.14
++		cp $?.1.0.14 $@.1.0.14
++		chmod 755 $@.1.0.13
++		$(LN) libgsm.so.1.0.14 $@
++		$(LN) libgsm.so.1.0.14 $@.1
+ 
+ # Distribution
+ 
+@@ -425,7 +425,7 @@
+ 			-print | xargs rm $(RMFLAGS)
+ 
+ clean:	semi-clean
+-		-rm $(RMFLAGS) $(LIBGSM) $(ADDTST)/add		\
++		-rm $(RMFLAGS) $(LIBGSMSO)* $(ADDTST)/add		\
+ 			$(TOAST) $(TCAT) $(UNTOAST)	\
+ 			$(ROOT)/gsm-1.0.tar.Z
+ 
+@@ -473,22 +473,22 @@
+ $(TST)/test-result:	$(TST)/lin2cod $(TST)/cod2lin $(TOAST) $(TST)/run
+ 			( cd $(TST); ./run ) 
+ 
+-$(TST)/lin2txt:		$(TST)/lin2txt.o $(LIBGSM)
++$(TST)/lin2txt:		$(TST)/lin2txt.o $(LIBGSMSO)
+ 			$(LD) $(LFLAGS) -o $(TST)/lin2txt \
+-				$(TST)/lin2txt.o $(LIBGSM) $(LDLIB)
++				$(TST)/lin2txt.o $(LIBGSMSO) $(LDLIB)
+ 
+-$(TST)/lin2cod:		$(TST)/lin2cod.o $(LIBGSM)
++$(TST)/lin2cod:		$(TST)/lin2cod.o $(LIBGSMSO)
+ 			$(LD) $(LFLAGS) -o $(TST)/lin2cod \
+-				$(TST)/lin2cod.o $(LIBGSM) $(LDLIB)
++				$(TST)/lin2cod.o $(LIBGSMSO) $(LDLIB)
+ 
+-$(TST)/gsm2cod:		$(TST)/gsm2cod.o $(LIBGSM)
++$(TST)/gsm2cod:		$(TST)/gsm2cod.o $(LIBGSMSO)
+ 			$(LD) $(LFLAGS) -o $(TST)/gsm2cod \
+-				$(TST)/gsm2cod.o $(LIBGSM) $(LDLIB)
++				$(TST)/gsm2cod.o $(LIBGSMSO) $(LDLIB)
+ 
+-$(TST)/cod2txt:		$(TST)/cod2txt.o $(LIBGSM)
++$(TST)/cod2txt:		$(TST)/cod2txt.o $(LIBGSMSO)
+ 			$(LD) $(LFLAGS) -o $(TST)/cod2txt \
+-				$(TST)/cod2txt.o $(LIBGSM) $(LDLIB)
++				$(TST)/cod2txt.o $(LIBGSMSO) $(LDLIB)
+ 
+-$(TST)/cod2lin:		$(TST)/cod2lin.o $(LIBGSM)
++$(TST)/cod2lin:		$(TST)/cod2lin.o $(LIBGSMSO)
+ 			$(LD) $(LFLAGS) -o $(TST)/cod2lin \
+-				$(TST)/cod2lin.o $(LIBGSM) $(LDLIB)
++				$(TST)/cod2lin.o $(LIBGSMSO) $(LDLIB)
diff --git a/package/libgsm/Config.in b/package/libgsm/Config.in
new file mode 100644
index 0000000..da6e22f
--- /dev/null
+++ b/package/libgsm/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBGSM
+	bool "libgsm"
+	help
+	  Shared libraries for GSM 06.10 lossy speech compression.
+
+	  http://www.quut.com/gsm
diff --git a/package/libgsm/libgsm.hash b/package/libgsm/libgsm.hash
new file mode 100644
index 0000000..c0c7d3b
--- /dev/null
+++ b/package/libgsm/libgsm.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	5814a16a30b3c026871b3739812dc4a2a84299331182c987da1c212c93e9352c	gsm-1.0.14.tar.gz
diff --git a/package/libgsm/libgsm.mk b/package/libgsm/libgsm.mk
new file mode 100644
index 0000000..e95109e
--- /dev/null
+++ b/package/libgsm/libgsm.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# libgsm
+#
+################################################################################
+
+LIBGSM_VERSION = 1.0.14
+LIBGSM_SOURCE = gsm-$(LIBGSM_VERSION).tar.gz
+LIBGSM_SITE = http://www.quut.com/gsm
+LIBGSM_LICENSE = gsm
+LIBGSM_LICENSE_FILES = COPYRIGHT
+LIBGSM_INSTALL_STAGING = YES
+
+define LIBGSM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+endef
+
+# install targets are not safe for parallel jobs
+define LIBGSM_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/share/man/man1/
+	mkdir -p $(STAGING_DIR)/usr/share/man/man3/
+	$(TARGET_MAKE_ENV) $(MAKE1) CC=$(TARGET_CC) -C $(@D) \
+		INSTALL_ROOT=$(STAGING_DIR)/usr \
+		GSM_INSTALL_INC=$(STAGING_DIR)/usr/include \
+		GSM_INSTALL_MAN=$(STAGING_DIR)/usr/share/man/man3 \
+		TOAST_INSTALL_MAN=$(STAGING_DIR)/usr/share/man/man1 \
+		install
+endef
+
+define LIBGSM_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/man/man1/
+	mkdir -p $(TARGET_DIR)/usr/share/man/man3/
+	$(TARGET_MAKE_ENV) $(MAKE1) CC=$(TARGET_CC) -C $(@D) \
+		INSTALL_ROOT=$(TARGET_DIR)/usr \
+		GSM_INSTALL_INC=$(TARGET_DIR)/usr/include \
+		GSM_INSTALL_MAN=$(TARGET_DIR)/usr/share/man/man3 \
+		TOAST_INSTALL_MAN=$(TARGET_DIR)/usr/share/man/man1 \
+		install
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
