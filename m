From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 17 Feb 2008 20:57:31 -0800
Subject: [Buildroot] [buildroot 0001478]: libglib12 is only built as a
	static library
Message-ID: <c0af19d76ee4d147bcacb1c09fc8e059@busybox.net>
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
Last Modified:              02-17-2008 20:57 PST
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
 johndoe1 - 09-09-07 07:56  
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

I think the correct match is further below:
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

After that, the package builds normally.

 

---------------------------------------------------------------------- 
 hbr_in - 02-17-08 20:57  
---------------------------------------------------------------------- 
Hi,

when compilling libglib12, configure output says

<snip>
<snip>
<snip>

checking for /opt/arm-uclinux/usr/bin/arm-linux-uclibcgnueabi-ld
-L/opt/arm-uclinux/lib -L/opt/arm-uclinux/usr/lib
--sysroot=/opt/arm-uclinux/ option to reload object files... -r
checking dynamic linker characteristics... no
checking if libtool supports shared libraries... no
checking whether to build shared libraries... no
checking whether to build static libraries... yes
checking for objdir... .libs
creating libtool
<snip>
<snip>
<snip>

In in ltconfig file, host_os is taken as arm_linux. I placed an echo for
host_os at line 1793 in ltconfig file.

echo $ac_n "checking dynamic linker characteristics... for host $host_os
$ac_c" 1>&6
case "$host_os" in

  Here it checks for Dynamic linking characteristics of this os
(arm-linux) and hence it fails the test. So it cannot build shared
libraries. 

Can anyone shed some light on this. 

Should i add 
host_os=linux-uclibc 

or 

linux-uclibc*)
arm-linux*)                     ----> add this line. is this correct

Thanks in advance

Regards
Gururaja 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-28-07 17:43  gururaj        New Issue                                    
08-28-07 17:43  gururaj        Status                   new => assigned     
08-28-07 17:43  gururaj        Assigned To               => buildroot       
09-09-07 07:47  johndoe1       Note Added: 0002735                          
09-09-07 07:55  johndoe1       Note Edited: 0002735                         
09-09-07 07:56  johndoe1       Note Edited: 0002735                         
02-17-08 20:57  hbr_in         Note Added: 0004984                          
======================================================================
