From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 Sep 2018 16:33:26 +0000
Subject: [Buildroot] [Bug 11266] New: qt5base-5.11.1 does not compile with
 musl, complains about redefinitions
Message-ID: <bug-11266-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11266

            Bug ID: 11266
           Summary: qt5base-5.11.1 does not compile with musl, complains
                    about redefinitions
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: richterphilipp.pops at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7706
  --> https://bugs.busybox.net/attachment.cgi?id=7706&action=edit
Config file to reproduce

Hello,

using the latest buildroot commit 2989e3c87a1123350728904fd789ad513e76b073
I tried to build qt5base 11.1 with musl but I get errors about redefinitions
like statx_timestamp, statx and renameat2. Seems like there are collisions
between the linux headers and the musl headers ?

Steps to reproduce :

1) select musl as libc

2) select qt5base 11.1 in the target packages

3) make

Build output :

In file included from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp:94: 
/usr/include/linux/stat.h:56:8: error: redefinition of ?struct statx_timestamp? 
 struct statx_timestamp {                                                       
        ^~~~~~~~~~~~~~~                                                         
In file included from /usr/include/sys/stat.h:446,                              
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/mkspecs/linux-g++/qplatformdefs.h:75,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp:42:
/usr/include/bits/statx.h:25:8: note: previous definition of ?struct
statx_timestamp?
 struct statx_timestamp
        ^~~~~~~~~~~~~~~
In file included from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp:94:
/usr/include/linux/stat.h:99:8: error: redefinition of ?struct statx?
 struct statx {
        ^~~~~
In file included from /usr/include/sys/stat.h:446,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/mkspecs/linux-g++/qplatformdefs.h:75,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp:42:
/usr/include/bits/statx.h:36:8: note: previous definition of ?struct statx?
 struct statx
        ^~~~~
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp:110:12:
error: ?int renameat2(int, const char*, int, const char*, unsigned int)? was
declared ?extern? and later ?static? [-fpermissive]                         
 static int renameat2(int oldfd, const char *oldpath, int newfd, const char
*newpath, unsigned flags)
            ^~~~~~~~~
In file included from /usr/include/c++/8.2.1/cstdio:42,
                 from /usr/include/c++/8.2.1/ext/string_conversions.h:43,
                 from /usr/include/c++/8.2.1/bits/basic_string.h:6391,
                 from /usr/include/c++/8.2.1/string:52,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/include/QtCore/../../src/corelib/tools/qbytearray.h:52, 
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/include/QtCore/qbytearray.h:1,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/include/QtCore/../../src/corelib/tools/qstring.h:49, 
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/include/QtCore/qstring.h:1,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/include/QtCore/../../src/corelib/io/qiodevice.h:50,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/include/QtCore/qiodevice.h:1,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/include/QtCore/../../src/corelib/io/qfiledevice.h:43, 
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/include/QtCore/qfiledevice.h:1,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfile.h:44,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfilesystemengine_p.h:54,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp:43:
/usr/include/stdio.h:164:12: note: previous declaration of ?int renameat2(int,
const char*, int, const char*, unsigned int)?
 extern int renameat2 (int __oldfd, const char *__old, int __newfd,
            ^~~~~~~~~
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp:115:12:
error: ?int statx(int, const char*, int, unsigned int, statx*)? was declared
?extern? and later ?static? [-fpermissive]                                  
 static int statx(int dirfd, const char *pathname, int flag, unsigned mask,
struct statx *statxbuf)
            ^~~~~
In file included from /usr/include/sys/stat.h:446,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/mkspecs/linux-g++/qplatformdefs.h:75,
                 from
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/src/corelib/io/qfilesystemengine_unix.cpp:42:
/usr/include/bits/statx.h:87:5: note: previous declaration of ?int statx(int,
const char*, int, unsigned int, statx*)?
 int statx (int __dirfd, const char *__restrict __path, int __flags,
     ^~~~~
make[2]: *** [Makefile:423: qfilesystemengine_unix.o] Error 1
make[1]: *** [package/pkg-generic.mk:222:
/home/popsulfr/work/buildroot/x86_64/build/qt5base-5.11.1/.stamp_configured]
Error 2
make: *** [Makefile:16: _all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
