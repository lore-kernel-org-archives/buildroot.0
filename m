From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 30 Jul 2019 23:38:45 +0200
Subject: [Buildroot] [RFC PATCH v4 1/2] makedevs: only warn when xattr
 support disabled
Message-ID: <20190730213846.7488-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously makedevs failed when xattr configuration defined while
disabled BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES.  Thus
check for this configuration would be required in each use in packages.
Changing makedevs to only print warning with number of ignored lines, so
package configuration don't have to deal with
BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES.

No package is using this feature so far (it's used only in tests),
thus no need to change any package config.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v3->v4 (Addressed Yann's issues):
* s/discharged/ignored/
* exit with EXIT_SUCCESS (no need to abort fakeroot script just due
ignored xattr lines)

 package/makedevs/makedevs.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index c57b964f5c..dbe5b13714 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -493,6 +493,7 @@ int main(int argc, char **argv)
 		printf("table=<stdin>\n");
 	}
 
+	unsigned int xattr_warned = 0;
 	while ((line = bb_get_chomped_line_from_file(table))) {
 		char type;
 		unsigned int mode = 0755;
@@ -518,9 +519,7 @@ int main(int argc, char **argv)
 			if (bb_set_xattr(full_name, xattr) < 0)
 				bb_error_msg_and_die("can't set cap %s on file %s\n", xattr, full_name);
 #else
-			bb_error_msg_and_die("line %d not supported: '%s'\nDid you forget to enable "
-					     "BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES?\n",
-					     linenum, line);
+			xattr_warned++;
 #endif /* EXTENDED_ATTRIBUTES */
 			continue;
 		}
@@ -641,6 +640,13 @@ int main(int argc, char **argv)
 loop:
 		free(line);
 	}
+
+	if (xattr_warned)
+			bb_error_msg("%u lines with xattr configuration ignored, enable "
+					     "BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES "
+						 "to get xattr support\n",
+					     xattr_warned);
+
 	fclose(table);
 
 	return ret;
-- 
2.22.0
