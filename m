From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Sep 2017 16:09:41 +0200
Subject: [Buildroot] [PATCH] support/scripts/check-bin-arch: ignore symbolic
	links
Message-ID: <20170903140941.12455-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit da32b49f0091ee9dfb613e0f00973bf6893bfa84
("instrumentation: extend packages-file-list.txt with symlinks and
directories"), the packages-file-list.txt also contains symbolic
links. Therefore, check-bin-arch is now also checking symbolic links.

However, symbolic links in $(TARGET_DIR) can have absolute path as
targets, such as:

$ ls -l output/target/sbin/ifdown
lrwxrwxrwx 1 thomas thomas 10 Sep  3 15:55 output/target/sbin/ifdown -> /sbin/ifup

Therefore, we are now potentially checking a host binary, which
obviously makes check-bin-arch fail.

This commit changes check-bin-arch to ignore symbolic links. Indeed,
we have two cases:

 - The symbolic link really points to something that will in the
   rootfs (such as /sbin/ifup above). In this case, /sbin/ifup will be
   checked separately by check-bin-arch.

 - The symbolic link doesn't point to something that will be in the
   rootfs, and that is not a problem from the perspective of
   check-bin-arch, which checks the architecture of target binaries.

Fixes:

  http://autobuild.buildroot.net/results/16d384a0183d477646ac7692feb65f00dde7d068/
  (vim)

  http://autobuild.buildroot.net/results/50429c0f63a8befff9e20899327b9a8d754d99be/
  (ifupdown)

  http://autobuild.buildroot.net/results/1db65973e782bfa61abcbccd3501bfd235f77288/
  (gawk)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-bin-arch | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index b822cdd60d..700ee3f65e 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -36,6 +36,12 @@ while read f; do
 		continue
 	fi
 
+	# Skip symlinks. Some symlinks may have absolute paths as
+	# target, pointing to host binaries while we're building.
+	if [[ -L "${f}" ]]; then
+		continue
+	fi
+
 	# Get architecture using readelf. We pipe through 'head -1' so
 	# that when the file is a static library (.a), we only take
 	# into account the architecture of the first object file.
-- 
2.13.5
