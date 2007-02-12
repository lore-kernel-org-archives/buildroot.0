From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:45 -0800
Subject: [Buildroot] [buildroot 0000495]: openssl build fails for Target
	Architecture i386 Variant i386
Message-ID: <1308ddf29c74daf3fc55fc545905a848@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=495 
====================================================================== 
Reported By:                noah
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   495
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-20-2005 17:26 PDT
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    openssl build fails for Target Architecture i386 
Variant i386
Description: 
The openssl.mk file sets OPENSSL_TARGET_ARCH to
i386-i386, but this wrong. This is a special case.
It should be set to just i386. The following patch
fixes the problem, diff -u openssl.mk.original openssl.mk
--- openssl.mk.original	2005-10-20 16:46:28.000000000 -0700
+++ openssl.mk	2005-10-20 17:17:12.569581608 -0700
@@ -14,8 +14,12 @@
 ifeq ($(ARCH),i686)
 OPENSSL_TARGET_ARCH:=i386-i686/cmov
 else
+ifeq ($(ARCH),i386)
+OPENSSL_TARGET_ARCH:=i386
+else
 OPENSSL_TARGET_ARCH:=i386-$(ARCH)
 endif
+endif
 else
 OPENSSL_TARGET_ARCH:=$(ARCH)
 endif


====================================================================== 

---------------------------------------------------------------------- 
 crafterm - 11-29-05 08:42  
---------------------------------------------------------------------- 
Hi All,

I can confirm this problem still occurs in the latest SVN cut of
buildroot.

The above patch works fine though to fix it.

Cheers,

Marcus 

---------------------------------------------------------------------- 
 boris64 - 12-03-05 11:16  
---------------------------------------------------------------------- 
Problem still exists, thx for the  patch which seems to work flawlessly ;) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-20-05 17:26  noah           New Issue                                    
10-20-05 17:26  noah           Status                   new => assigned     
10-20-05 17:26  noah           Assigned To               => uClibc          
10-20-05 17:26  noah           File Added: openssl.mk.patch                    
11-29-05 08:42  crafterm       Note Added: 0000711                          
12-03-05 11:16  boris64        Note Added: 0000720                          
12-03-05 12:32  vapier         Status                   assigned => closed  
12-03-05 12:32  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
