From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 12:40:20 +0100
Subject: [Buildroot] [PATCH 3/5] crda: remove static library handling
In-Reply-To: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1425728422-14113-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit d54418f2bcd9267fd049511d6236fb91c83b94ea ("crda: fix static
build failure"), some static linking handling was added in crda. But
in a later commit, 7c08fa935f55d108e20834e6b4bba664e1d2d408 ("crda:
needs dynamic library support"), crda was marked as not available for
static only builds.

This means that the static linking logic in crda.mk is now just dead
code, so this commit gets rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/crda/crda.mk | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index abfbb8e..24bfd5f 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -12,17 +12,6 @@ CRDA_DEPENDENCIES = host-pkgconf host-python-m2crypto \
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
 
-# libnl-3 needs -lm (for rint) and -lpthread if linking statically.
-# And library order matters hence stick -lnl-3 first since it's appended
-# in the crda Makefiles as in NLLIBS+=-lnl-3 ... thus failing.
-#
-# libgcrypt needs -lgpg-error if linking statically, which is correctly
-# set by the libgcrypt-config script (and in the right order).
-ifeq ($(BR2_STATIC_LIBS),y)
-CRDA_NLLIBS += -lnl-3 -lm -lpthread
-CRDA_LDLIBS += `$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`
-endif
-
 # * key2pub.py currently is not python3 compliant (though python2/python3
 #   compliance could rather easily be achieved.
 # * key2pub.py uses M2Crypto python module, which is only available for
@@ -30,8 +19,6 @@ endif
 #   interpreter, hence the host-python dependency and the PYTHON variable.
 define CRDA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-		LDLIBS="$(CRDA_LDLIBS)" \
-		NLLIBS="$(CRDA_NLLIBS)" \
 		PYTHON=$(HOST_DIR)/usr/bin/python2 \
 		$(MAKE) all_noverify -C $(@D)
 endef
-- 
2.1.0
