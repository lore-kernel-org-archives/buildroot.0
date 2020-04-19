From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 19 Apr 2020 16:40:09 -0600
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: disable docs
Message-ID: <20200419224009.27450-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can skip building docs by only running make against subdirs that are
not "doc".

Fixes:
http://autobuild.buildroot.net/results/e65/e65c23c3c1cae9aa9d697323fabf8a6f310fc3ba/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/apcupsd/apcupsd.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index e750657236..ff9cc9242f 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -64,4 +64,14 @@ else
 APCUPSD_CONF_OPTS += --disable-usb
 endif
 
+define APCUPSD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/platforms
+endef
+
+define APCUPSD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/platforms DESTDIR=$(TARGET_DIR) install
+endef
+
 $(eval $(autotools-package))
-- 
2.20.1
