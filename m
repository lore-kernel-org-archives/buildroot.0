From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Oct 2011 12:51:36 +0000 (UTC)
Subject: [Buildroot] [Bug 4297] New: Qt's qmake uses wrong pkg-config
Message-ID: <bug-4297-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4297

           Summary: Qt's qmake uses wrong pkg-config
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: buildroot at bluespirit.la
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Creating a toolchain for ARM with the latest Qt library will install it's
libraries and QMAKESPECs. Theses QMAKESPECs have the CXXFLAGS and the correct
compiler, but don't address the pkg-config location.

If using pkg-config with qmake, it calls pkg-config from /usr/bin which causes
wrong include dirs.


########## Example ##########

Write to your *.pro file:

    # see
http://doc.trolltech.com/4.6/qmake-project-files.html#configuration-features
    CONFIG    += link_pkgconfig
    PKGCONFIG += fuse


If the wrong pkg-config is used, the include directory points to
"-I/usr/include/fuse" - otherwise to a directory inside your toolchain.

########## Patch ############

$ diff -u qws/linux-arm-g++/qmake.conf.orig qws/linux-arm-g++/qmake.conf
--- qws/linux-arm-g++/qmake.conf.orig    2011-10-12 14:47:49.000000000 +0200
+++ qws/linux-arm-g++/qmake.conf    2011-10-12 14:41:34.000000000 +0200
@@ -17,6 +17,9 @@
 QMAKE_CXX      = /opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-g++
 QMAKE_CC       = /opt/damian/toolchain-arm/usr/bin/arm-none-linux-gnueabi-gcc

+# Define Path to the correct pkg-config
+PKG_CONFIG = /opt/damian/toolchain-arm/usr/bin/pkg-config
+
 # modifications to g++.conf

 # modifications to linux.conf




I'm using buildroot 2011.08 with the CodeSoucery 2009q1 toolchain.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
