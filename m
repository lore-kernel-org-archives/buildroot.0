From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 15 May 2008 05:45:21 -0700
Subject: [Buildroot] [buildroot 0002864]: Java compiler and libgcj build
	fails (arm-iwmmxt-eabi)
Message-ID: <48abf4de9d83cba4c761d99d49f0d9e0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2864 
====================================================================== 
Reported By:                Francesco
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2864
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-06-2008 14:28 PDT
Last Modified:              05-15-2008 05:45 PDT
====================================================================== 
Summary:                    Java compiler and libgcj build fails
(arm-iwmmxt-eabi)
Description: 
I get this error while trying to compile libgcj and java compiler for
arm-iwmmxt-eabi:

#
# Now for the ugly 3.3.x soft float hack...
#
#
# Ok... that's enough of that.
#
mkdir -p /root/tmp/buildroot/project_build_arm/uclibc/root/usr/lib
/root/tmp/buildroot/project_build_arm/uclibc/root/usr/sbin
touch /root/tmp/buildroot/toolchain_build_arm/gcc-4.2.3-final/.installed
# These are in /lib, so...
rm -rf
/root/tmp/buildroot/project_build_arm/uclibc/root/usr/lib/libgcc_s*.so*
cp -dpf
root/tmp/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/libgcc_s*
\
                /root/tmp/buildroot/project_build_arm/uclibc/root/lib/
cp -dpf
/root/tmp/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/libstdc++.so*
\
               
/root/tmp/buildroot/project_build_arm/uclibc/root/usr/lib/
cp -dpf /root/tmp/buildroot/build_arm/staging_dir/lib/libgcj.so*
/root/tmp/buildroot/project_build_arm/uclibc/root/lib/
cp: cannot stat
`/root/tmp/buildroot/build_arm/staging_dir/lib/libgcj.so*': No such file
or directory
make: ***
[/root/tmp/buildroot/toolchain_build_arm/gcc-4.2.3-final/.libs_installed]
Error 1



====================================================================== 

---------------------------------------------------------------------- 
 tpetazzoni - 05-15-08 05:33  
---------------------------------------------------------------------- 
Problem still exists in today's Subversion of Buildroot. 

---------------------------------------------------------------------- 
 tpetazzoni - 05-15-08 05:45  
---------------------------------------------------------------------- 
Ok, the problem is that when you enable the Java compiler, the option
BR2_INSTALL_LIBGCJ is enabled. When this option is selected,
toolchain/gcc/gcc-uclibc-4.x.mk does the following thing:

GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),java

So, Java is added to GCC_TARGET_LANGUAGES.

However, GCC_TARGET_LANGUAGES is used in the optional 3rd step of gcc
compilation: compilation of a native gcc for the target (not a
cross-compiler). The list of languages supported by the cross-compiler is
in GCC_CROSS_LANGUAGES.

However, for some reason, when BR2_INSTALL_LIBGCJ is enabled, at the of
the second step of gcc compilation (compilation of the final
cross-compiler), then the Makefile looks for some libgcj.so* files. Which
of course are not present, since "java" was not in GCC_CROSS_LANGUAGES. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-06-08 14:28  Francesco      New Issue                                    
04-06-08 14:28  Francesco      Status                   new => assigned     
04-06-08 14:28  Francesco      Assigned To               => buildroot       
04-06-08 14:28  Francesco      File Added: .config                          
05-15-08 05:33  tpetazzoni     Note Added: 0007684                          
05-15-08 05:45  tpetazzoni     Note Added: 0007694                          
======================================================================
