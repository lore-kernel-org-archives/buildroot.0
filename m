From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2009 12:34:24 +0000 (UTC)
Subject: [Buildroot] [Bug 559] New: mesa3d build fails
Message-ID: <bug-559-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=559

              Host: i686
            Target: i686
             Build: x86_64
           Summary: mesa3d build fails
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello!

Just tried to compile x11 for x86 on a x86_64 machine with
buildroot-2009.08-rc2. I'm using an external glibc-toolchain (created by
crosstool-ng)

Build of Mesa 7.2 fails with:
/home/test/crosstool-ng/i686-unknown-linux-gnu/lib/gcc/i686-unknown-linux-gnu/4.3.2/../../../../i686-unknown-linux-gnu/bin/ld:
cannot find -lX11
collect2: ld returned 1 exit status


My current workaround is:
--- 1/package/x11r7/mesa3d/mesa3d.mk~   2009-08-11 14:30:37.000000000 +0200
+++ 2/package/x11r7/mesa3d/mesa3d.mk    2009-08-11 14:30:42.000000000 +0200
@@ -47,7 +47,7 @@
                echo "SRC_DIRS = glx/x11 mesa glu glut/glx" && \
                echo "USING_EGL = 0" && \
                echo "X11_INCLUDES = " && \
-               echo "EXTRA_LIB_PATH = " && \
+               echo "EXTRA_LIB_PATH = -L$(STAGING_DIR)/usr/lib" && \
                echo "PROGRAM_DIRS =" && \
                echo "MKDEP_OPTIONS = -fdepend -Y$(STAGING_DIR)/usr/include
-I$(MESA_GCCINCLUDE)" \
        ) >> $(MESA_CONFIG_FILE)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
