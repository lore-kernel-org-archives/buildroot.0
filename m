From: robert.mccabe at rockwellcollins.com <robert.mccabe@rockwellcollins.com>
Date: Tue,  9 Jul 2019 15:46:19 -0500
Subject: [Buildroot] [PATCH v2 1/1] BR2_EXTERNAL linux-kernel-extensions
 support
Message-ID: <20190709204619.425-1-robert.mccabe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "McCabe, Robert J" <robert.mccabe@rockwellcollins.com>

Allows external projects to inject custom code inside the Linux source
tree.

Signed-off-by: McCabe, Robert J <robert.mccabe@rockwellcollins.com>
---
 linux/linux.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a1378345c3..2128a36b5f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -511,14 +511,19 @@ endef
 #
 # Note: our package infrastructure uses the full-path of the last-scanned
 # Makefile to determine what package we're currently defining, using the
-# last directory component in the path. As such, including other Makefile,
-# like below, before we call one of the *-package macro is usally not
-# working.
+# last directory component in the path. As such, including other Makefiles,
+# like below, before we call one of the *-package macros usually doesn't
+# work.
 # However, since the files we include here are in the same directory as
 # the current Makefile, we are OK. But this is a hard requirement: files
-# included here *must* be in the same directory!
+# included here *must* either by in this same directory OR within a
+# another directory with the name "linux" (in the BR2_EXTERNAL case).
 include $(sort $(wildcard linux/linux-ext-*.mk))

+#Import linux-kernel-extensions from externals
+-include $(sort $(wildcard $(foreach ext,$(BR2_EXTERNAL_DIRS), \
+       $(ext)/linux/linux-ext-*.mk)))
+
 LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
        $(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))

--
2.17.1
