From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Jul 2019 06:23:22 +0000
Subject: [Buildroot] [Bug 12031] New: Build of cups-filters fails while
 linking, apparently due to missing libiconv
Message-ID: <bug-12031-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12031

            Bug ID: 12031
              Host: i386
             Build: amd64 Linux
           Summary: Build of cups-filters fails while linking, apparently
                    due to missing libiconv
           Product: buildroot
           Version: 2019.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Keywords: link-failure
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jakobcornell at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The command `make` fails with the following output:

[7m>>> cups-filters 1.21.3 Building[27m
PATH="/home/jakob/buildroot-2019.05.1/output/host/bin:/home/jakob/buildroot-2019.05.1/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/jakob/.cargo/bin"
 /usr/bin/make -j3  -C
/home/jakob/buildroot-2019.05.1/output/build/cups-filters-1.21.3/
make[1]: Entering directory
'/home/jakob/buildroot-2019.05.1/output/build/cups-filters-1.21.3'
/usr/bin/make  all-am
make[2]: Entering directory
'/home/jakob/buildroot-2019.05.1/output/build/cups-filters-1.21.3'
sed -e "s/Braille transcription/Additional Braille transcription (2)/" \
    -e "s/^  \\*Choice /  Choice /" \
    -e "s/^  Choice \"HyphLocale\//  *Choice \"HyphLocale\//" \
    -e s/LibLouis/LibLouis2/ \
    < filter/braille/filters/liblouis1.defs >
filter/braille/filters/liblouis2.defs
sed -e "s/Braille transcription/Additional Braille transcription (3)/" \
    -e "s/^  \\*Choice /  Choice /" \
    -e "s/^  Choice \"None\//  *Choice \"None\//" \
    -e s/LibLouis/LibLouis3/ \
    < filter/braille/filters/liblouis1.defs >
filter/braille/filters/liblouis3.defs
  CCLD     texttotext
sed -e "s/Braille transcription/Additional Braille transcription (4)/" \
    -e "s/^  \\*Choice /  Choice /" \
    -e "s/^  Choice \"None\//  *Choice \"None\//" \
    -e s/LibLouis/LibLouis4/ \
    < filter/braille/filters/liblouis1.defs >
filter/braille/filters/liblouis4.defs
/home/jakob/buildroot-2019.05.1/output/host/lib/gcc/i686-buildroot-linux-uclibc/7.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld:
texttotext-texttotext.o: in function `main':
texttotext.c:(.text.startup+0xdf3): undefined reference to `libiconv_open'
/home/jakob/buildroot-2019.05.1/output/host/lib/gcc/i686-buildroot-linux-uclibc/7.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld:
texttotext.c:(.text.startup+0xfb0): undefined reference to `libiconv'
/home/jakob/buildroot-2019.05.1/output/host/lib/gcc/i686-buildroot-linux-uclibc/7.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld:
texttotext.c:(.text.startup+0xfe9): undefined reference to `libiconv'
/home/jakob/buildroot-2019.05.1/output/host/lib/gcc/i686-buildroot-linux-uclibc/7.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld:
texttotext.c:(.text.startup+0x16eb): undefined reference to `libiconv_close'
collect2: error: ld returned 1 exit status
Makefile:2541: recipe for target 'texttotext' failed
make[2]: *** [texttotext] Error 1
make[2]: Leaving directory
'/home/jakob/buildroot-2019.05.1/output/build/cups-filters-1.21.3'
Makefile:1968: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory
'/home/jakob/buildroot-2019.05.1/output/build/cups-filters-1.21.3'
package/pkg-generic.mk:238: recipe for target
'/home/jakob/buildroot-2019.05.1/output/build/cups-filters-1.21.3/.stamp_built'
failed
make: ***
[/home/jakob/buildroot-2019.05.1/output/build/cups-filters-1.21.3/.stamp_built]
Error 2

My Buildroot config is attached. I'm using uClibc in the toolchain, and
libiconv is selected as a dependency in the target package list.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
