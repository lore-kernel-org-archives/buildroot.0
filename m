From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:46:22 +0200
Subject: [Buildroot] [git commit] linux: add support for 3.x and -rc versions
Message-ID: <20110711214654.9E4738A482@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f45f775b4fcb271e5b94b489ad47ffd37f712ce2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index bba4921..0679238 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -15,7 +15,16 @@ LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
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
+# release candidates are in testing/ subdir
+ifneq ($(findstring -rc,$(LINUX_VERSION)),)
+LINUX_SITE = $(LINUX_SITE)testing/
+endif # -rc
 endif
 
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
-- 
1.7.3.4
