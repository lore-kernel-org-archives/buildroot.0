From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Feb 2011 17:44:41 +0100
Subject: [Buildroot] [PATCH v2] makedevs: fix cases where (start != 0)
In-Reply-To: <AANLkTim5v30bAeJ=H_TZ1N=ze6UaFh4MnsURchwQ-=_B@mail.gmail.com>
References: <4D63E496.8020704@gmail.com>	<87tyfvn1lm.fsf@macbook.be.48ers.dk>
	<AANLkTim5v30bAeJ=H_TZ1N=ze6UaFh4MnsURchwQ-=_B@mail.gmail.com>
Message-ID: <4D653979.7090007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The makedevs script did not always generate the requested set of device names / minor number series.
* If start != 0, then requesting (count) devices would generate only (count - start)
* If start != 0 && increment != 1, then requesting minors starting with (minor) would generate minors starting with (minor + (start * (increment - 1)))

This patch fixes the code and updates the usage text with extra examples.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -345,14 +345,22 @@
 	fprintf(stderr, "/dev/null    c    666    0    0     1       3       0       0     -\n");
 	fprintf(stderr, "/dev/zero    c    666    0    0     1       5       0       0     -\n");
 	fprintf(stderr, "/dev/hda     b    640    0    0     3       0       0       0     -\n");
-	fprintf(stderr, "/dev/hda     b    640    0    0     3       1       1       1     15\n\n");
+	fprintf(stderr, "/dev/hda     b    640    0    0     3       1       1       1     15\n");
+	fprintf(stderr, "/dev/rtp     b    640    0    0     250     0       0       1     5\n");
+	fprintf(stderr, "/dev/gps     b    640    0    0     251     0       1       1     5\n");
+	fprintf(stderr, "/dev/uio     b    640    0    0     252     0       1       2     5\n");
+	fprintf(stderr, "/dev/uio     b    640    0    0     252     1       6       2     5\n\n");
 	fprintf(stderr, "Will Produce:\n");
 	fprintf(stderr, "/dev\n");
 	fprintf(stderr, "/dev/console\n");
 	fprintf(stderr, "/dev/null\n");
 	fprintf(stderr, "/dev/zero\n");
 	fprintf(stderr, "/dev/hda\n");
-	fprintf(stderr, "/dev/hda[0-15]\n");
+	fprintf(stderr, "/dev/hda[1-15] with minor numbers [1-15]\n");
+	fprintf(stderr, "/dev/rtp[0-4]  with minor numbers [0-4]\n");
+	fprintf(stderr, "/dev/gps[1-5]  with minor numbers [0-4]\n");
+	fprintf(stderr, "/dev/uio[1-5]  with minor numbers 0,2,4,6,8\n");
+	fprintf(stderr, "/dev/uio[6-10] with minor numbers 1,3,5,7,9\n");
 	exit(1);
 }
 
@@ -489,9 +497,9 @@
 				char *full_name_inc;
 
 				full_name_inc = xmalloc(strlen(full_name) + 8);
-				for (i = start; i < count; i++) {
-					sprintf(full_name_inc, "%s%d", full_name, i);
-					rdev = makedev(major, minor + (i * increment - start));
+				for (i = 0; i < count; i++) {
+					sprintf(full_name_inc, "%s%d", full_name, start + i);
+					rdev = makedev(major, minor + i * increment);
 					if (mknod(full_name_inc, mode, rdev) == -1) {
 						bb_perror_msg("line %d: Couldnt create node %s", linenum, full_name_inc);
 						ret = EXIT_FAILURE;
