From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 16 Jan 2020 21:23:17 +0000
Subject: [Buildroot] [Bug 12481] New: minicom fails when output directory
 path contains "m4"
Message-ID: <bug-12481-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12481

            Bug ID: 12481
           Summary: minicom fails when output directory path contains "m4"
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: heiko.thiery at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Building minicom package fails when the output directory path contains the
string "m4".

e.g.

make O=output-m4 qemu_x86_64_defconfig
make minicom

The build output looks like:

>>> minicom a6a507dcb8bd4cb5da7af9e2dc75b8e495fedbb6 Configuring
>>> minicom a6a507dcb8bd4cb5da7af9e2dc75b8e495fedbb6 Autoreconfiguring
configure.ac:27: warning: macro 'AM_ICONV_LINK' not found in library
configure.ac:125: warning: macro 'AM_GNU_GETTEXT' not found in library
configure.ac:126: warning: macro 'AM_GNU_GETTEXT_VERSION' not found in library
autoreconf: configure.ac: AM_GNU_GETTEXT_VERSION is used, but not
AM_GNU_GETTEXT
configure.ac:27: error: possibly undefined macro: AM_ICONV_LINK
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:125: error: possibly undefined macro: AM_GNU_GETTEXT
configure.ac:126: error: possibly undefined macro: AM_GNU_GETTEXT_VERSION
autoreconf:
/home/hthiery/sources/mainline/buildroot/output-m4/host/bin/autoconf failed
with exit status: 1
make[1]: *** [package/pkg-generic.mk:249:
/home/hthiery/sources/mainline/buildroot/output-m4/build/minicom-a6a507dcb8bd4cb5da7af9e2dc75b8e495fedbb6/.stamp_configured]
Fehler 1
make: *** [Makefile:23: _all] Fehler 2


I also observed that a directory is created where the "m4" part of the path is
replaced by the next part of the host directory. This directory contains links
to m4 files. In this example:

output-host/
output-host/share
output-host/share/aclocal
output-host/share/aclocal/codeset.m4
output-host/share/aclocal/wchar_t.m4
output-host/share/aclocal/fcntl-o.m4
output-host/share/aclocal/size_max.m4
output-host/share/aclocal/lib-link.m4
output-host/share/aclocal/progtest.m4
output-host/share/aclocal/intdiv0.m4
output-host/share/aclocal/iconv.m4
output-host/share/aclocal/uintmax_t.m4
output-host/share/aclocal/xsize.m4
output-host/share/aclocal/inttypes-pri.m4
output-host/share/aclocal/intldir.m4
output-host/share/aclocal/lock.m4
output-host/share/aclocal/longlong.m4
output-host/share/aclocal/nls.m4
output-host/share/aclocal/glibc21.m4
output-host/share/aclocal/lib-prefix.m4
output-host/share/aclocal/visibility.m4
output-host/share/aclocal/lib-ld.m4
output-host/share/aclocal/configheader.m4
output-host/share/aclocal/wint_t.m4
output-host/share/aclocal/printf-posix.m4
output-host/share/aclocal/intlmacosx.m4
output-host/share/aclocal/threadlib.m4
output-host/share/aclocal/stdint_h.m4
output-host/share/aclocal/lcmessage.m4
output-host/share/aclocal/intmax.m4
output-host/share/aclocal/po.m4
output-host/share/aclocal/ansi-c++.m4
output-host/share/aclocal/intl.m4
output-host/share/aclocal/glibc2.m4
output-host/share/aclocal/inttypes_h.m4
output-host/share/aclocal/gettext.m4


The same can be reproduced by:
utils/test-pkg -d ~/pkg-test-m4 -p minicom

-- 
You are receiving this mail because:
You are on the CC list for the bug.
