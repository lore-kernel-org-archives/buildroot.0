From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Tue,  2 Dec 2008 14:26:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/makedevs
Message-ID: <20081202222600.D852D3C7D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-12-02 14:26:00 -0800 (Tue, 02 Dec 2008)
New Revision: 24236

Log:
Compiling current SVN fails with the following error for me:

 cc1: warnings being treated as errors
 buildroot/buildroot/build_powerpc/makedevs/makedevs.c: In function main:
 buildroot/buildroot/build_powerpc/makedevs/makedevs.c:531: error:
 ignoring return value of system, declared with attribute warn_unused_result

This change adds a simple warning if system() fails.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/target/makedevs/makedevs.c


Changeset:
Modified: trunk/buildroot/target/makedevs/makedevs.c
===================================================================
--- trunk/buildroot/target/makedevs/makedevs.c	2008-12-02 21:52:24 UTC (rev 24235)
+++ trunk/buildroot/target/makedevs/makedevs.c	2008-12-02 22:26:00 UTC (rev 24236)
@@ -528,7 +528,8 @@
 	}
 	fclose(table);
 
-	system("/bin/sync");
+	if (system("/bin/sync"))
+		bb_error_msg("sync failed, continuing anyway");
 
 	return 0;
 }
