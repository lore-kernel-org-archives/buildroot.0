From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:48 -0800
Subject: [Buildroot] [buildroot 0000368]: libelf shared lib error
Message-ID: <03f783f9837051de06f6b18e5bac521e@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=368 
====================================================================== 
Reported By:                mdeschamps
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   368
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-08-2005 01:35 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    libelf shared lib error
Description: 
It crashes my builroot making processes on libelf.so.0.8.5 installing (Not
found)

----------
make[2]: Quitte le repertoire
`/usr/local/buildroot/build_arm/libelf-0.8.5/lib'
make[1]: Quitte le repertoire
`/usr/local/buildroot/build_arm/libelf-0.8.5'
/usr/bin/install -m 0644 /opt/buildroot/usr/lib/libelf.so.0.8.5
/usr/local/buildroot/build_arm/root/usr/lib/
/usr/bin/install: ne peut evaluer
`/opt/buildroot/usr/lib/libelf.so.0.8.5': Aucun fichier ou repertoire de
ce type
----------

It can't find the lib to install because it hadn't made it. It hadn't made
it
because configure returns a error with shared lib previously but it wasn't
blocking/crashing.


Here is the complete log of the early stage of the process :

-------
zcat /usr/local/buildroot/dl/libelf-0.8.5.tar.gz | tar -C
/usr/local/buildroot/build_arm -xf -
toolchain/patch-kernel.sh /usr/local/buildroot/build_arm/libelf-0.8.5
package/libelf libelf\*.patch

Applying package/libelf/libelf.patch using plaintext:
patching file aclocal.m4
touch /usr/local/buildroot/build_arm/libelf-0.8.5/.source
(cd /usr/local/buildroot/build_arm/libelf-0.8.5; \
        PATH=/opt/buildroot/bin:/bin:/sbin:/usr/bin:/usr/sbin
AR=/opt/buildroot/bin/arm-linux-uclibc-ar
AS=/opt/buildroot/bin/arm-linux-uclibc-as
LD=/opt/buildroot/bin/arm-linux-uclibc-ld
NM=/opt/buildroot/bin/arm-linux-uclibc-nm
CC=/opt/buildroot/bin/arm-linux-uclibc-gcc
GCC=/opt/buildroot/bin/arm-linux-uclibc-gcc
CXX=/opt/buildroot/bin/arm-linux-uclibc-g++
RANLIB=/opt/buildroot/bin/arm-linux-uclibc-ranlib
OBJCOPY=/opt/buildroot/bin/arm-linux-uclibc-objcopy \
        ./configure \
        --target=arm-linux \
        --host=arm-linux \
        --build=i386-pc-linux-gnu \
        --prefix=/usr \
        --sysconfdir=/etc \
        --disable-nls \
        --enable-shared \
);
--------------

After detaring/decompressing, configure displays out :

--------------
creating cache ./config.cache
checking whether make sets ${MAKE}... yes
checking for gcc... /opt/buildroot/bin/arm-linux-uclibc-gcc
checking whether the C compiler (/opt/buildroot/bin/arm-linux-uclibc-gcc 
) works... yes
checking whether the C compiler (/opt/buildroot/bin/arm-linux-uclibc-gcc 
) is a cross-compiler... yes
checking whether we are using GNU C... yes
checking whether /opt/buildroot/bin/arm-linux-uclibc-gcc accepts -g...
yes
checking how to run the C preprocessor...
/opt/buildroot/bin/arm-linux-uclibc-gcc -E
checking for a BSD compatible install... /usr/bin/install -c
checking for ranlib... /opt/buildroot/bin/arm-linux-uclibc-ranlib
checking whether ln -s works... yes
checking for ANSI C header files... yes
checking for unistd.h... yes
checking for fcntl.h... yes
checking for elf.h... yes
checking for sys/elf.h... no
checking for link.h... yes
checking for sys/link.h... no
checking for ar.h... yes
checking for libelf.h... no
checking for nlist.h... no
checking for gelf.h... no
checking whether to install <libelf.h>, <nlist.h> and <gelf.h>... yes
.
.
.

checking the coffee machine... empty - operator may not work as expected
>> oh really ?<<
checking whether 64-bit ELF support is sufficient... no
checking whether to include 64-bit support... no
checking whether versioning support is sufficient... yes
checking whether to include versioning support... yes
checking whether NLS is requested... no
checking host system type... arm-unknown-linux-gnu
checking whether to build a shared library... yes
checking whether GNU naming conventions are requested... no
checking for ld... /opt/buildroot/bin/arm-linux-uclibc-ld
checking for native ELF system... no << umm ?

configure: warning: shared libraries not supported for
arm-unknown-linux-gnu



updating cache ./config.cache
creating ./config.status
creating Makefile
creating lib/Makefile
creating po/Makefile
creating config.h
creating lib/sys_elf.h
touch /usr/local/buildroot/build_arm/libelf-0.8.5/.configured;
make -j10 PATH=/opt/buildroot/bin:/bin:/sbin:/usr/bin:/usr/sbin
AR=/opt/buildroot/bin/arm-linux-uclibc-ar
AS=/opt/buildroot/bin/arm-linux-uclibc-as
LD=/opt/buildroot/bin/arm-linux-uclibc-
ld NM=/opt/buildroot/bin/arm-linux-uclibc-nm
CC=/opt/buildroot/bin/arm-linux-uclibc-gcc
GCC=/opt/buildroot/bin/arm-linux-uclibc-gcc
CXX=/opt/buildroot/bin/arm-linux-uclibc-g++ RANLIB=/opt
/buildroot/bin/arm-linux-uclibc-ranlib
OBJCOPY=/opt/buildroot/bin/arm-linux-uclibc-objcopy -C
/usr/local/buildroot/build_arm/libelf-0.8.5
make[1]: Entering directory `/usr/local/buildroot/build_arm/libelf-0.8.5'

