From: Jeremy Kerr <jk@ozlabs.org>
Date: Mon, 08 Dec 2008 14:58:17 +1100
Subject: [Buildroot] [PATCH 4/4] package/udev: create base device nodes
	after mounting a	new /dev
In-Reply-To: <1228708697.392615.378550596058.1.gpush@pingu>
Message-ID: <1228708697.395009.129460318835.4.gpush@pingu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, udev won't start for me, as we've just mounted a new /dev,
which is completely empty, and udevd requires a /dev/null.

This change manually creates the three base device nodes (zero, null
and console) so that udev can start.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/udev/S10udev |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/udev/S10udev b/package/udev/S10udev
index 5b663a0..6418f63 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -58,6 +58,9 @@ case "$1" in
 	exit 1
 
         mkdir $udev_root/pts $udev_root/shm
+        mknod -m 0666 /dev/null c 1 3
+        mknod -m 0666 /dev/zero c 1 5
+        mknod -m 0600 /dev/console c 5 1
 
         # populate /dev (normally)
         echo -n "Populating $udev_root using udev: "
