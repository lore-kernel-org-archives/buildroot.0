From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:58 -0800
Subject: [Buildroot] [buildroot 0000602]: build of gdb target gdb$(EXEEXT)
	fails
Message-ID: <31f48170aaaf0f21009e2914beccaf0c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=602 
====================================================================== 
Reported By:                alessio
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   602
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-16-2005 04:31 PST
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    build of gdb target gdb$(EXEEXT) fails
Description: 
This is valid for buildroot 14-12-2005.

The linker cannot find symbols defined in the "mi" subdir (e.g.
async_reason_lookup). Apparently the buildroot makefiles are not including
that gdb subdir in the build.

Workaround
Confgure buildtools and add $(SUBDIR_MI_OBS) to the dependencies and the
build command line of target gdb$(EXEEXT) in file
build_TARGETARCH/gdb-6.4-target/gdb/Makefile
====================================================================== 

---------------------------------------------------------------------- 
 hagepe - 01-06-06 06:35  
---------------------------------------------------------------------- 
You have to do just the same for the host version of gdb in
toolchain_build_TARGETARCH/gdb-6.4/gdb/Makefile.in 

---------------------------------------------------------------------- 
 alessio - 03-06-06 04:35  
---------------------------------------------------------------------- 
The problem is in toolchain/gdb/gdb.mk
The statement
DISABLE_GDBMI:=--disable-gdbmi
must not be executed for gdb 6.4 

---------------------------------------------------------------------- 
 alessio - 06-09-06 04:27  
---------------------------------------------------------------------- 
Fix patch uploaded

 

---------------------------------------------------------------------- 
 vapier - 07-19-06 17:08  
---------------------------------------------------------------------- 
disabling gdmi ignores the issue (whatever that may be)

the buildroot gdb.mk simply runs `make`, it doesnt screw around in the
build system 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-16-05 04:31  alessio        New Issue                                    
12-16-05 04:31  alessio        Status                   new => assigned     
12-16-05 04:31  alessio        Assigned To               => uClibc          
01-06-06 06:35  hagepe         Note Added: 0000865                          
03-06-06 04:35  alessio        Note Added: 0001165                          
06-09-06 04:25  alessio        Note Added: 0001405                          
06-09-06 04:26  alessio        File Added: gdb-mi-fix.patch                    
06-09-06 04:27  alessio        Note Edited: 0001405                         
07-19-06 17:08  vapier         Note Added: 0001541                          
07-19-06 17:08  vapier         Status                   assigned => closed  
07-19-06 17:08  vapier         Resolution               open => unable to
reproduce
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
