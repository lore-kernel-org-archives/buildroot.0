From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 21:29:47 +0100
Subject: [Buildroot] [git commit] oprofile: don't install shared library in
	BR2_STATIC_LIBS=y configs
Message-ID: <20151122203114.7049B80812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=953b84a930fe6872ec349fb977fc9475da501931
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building with BR2_STATIC_LIBS=y, no shared library gets built, so
the installation of libopagent.so* fails. This commit gets rid of this
installation step when BR2_STATIC_LIBS=y.

Fixes:

  http://autobuild.buildroot.net/results/2a6604622392a3f127fb61505e2751a88a90af7b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/oprofile.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index ba36640..c73086e 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -47,6 +47,12 @@ endif
 # a static build. We have to do the call to pkgconfig manually...
 OPROFILE_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
 
+ifeq ($(BR2_STATIC_LIBS),)
+define OPROFILE_INSTALL_SHARED_LIBRARY
+	$(INSTALL) -m 755 $(@D)/libopagent/.libs/*.so* $(TARGET_DIR)/usr/lib/oprofile
+endef
+endif
+
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile
@@ -57,7 +63,7 @@ define OPROFILE_INSTALL_TARGET_CMDS
 	fi
 	$(INSTALL) -m 644 $(@D)/libregex/stl.pat $(TARGET_DIR)/usr/share/oprofile
 	$(INSTALL) -m 755 $(addprefix $(@D)/, $(OPROFILE_BINARIES)) $(TARGET_DIR)/usr/bin
-	$(INSTALL) -m 755 $(@D)/libopagent/.libs/*.so* $(TARGET_DIR)/usr/lib/oprofile
+	$(OPROFILE_INSTALL_SHARED_LIBRARY)
 endef
 
 $(eval $(autotools-package))
