From: Brian Foster <brian.foster@innova-card.com>
Date: Wed, 19 Nov 2008 17:36:26 +0100
Subject: [PATCH] makedevs: Use sync(2) instead running /bin/sync
Message-ID: <mailman.1.1227276921.1345.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiled  -O2 -D_FORTIFY_SOURCE=2  with gcc v4,
the call  system("/bin/sync")  causes a fatal error,
   makedevs.c:531: error: ignoring return value of ?system?
This is the case (by default) on Ubuntu 8.10; for details
see  https://wiki.kubuntu.org/CompilerFlags

In any case, using system(3) to run (via the shell) sync(1)
is silly.  Avoid the issues by directly calling sync(2).

Signed-off-by: Brian Foster <brian.foster@innova-card.com>
---
	This patch is against r22481.
	It fixes Innova Card defect http://busybox.net/bugs/view.php?id=1090.

 target/makedevs/makedevs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/makedevs/makedevs.c b/target/makedevs/makedevs.c
index 8fa3048..de88079 100644
--- a/target/makedevs/makedevs.c
+++ b/target/makedevs/makedevs.c
@@ -528,7 +528,7 @@ loop:
 	}
 	fclose(table);
 
-	system("/bin/sync");
+	sync();
 
 	return 0;
 }
-- 
1.6.0.4


====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-21-08 06:15  
---------------------------------------------------------------------- 
applied to my tree. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-21-08 06:01  blf            New Issue                                    
11-21-08 06:01  blf            Status                   new => assigned     
11-21-08 06:01  blf            Assigned To               => buildroot       
11-21-08 06:15  bernhardf      Note Added: 0016024                          
======================================================================
