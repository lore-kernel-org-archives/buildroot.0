From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:39 -0800
Subject: [Buildroot] [buildroot 0001102]: sqlite build can't find "readline"
Message-ID: <133b41b3b1cc30712bd6dca35854b13f@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1102 
====================================================================== 
Reported By:                znmeb
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1102
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-22-2006 17:17 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    sqlite build can't find "readline"
Description: 
/data1/vgrails/RailsOnAStick/GenericBuildroot/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc
-Os -pipe -DOS_UNIX=1 -DHAVE_USLEEP=1 -DHAVE_FDATASYNC=1 -I. -I./src
-DNDEBUG -DTHREADSAFE=1 -DSQLITE_THREAD_OVERRIDE_LOCK=-1
-DSQLITE_OMIT_CURSOR -DHAVE_READLINE=1
-I/data1/vgrails/RailsOnAStick/GenericBuildroot/buildroot/build_i686/staging_dir/usr/include
-o .libs/sqlite3 ./src/shell.c  ./.libs/libsqlite3.so -lpthread
-L/data1/vgrails/RailsOnAStick/GenericBuildroot/buildroot/build_i686/root/usr/lib
-L/data1/vgrails/RailsOnAStick/GenericBuildroot/buildroot/build_i686/root/lib
-lncurses -lreadline
./src/shell.c:45:32: readline/readline.h: No such file or directory
./src/shell.c:46:31: readline/history.h: No such file or directory
./src/shell.c: In function `one_input_line':
./src/shell.c:206: warning: assignment makes pointer from integer without
a cast
make[1]: *** [sqlite3] Error 1
make[1]: Leaving directory
`/data1/vgrails/RailsOnAStick/GenericBuildroot/buildroot/build_i686/sqlite-3.3.8'
make: ***
[/data1/vgrails/RailsOnAStick/GenericBuildroot/buildroot/build_i686/sqlite-3.3.8/sqlite3]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 11-23-06 01:18  
---------------------------------------------------------------------- 
Did you select BR2_READLINE ?
If so, did readline build correctly?
Is there a lib*readline* in your
/data1/vgrails/RailsOnAStick/GenericBuildroot/buildroot/build_i686/root/lib?
Is there a readline.h in
/data1/vgrails/RailsOnAStick/GenericBuildroot/buildroot/build_i686/staging_dir/usr/include/readline/
? 

---------------------------------------------------------------------- 
 znmeb - 11-23-06 20:13  
---------------------------------------------------------------------- 
In the original attempt, I did have "readline" selected, but I didn't see
whether it built correctly or not. I just re-ran everything one step at a
time and I think I know what happened.

The default "make defconfig" gives you a target architecture of i386 but
it gives you a target architecture variant of i686. I think that killed
the build of readline. I just re-ran the build of readline and then the
build of sqlite with both of them set to i386 and both builds worked. So
I'm going to try readline again with the default and capture a log file. 

---------------------------------------------------------------------- 
 bernhardf - 01-21-07 09:30  
---------------------------------------------------------------------- 
ping. Any news on this one? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-22-06 17:17  znmeb          New Issue                                    
11-22-06 17:17  znmeb          Status                   new => assigned     
11-22-06 17:17  znmeb          Assigned To               => uClibc          
11-22-06 17:18  znmeb          Issue Monitored: znmeb                       
11-23-06 01:18  bernhardf      Note Added: 0001790                          
11-23-06 20:13  znmeb          Note Added: 0001800                          
12-01-06 10:06  bernhardf      Status                   assigned => feedback
01-21-07 09:30  bernhardf      Note Added: 0002026                          
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================
