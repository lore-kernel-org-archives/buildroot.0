From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:06 +0100
Subject: [Buildroot] [PATCH 10/16] linux-headers: rework hash exclusion
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-11-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although we currently don't have a .hash file for linux-headers, there
already are exclusions for the BR2_KERNEL_HEADERS_AS_KERNEL case (copied
from linux.mk).  However, there is no exclusion for the
BR2_KERNEL_HEADERS_VERSION case.

For the BR2_KERNEL_HEADERS_AS_KERNEL case, the exclusion is actually
not needed. Indeed, KERNEL_HEADERS_SOURCE is computed to be the same
value as LINUX_SOURCE, and linux.mk already adds LINUX_SOURCE to
BR_NO_CHECK_HASH_FOR.

For the other cases, we should exclude the BR2_KERNEL_HEADERS_VERSION
case because there the user supplies the version so it can't be
included in the .hash file.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-headers/linux-headers.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 8f339cfec5..d83b9b0b02 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -16,7 +16,6 @@ ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_HEADERS_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_TARBALL)))
 LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_TARBALL))
-BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_HEADERS_SITE_METHOD = git
@@ -29,9 +28,6 @@ LINUX_HEADERS_SITE_METHOD = hg
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
 else
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
-ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
-BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
-endif
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
@@ -80,6 +76,10 @@ LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
+ifeq ($(BR2_KERNEL_HEADERS_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
+endif
+
 endif # ! BR2_KERNEL_HEADERS_AS_KERNEL
 
 LINUX_HEADERS_LICENSE = GPLv2
-- 
2.11.0
