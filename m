From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:06:41 +0100
Subject: [Buildroot] [git commit] docs/manual: mention the new post-image
	mechanism
Message-ID: <20130208210651.835529AA21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04dea0c48b57177fab80bfff46d74162011b199d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix minor typos]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/customize-rootfs.txt |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index fa04d85..f396c0d 100644
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
+Each of those scripts will be called with the path to the +images+
+output directory as first and unique argument, and will be executed
+with the main Buildroot source directory as the current
+directory. Those scripts will be executed as the user that executes
+Buildroot, which should normally not be the root user. Therefore, any
+action requiring root permissions in one of these post-image script
+will require special handling (usage of fakeroot or sudo), which is
+left to the script developer.
+
+Just like for the _post-build scripts_ mentioned above, you also have
+access to the following environment variables from your _post-image
+scripts_: +BUILDROOT_CONFIG+, +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+,
++BINARIES_DIR+ and +BASE_DIR+.
