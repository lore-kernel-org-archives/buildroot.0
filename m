From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Apr 2012 07:55:28 +0000 (UTC)
Subject: [Buildroot] [Bug 5018] New: dialog broken: exits with assert in
	uClibc
Message-ID: <bug-5018-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5018

           Summary: dialog broken: exits with assert in uClibc
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: zkdigisec at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


dialog can easily be made do abort with an assert, leaving the terminal in an
undefined state.

For example:
1. Start dialog: "dialog --yesno test 0 0"
2. Hit the right arrow key

Results in:
dialog: libc/misc/ctype/ctype.c: 320: toupper: Assertion '...' failed. Aborted

The reason is that dialog calls the uClibc function toupper() with a character
code > 255, resulting in an assert and fatal exit.

This could be seen as a problem in dialog.

But it could also be fixed in buildroot by changing the default uClibc
configuration in uClibc-0.9.33.config:

-UCLIBC_HAS_CTYPE_ENFORCED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
