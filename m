From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:43:53 +0200
Subject: [Buildroot] [git commit] package/apcupsd: disable docs
Message-ID: <20200420052956.6223C8F386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21d19f5c74a6e954364fd6b58b6a86e1091042c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can skip building docs by only running make against subdirs that are
not "doc".

Fixes:
http://autobuild.buildroot.net/results/e65/e65c23c3c1cae9aa9d697323fabf8a6f310fc3ba/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
