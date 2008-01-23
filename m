From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 23 Jan 2008 12:08:14 -0800
Subject: [Buildroot] [buildroot 0001959]: mDNSResponder-107.6 fails to cross
	compile with incompatible object error
Message-ID: <fcf540eef41abf7af6bc5c5cd135c539@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1959 
====================================================================== 
Reported By:                dajhorn
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1959
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-21-2008 11:46 PST
Last Modified:              01-23-2008 12:08 PST
====================================================================== 
Summary:                    mDNSResponder-107.6 fails to cross compile with
incompatible object error
Description: 
The mDNSResponder 107.6 package fails to cross compile in buildroot
revision 20883 with this error:

cc dns-sd.c -L../mDNSPosix/build/prod/ -ldns_sd -I../mDNSShared -o
build/dns-sd
/usr/bin/ld: skipping incompatible ../mDNSPosix/build/prod//libdns_sd.so
when searching for -ldns_sd
/usr/bin/ld: cannot find -ldns_sd
collect2: ld returned 1 exit status

This package compiles properly when the buildroot host is the same
architecture as the buildroot target.
====================================================================== 

---------------------------------------------------------------------- 
 dajhorn - 01-21-08 11:47  
---------------------------------------------------------------------- 
The second attachment is a transcript for a successful native build with
the same buildroot configuration. 

---------------------------------------------------------------------- 
 UlfSamuelsson - 01-21-08 13:51  
---------------------------------------------------------------------- 
Is it a big surprise that calling the *native* cc compiler
to link with a cross compiled library fails?
Suggest you find the place where "cc" is called and change
that to use the cross compiler and then submit a patch. 

---------------------------------------------------------------------- 
 antezedens - 01-22-08 03:43  
---------------------------------------------------------------------- 
I have identified 3 problems with cross-compiling mDNSResponder:
First, the STRIP make Variable is not properly set:

/build_080121/package/mdnsresponder/mdnsresponder.mk 
31c31
<       $(MAKE1) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared"
STRIP=$(TARGET_STRIP) LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
---
>       $(MAKE1) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared"
LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix

Second, the wrong ld version and the wrong strip is used:
/build_powerpc/mDNSResponder-107.6/mDNSPosix/Makefile 
271c271
< LD = @ld -shared
---
> LD = ld -shared
296,297c296
< STRIP = @strip -S
---
> STRIP = strip -S 


Third, the wrong CC is used:
build_powerpc/mDNSResponder-107.6/Clients/Makefile 
69c69
<       $(CC) $(filter %.c %.o, $+) $(LIBS) -I../mDNSShared -o $@
---
>       cc $(filter %.c %.o, $+) $(LIBS) -I../mDNSShared -o $@

After applying these changes the package builds without a problem!

 

---------------------------------------------------------------------- 
 dajhorn - 01-23-08 12:08  
---------------------------------------------------------------------- 
The patch by antezedens works for me. (Thanks.)

Attached is the buildroot svn diff for the change. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-21-08 11:46  dajhorn        New Issue                                    
01-21-08 11:46  dajhorn        Status                   new => assigned     
01-21-08 11:46  dajhorn        Assigned To               => buildroot       
01-21-08 11:46  dajhorn        File Added: mDNSResponder-build_amd64.txt        
           
01-21-08 11:47  dajhorn        Note Added: 0003479                          
01-21-08 11:47  dajhorn        File Added: mDNSResponder-build_i386.txt         
          
01-21-08 13:51  UlfSamuelsson  Note Added: 0003484                          
01-22-08 03:41  antezedens     Note Added: 0003489                          
01-22-08 03:43  antezedens     Note Edited: 0003489                         
01-23-08 12:08  dajhorn        Note Added: 0003494                          
======================================================================
