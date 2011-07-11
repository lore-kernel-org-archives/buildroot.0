From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 22:46:16 +0200
Subject: [Buildroot] [PATCH 10/11] linux: add support for 3.x and -rc
	versions
In-Reply-To: <cover.1310417153.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310417153.git.thomas.petazzoni@free-electrons.com>
Message-ID: <631c0e709a85b6054e5f5f79675bb5b10814fa48.1310417153.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The assumption that all kernels are in
http://www.kernel.org/pub/linux/kernel/v2.6/ is no longer true:
versions 3.x are in separate directories.

We now compute the directory name from the major and minor versions of
the version provided by the user. This assumes that the 3.1 version
will be in a /v3.1/ directory, which we don't know yet because the 3.1
cycle hasn't started yet.

At the same time, we add support for the official -rcX versions.

Patch tested by compiling 3.0-rc6, which Buildroot has successfully
downloaded and built.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index bba4921..1b3b05d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -15,7 +15,15 @@ LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 LINUX_SITE_METHOD = git
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
-LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
+# to use the $(word) function. We support versions such as 3.1,
+# 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
+LINUX_VERSION_MAJOR = $(word 1,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
+LINUX_VERSION_MINOR = $(word 2,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/
+ifneq ($(findstring -rc,$(LINUX_VERSION)),)
+LINUX_SITE = $(LINUX_SITE)testing/
+endif # -rc
 endif
 
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
-- 
1.7.4.1
