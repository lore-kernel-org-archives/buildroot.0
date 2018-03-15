From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Mar 2018 08:23:06 +0000
Subject: [Buildroot] [Bug 10861] New: Package batman_adv Makefile is missing
 include header directory
Message-ID: <bug-10861-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10861

            Bug ID: 10861
              Host: ARM
             Build: X86_64
           Summary: Package batman_adv Makefile is missing include header
                    directory
           Product: buildroot
           Version: 2018.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: miltos.koutsokeras at iccs.gr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7511
  --> https://bugs.busybox.net/attachment.cgi?id=7511&action=edit
batman_adv package Makefile fix

Bug found in package/batman-adv/batman-adv.mk leading to compilation error due
to missing headers:

fatal error: uapi/linux/batman_adv.h: No such file or directory
 #include <uapi/linux/batman_adv.h>

There is an extra include directory (-I$(PWD)/include/) added in batman_adv
source Makefile in commit:

https://git.open-mesh.org/batman-adv.git/blobdiff/14adbd701dec0717606bff4f0c8c084827bf4735..2b20eb572f271edca0d0fd1abd5350876c315d28:/Makefile

but the extra directory is missing from the Buildroot
package/batman-adv/batman-adv.mk:

BATMAN_ADV_CFLAGS = \
        -I$(@D)/compat-include/ \
        -include $(@D)/compat.h \
        -DBATADV_SOURCE_VERSION=\"\\\"$(BATMAN_ADV_VERSION)\\\"\"

Patch attached fixes the issue and the build finishes properly.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
