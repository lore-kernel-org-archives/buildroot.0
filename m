From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jun 2017 22:06:39 +0000
Subject: [Buildroot] [Bug 9996] New: lz4 option does not install lz4
	binaries in ramdisk
Message-ID: <bug-9996-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9996

            Bug ID: 9996
           Summary: lz4 option does not install lz4 binaries in ramdisk
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jamin.collins at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Selecting the lz4 option in the menuconfig does not result in the lz4 binaries
being installed into the ramdisk, only the libraries.  This appears to be due
to a problem in the package's makefile.  The following change corrects this:

$ git diff
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index d350d4c09..4a7129998 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -37,7 +37,7 @@ endef

 define LZ4_INSTALL_TARGET_CMDS
        $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE)
DESTDIR=$(TARGET_DIR) \
-               PREFIX=/usr install -C $(@D)/lib
+               PREFIX=/usr install -C $(@D)
 endef

 $(eval $(generic-package))

-- 
You are receiving this mail because:
You are on the CC list for the bug.
