From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Tue, 20 Oct 2009 16:51:40 -0700
Subject: [Buildroot] uClibc kernel headers problem
In-Reply-To: <4ADDE87E.1030601@cs.ucsb.edu>
References: <4ADDE87E.1030601@cs.ucsb.edu>
Message-ID: <4ADE4D0C.7010101@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have untared a fresh copy of build root 2009.8.  When I run make for
the first time, there is an error regarding the absence of
toolchain_build_arm/uClibc.config.arm  and the process stops (see error
log below).  If I do 'touch toolchain_build_arm/uClibc.config.arm' then
run make again, there is a series of questions which pertain to which
configs should be used.

I am using my own target/device.  But that mainly defines the U-BOOT
config variable (cs-e9302), and I don't have any uClibc configuration
files in that directory.  I am just curious if this is a bug or if I am
doing something wrong.

Roman

Applying uClibc-0.9.30.1-unifdef-getline.patch using plaintext:
patching file extra/scripts/unifdef.c
touch
/proj/tools/buildroot-2009.08/toolchain_build_arm/uClibc-0.9.30.1/.patched
cp -f
/proj/tools/buildroot-2009.08/toolchain_build_arm/uClibc.config.arm
/proj/tools/buildroot-2009.08/toolchain_build_arm/uClibc-0.9.30.1/.oldconfig

cp: cannot stat
`/proj/tools/buildroot-2009.08/toolchain_build_arm/uClibc.config.arm':
No such file or directory

make: ***
[/proj/tools/buildroot-2009.08/toolchain_build_arm/uClibc-0.9.30.1/.oldconfig]
Error 1


Roman Chertov wrote:
> Hello,
> 
> I am using the latest build root release and I am trying to build a tool
> chain for CS-e9302 board which has an ARM chip.  I want to use the
> 2.6.24.7 Linux kernel (I patched it to support click modular router).  I
> patched that kernel and u-boot 1.3.3 with patches from
> http://dev.ivanov.eu/projects/cs-e9302/ to enable the board support.  I
> then renamed the tar.bz2 files into file names that buildroot supports
> in the menuconfig (linux-2.6.24.tar.bz2 kernel and
> u-boot-2009.06.tar.bz2) and placed the files into the dl directory.
> 
> My current trouble is with uClibc 0.9.30.1.  In the buildroot menuconfig
> I specified that I want to build the entire Linux kernel, so as far as I
> understand there is no need to use the precompiled headers option.  When
> I build the tool chain, it all works up to uClibc.  I get the following
> error "cc1: error: unrecognized command line option "-mbig-endian"".  I
> have included the output log down below.  I would appreciate any help
> with this.
> 
> Thanks,
> 
> Roman
> 
>   Checking build system dependencies:
> BUILDROOT_DL_DIR clean:                         Ok
> CC clean:                                       Ok
> CXX clean:                                      Ok
> CPP clean:                                      Ok
> CFLAGS clean:                                   Ok
> INCLUDES clean:                                 Ok
> CXXFLAGS clean:                                 Ok
> which installed:                                Ok
> sed works:                                      Ok (/bin/sed)
> GNU make version '3.81':                        Ok
> C compiler '/usr/lib/ccache/gcc'
> C compiler version '4.4.1':                     Ok
> C++ compiler '/usr/lib/ccache/g++'
> C++ compiler version '4.4.1':                   Ok
> awk installed:                                  Ok
> bash installed:                                 Ok
> bison installed:                                Ok
> flex installed:                                 Ok
> gettext installed:                              Ok
> makeinfo installed:                             Ok
> Build system dependencies:                      Ok
> 
> rm -rf
> /proj/tools/buildroot-2009.08/project_build_arm/uclibc/buildroot-config
> mkdir -p /proj/tools/buildroot-2009.08/project_build_arm/uclibc
> cp -dpRf package/config/buildroot-config
> /proj/tools/buildroot-2009.08/project_build_arm/uclibc/buildroot-config
> /usr/bin/make -j1 -C
> /proj/tools/buildroot-2009.08/toolchain_build_arm/uClibc-0.9.30.1 \
>                 PREFIX= \
>                 DEVEL_PREFIX=/ \
>                 RUNTIME_PREFIX=/ \
>                 HOSTCC="/usr/lib/ccache/gcc" \
>                 all
> make[1]: Entering directory
> `/proj/tools/buildroot-2009.08/toolchain_build_arm/uClibc-0.9.30.1'
>   GEN include/bits/sysnum.h
> cc1: error: unrecognized command line option "-mbig-endian"
> cc1: error: unrecognized command line option "-mbig-endian"
> ERROR: Could not generate syscalls.
> Make sure that you have proper kernel headers.
> Your .config in KERNEL_HEADERS="" was set to:
> /usr/include/
> make[1]: *** [include/bits/sysnum.h] Error 1
> make[1]: Leaving directory
> `/proj/tools/buildroot-2009.08/toolchain_build_arm/uClibc-0.9.30.1'
> make: ***
> [/proj/tools/buildroot-2009.08/toolchain_build_arm/uClibc-0.9.30.1/lib/libc.a]
> Error 2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
