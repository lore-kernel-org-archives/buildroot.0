From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 10:03:34 +0200
Subject: [Buildroot] [git commit] 4th: build with -fPIC when shared library
	build is enabled
Message-ID: <20160707080422.D886382119@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3991b22121b7a0f26753ecc2c3ec7877978dd0ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/1e288dabbdd0c5131c18e1426ed6ceedce046b9c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/4th/4th.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index d920eb0..071c2d4 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -14,16 +14,19 @@
 4TH_DEPENDENCIES = host-4th
 4TH_INSTALL_STAGING = YES
 
+4TH_CFLAGS = $(TARGET_CFLAGS) -DUNIX -fsigned-char
+
 ifeq ($(BR2_STATIC_LIBS),y)
 4TH_MAKE_ENV = STATIC=1
 else
 4TH_MAKE_ENV = SHARED=1
+4TH_CFLAGS += -fPIC
 endif
 
 define 4TH_BUILD_CMDS
 	$(4TH_MAKE_ENV) $(MAKE) -C $(@D)/sources all \
 		CROSS="$(TARGET_CROSS)" \
-		CFLAGS="$(TARGET_CFLAGS) -DUNIX -fsigned-char" \
+		CFLAGS="$(4TH_CFLAGS)" \
 		FOURTH=$(HOST_DIR)/usr/bin/4th
 endef
 
