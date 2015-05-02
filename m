From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 15:11:01 +0200
Subject: [Buildroot] [git commit] linux: do not check hashes for custom
	versions and tarballs
Message-ID: <20150502131735.AD2B47FA68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=715ebe3b4d1702420e32b93750f03a2318d22040
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This one is a bit tricky, as the version can come from the linux-headers
package, so we must also account for that.

We currently have no hash file for linux, but better do the change now,
which allows us to later add a hash file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0c348da..c765954 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -13,6 +13,7 @@ ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
 LINUX_SITE_METHOD = local
@@ -24,6 +25,12 @@ LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = hg
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
+endif
+ifeq ($(BR2_LINUX_KERNEL_SAME_AS_HEADERS)$(BR2_KERNEL_HEADERS_VERSION),yy)
+BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
+endif
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