-----

Why "configure: warning: shared libraries not supported for
arm-unknown-linux-gnu" ? I think my platform is badly recognize or
something like that. Thus, i've tried with configure --target and --host
options
same set to i386-linux-gnu : idem issue... 

Then, i've thought it could be a bad patching or so since a patch to
aclocal.m4
is done. The patch is putting a yes a the last "mr_cv_target_elf="
--------

 changequote([, ])dnl
      mr_cv_target_elf=yes,
      mr_cv_target_elf=no,
      mr_cv_target_elf=yes)])])
--------
The issue point in the aclocal.m4 code is 
the "if test "$mr_cv_target_elf" = yes; then"  test
that is false leading the else state which shouldn't
happen into my case (for the patch actually works !)
---------
case "$host" in
      *-linux*|*-gnu*)
        if test "$GCC" = yes; then
          mr_TARGET_ELF
          if test "$mr_cv_target_elf" = yes; then
            PICFLAGS='-fPIC -DPIC'
            if test "$mr_enable_gnu_names" = yes
            then
              SHLIB_SFX='-$(VERSION).so'
            else
              SHLIB_SFX='.so.$(VERSION)'
            fi
            SHLINK_SFX='.so'
            SONAME_SFX='.so.$(MAJOR)'
            LINK_SHLIB='$(CC) -shared -Wl,-soname,$(SONAME)'
            INSTALL_SHLIB='$(INSTALL_PROGRAM)'
            DEPSHLIBS='-lc'
          else
            AC_MSG_WARN([shared libraries not supported for $host])
            mr_enable_shared=no
>> Of course up to there sharedlib are actually disable !<<
          fi
        else
          AC_MSG_WARN([GNU CC required for building shared libraries])
          mr_enable_shared=no
        fi
        ;;

-----

I'am puzzled and can't get through. 
======================================================================
Relationships       ID      Summary
----------------------------------------------------------------------
has duplicate       0000307 libelf.so.0.8.5 fails to create / install
====================================================================== 

