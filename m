From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 16:40:10 +0000
Subject: [Buildroot] [Bug 12911] New: usb_modeswitch installation race
 condition
Message-ID: <bug-12911-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12911

            Bug ID: 12911
           Summary: usb_modeswitch installation race condition
           Product: buildroot
           Version: 2020.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jharjuma at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

In usb_modeswitch Makefile dispatcher-script, dispatcher-dynlink and
dispatcher-statlink are .PHONY targets. The result is that sources are compiled
also when install targets are called. USB_MODESWITCH_INSTALL_TARGET_CMDS calls
$(MAKE) which is a call to parallel make eg. make -j9. So the install phase can
install empty usb_modeswitch binary (happened once) if the compiler have just
cleared the binary and install command installs it before compiler writes the
binary. USB_MODESWITCH_INSTALL_TARGET_CMDS should call $(MAKE1).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
