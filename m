From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  5 Mar 2014 23:04:45 +0100
Subject: [Buildroot] [PATCH 6/6] crda: override python interperter
In-Reply-To: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
References: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1394057085-10399-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During its build, crda calls a python script importing m2crypto module
which requires python2 interpreter.

So, we have a build dependency against host-python.

Also, we make sure this python script is interpreted using the right
python interpreter; we add a patch allowing to enforce this and
explicitly set it.

Fixes:
  http://autobuild.buildroot.net/results/a1e/a1e53d66d3962fd5431e7601937b071a0a3c2084/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...file-allow-to-override-python-interpreter.patch | 34 ++++++++++++++++++++++
 package/crda/crda.mk                               |  8 ++++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 package/crda/crda-0001-Makefile-allow-to-override-python-interpreter.patch

diff --git a/package/crda/crda-0001-Makefile-allow-to-override-python-interpreter.patch b/package/crda/crda-0001-Makefile-allow-to-override-python-interpreter.patch
new file mode 100644
index 0000000..2481390
--- /dev/null
+++ b/package/crda/crda-0001-Makefile-allow-to-override-python-interpreter.patch
@@ -0,0 +1,34 @@
+From 6831024a247fd89c7f7adcbee8a0be991b3caaf4 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 2 Mar 2014 23:45:44 +0100
+Subject: [PATCH] Makefile: allow to override python interpreter
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1d34bde..d7134ff 100644
+--- a/Makefile
++++ b/Makefile
+@@ -42,6 +42,7 @@ LDLIBS += -lgcrypt
+ reglib.o: keys-gcrypt.c
+ 
+ endif
++PYTHON ?= python2
+ MKDIR ?= mkdir -p
+ INSTALL ?= install
+ 
+@@ -103,7 +104,7 @@ $(REG_BIN):
+ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR)/*.pem)
+ 	$(NQ) '  GEN ' $@
+ 	$(NQ) '  Trusted pubkeys:' $(wildcard $(PUBKEY_DIR)/*.pem)
+-	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
++	$(Q)$(PYTHON) ./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
+ 
+ %.o: %.c regdb.h reglib.h
+ 	$(NQ) '  CC  ' $@
+-- 
+1.9.0
+
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index ce87d44..0a10816 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -8,7 +8,7 @@ CRDA_VERSION = 1.1.3
 CRDA_SOURCE = crda-$(CRDA_VERSION).tar.bz2
 CRDA_SITE = http://wireless.kernel.org/download/crda
 CRDA_DEPENDENCIES = host-pkgconf host-python-m2crypto \
-	libnl libgcrypt
+	libnl libgcrypt host-python
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
 
@@ -23,10 +23,16 @@ CRDA_NLLIBS += -lnl-3 -lm -lpthread
 CRDA_LDLIBS += `$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`
 endif
 
+# * key2pub.py currently is not python3 compliant (thought python2/pyhton3
+#   compliance could rather easily be achieved.
+# * key2pub.py uses M2Crypto python module, which is only available for
+#   python2, so we have to make sure this script is run suing the python2
+#   interpreter, hence the host-python dependency and the PYTHON var.
 define CRDA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		LDLIBS="$(CRDA_LDLIBS)" \
 		NLLIBS="$(CRDA_NLLIBS)" \
+		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(MAKE) all_noverify -C $(@D)
 endef
 
-- 
1.9.0
