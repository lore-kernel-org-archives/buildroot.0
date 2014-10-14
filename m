From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 14 Oct 2014 18:52:23 +0200
Subject: [Buildroot] [PATCH] botan: fix build with
	mips64el-ctng_n32-linux-gnu toolchain
Message-ID: <1413305543-32388-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

set --cpu only with "mips"

see http://autobuild.buildroot.org/results/5dc/5dc907c0334d3a3b7abff41eef4e025c1f29a655/build-end.log

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/botan/botan.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index ae0e02d..226294b 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -13,8 +13,14 @@ BOTAN_LICENSE_FILES = doc/license.txt
 BOTAN_INSTALL_STAGING = YES
 BOTAN_INSTALL_TARGET = YES
 
+BOTAN_ARCH = $(BR2_ARCH)
+
+ifneq ($(findstring mips,$(BOTAN_ARCH)),)
+	BOTAN_ARCH = mips
+endif
+
 BOTAN_CONF_OPTS = \
-	--cpu=$(BR2_ARCH) \
+	--cpu=$(BOTAN_ARCH) \
 	--os=linux \
 	--cc=gcc \
 	--cc-bin="$(TARGET_CXX)"
-- 
1.9.1
