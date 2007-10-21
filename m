From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 21 Oct 2007 05:03:25 -0700
Subject: [Buildroot] [buildroot 0001545]: lsof package configures using host
	instead of target includes
Message-ID: <6a941118d0c0db2764eed885402bcfdd@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1545 
====================================================================== 
Reported By:                marcg
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1545
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-20-2007 21:27 PDT
Last Modified:              10-21-2007 05:03 PDT
====================================================================== 
Summary:                    lsof package configures using host instead of target
includes
Description: 
The lsof package uses its own Configure system, which requires LSOF_INCLUDE
to point to the target's include directory.  Without this it defaults to
looking at /usr/include to decide on configuration parameters. 
Encountered this where the target didn't have selinux/selinux.h in its
headers, yet lsof's Configure enabled selinux anyway when it found
/usr/include/selinux/selinux.h on the host.

Here's a generic patch that fixes this.

Index: package/lsof/lsof.mk
===================================================================
--- package/lsof/lsof.mk        (revision 8)
+++ package/lsof/lsof.mk        (working copy)
@@ -10,6 +10,7 @@
 LSOF_DIR:=$(BUILD_DIR)/lsof_$(LSOF_VERSION)
 LSOF_BINARY:=lsof
 LSOF_TARGET_BINARY:=bin/lsof
+LSOF_INCLUDE:=$(STAGING_DIR)/usr/include
 
 BR2_LSOF_CFLAGS:=
 ifeq ($(BR2_LARGEFILE),)
@@ -33,7 +34,7 @@
        touch $(LSOF_DIR)/.unpacked
 
 $(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
-       (cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n |
$(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)"
./Configure linux)
+       (cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n |
$(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)"
LSOF_INCLUDE="$(LSOF_INCLUDE)" ./Configure linux)
        touch $(LSOF_DIR)/.configured
 
 $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY):
$(LSOF_DIR)/.configured

====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 10-21-07 05:03  
---------------------------------------------------------------------- 
patch applied in svn r20310, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-20-07 21:27  marcg          New Issue                                    
10-20-07 21:27  marcg          Status                   new => assigned     
10-20-07 21:27  marcg          Assigned To               => buildroot       
10-21-07 05:03  vanokuten      Status                   assigned => closed  
10-21-07 05:03  vanokuten      Note Added: 0002853                          
======================================================================
