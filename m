From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:00 -0800
Subject: [Buildroot] [buildroot 0000786]: BR2_PACKAGE_MTD_ORIG_STRING is not
	set and make failes
Message-ID: <c71f9a17da0e1500cc2dbc099ec622cb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=786 
====================================================================== 
Reported By:                badknees
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   786
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-15-2006 16:56 PST
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    BR2_PACKAGE_MTD_ORIG_STRING is not set and make
failes
Description: 
When not using the snapshot mtd the make failes because the
BR2_PACKAGE_MTD_ORIG_STRING variable is not set. Make calls on tar to
untar the dl/ directory, which of cource failes.
If i wasn't in such a hurry i would have submitted a patch, sorry.
Maybe later.
====================================================================== 

---------------------------------------------------------------------- 
 ruscal - 03-22-06 16:47  
---------------------------------------------------------------------- 
I believe the problem arrises because in the mtd.mk file the
$(DL_DIR)/$(MTD_SOURCE): target resolves to
$(DL_DIR)/"mtd_20050122.orig.tar.gz" rather than
$(DL_DIR)/mtd_20050122.orig.tar.gz .  The attached mtd.mk changes the
value of MTD_SOURCE to MTD_SOURCE:=$(subst ",,$(strip
$(BR2_PACKAGE_MTD_ORIG_STRING))) which fixed mtd builds for me when not
using the latest snapshot. 

---------------------------------------------------------------------- 
 jacmet - 04-10-06 06:36  
---------------------------------------------------------------------- 
Yes, the missing stripping of quotes is exactly the problem. The attached
patch (mtd-strip-qoutes.patch) fixes it. 

---------------------------------------------------------------------- 
 andersen - 04-10-06 16:40  
---------------------------------------------------------------------- 
fixed per comments 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-15-06 16:56  badknees       New Issue                                    
03-15-06 16:56  badknees       Status                   new => assigned     
03-15-06 16:56  badknees       Assigned To               => uClibc          
03-22-06 16:47  ruscal         File Added: mtd.mk                           
03-22-06 16:47  ruscal         Note Added: 0001193                          
04-10-06 06:35  jacmet         File Added: mtd-strip-quotes.patch               
    
04-10-06 06:36  jacmet         Note Added: 0001244                          
04-10-06 16:40  andersen       Note Added: 0001247                          
04-10-06 16:40  andersen       Status                   assigned => closed  
04-10-06 16:40  andersen       Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================
