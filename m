From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:32 -0800
Subject: [Buildroot] [buildroot 0000628]: fail to build on pc-cygwin
Message-ID: <131d4a4eaeb3cfdeaa8dc7cc57ad57b3@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=628 
====================================================================== 
Reported By:                petev
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   628
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-08-2006 01:08 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    fail to build on pc-cygwin
Description: 
I'm using buildroot-20060107.tar.bz2 on a pc-cygwin platform with a
mipsel-linux target. So far I have not been able to build successfully.
Here are several of the problems I have ran into and some solutions.

1) In buildroot/Makefile lines 70, 71, 72 are similar to:
	    #include toolchain/*/*.mk
These do not glob correctly with make 3.80, but work fine with bash
3.00.16. I ran ls saving the output to a file and replaced each include
line with the expanded results (ugly, but effective). This is probably a
cygwin/make bug.

2) buildroot/package/sed/sed.mk line 69 is:
	    ln -s $$SED $(HOST_SED_DIR)/$(SED_TARGET_BINARY)
I changed it to:
	    ln -sf $$SED $(HOST_SED_DIR)/$(SED_TARGET_BINARY)
This fixed the problem with the link already existing when running make
again.

3) The CONFIG_UPDATE macro in package/gnuconfig/gnuconfig.mk needs to use
cp -f as some of the config.sub files, etc. from the tar balls are read
only and the cp fails.

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 01-08-06 01:59  
---------------------------------------------------------------------- 
1) yes, bug in your build system

2) fixed in svn, thanks

3) fixed in svn, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-08-06 01:08  petev          New Issue                                    
01-08-06 01:08  petev          Status                   new => assigned     
01-08-06 01:08  petev          Assigned To               => uClibc          
01-08-06 01:59  vapier         Note Added: 0000870                          
01-08-06 01:59  vapier         Status                   assigned => closed  
01-08-06 01:59  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================
