From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  6 Nov 2009 15:46:14 +0000 (UTC)
Subject: [Buildroot] [Bug 693] New: setting an external toolchain makes the
 compilation fail
Message-ID: <bug-693-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=693

           Summary: setting an external toolchain makes the compilation fail
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: damien.courousse.logica at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=719)
 --> (https://bugs.busybox.net/attachment.cgi?id=719)
buildroot config file

Hello all,


I started a new project where I wanted to use an external toolchain previously
built with buildroot. For further details please read the buildroot
configuration file attached to this report.

make fails with these settings because with this toolchain 'arm-linux-gcc -v'
returns three occurrences of --sysroot ("Configured" // "(reconfigured)" //
"(reconfigured)" ). I guess (yet not sure) this happens because this toolchain
has been rebuild a few times.

Hence you might consider the bug comes from my toolchain, or not ;) 
My patch comes with the next report.

Best regards,
Damien


=================================
Here is the result of buildroot make:
buildroot$ make V=1

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
C compiler version '4.3.2':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.3.2':                   Ok
awk installed:                                  Ok
bash installed:                                 Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
patch installed:                                Ok
Build system dependencies:                      Ok

rm -rf /mnt/fractal/buildroot/temp/buildroot/output/build/buildroot-config
mkdir -p /mnt/fractal/buildroot/temp/buildroot/output/build
cp -dpRf package/config/buildroot-config
/mnt/fractal/buildroot/temp/buildroot/output/build/buildroot-config
Checking external toolchain settings
if ! test -x
/mnt/fractal/buildroot/buildroot/output/staging/usr/bin/arm-linux-gcc ; then
echo "Cannot find cross-compiler
/mnt/fractal/buildroot/buildroot/output/staging/usr/bin/arm-linux-gcc" ; exit 1
; fi ; 
EXT_TOOLCHAIN_TARGET=arm-linux-uclibcgnueabi ; if echo ${EXT_TOOLCHAIN_TARGET}
| grep -q 'eabi$' ; then EXT_TOOLCHAIN_ABI="eabi" ; else
EXT_TOOLCHAIN_ABI="oabi" ; fi ; if [ x == x"y" -a ${EXT_TOOLCHAIN_ABI} ==
"eabi" ] ; then echo "Incorrect ABI setting" ; exit 1 ; fi ; if [ xy == x"y" -a
${EXT_TOOLCHAIN_ABI} == "oabi" ] ; then echo "Incorrect ABI setting" ; exit 1 ;
fi ; 
SYSROOT_DIR="/mnt/fractal/buildroot/buildroot/output/staging
/mnt/fractal/buildroot/buildroot/output/staging
/mnt/fractal/buildroot/buildroot/output/staging"; if ! test -f
${SYSROOT_DIR}/lib/ld-uClibc.so.* ; then echo "Incorrect selection of the C
library"; exit -1; fi;
UCLIBC_CONFIG_FILE=${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ;
IS_IN_LIBC=`grep -q "#define __UCLIBC_HAS_LFS__ 1" ${UCLIBC_CONFIG_FILE} &&
echo y` ; if [ x != x"y" -a x${IS_IN_LIBC} == x"y" ] ; then echo "Large file
support available in C library, please enable BR2_LARGEFILE" ; exit 1 ; fi ; if
[ x == x"y" -a x${IS_IN_LIBC} != x"y" ] ; then echo "Large file support not
available in C library, please disable BR2_LARGEFILE" ; exit 1 ; fi ;
IS_IN_LIBC=`grep -q "#define __UCLIBC_HAS_IPV6__ 1" ${UCLIBC_CONFIG_FILE} &&
echo y` ; if [ x != x"y" -a x${IS_IN_LIBC} == x"y" ] ; then echo "IPv6 support
available in C library, please enable BR2_INET_IPV6" ; exit 1 ; fi ; if [ x ==
x"y" -a x${IS_IN_LIBC} != x"y" ] ; then echo "IPv6 support not available in C
library, please disable BR2_INET_IPV6" ; exit 1 ; fi ; IS_IN_LIBC=`grep -q
"#define __UCLIBC_HAS_RPC__ 1" ${UCLIBC_CONFIG_FILE} && echo y` ; if [ x !=
x"y" -a x${IS_IN_LIBC} == x"y" ] ; then echo "RPC support available in C
library, please enable BR2_INET_RPC" ; exit 1 ; fi ; if [ x == x"y" -a
x${IS_IN_LIBC} != x"y" ] ; then echo "RPC support not available in C library,
please disable BR2_INET_RPC" ; exit 1 ; fi ; IS_IN_LIBC=`grep -q "#define
__UCLIBC_HAS_LOCALE__ 1" ${UCLIBC_CONFIG_FILE} && echo y` ; if [ x != x"y" -a
x${IS_IN_LIBC} == x"y" ] ; then echo "Locale support available in C library,
please enable BR2_ENABLE_LOCALE" ; exit 1 ; fi ; if [ x == x"y" -a
x${IS_IN_LIBC} != x"y" ] ; then echo "Locale support not available in C
library, please disable BR2_ENABLE_LOCALE" ; exit 1 ; fi ; IS_IN_LIBC=`grep -q
"#define __UCLIBC_HAS_WCHAR__ 1" ${UCLIBC_CONFIG_FILE} && echo y` ; if [ x !=
x"y" -a x${IS_IN_LIBC} == x"y" ] ; then echo "Wide char support available in C
library, please enable BR2_USE_WCHAR" ; exit 1 ; fi ; if [ x == x"y" -a
x${IS_IN_LIBC} != x"y" ] ; then echo "Wide char support not available in C
library, please disable BR2_USE_WCHAR" ; exit 1 ; fi ; IS_IN_LIBC=`grep -q
"#define __UCLIBC_HAS_PROGRAM_INVOCATION_NAME__ 1" ${UCLIBC_CONFIG_FILE} &&
echo y` ; if [ x != x"y" -a x${IS_IN_LIBC} == x"y" ] ; then echo "Program
invocation support available in C library, please enable
BR2_PROGRAM_INVOCATION" ; exit 1 ; fi ; if [ x == x"y" -a x${IS_IN_LIBC} !=
x"y" ] ; then echo "Program invocation support not available in C library,
please disable BR2_PROGRAM_INVOCATION" ; exit 1 ; fi ; 
/bin/sh: line 0: test: too many arguments
Incorrect selection of the C library
make: ***
[/mnt/fractal/buildroot/temp/buildroot/output/stamps/ext-toolchain-installed]
Erreur 255


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
