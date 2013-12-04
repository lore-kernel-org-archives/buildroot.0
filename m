From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Dec 2013 19:56:10 +0100
Subject: [Buildroot] [PATCHv5 2/5] core: allow external Config.in/makefile
	code to be integrated
In-Reply-To: <1386183373-17611-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386183373-17611-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386183373-17611-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit allows the BR2_EXTERNAL directory to contain Config.in and
Makefile code, which gets integrated into the Buildroot build logic:

 - Buildroot automatically includes the $BR2_EXTERNAL/Config.in in the
   top-level configuration menu.

 - Buildroot automatically includes the BR2_EXTERNAL/external.mk in
   the build logic, so it can for example be used to include other .mk
   files that define package recipes.

This is typically intended to be used to create target packages in the
BR2_EXTERNAL directory, but can also be used for bootloaders, host
packages, or other custom make logic.

We also add a dummy Config.in file in support/dummy-external/ to
ensure that the source "$BR2_EXTERNAL/Config.in" line will point to an
existing file even when BR2_EXTERNAL is not used by the user.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                          | 2 ++
 Makefile                           | 2 ++
 support/dummy-external/Config.in   | 0
 support/dummy-external/external.mk | 0
 4 files changed, 4 insertions(+)
 create mode 100644 support/dummy-external/Config.in
 create mode 100644 support/dummy-external/external.mk

diff --git a/Config.in b/Config.in
index ea060bc..12d36b5 100644
--- a/Config.in
+++ b/Config.in
@@ -492,3 +492,5 @@ source "boot/Config.in"
 source "package/Config.in.host"
 
 source "Config.in.legacy"
+
+source "$BR2_EXTERNAL/Config.in"
diff --git a/Makefile b/Makefile
index e94c0bd..4f20bd5 100644
--- a/Makefile
+++ b/Makefile
@@ -364,6 +364,8 @@ include boot/common.mk
 include linux/linux.mk
 include system/system.mk
 
+include $(BR2_EXTERNAL)/external.mk
+
 TARGETS+=target-finalize
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
diff --git a/support/dummy-external/Config.in b/support/dummy-external/Config.in
new file mode 100644
index 0000000..e69de29
diff --git a/support/dummy-external/external.mk b/support/dummy-external/external.mk
new file mode 100644
index 0000000..e69de29
-- 
1.8.1.2
