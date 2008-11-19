From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Nov 2008 02:17:03 -0800
Subject: [Buildroot] [buildroot 0006364]: lockfile-progs do not find rindex
	in string.h
Message-ID: <15929b9640bf723b4237eaa130c415fe@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=6364 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6364
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             11-17-2008 02:26 PST
Last Modified:              11-19-2008 02:17 PST
====================================================================== 
Summary:                    lockfile-progs do not find rindex in string.h
Description: 
make[1]: Entering directory
`/home/roberto/gles/buildroot/build_i586/lockfile-progs-0.1.11'
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -g -Wall -Werror -O2   -c -o lockfile-progs.o
lockfile-progs.c
cc1: warnings being treated as errors
lockfile-progs.c: In function ?parse_arguments?:
lockfile-progs.c:96: warning: implicit declaration of function ?rindex?
lockfile-progs.c:96: warning: incompatible implicit declaration of
built-in function ?rindex?
make[1]: *** [lockfile-progs.o] Error 1
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/lockfile-progs-0.1.11'
make: ***
[/home/roberto/gles/buildroot/project_build_i586/ugles/root/usr/bin/lockfile-create]
Error 2





====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-17-08 02:46  
---------------------------------------------------------------------- 
Probably the best solution is adding this lines to lockfile-progs.c after
includes

#if !defined(rindex)
#define rindex(s,c) strrchr((s), (c))
#endif

UPDATE: the problem is a missing \ into lockfile.mk, please apply the
attached patch.

 

---------------------------------------------------------------------- 
 jacmet - 11-19-08 02:17  
---------------------------------------------------------------------- 
Thanks, committed as r24098. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-17-08 02:26  robang74       New Issue                                    
11-17-08 02:26  robang74       Status                   new => assigned     
11-17-08 02:26  robang74       Assigned To               => buildroot       
11-17-08 02:27  robang74       Issue Monitored: robang74                    
11-17-08 02:29  robang74       Note Added: 0015914                          
11-17-08 02:46  robang74       Note Edited: 0015914                         
11-17-08 02:47  robang74       File Added: lockfile-progs.mk.patch              
     
11-19-08 02:17  jacmet         Status                   assigned => closed  
11-19-08 02:17  jacmet         Note Added: 0015984                          
======================================================================
