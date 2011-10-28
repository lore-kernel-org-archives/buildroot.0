From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Oct 2011 14:59:27 +0200
Subject: [Buildroot] [git commit] /etc/profile: read in /etc/profile.d/*.sh
	files
Message-ID: <20111028131045.926EC8F165@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c8502e8211d6153830929110611ce18956ae42c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For custom projects, it is more maintainable to add custom profile settings
in a separate file, than directly in /etc/profile.

This patch modifies /etc/profile to read in *.sh files from /etc/profile.d/,
a technique commonly used in Linux distributions.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/profile |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/fs/skeleton/etc/profile b/fs/skeleton/etc/profile
index cc2e0be..31d3180 100644
--- a/fs/skeleton/etc/profile
+++ b/fs/skeleton/etc/profile
@@ -46,3 +46,10 @@ if [ "$PS1" ]; then
     alias calc='calc -Cd '
     alias bc='calc -Cd '
 fi;
+
+# Source configuration files from /etc/profile.d
+for i in /etc/profile.d/*.sh ; do
+    if [ -r "$i" ]; then
+        . $i
+    fi
+done
