From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:18 -0800
Subject: [Buildroot] [buildroot 0000754]: "prefix" path is used to retrieve
	data files by directfb
Message-ID: <faf6a675cbdeb40eb80944cabe7529ec@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=754 
====================================================================== 
Reported By:                vspaceg
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   754
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-23-2006 09:43 PST
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    "prefix" path is used to retrieve data files by
directfb
Description: 
Directfb is using the "prefix" path to retrieve data files.
So the host path of the build appears as missing when I execute on the
target.

Work-around:
I patched directfb this way, in order to have "prefix" having two
different values when compiling and when installing:

(note: look for "--prefix="):
$(DIRECTFB_DIR)/.configured: $(DIRECTFB_DIR)/.unpacked
	(cd $(DIRECTFB_DIR); \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
	LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
	ac_cv_header_linux_wm97xx_h=no \
	ac_cv_header_linux_sisfb_h=no \
	./configure \
	--target=$(GNU_TARGET_NAME) \
	--host=$(GNU_TARGET_NAME) \
	--build=$(GNU_HOST_NAME) \
	--prefix=/usr \
	--with-gfxdrivers=cle266,unichrome \
	--enable-jpeg \
[...]

(note: look for "prefix=")
$(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
	$(MAKE) -C $(DIRECTFB_DIR) install prefix=$(STAGING_DIR)/usr
	$(MAKE) -C $(DIRECTFB_DIR)/lib/fusion install prefix=$(STAGING_DIR)/usr
	$(MAKE) -C $(DIRECTFB_DIR)/lib/direct install prefix=$(STAGING_DIR)/usr
	touch -c $(STAGING_DIR)/lib/libdirectfb.so

====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-06-06 10:49  
---------------------------------------------------------------------- 
This problem is now fixed 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-23-06 09:43  vspaceg        New Issue                                    
02-23-06 09:43  vspaceg        Status                   new => assigned     
02-23-06 09:43  vspaceg        Assigned To               => uClibc          
04-06-06 10:49  andersen       Note Added: 0001230                          
04-06-06 10:49  andersen       Status                   assigned => closed  
04-06-06 10:49  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
