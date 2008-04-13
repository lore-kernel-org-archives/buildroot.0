From: fpml at adinet.com.uy <fpml@adinet.com.uy>
Date: Sun, 13 Apr 2008 01:28:11 -0300 (UYT)
Subject: [Buildroot] libtool, libglib2, *_HOOK_POST_(BUILD|INSTALL)
Message-ID: <27218521.1208060891367.JavaMail.tomcat@fe-ps02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


target: x86 uclibc/busybox

(1) libtool built by many packages use system paths to find shared-
objects, producing libraries that don't work on target.

I'm using this shell script to patch libtool after configure:

#!/bin/sh
sed 's/sys_lib_search_path_spec=\"[^\"]*\"/sys_lib_search_path_spec=\"
\"/' $1 >/tmp/sedtmp1
sed 's/sys_lib_dlsearch_path_spec=\"[^\"]*\"
/sys_lib_dlsearch_path_spec=\"\"/' /tmp/sedtmp1 >/tmp/sedtmp2
#sed 's/shlibpath_var=LD_LIBRARY_PATH/shlibpath_var=\"\"/' 
/tmp/sedtmp2 >/tmp/sedtmp3
mv /tmp/sedtmp2 $1
chmod +x $1

(2) libglib2 builds some libs that use shared-objects from host 
system, even after patching its libtool.

eg gmodule/.libs/libgmodule-2.0.so.0.1504.0 << works
  gmodule/.libs/libgmodule-2.0.so.0.1504.0T << host libs

Good one copied to staging, while the other goes to project_*, so 
binaries on the final image fail to run due to missing libs (eg instead 
of uclibc's libc.so.0, libgmodule requests libc.so.6 present in my 
Slackware host)

(3) How does one use {pkgname}_HOOK_POST_BUILD and INSTALL?  I tried 
to use it on libglib2's mk but looks like it is ignored.

Thanks,
Fernando.