---------------------------------------------------------------------- 
 swth - 08-17-05 07:49  
---------------------------------------------------------------------- 
My problem matches yours with the exception of --target and --host:
        .......
        ./configure \
        --target=i386-linux \
        --host=i386-linux \
        --build=i386-pc-linux-gnu \
        --prefix=/usr \
        --sysconfdir=/etc \
        --disable-nls \
        --enable-shared \
);

The short answer: cross compiling disables shared library creation

The long answer (working backwards):

1.) The shared libraries are not created because $mr_enable_shared is
equal to "no".

2.) $mr_enable_shared is equal to "no" and the "configure: warning: shared
libraries not supported for i386-pc-linux-gnu" warning is generated because
$mr_cv_target_elf does not equal "yes"

3.) $mr_cv_target_elf does not equal "yes" because it is set to "no" when
$cross_compiling is equal to "yes"

4.) Why does enabling cross_compiling cause TARGET elf support to be
disabled?  Oh wait, the associated comment states "Checking for native ELF
system".  Well, which is it suppose to be checking?  The comment says
NATIVE and the variable says TARGET.  Hmmm, maybe it means native elf
support on the target.

The answer:

Assuming configure is attempting to determine if native elf support exists
on the cross compiled target, the always "no" answer is incomplete@best.
 Thus, configure needs a patch for this situation:

1.) create the following c program, compile it with the cross compiler,
and call the executable elf_test
    int main(int argc, char **argv) { return 0; }
2.) create the native elf application checking c program and compile it
with the host compiler
3.) use the program created in step 2 to determine if the program in step
one is elf or not
4.) set the mr_cv_target_elf variable according to the output in step 3

Question:  This will work to solve my i386 program.  However, I do not
know if it will solve your arm problem.  Are the first 4 bytes of an elf
arm application '\177' 'E' 'L' 'F'  ( 7f 45 4c 46 in hex)?

Please run the following on elf_test (or one of your arm applications) and
let me know if the output is "7f 45 4c 46":

hexdump -C elf_test | head -1 | cut -f3-6 -d' ' 

---------------------------------------------------------------------- 
 mdeschamps - 08-25-05 00:47  
---------------------------------------------------------------------- 
$  hexdump -C /sbin/hotplug | head -1 | cut -f3-6 -d' '
7f 45 4c 46

err... ok then but what's exactly your point ?

 

---------------------------------------------------------------------- 
 swth - 08-26-05 07:34  
---------------------------------------------------------------------- 
I believe the elf library support for cross compiling has been disabled
because somebody mistakenly attempted use the host test as the cross
target test and it did not work.  Thus, as a short term solution, it was
marked as disabled when a cross compiler was in use.

So, after reading your problem discription and debugging the script in
question, I determined a way to fix it.  However, I did not know enough
about ELF executables to know if my solution would work for your cross
compiler.  Thus, I asked for the simple test.  Will your output match
mine?  Answer, yes.

Now, I know that the fix I have should work and I will finish it as soon
as possible. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-08-05 01:35  mdeschamps     New Issue                                    
08-08-05 01:35  mdeschamps     Status                   new => assigned     
08-08-05 01:35  mdeschamps     Assigned To               => uClibc          
08-16-05 17:57  swth           Issue Monitored: swth                        
08-17-05 07:49  swth           Note Added: 0000424                          
08-25-05 00:45  mdeschamps     Note Added: 0000433                          
08-25-05 00:47  mdeschamps     Note Edited: 0000433                         
08-26-05 07:34  swth           Note Added: 0000438                          
10-11-05 10:27  bjdooks        Issue Monitored: bjdooks                     
12-03-05 10:36  boris64        Issue Monitored: boris64                     
01-23-06 05:21  prpplague      Relationship added       has duplicate 0000307
01-23-06 06:04  prpplague      Status                   assigned => resolved
01-23-06 06:04  prpplague      Resolution               open => fixed       
01-23-06 06:04  prpplague      Additional Information Updated                   

03-08-06 16:56  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
