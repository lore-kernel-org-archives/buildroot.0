From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 25 Nov 2008 10:41:26 +1100
Subject: [Buildroot] [PATCH] target/makedev: fix compile breakage from
	unused result warning
Message-ID: <1227570086.584828.33608303487.qpush@pingu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compiling current SVN fails with the following error for me:

 cc1: warnings being treated as errors
 buildroot/buildroot/build_powerpc/makedevs/makedevs.c: In function ???main???:
 buildroot/buildroot/build_powerpc/makedevs/makedevs.c:531: error:
 ignoring return value of ???system???, declared with attribute
 warn_unused_result

This change adds a simple warning if system() fails.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---

 target/makedevs/makedevs.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: buildroot/target/makedevs/makedevs.c
===================================================================
--- buildroot.orig/target/makedevs/makedevs.c	2008-11-24 11:25:03.000000000 +1100
+++ buildroot/target/makedevs/makedevs.c	2008-11-24 11:34:51.000000000 +1100
@@ -528,7 +528,8 @@ loop:
 	}
 	fclose(table);
 
-	system("/bin/sync");
+	if (system("/bin/sync"))
+		bb_error_msg("sync failed, continuing anyway");
 
 	return 0;
 }
