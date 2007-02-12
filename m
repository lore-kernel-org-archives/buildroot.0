From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:42:28 -0800
Subject: [Buildroot] [buildroot 0001182]: MTD: Missing definition of
	jint_16/jint_32 svn (17567)
Message-ID: <2e3c2694f7904a6c671f0fba34202f4e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1182 
====================================================================== 
Reported By:                jcoppens
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1182
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-28-2007 05:53 PST
Last Modified:              02-12-2007 05:42 PST
====================================================================== 
Summary:                    MTD: Missing definition of jint_16/jint_32 svn
(17567)
Description: 
Definition of jint_16 and _32 is missing in flash_eraseall.c. 
(See error message below)

I tried to add #include "jffs2.h", but that produces duplicate
definitions.
(second part - below)

====================================================================== 

---------------------------------------------------------------------- 
 jcoppens - 01-28-07 20:18  
---------------------------------------------------------------------- 
Sorry, that was of course jff3.h I tried to add (not jff2.h as commented
above).
Just a typo - the problem is still there. 

---------------------------------------------------------------------- 
 bagland - 01-30-07 04:55  
---------------------------------------------------------------------- 
Removing an include path fixes the problem for me (against rev 17540):

Index: package/mtd/mtd.mk
===================================================================
--- package/mtd/mtd.mk  (revision 17540)
+++ package/mtd/mtd.mk  (working copy)
@@ -116,7 +116,7 @@
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-       $(MAKE) CC=$(TARGET_CC) CFLAGS="-I$(LINUX_HEADERS_DIR)/include
-I$(MTD_DIR)/include $(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
+       $(MAKE) CC=$(TARGET_CC) CFLAGS="-I$(MTD_DIR)/include
$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" LINUXDIR=$(LINUX_DIR) -C
$(MTD_DIR)/util
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))

Rgds,
Benjamin 

---------------------------------------------------------------------- 
 jcoppens - 01-30-07 12:34  
---------------------------------------------------------------------- 
Another issue popped up, and I'm not sure yet this patch solved the
problem.

(http://busybox.net/bugs/view.php?id=1185)

Thanks
John
(will report if I get past the other problem) 

---------------------------------------------------------------------- 
 bernhardf - 02-09-07 06:19  
---------------------------------------------------------------------- 
Fixed in r17839. Thanks for the report. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-28-07 05:53  jcoppens       New Issue                                    
01-28-07 05:53  jcoppens       Status                   new => assigned     
01-28-07 05:53  jcoppens       Assigned To               => uClibc          
01-28-07 20:18  jcoppens       Note Added: 0002065                          
01-30-07 04:55  bagland        Note Added: 0002071                          
01-30-07 12:34  jcoppens       Note Added: 0002077                          
02-04-07 08:44  bernhardf      Summary                  Missing definition of
jint_16/jint_32 svn (17567) => MTD: Missing definition of jint_16/jint_32 svn
(17567)
02-09-07 06:19  bernhardf      Status                   assigned => closed  
02-09-07 06:19  bernhardf      Note Added: 0002142                          
02-09-07 06:19  bernhardf      Resolution               open => fixed       
02-12-07 05:42  vapier         Status                   closed => assigned  
02-12-07 05:42  vapier         Assigned To              uClibc => buildroot 
======================================================================
