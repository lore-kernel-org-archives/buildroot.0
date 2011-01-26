From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jan 2011 16:46:49 +0100
Subject: [Buildroot] [git commit master 1/1] zlib: disable call to ldconfig
Message-ID: <20110126154810.7DA408D3CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=71970895406975355a3870b1ff3920e6aefd9158
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, zlib installation procedure calls ldconfig, which takes
time uselessly. ldconfig is only useful if you install libraries on
the host (in directories listed in /etc/ld.so.conf, or in /usr/lib or
/lib), so calling it after installing libraries in $(STAGING_DIR),
$(TARGET_DIR) or $(HOST_DIR) is just a lenghty no-op.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zlib/zlib.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 58f758b..dcd2548 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -48,15 +48,15 @@ define HOST_ZLIB_BUILD_CMDS
 endef
 
 define ZLIB_INSTALL_STAGING_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) LDCONFIG=true install
 endef
 
 define ZLIB_INSTALL_TARGET_CMDS
-	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
 endef
 
 define HOST_ZLIB_INSTALL_CMDS
-	$(MAKE1) -C $(@D) install
+	$(MAKE1) -C $(@D) LDCONFIG=true install
 endef
 
 define ZLIB_CLEAN_CMDS
-- 
1.7.3.4
