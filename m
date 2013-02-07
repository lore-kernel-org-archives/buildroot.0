From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Feb 2013 22:58:44 +0100
Subject: [Buildroot] [PATCH v3 2/6] docs/manual: mention the new post-image
	mechanism
In-Reply-To: <1360274328-14754-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360274328-14754-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360274328-14754-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v1->v2:
 * Fix typos noticed by Yann.
v2->v3:
 * Mention that the post-image scripts are executed as the user
   executing Buildroot, i.e generally not the root user. Suggested by
   Samuel Martin.
---
 docs/manual/customize-rootfs.txt |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index fa04d85..97af580 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -55,3 +55,25 @@ there are a few ways to customize the resulting target filesystem.
   target root filesystem in +package/customize/source+, and then
   enable this special package in the configuration system. _This
   method is marked as deprecated_.
+
+Note also that if you want to perform some specific actions *after*
+all filesystem images have been created (for example to automatically
+extract your root filesystem tarball in a location exported by your
+NFS server, or to create a special firmware image that bundles your
+root filesystem and kernel image, or any other custom action), you can
+specify a space-separated list of scripts in the
++BR2_ROOTFS_POST_IMAGE_SCRIPT+ configuration option.
+
+Each of those scripts will be called, with the path to the +images+
+output directory as first and unique argument, and will be executed
+with the main Buildroot source directory as the current
+directory. Those scripts will be executed as the user that executes
+Buildroot, which should normally not be the root user. Therefore, any
+action requiring root permissions in one of these post-image script
+will require special handling (usage of fakeroot or sudo), which is
+left to the script developer.
+
+Just like for the _post-build scripts_ mentionned above, you also have
+access to the following environment variables from your _post-image
+scripts_: +BUILDROOT_CONFIG+, +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+,
++BINARIES_DIR+ and +BASE_DIR+.
-- 
1.7.9.5
