From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 May 2012 08:45:02 +0000 (UTC)
Subject: [Buildroot] [Bug 5198] New: Line graphics output is broken in GNU
	Screen
Message-ID: <bug-5198-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5198

           Summary: Line graphics output is broken in GNU Screen
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


Line graphics looks garbled when output over a Screen terminal.

For example:
$ echo -e "Line: \033(0qqqqqqqq\033(B Normal: qqqqqqqq"

Results in output:
Line: qqqqqqqq Normal: qqqqqqqqq

When it should result in a horizontal line after "Line:". (Screen terminal type
is "screen" and underlying terminal type can be for example "vt102" or
"xterm").

The problem is due to screen being compiled without TERMINFO defined, meaning
that it uses termcap control codes, while ncurses is built with terminfo
support only (without termcap backwards compatibility support).

The root of the problem is the termcap/terminfo detection at line 666 in
configure.in. The detection uses AC_TRY_RUN which always fails when
cross-compilation is used, and TERMINFO is therefore never defined.

An easy fix could be to force terminfo support in the Buildroot screen
makefile:
--- screen.mk    2012-02-29 23:19:47.000000000 +0100
+++ screen-fixed.mk    2012-05-07 10:42:50.938185870 +0200
@@ -10 +10 @@
-SCREEN_CONF_ENV = CFLAGS=-DSYSV=1
+SCREEN_CONF_ENV = CFLAGS="-DSYSV=1 -DTERMINFO"

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
