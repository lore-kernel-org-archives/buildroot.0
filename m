From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:13:59 +0200
Subject: [Buildroot] [git commit] linux: exclude from hash check except for
	latest version
Message-ID: <20170611123751.397B88189C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba0a5b11d9c9f3b4ed579e34327928dbdb0bcaa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't have a hash for any linux version. We currently also don't
have a hash for the latest version, but if we ever add a hash, it
will only be for the latest version.

This simplifies the code a little because soon we will add hash checks
for git as well, so we also need an exclusion in that case. It's much
easier to always exclude except in the single case where we do have a
hash.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 9da7e9b..d06f74f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -20,7 +20,6 @@ ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
-BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
@@ -34,9 +33,6 @@ else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
 LINUX_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/bwh/linux-cip.git
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
-ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
-BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
-endif
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 4.0, 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
@@ -53,6 +49,10 @@ LINUX_SITE := $(LINUX_SITE)/testing
 endif # -rc
 endif
 
+ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
+endif
+
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 # We rely on the generic package infrastructure to download and apply
