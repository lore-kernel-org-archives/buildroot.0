From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 7 Oct 2008 00:07:06 -0700
Subject: [Buildroot] [buildroot 0005234]: Selecting MTD utils from git
	doesn't give you the HEAD
Message-ID: <31ca79ae204554196f8e4a40ae203641@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=5234 
====================================================================== 
Reported By:                mjd
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   5234
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-03-2008 09:40 PDT
Last Modified:              10-07-2008 00:07 PDT
====================================================================== 
Summary:                    Selecting MTD utils from git doesn't give you the
HEAD
Description: 
If you turn on BR2_PACKAGE_MTD_UTILS_GIT, you can get the mtd-utils
source code from the Linux MTD project's GIT server, rather than use
source that is 1 or 2 years old.

I would have thought that the whole point of this is so that you can
get the latest-and-greatest mtd-utils source.  But
package/mtd/mtd-utils.git/mtd.mk hard-codes a particular (now
out-of-date)
version of mtd-utils.

This patch ensures that getting mtd-utils source from git gets the head
from Linux MTD.
====================================================================== 

---------------------------------------------------------------------- 
 mjd - 10-03-08 09:42  
---------------------------------------------------------------------- 
diff -x config -u -r
buildroot-mtcba-g1-pristine/package/mtd/mtd-utils.git/mtd.mk
buildroot-mtcba-g1/package/mtd/mtd-utils.git/mtd.mk
---
buildroot-mtcba-g1-pristine/package/mtd/mtd-utils.git/mtd.mk	2008-08-03
14:11:27.000000000 +1000
+++ buildroot-mtcba-g1/package/mtd/mtd-utils.git/mtd.mk	2008-09-30
17:45:07.000000000 +1000
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
+MTD_VERSION:=HEAD
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz

MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION) 

---------------------------------------------------------------------- 
 bernhardf - 10-03-08 10:01  
---------------------------------------------------------------------- 
may i suggest you add a
config BR2_PACKAGE_MTD_UTILS_GIT_REVISION
  string "git revision"
  default "HEAD" if !BR2_avr
  default "the_previous_hash" if BR2_avr32
  help
    Here you can enter the git revision you want to use.
    Usually this will be "HEAD", but if you could add some other
    hash here.

Just a thought.. 

---------------------------------------------------------------------- 
 mjd - 10-03-08 16:47  
---------------------------------------------------------------------- 
Hi bernhardf, I like that idea.  However my config.in-fu is not yet good
enough to do what you suggested.  If you want to do it, could you (or
someone else) write it and try it out please? 

---------------------------------------------------------------------- 
 mjd - 10-03-08 16:49  
---------------------------------------------------------------------- 
Guys, there may be a problem with using mtd-util from HEAD.  Please give me
a little time to work out what's happening with that code. 

---------------------------------------------------------------------- 
 egtvedt - 10-06-08 22:00  
---------------------------------------------------------------------- 
There is also no need to special handle AVR32. AVR32 works fine with the
latest release of MTD. 

---------------------------------------------------------------------- 
 mjd - 10-07-08 00:07  
---------------------------------------------------------------------- 
I'm not sure why yet, but at the moment, I can build "mtd-host", but I
can't build "mtd".

mtd-utils-HEAD has a file called "fec.c".  This file is trying to use
bcopy and bzero.  It also has macros to work out whether it has to fake
the existence of bcopy and bzero.

The compile warnings and link errors I get are that there's a mismatch
between the definitions of those internals, and what's in fec.c.

Does anyone else have this problem?  Does fec.c compile for your target? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-03-08 09:40  mjd            New Issue                                    
10-03-08 09:40  mjd            Status                   new => assigned     
10-03-08 09:40  mjd            Assigned To               => buildroot       
10-03-08 09:40  mjd            File Added: mtd-utils-git-from-head-1.diff       
            
10-03-08 09:42  mjd            Note Added: 0012684                          
10-03-08 10:01  bernhardf      Note Added: 0012694                          
10-03-08 16:47  mjd            Note Added: 0012714                          
10-03-08 16:49  mjd            Note Added: 0012724                          
10-06-08 22:00  egtvedt        Note Added: 0012904                          
10-07-08 00:07  mjd            Note Added: 0012914                          
======================================================================
