From: Claus Klein <claus.klein@arcormail.de>
Date: Tue, 01 Jan 2008 14:54:00 +0100
Subject: [Buildroot] Errors while build with BR2_LARGEFILE not set
Message-ID: <477A45F8.8070006@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

I tried to build a root file system with the target option: "generic
development system" selected.
Too I selected the toolchain for the taget:

BR2_GCC_CROSS_CXX=y
# BR2_GCC_CROSS_FORTRAN is not set
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y


My first try was without BR2_LARGEFILE support, but this fails for some
packages.
I was able to fix the makefiles for this. My patch is included.

But finaly I stoped which a lot of errors in the toolchain and I give it up.

Here is the tail of my build log:

...
make[5]: Entering directory
`/mnt/hda1/buildroot/project_build_i386/uclibc/root/root/ltp-full-20070228/testcases/kernel/fs/fsstress'
/mnt/hda1/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc
-Os -pipe  -I/mnt/hda1/buildroot/build_i386/staging_dir/usr/include
-I/mnt/hda1/buildroot/build_i386/staging_dir/include
--sysroot=/mnt/hda1/buildroot/build_i386/staging_dir/ -isysroot
/mnt/hda1/buildroot/build_i386/staging_dir -mtune=i386 -march=i386
-Wall  -Wall -g -DNO_XFS -I. -D_LARGEFILE64_SOURCE -D_GNU_SOURCE
fsstress.c   -o fsstress
fsstress.c:213: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'maxfsize'
fsstress.c:256: warning: 'struct stat64' declared inside parameter list
fsstress.c:256: warning: its scope is only this definition or
declaration, which is probably not what you want
fsstress.c:269: warning: 'struct stat64' declared inside parameter list
fsstress.c:271: error: expected declaration specifiers or '...' before
'off64_t'
fsstress.c: In function 'main':
fsstress.c:406: warning: implicit declaration of function 'lseek64'
fsstress.c:406: error: 'off64_t' undeclared (first use in this function)
fsstress.c:406: error: (Each undeclared identifier is reported only once
fsstress.c:406: error: for each function it appears in.)
fsstress.c:407: error: 'maxfsize' undeclared (first use in this function)
fsstress.c: In function 'doproc':
fsstress.c:705: error: storage size of 'statbuf' isn't known
fsstress.c:713: warning: implicit declaration of function 'stat64'
fsstress.c:705: warning: unused variable 'statbuf'
fsstress.c: At top level:
fsstress.c:953: warning: 'struct stat64' declared inside parameter list
fsstress.c:954: error: conflicting types for 'lstat64_path'
fsstress.c:256: error: previous declaration of 'lstat64_path' was here
fsstress.c: In function 'lstat64_path':
fsstress.c:959: warning: implicit declaration of function 'lstat64'
fsstress.c: At top level:
fsstress.c:1256: warning: 'struct stat64' declared inside parameter list
fsstress.c:1257: error: conflicting types for 'stat64_path'
fsstress.c:269: error: previous declaration of 'stat64_path' was here
fsstress.c:1299: error: expected declaration specifiers or '...' before
'off64_t'
fsstress.c: In function 'truncate64_path':
fsstress.c:1305: warning: implicit declaration of function 'truncate64'
fsstress.c:1305: error: 'length' undeclared (first use in this function)
fsstress.c:1310: error: too many arguments to function 'truncate64_path'
fsstress.c: In function 'dread_f':
fsstress.c:1752: error: 'off64_t' undeclared (first use in this function)
fsstress.c:1752: error: expected ';' before 'off'
fsstress.c:1753: error: storage size of 'stb' isn't known
fsstress.c:1778: warning: implicit declaration of function 'fstat64'
fsstress.c:1813: error: 'off' undeclared (first use in this function)
fsstress.c:1753: warning: unused variable 'stb'
fsstress.c: In function 'dwrite_f':
fsstress.c:1843: error: 'off64_t' undeclared (first use in this function)
fsstress.c:1843: error: expected ';' before 'off'
fsstress.c:1844: error: storage size of 'stb' isn't known
fsstress.c:1893: error: 'off' undeclared (first use in this function)
fsstress.c:1903: error: 'maxfsize' undeclared (first use in this function)
fsstress.c:1844: warning: unused variable 'stb'
fsstress.c: In function 'getdents_f':
fsstress.c:2053: warning: implicit declaration of function 'readdir64'
fsstress.c:2053: warning: comparison between pointer and integer
fsstress.c: In function 'read_f':
fsstress.c:2191: error: 'off64_t' undeclared (first use in this function)
fsstress.c:2191: error: expected ';' before 'off'
fsstress.c:2192: error: storage size of 'stb' isn't known
fsstress.c:2229: error: 'off' undeclared (first use in this function)
fsstress.c:2192: warning: unused variable 'stb'
fsstress.c: In function 'stat_f':
fsstress.c:2403: error: storage size of 'stb' isn't known
fsstress.c:2403: warning: unused variable 'stb'
fsstress.c: In function 'truncate_f':
fsstress.c:2482: error: 'off64_t' undeclared (first use in this function)
fsstress.c:2482: error: expected ';' before 'off'
fsstress.c:2483: error: storage size of 'stb' isn't known
fsstress.c:2503: error: 'off' undeclared (first use in this function)
fsstress.c:2504: error: 'maxfsize' undeclared (first use in this function)
fsstress.c:2505: error: too many arguments to function 'truncate64_path'
fsstress.c:2483: warning: unused variable 'stb'
fsstress.c: In function 'write_f':
fsstress.c:2600: error: 'off64_t' undeclared (first use in this function)
fsstress.c:2600: error: expected ';' before 'off'
fsstress.c:2601: error: storage size of 'stb' isn't known
fsstress.c:2630: error: 'off' undeclared (first use in this function)
fsstress.c:2631: error: 'maxfsize' undeclared (first use in this function)
fsstress.c:2601: warning: unused variable 'stb'
make[5]: *** [fsstress] Error 1
make[5]: Leaving directory
`/mnt/hda1/buildroot/project_build_i386/uclibc/root/root/ltp-full-20070228/testcases/kernel/fs/fsstress'
make[4]: *** [all] Error 2
make[4]: Leaving directory
`/mnt/hda1/buildroot/project_build_i386/uclibc/root/root/ltp-full-20070228/testcases/kernel/fs'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/mnt/hda1/buildroot/project_build_i386/uclibc/root/root/ltp-full-20070228/testcases/kernel'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/mnt/hda1/buildroot/project_build_i386/uclibc/root/root/ltp-full-20070228/testcases'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/mnt/hda1/buildroot/project_build_i386/uclibc/root/root/ltp-full-20070228'
make: ***
[/mnt/hda1/buildroot/project_build_i386/uclibc/root/root/ltp-full-20070228/.compiled] 

Error 2
root at slax:/buildroot#
Script done on Tue Jan  1 12:45:23 2008

ck


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: largefile-config.diff
Url: http://busybox.net/lists/buildroot/attachments/20080101/70af09a6/attachment.diff 
