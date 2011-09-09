From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Sep 2011 23:14:30 +0000 (UTC)
Subject: [Buildroot] [Bug 4165] New: lrzsz-fix-symlink-at-rebuild.patch
Message-ID: <bug-4165-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4165

           Summary: lrzsz-fix-symlink-at-rebuild.patch
           Product: buildroot
           Version: 2010.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hector.oron at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

  When rebuilding buildroot, `ln' fails to rebuild because symlinks are already
in place. The following patch attempts to fix this issue:

Index: buildroot-2010.11/package/lrzsz/lrzsz.mk
===================================================================
--- buildroot-2010.11.orig/package/lrzsz/lrzsz.mk       2011-09-09
21:12:53.780126913 +0100
+++ buildroot-2010.11/package/lrzsz/lrzsz.mk    2011-09-09 21:14:37.908127216
+0100
@@ -38,8 +38,8 @@
 define LRZSZ_INSTALL_TARGET_CMDS
        cp $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
        cp $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
-       ln -s rz $(TARGET_DIR)/usr/bin/lrz
-       ln -s sz $(TARGET_DIR)/usr/bin/lsz
+       test -h $(TARGET_DIR)/usr/bin/lrz || ln -s rz $(TARGET_DIR)/usr/bin/lrz
+       test -h $(TARGET_DIR)/usr/bin/lsz || ln -s sz $(TARGET_DIR)/usr/bin/lsz
 endef

 define LRZSZ_CLEAN_CMDS

Kind regards,
  -- Hector Oron

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
