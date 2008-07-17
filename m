From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 17 Jul 2008 03:40:11 -0700
Subject: [Buildroot] [buildroot 0001899]: Using the Atmel supplied build
	root, openssl fails to build
Message-ID: <41478dcbac91a208bab3b392287ef614@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1899 
====================================================================== 
Reported By:                yogy
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1899
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             01-04-2008 15:34 PST
Last Modified:              07-17-2008 03:40 PDT
====================================================================== 
Summary:                    Using the Atmel supplied build root, openssl fails
to build
Description: 
openssl fails to build because avr32 architecture is not supported.

I have "hacked" the openssl.patch to change the entry for alpha ev4 (which
I suppose does not really need buildroot support) to 

+"linux-avr32","gcc:-DTERMIO -O3 -fomit-frame-pointer
-Wall::-D_REENTRANT::-ldl:BN_LLONG
DES_RISC1::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",

all on one line.

Also, the gcc version used, does not support the -msoft-float option, so I
had to remove the 

$(SED) 's,/CFLAG=,/CFLAG= $(TARGET_SOFT_FLOAT) ,g' \
      $(OPENSSL_DIR)/Configure

lines from openssl.mk.  After this, openssl built fine for avr32 .
====================================================================== 

---------------------------------------------------------------------- 
 glennswest - 06-17-08 19:45  
---------------------------------------------------------------------- 
Building based on current snapshot of buildroot, problem still occurs on
avr32
Jun 18, 2008 

---------------------------------------------------------------------- 
 UlfSamuelsson - 07-04-08 23:51  
---------------------------------------------------------------------- 
Maybe it needs an $(CONFIG_UPDATE) $(OPENSSL_DIR) 

---------------------------------------------------------------------- 
 UlfSamuelsson - 07-05-08 00:27  
---------------------------------------------------------------------- 
Fixed by adding an additional AVR32 specific patch.
Softfloat disabled if AVR32 is used.
config.* is updated to latest buildroot version.
Architecture specific patches allowed (*.patch.$(ARCH)) 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-04-08 15:34  yogy           New Issue                                    
01-04-08 15:34  yogy           Status                   new => assigned     
01-04-08 15:34  yogy           Assigned To               => buildroot       
06-17-08 19:45  glennswest     Note Added: 0008374                          
07-04-08 23:51  UlfSamuelsson  Note Added: 0008934                          
07-05-08 00:27  UlfSamuelsson  Status                   assigned => resolved
07-05-08 00:27  UlfSamuelsson  Resolution               open => fixed       
07-05-08 00:27  UlfSamuelsson  Note Added: 0008944                          
07-16-08 08:02  bernhardf      Status                   resolved => new     
07-17-08 03:40  bernhardf      Status                   new => closed       
======================================================================
