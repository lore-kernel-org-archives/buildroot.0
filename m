From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 22:14:42 +0100
Subject: [Buildroot] [git commit] gptfdisk: use TARGET_CONFIGURE_OPTS
	properly, use TARGET_MAKE_ENV
Message-ID: <20130310213207.AFB5E9AFA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e14c0429d23bde17451b982d5b3d58f3b685fe8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$(TARGET_CONFIGURE_OPTS) should be passed as $(MAKE) argument, not in
the environment. We can then remove the redefined CC and LD variables
that were useless. We also take this opportunity to pass
$(TARGET_MAKE_ENV) in the environment of make.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gptfdisk/gptfdisk.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 2d3cb1a..656a187 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -15,10 +15,9 @@ ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
     GPTFDISK_DEPENDENCIES += popt
 endif
 
-
 define GPTFDISK_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
-		-C $(@D) $(GPTFDISK_TARGETS_y)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(GPTFDISK_TARGETS_y)
 endef
 
 define GPTFDISK_INSTALL_TARGET_CMDS
