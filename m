From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 08:34:28 +1300
Subject: [Buildroot] [git commit] package/libgsm: new package
Message-ID: <20170127193518.17D268211E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed8c4077cc26c245cef3f2762dc31b4321b9f1f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr:
  - manually install things, it's easier than using the flawed install
    rules of the package
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Thomas: minor tweaks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |   1 +
 package/libgsm/0001-misc.patch | 205 +++++++++++++++++++++++++++++++++++++++++
 package/libgsm/Config.in       |  10 ++
 package/libgsm/libgsm.hash     |   2 +
 package/libgsm/libgsm.mk       |  45 +++++++++
 5 files changed, 263 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f52a1eb..0dded56 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -865,6 +865,7 @@ menu "Audio/Sound"
 	source "package/libcuefile/Config.in"
 	source "package/libebur128/Config.in"
 	source "package/libg7221/Config.in"
+	source "package/libgsm/Config.in"
 	source "package/libid3tag/Config.in"
 	source "package/libilbc/Config.in"
 	source "package/liblo/Config.in"
diff --git a/package/libgsm/0001-misc.patch b/package/libgsm/0001-misc.patch
new file mode 100644
index 0000000..735d744
--- /dev/null
+++ b/package/libgsm/0001-misc.patch
@@ -0,0 +1,205 @@
+Misc fixes from Archlinux
+
+Patch from:
+    https://git.archlinux.org/svntogit/packages.git/plain/gsm/trunk/gsm.patch
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
++	$(LD) -shared -Wl,-soname,libgsm.so.1 -o $@.1.0.13 $(GSM_OBJECTS)
++	$(LN) libgsm.so.1.0.13 $(LIBGSMSO).1
++	$(LN) libgsm.so.1.0.13 $(LIBGSMSO)
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
++		-rm $(RMFLAGS) $@ $@.1 $@.1.0.13
++		cp $?.1.0.13 $@.1.0.13
++		chmod 755 $@.1.0.13
++		$(LN) libgsm.so.1.0.13 $@
++		$(LN) libgsm.so.1.0.13 $@.1
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
index 0000000..c6edefe
--- /dev/null
+++ b/package/libgsm/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBGSM
+	bool "libgsm"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Shared libraries for GSM 06.10 lossy speech compression.
+
+	  http://www.quut.com/gsm
+
+comment "libgsm needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libgsm/libgsm.hash b/package/libgsm/libgsm.hash
new file mode 100644
index 0000000..bcfb650
--- /dev/null
+++ b/package/libgsm/libgsm.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  725a3768a1e23ab8648b4df9d470aed38eb1635af3cbc8d0b64fef077236f4ce  gsm-1.0.16.tar.gz
diff --git a/package/libgsm/libgsm.mk b/package/libgsm/libgsm.mk
new file mode 100644
index 0000000..8e8335a
--- /dev/null
+++ b/package/libgsm/libgsm.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# libgsm
+#
+################################################################################
+
+LIBGSM_VERSION = 1.0.16
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
+# Install targets are not safe for parallel jobs. However, since there's
+# just only a bunch of files to install, just do it manually. Note that,
+# even though the package version is '1.0.16', the solib is generated as
+# '1.0.13' and its SONAME is just '1'.
+#
+# For staging, we install all the .so symlinks, and the header.
+define LIBGSM_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/inc/gsm.h $(STAGING_DIR)/usr/include/gsm.h
+	$(INSTALL) -D -m 0644 $(@D)/lib/libgsm.so.1.0.13 $(STAGING_DIR)/usr/lib/libgsm.so.1.0.13
+	ln -sf libgsm.so.1.0.13 $(STAGING_DIR)/usr/lib/libgsm.so.1
+	ln -sf libgsm.so.1.0.13 $(STAGING_DIR)/usr/lib/libgsm.so
+endef
+
+# Install targets are not safe for parallel jobs. However, since there's
+# just only a bunch of files to install, just do it manually. Note that,
+# even though the package version is '1.0.16', the solib is versioned as
+# '1.0.13' and its SONAME is just versioned with '1'.
+#
+# For target, we just need the library to be installed as its SONAME, and
+# the programs.
+define LIBGSM_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/lib/libgsm.so.1.0.13 $(TARGET_DIR)/usr/lib/libgsm.so.1
+	$(INSTALL) -D -m 0755 $(@D)/bin/toast $(TARGET_DIR)/usr/bin/toast
+	$(INSTALL) -D -m 0755 $(@D)/bin/tcat $(TARGET_DIR)/usr/bin/tcat
+	$(INSTALL) -D -m 0755 $(@D)/bin/untoast $(TARGET_DIR)/usr/bin/untoast
+endef
+
+$(eval $(generic-package))
