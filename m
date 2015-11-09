From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2015 21:48:10 +0100
Subject: [Buildroot] [git commit] system: Fix warning when selecting systemd
	and ensure merged /usr workarounds are enabled
Message-ID: <20151109205943.947248177A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29206817d00f8a00991be771fc3db456b5881597
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With systemd and a custom skeleton, we end up with the following warning:

warning: (BR2_INIT_SYSTEMD) selects BR2_ROOTFS_MERGED_USR which has
unmet direct dependencies (BR2_ROOTFS_SKELETON_DEFAULT)

Which makes sense as the logic to install the symlinks to /usr is part of
the default skeleton handling, but the BR2_ROOTFS_MERGED_USR symbol is ALSO
used by packages to activate various workarounds for a merged /usr, so it
should be always active when using systemd even with a custom rootfs
skeleton (that by definition must use a merged /usr as required by systemd).

So introduce a dummy symbol with the same name for the custom skeleton case,
similar to how we handle the BR2_PACKAGE_BUSYBOX_SHOW_OTHERS option.

This is a hidden option so it can only be activated by enabling systemd (and
not if people just want to use a merged /usr with a custom skeleton but not
systemd), but as this is really a legacy option that is probably good enough
(if not, patches are welcome!).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 4d07010..2e14971 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -179,6 +179,11 @@ config BR2_ROOTFS_SKELETON_CUSTOM_PATH
 	default "system/skeleton"
 	help
 	  Path to custom target skeleton.
+
+# dummy config so merged /usr workarounds can also be activated for
+# custom rootfs skeleton
+config BR2_ROOTFS_MERGED_USR
+
 endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT
