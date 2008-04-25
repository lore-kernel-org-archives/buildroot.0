From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 24 Apr 2008 21:51:03 -0700
Subject: [Buildroot] [buildroot 0001549]:
	buildroot/build_i386/grep-2.5.1/src/dfa.c:147: undefined
	reference to `libintl_gettext'
Message-ID: <b61b2df5936d80959d8aea52ccfbf23a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1549 
====================================================================== 
Reported By:                Steve Cornett
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1549
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-22-2007 14:26 PDT
Last Modified:              04-24-2008 21:51 PDT
====================================================================== 
Summary:                    buildroot/build_i386/grep-2.5.1/src/dfa.c:147:
undefined reference to `libintl_gettext'
Description: 
Configure for i386.  Build ends with:

dfa.o: In function `xmalloc':
/home/test/buildroot/build_i386/grep-2.5.1/src/dfa.c:147: undefined
reference to `libintl_gettext'

Input and log attached.
====================================================================== 

---------------------------------------------------------------------- 
 pcwalton - 10-26-07 19:33  
---------------------------------------------------------------------- 
I'm getting this too. Workaround was to copy the configure line that the
buildroot makefile spits out, add LDFLAGS="-lintl" to the front of it, and
reconfigure and make manually. 

---------------------------------------------------------------------- 
 pcwalton - 10-28-07 13:59  
---------------------------------------------------------------------- 
Attached a proposed patch. 

---------------------------------------------------------------------- 
 vanokuten - 10-28-07 14:28  
---------------------------------------------------------------------- 
Can you post your part of config.log file? 

I have arm configuration and it works without applying your patch.
-lintl is added on configure step when checking for gettext:
configure:7201: checking for GNU gettext in libintl

/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os
-pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot
/opt/buildroot/build_arm/staging_dir -mtune=arm920t -msoft-float  -g -O2  
-o grep  grep.o dfa.o kwset.o search.o grepmat.o -lintl 
../lib/libgreputils.a

Regards,
Ivan 

---------------------------------------------------------------------- 
 jbruchon - 04-24-08 21:51  
---------------------------------------------------------------------- 
I'm now getting this error in the most recent snapshot (2008-04-24), as
seen below.  I have not applied the submitted patch yet; I would have
thought that this problem would be fixed in the most recent snapshot but
apparently it is still outstanding.  This was done on a machine that had
no problem building a rootfs a month ago with the most recent snapshot
back then.

Tail of console log:

Making all in src
make[3]: Entering directory
`/home/user/src/buildroot/build_i486/grep-2.5.1/src'
/home/user/src/buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc
-Os  -I/home/user/src/buildroot/build_i486/staging_dir/usr/include
-I/home/user/src/buildroot/build_i486/staging_dir/include
--sysroot=/home/user/src/buildroot/build_i486/staging_dir/ -isysroot
/home/user/src/buildroot/build_i486/staging_dir -mtune=i486 -march=i486 
-g -O2   -o grep  grep.o dfa.o kwset.o search.o grepmat.o
../lib/libgreputils.a
dfa.o: In function `xmalloc':
/home/user/src/buildroot/build_i486/grep-2.5.1/src/dfa.c:147: undefined
reference to `libintl_gettext'
dfa.o: In function `xrealloc':
/home/user/src/buildroot/build_i486/grep-2.5.1/src/dfa.c:158: undefined
reference to `libintl_gettext'
dfa.o: In function `xcalloc':
/home/user/src/buildroot/build_i486/grep-2.5.1/src/dfa.c:136: undefined
reference to `libintl_gettext'
dfa.o: In function `parse_bracket_exp_mb':
/home/user/src/buildroot/build_i486/grep-2.5.1/src/dfa.c:489: undefined
reference to `libintl_gettext'
/home/user/src/buildroot/build_i486/grep-2.5.1/src/dfa.c:604: undefined
reference to `libintl_gettext'
dfa.o:/home/user/src/buildroot/build_i486/grep-2.5.1/src/dfa.c:545: more
undefined references to `libintl_gettext' follow
collect2: ld returned 1 exit status
make[3]: *** [grep] Error 1
make[3]: Leaving directory
`/home/user/src/buildroot/build_i486/grep-2.5.1/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/user/src/buildroot/build_i486/grep-2.5.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/user/src/buildroot/build_i486/grep-2.5.1'
make: *** [/home/user/src/buildroot/build_i486/grep-2.5.1/src/grep] Error
2 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-22-07 14:26  Steve Cornett  New Issue                                    
10-22-07 14:26  Steve Cornett  Status                   new => assigned     
10-22-07 14:26  Steve Cornett  Assigned To               => buildroot       
10-22-07 14:26  Steve Cornett  File Added: InputAndOutput.tar                   

10-26-07 19:33  pcwalton       Note Added: 0002862                          
10-28-07 13:59  pcwalton       File Added: buildroot-grep.patch                 
  
10-28-07 13:59  pcwalton       Note Added: 0002863                          
10-28-07 14:28  vanokuten      Note Added: 0002864                          
04-24-08 21:51  jbruchon       Note Added: 0007094                          
======================================================================
