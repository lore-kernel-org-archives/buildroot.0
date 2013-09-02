From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 22:59:00 +0200
Subject: [Buildroot] [git commit] kmod: allow to build a host variant
Message-ID: <20130902213322.08A619B6B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00deac473c8ecba6d611b9ffbfaa55645036be46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since module-init-tools is deprecated, we now want to use kmod instead
for the installation of modules during the kernel build process. In
order to do this, we need to be able to build a host variant of kmod,
which is want this patch allows to do.

Note that only the depmod tool is installed on the host, since that's
the only one likely to be used on the host in a cross-compilation
context.

[Peter: needs AUTORECONF for the host as well. Fix comment while we're at it]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 06d8dc5..649415f 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -10,8 +10,9 @@ KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 
-# Some patches are touching configure.in
+# Some patches are touching configure.ac
 KMOD_AUTORECONF = YES
+HOST_KMOD_AUTORECONF = YES
 
 # license info for libkmod only, conditionally add more below
 KMOD_LICENSE = LGPLv2.1+
@@ -57,4 +58,14 @@ else
 KMOD_CONF_OPT += --disable-tools
 endif
 
+# We only install depmod, since that's the only tool used for the
+# host.
+define HOST_KMOD_INSTALL_TOOLS
+	mkdir -p $(HOST_DIR)/sbin/
+	ln -sf ../usr/bin/kmod $(HOST_DIR)/sbin/depmod
+endef
+
+HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
