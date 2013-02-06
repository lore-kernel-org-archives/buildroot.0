From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Feb 2013 21:46:02 +0100
Subject: [Buildroot] [PATCH 4/8] gptfdisk: use TARGET_CONFIGURE_OPTS
	properly, use TARGET_MAKE_ENV
In-Reply-To: <1360183566-27556-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360183566-27556-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360183566-27556-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$(TARGET_CONFIGURE_OPTS) should be passed as $(MAKE) argument, not in
the environment. We can then remove the redefined CC and LD variables
that were useless. We also take this opportunity to pass
$(TARGET_MAKE_ENV) in the environment of make.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gptfdisk/gptfdisk.mk |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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
-- 
1.7.9.5
