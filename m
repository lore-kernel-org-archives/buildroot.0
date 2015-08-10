From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Aug 2015 14:24:50 +0300
Subject: [Buildroot] [PATCH] libsodium: disable PIE on ARC
Message-ID: <1439205890-17076-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though ARC gcc understands "-pie" option and attempts to generate
PIE binaries as of today PIE is not really supported for user-space
applications.

So we disable PIE detection if building for ARC.
That fixes http://autobuild.buildroot.net/results/be4/be46b621ce5443788b0a1bc9fab614c4ca5d0859
and also prevents execution of non-supported PIE binary in runtime.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsodium/libsodium.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index c032863..18035f3 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -10,4 +10,8 @@ LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
 LIBSODIUM_INSTALL_STAGING = YES
 
+ifeq ($(BR2_arc),y)
+LIBSODIUM_CONF_OPTS += --disable-pie
+endif
+
 $(eval $(autotools-package))
-- 
2.4.3
