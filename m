From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Mar 2015 19:57:28 +0100
Subject: [Buildroot] [PATCH 1/2] linux: add note about why it's safe to
	include other .mk files
In-Reply-To: <cover.1426272973.git.yann.morin.1998@free.fr>
References: <cover.1426272973.git.yann.morin.1998@free.fr>
Message-ID: <693e958df2ac17a7229db603ab68ec9ff7098508.1426272973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 linux/linux.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5afcd4e..b1aca41 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -323,6 +323,14 @@ define LINUX_INSTALL_TARGET_CMDS
 	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
+# Note: our package infrastructure uses the full-path of the last-scanned
+# Makefile to determine what package we're currently defining, using the
+# last directory component in the path. As such, including other Makefile,
+# like below, before we call one of the *-package macro is usally not
+# working.
+# However, since the files we include here are in the same directory as
+# the current Makefile, we are OK. But this is a hard requirement: files
+# included here *must* be in the same directory!
 include $(sort $(wildcard linux/linux-ext-*.mk))
 
 $(eval $(kconfig-package))
-- 
1.9.1
