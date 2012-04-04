From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Apr 2012 09:26:37 +0000 (UTC)
Subject: [Buildroot] [Bug 5030] New: busybox built fails if we use an
 override src dir BUSYBOX_OVERRIDE_SRCDIR and that dir does not contain
 .config
Message-ID: <bug-5030-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5030

           Summary: busybox built fails if we use an override src dir
                    BUSYBOX_OVERRIDE_SRCDIR and that dir does not contain
                    .config
           Product: buildroot
           Version: 2012.02
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: korkakak at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


when one tries to make busybox this fails because the
BUSYBOX_POST_EXTRACT_HOOKS are not run (we rsync from another directory).

The solution to that I've came up with is to either change the
BUSYBOX_POST_EXTRACT_HOOKS to BUSYBOX_PRE_CONFIGURE_HOOKS or add another hook
BUSYBOX_PRE_CONFIGURE_HOOKS += BUSYBOX_COPY_CONFIG

(the worst case scenario with the two hooks will be to copy the same file
twice)

the proposed solution is the following:

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d18b6d0..17e8b7e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -138,7 +138,7 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
 endef

 # We do this here to avoid busting a modified .config in configure
-BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
+BUSYBOX_PRE_CONFIGURE_HOOKS += BUSYBOX_COPY_CONFIG

 define BUSYBOX_CONFIGURE_CMDS
        $(BUSYBOX_SET_LARGEFILE)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
