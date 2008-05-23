From: mike sander <msander@ripnet.com>
Date: Fri, 23 May 2008 17:51:23 -0400
Subject: [Buildroot] link error building portmap
Message-ID: <48373C5B.5080905@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to use nfs mount within busybox.    This requires mount & 
portmap.  I am getting a link failure that I cannot figure out.

I have enabled busybox  MOUNT, FEATURE_MOUNT_NFS, FEATURE_HAVE_RPC as 
well as uclibc  UCLIBC_HAS_RPC and top level  
CONFIG_BR2_PACKAGE_PORTMAP.  I have done a top level "make clean".

Here is the output of top level make.  I have even explicitly put the 
full path to libc.a in the link line (in portmap Makefile):



mike at himalia:/home/buildroot$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.3':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.3':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/buildroot/project_build_arm/uclibc/buildroot-config
mkdir -p /home/buildroot/project_build_arm/uclibc
cp -dpRf package/config/buildroot-config 
/home/buildroot/project_build_arm/uclibc/buildroot-config
/usr/bin/make -j1 
CC=/home/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc 
O="-Os  -I/home/buildroot/build_arm/staging_dir/usr/include 
-I/home/buildroot/build_arm/staging_dir/include 
--sysroot=/home/buildroot/build_arm/staging_dir/ -isysroot 
/home/buildroot/build_arm/staging_dir -mtune=arm9tdmi" -C 
/home/buildroot/build_arm/portmap_5beta
make[1]: Entering directory `/home/buildroot/build_arm/portmap_5beta'
/home/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc  
-Dperror=xperror -DCHECK_PORT  -DFACILITY=LOG_AUTH  
-DIGNORE_SIGCHLD            -Os  
-I/home/buildroot/build_arm/staging_dir/usr/include 
-I/home/buildroot/build_arm/staging_dir/include 
--sysroot=/home/buildroot/build_arm/staging_dir/ -isysroot 
/home/buildroot/build_arm/staging_dir -mtune=arm9tdmi    -c -o portmap.o 
portmap.c
/home/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc  
-Dperror=xperror -DCHECK_PORT  -DFACILITY=LOG_AUTH  
-DIGNORE_SIGCHLD            -Os  
-I/home/buildroot/build_arm/staging_dir/usr/include 
-I/home/buildroot/build_arm/staging_dir/include 
--sysroot=/home/buildroot/build_arm/staging_dir/ -isysroot 
/home/buildroot/build_arm/staging_dir -mtune=arm9tdmi    -c -o 
pmap_check.o pmap_check.c
/home/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc  
-Dperror=xperror -DCHECK_PORT  -DFACILITY=LOG_AUTH  
-DIGNORE_SIGCHLD            -Os  
-I/home/buildroot/build_arm/staging_dir/usr/include 
-I/home/buildroot/build_arm/staging_dir/include 
--sysroot=/home/buildroot/build_arm/staging_dir/ -isysroot 
/home/buildroot/build_arm/staging_dir -mtune=arm9tdmi   -o portmap  
/home/buildroot/build_arm/staging_dir/usr/lib/libc.a  portmap.o 
pmap_check.o from_local.o get_myaddress.o  
portmap.o: In function `main':
portmap.c:(.text+0x914): undefined reference to `svcudp_create'
portmap.c:(.text+0x9a0): undefined reference to `svctcp_create'
portmap.c:(.text+0xa1c): undefined reference to `svc_run'
collect2: ld returned 1 exit status
make[1]: *** [portmap] Error 1
make[1]: Leaving directory `/home/buildroot/build_arm/portmap_5beta'
make: *** [/home/buildroot/build_arm/portmap_5beta/portmap] Error 2






Make sure I'm pointing to the right libc.a:
mike at himalia:/home/buildroot$ arm-linux-gcc  -print-file-name=libc.a
/home/buildroot/build_arm/staging_dir/usr/lib/libc.a





Using nm, I verified that libc.a does in fact contain 2 of the 3 
unresolved external references.
mike at himalia:/home/buildroot$ nm 
/home/buildroot/build_arm/staging_dir/usr/lib/libc.a | grep svc_run
svc_run.os:
00000028 T svc_run
mike at himalia:/home/buildroot$ nm 
/home/buildroot/build_arm/staging_dir/usr/lib/libc.a | grep svctcp_create
00000354 T svctcp_create



Anyone have any ideas what is going on here?

Thanks in advance.

Mike
