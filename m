From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 21:03:51 +0200
Subject: [Buildroot] [PATCHv2 2/4] core: allow external Config.in/makefile
	code to be integrated
In-Reply-To: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1379185433-8770-3-git-send-email-thomas.petazzoni@free-electrons.com>
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

We also add a dummy Config.in file in support/dummy-external/ to
ensure that the source "$BR2_EXTERNAL/Config.in" line will point to an
existing file even when BR2_EXTERNAL is not used by the user.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                        | 2 ++
 Makefile                         | 4 ++++
 support/dummy-external/Config.in | 0
 3 files changed, 6 insertions(+)
 create mode 100644 support/dummy-external/Config.in

diff --git a/Config.in b/Config.in
index 522eaf8..9ef5466 100644
--- a/Config.in
+++ b/Config.in
@@ -465,3 +465,5 @@ source "boot/Config.in"
 source "package/Config.in.host"
 
 source "Config.in.legacy"
+
+source "$BR2_EXTERNAL/Config.in"
diff --git a/Makefile b/Makefile
index 13ad342..bea5ad5 100644
--- a/Makefile
+++ b/Makefile
@@ -348,6 +348,10 @@ include boot/common.mk
 include linux/linux.mk
 include system/system.mk
 
+ifeq ($(BR2_EXTERNAL_USED),y)
+include $(BR2_EXTERNAL)/external.mk
+endif
+
 TARGETS+=target-finalize
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
diff --git a/support/dummy-external/Config.in b/support/dummy-external/Config.in
new file mode 100644
index 0000000..e69de29
-- 
1.8.1.2
