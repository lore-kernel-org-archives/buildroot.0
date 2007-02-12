From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:43 -0800
Subject: [Buildroot] [buildroot 0000296]: Minor issue in kernel-headers.mk
	when making ".unpacked" target
Message-ID: <4b5e87edd4724bd0fa01ab7cd18be803@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=296 
====================================================================== 
Reported By:                silacci
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   296
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-09-2005 07:55 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    Minor issue in kernel-headers.mk when making
".unpacked" target
Description: 
If you update the kernel headers tarball and run make against an already
built buildroot, the header files will be re-extracted, but they will not
be put in exactly the right place if the name of the extracted directory
includes the kernel version numbers.

For example, linux-libc-headers-2.4.25.tar.bz2 will be extracted to
$(TOOLCHAIN_BUILD_DIR)/linux-libc-headers-2.4.25, and then the mv command
will move the newly extracted headers into the already existing
$(TOOLCHAIN_BUILD_DIR)/linux directory, instead of replacing that
directory as desired.

The fix is to first remove the $(TOOLCHAIN_BUILD_DIR)/linux directory and
then do the mv command.

*** kernel-headers.mk.old       2005-06-09 09:47:06.000000000 -0500
--- kernel-headers.mk   2005-06-09 09:54:55.000000000 -0500
***************
*** 81,86 ****
--- 81,87 ----
        mkdir -p $(TOOL_BUILD_DIR)
        bzcat $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR)
$(TAR_OPTIONS) -
  ifneq ($(LINUX_HEADERS_UNPACK_DIR),$(LINUX_HEADERS_DIR))
+       rm -rf $(LINUX_HEADERS_DIR)
        mv $(LINUX_HEADERS_UNPACK_DIR) $(LINUX_HEADERS_DIR)
  endif
        touch $(LINUX_HEADERS_DIR)/.unpacked

  ifneq ($(LINUX_HEADERS_UNPACK_DIR),$(LINUX_HEADERS_DIR))
+       rm -rf $(LINUX_HEADERS_DIR)
        mv $(LINUX_HEADERS_UNPACK_DIR) $(LINUX_HEADERS_DIR)
  endif
        touch $(LINUX_HEADERS_DIR)/.unpacked


====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-09-05 07:55  silacci        New Issue                                    
06-23-05 20:12  andersen       Status                   assigned => closed  
06-23-05 20:12  andersen       Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
