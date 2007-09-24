From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 24 Sep 2007 07:21:44 -0700
Subject: [Buildroot] [buildroot 0001507]: Build fails for ARM920T,
	c++ compiler/gcj build
Message-ID: <aa293cd5222d81d5fc8104cc35a5c938@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1507 
====================================================================== 
Reported By:                APOLAUF
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1507
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-23-2007 09:56 PDT
Last Modified:              09-24-2007 07:21 PDT
====================================================================== 
Summary:                    Build fails for ARM920T, c++ compiler/gcj build
Description: 
When attempting to build toolchain for ARM920t, with "Build/install c++
compiler and libsdc++" option and "build/install java compiler and
libgcj", the following error shows up no matter what distro I use (Fedora,
Debian, Gentoo, etc.):


)
# Now for the ugly 3.3.x soft float hack... 
#
#
# Ok... that's enough of that. ft
mkdir -p /root/buildroot/project_build_arm/uclibc/root/usr/lib
/root/buildroot/pro ject_build_arm/uclibc/root/usr/sbin
touch /root/buildroot/toolchain_build_arm/gcc-4.2.1-final/.installed 
# These are in /lib, so ...
rm -rf /root/bui
Idroot/project_build_arm/uclibc/root/usr/lib/libgcc_s*.so* 
cp -dpf
/root/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib/libgcc_s*
\
/root/buildroot/project_build_arm/uclibc/root/lib/ 
cp -dpf
/root/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib/libstdc++
/root/buildroot/project_build_arm/uclibc/root/usr/lib/
cp : cannot stat
?/root/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib/l
ibstdc++.so*? : Mo such file or directory
make : ***
[/root/buildroot/toolchain_build_arm/gcc-4.2.1-final/.libs_installed]
Error 1

I must have Java support on my toolchain, and this failure to compile
makes things very frustrating.  I saw something similar on these boards,
with the response being ~"fix your headers.", and stating that Gentoo had
correct headers. I'm using Gentoo, and it's apparently not helping. Please
help. Thanks,
-Adrian
====================================================================== 

---------------------------------------------------------------------- 
 APOLAUF - 09-23-07 09:58  
---------------------------------------------------------------------- 
the "ft" after "#Ok... that's enough of that" is my OCR software
incorrectly identifying the # symbol. I'm running this in a VM, and didn't
feel like piping the output over, so there may be a recognition error or
two. I took care to correct the rest of the output. 

---------------------------------------------------------------------- 
 UlfSamuelsson - 09-23-07 11:39  
---------------------------------------------------------------------- 
I have seen the same thing for the AVR32 build.
I traced it back to "configure" not beeing able to link.
This was because "crt1.o" was not found, when linking.
That disabled creating the *.so files.

I find this strange, since there is no crt1.asm in gcc
except for the SH architecture.
Did not have time to investigate further. 

---------------------------------------------------------------------- 
 APOLAUF - 09-23-07 12:58  
---------------------------------------------------------------------- 
So what can I do to get this to compile? I need gcj support or a JVM to run
on my busybox build. And I don't have room to statically link GCJ with
glibc (47MB for a  hello world app). Is there any toolchain that I can use
to build gcj cross-compiling support with static linking against uClibc? 

---------------------------------------------------------------------- 
 bernhardf - 09-23-07 13:21  
---------------------------------------------------------------------- 
I only tested C, fortran, c++ and those work as expected as far as i'm
concerned.
I don't do java (never did and will most likely never do), so please feel
free to send in patches. 

---------------------------------------------------------------------- 
 APOLAUF - 09-24-07 07:21  
---------------------------------------------------------------------- 
I disabled GCJ support, enabling only C++, but it still fails with the
exact same error. What can be done? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-23-07 09:56  APOLAUF        New Issue                                    
09-23-07 09:56  APOLAUF        Status                   new => assigned     
09-23-07 09:56  APOLAUF        Assigned To               => buildroot       
09-23-07 09:58  APOLAUF        Note Added: 0002766                          
09-23-07 11:39  UlfSamuelsson  Note Added: 0002767                          
09-23-07 12:58  APOLAUF        Note Added: 0002769                          
09-23-07 13:21  bernhardf      Note Added: 0002770                          
09-24-07 07:21  APOLAUF        Note Added: 0002789                          
======================================================================
