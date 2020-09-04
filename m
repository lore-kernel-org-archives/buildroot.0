From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 17:19:16 +0200
Subject: [Buildroot] [git commit] package/refpolicy: ensure
 REFPOLICY_EXTRA_MODULES_DIRS is empty when it should be
Message-ID: <20200904151224.786A787A1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a326b6ecb0c8710fe1064606b20818b558fcf529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When both BR2_REFPOLICY_EXTRA_MODULES_DIRS and
PACKAGES_SELINUX_EXTRA_MODULES_DIRS are empty, we expect
REFPOLICY_EXTRA_MODULES_DIRS to also be empty. However, due to spaces,
this is not the case. This commit adds a $(strip ...) call to ensure
it is the case.

Thanks to this, the check on whether REFPOLICY_EXTRA_MODULES_DIRS is
empty later on will really work as it should.

Reported-by: Antoine T??nart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/refpolicy.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index edfbb3542c..e1924f3c2d 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -42,8 +42,9 @@ ifeq ($(BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION),y)
 # Allow to provide out-of-tree SELinux modules in addition to the ones
 # in the refpolicy.
 REFPOLICY_EXTRA_MODULES_DIRS = \
-	$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS)) \
-	$(PACKAGES_SELINUX_EXTRA_MODULES_DIRS)
+	$(strip \
+		$(call qstrip,$(BR2_REFPOLICY_EXTRA_MODULES_DIRS)) \
+		$(PACKAGES_SELINUX_EXTRA_MODULES_DIRS))
 $(foreach dir,$(REFPOLICY_EXTRA_MODULES_DIRS),\
 	$(if $(wildcard $(dir)),,\
 		$(error BR2_REFPOLICY_EXTRA_MODULES_DIRS contains nonexistent directory $(dir))))
