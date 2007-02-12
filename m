From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:44 -0800
Subject: [Buildroot] [buildroot 0000971]: zcat vs. gunzip (host system
	portability)
Message-ID: <de956caa9a96463461f640e223769040@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=971 
====================================================================== 
Reported By:                wiml
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   971
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-25-2006 21:31 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    zcat vs. gunzip (host system portability)
Description: 
As the man page for (g)zcat mentions, zcat is identical to gunzip -c,
except that zcat might not be installed on some systems (or might be the
old 'compress' zcat instead of the GNU zip gzcat). Darwin / MacOS is one
such.

Using gunzip -c should work everywhere. A patch is attached.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 10-01-06 08:09  
---------------------------------------------------------------------- 
Can you please update your patch to take $(BR2_ZCAT) into account -- i.e
use that instead of hardcoding 'gunzip -c'?

TIA

diff -r16280:16281 looks like this, FYI:

Index: Config.in
===================================================================
--- Config.in	(revision 16280)
+++ Config.in	(revision 16281)
@@ -180,6 +180,16 @@
 	string "Subversion (svn) checkout command"
 	default "svn co"
 
+config BR2_ZCAT
+	string "zcat command"
+	default "zcat"
+	help
+	  Command to be used to extract a gzip'ed file to stdout.
+	  zcat is identical to gunzip -c except that the former may
+	  not be available on your system.
+	  Default is "zcat"
+	  Other possible values include "gunzip -c"
+
 config BR2_TAR_OPTIONS
 	string "Tar options"
 	default "" 

---------------------------------------------------------------------- 
 bernhardf - 10-01-06 08:18  
---------------------------------------------------------------------- 
I did that change for you, please test r16282 or later and report back.

Thanks,
Bernhard 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-25-06 21:31  wiml           New Issue                                    
07-25-06 21:31  wiml           Status                   new => assigned     
07-25-06 21:31  wiml           Assigned To               => uClibc          
07-25-06 21:31  wiml           File Added: zcat.patch                       
10-01-06 08:09  bernhardf      Note Added: 0001682                          
10-01-06 08:18  bernhardf      Status                   assigned => closed  
10-01-06 08:18  bernhardf      Note Added: 0001683                          
10-01-06 08:18  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
