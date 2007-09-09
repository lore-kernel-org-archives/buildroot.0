From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 9 Sep 2007 07:47:13 -0700
Subject: [Buildroot] [buildroot 0001478]: libglib12 is only built as a
	static library
Message-ID: <8f794ae83b143c8b24f904bcb78ec5c3@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1478 
====================================================================== 
Reported By:                gururaj
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1478
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-28-2007 17:43 PDT
Last Modified:              09-09-2007 07:47 PDT
====================================================================== 
Summary:                    libglib12 is only built as a static library
Description: 
trying to make libglib12 and it ends with error about missing libglib.so in
buildroot/build_arm/staging_dir/lib/. 

cp -dpf
/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/lib/libglib.so
/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/lib/

cp: cannot stat
`/home/guru/project/original/bldrt/buildroot/build_arm/staging_dir/lib/libglib.so':
No such file or directory 
make: ***
[/home/guru/project/original/bldrt/buildroot/project_build_arm/uclibc/root/lib/libglib-1.2.so.0.0.10]
Error 1 


When i searched in this Directory i had 
root at box124:~/project/original/bldrt/buildroot# ls -la
build_arm/staging_dir/lib/libglib.* 
-rw-r--r-- 1 root root 596464 Aug 22 11:58
build_arm/staging_dir/lib/libglib.a 
-rwxr-xr-x 1 root root    593 Aug 22 11:58
build_arm/staging_dir/lib/libglib.la
====================================================================== 

---------------------------------------------------------------------- 
 johndoe1 - 09-09-07 07:47  
---------------------------------------------------------------------- 
In file build_i386/glib-1.2.10/ltconfig, there is a test which starts at
line 1793:
echo $ac_n "checking dynamic linker characteristics... $ac_c" 1>&6
case "$host_os" in
...

Because our $host_os is 'i386-pc-linux-gnu', I gather that the script
matches our $host_os to this:
[line 1902]
gnu*)
  version_type=linux
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}.so$versuffix
${libname}${release}.so$
  soname_spec='${libname}${release}.so$major'
  shlibpath_var=LD_LIBRARY_PATH
  ;;

I think the correct choice is further below:
[line 1987]
linux-uclibc*)
  version_type=linux
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}.so$versuffix
${libname}${release}.so$
  soname_spec='${libname}${release}.so$major'
  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=no
  # deplibs_check_method=pass_all
  deplibs_check_method='file_magic ELF [0-9][0-9]*-bit [LM]SB (shared
object|dy$
  file_magic_cmd=/usr/bin/file
  file_magic_test_file=`echo /lib/libuClibc-*.so`
  # This implies no fast_install, which is unacceptable.
  # Some rework will be needed to allow for fast_install
  # before this can be enabled.
  # Note: copied from linux-gnu, and may not be appropriate.
  hardcode_into_libs=yes
  # Assume using the uClibc dynamic linker.
  dynamic_linker="uClibc ld.so"
  ;;

I inserted a line right after the start of the test:
[line 1793]
echo $ac_n "checking dynamic linker characteristics... $ac_c" 1>&6
host_os=linux-uclibc
case "$host_os" in
...

After that, the package built normally. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-28-07 17:43  gururaj        New Issue                                    
08-28-07 17:43  gururaj        Status                   new => assigned     
08-28-07 17:43  gururaj        Assigned To               => buildroot       
09-09-07 07:47  johndoe1       Note Added: 0002735                          
======================================================================
