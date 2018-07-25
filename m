From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Jul 2018 15:24:32 +0000
Subject: [Buildroot] [Bug 11191] New: xattr and check-package issue
Message-ID: <bug-11191-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11191

            Bug ID: 11191
           Summary: xattr and check-package issue
           Product: buildroot
           Version: 2018.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

check-package warns about missing indent with xattr line in permissions of
packages, however adding indentation to those lines makes the check-package
script happy but then corresponding xattr entries are then silently ignored
when creating the image.

e.g., this entry will make check-package issue a warning :

...
define TEST_PERMISSIONS
        /usr/bin/test f 0755 user0 users - - - - -
|xattr cap_kill+eip
|xattr cap_sys_nice+eip
|xattr cap_sys_time+eip

...

package/test/test.mk:618: expected indent with tabs

However changing it to

define TEST_PERMISSIONS
        /usr/bin/test f 0755 user0 users - - - - -
\t|xattr cap_kill+eip
\t|xattr cap_sys_nice+eip
\t|xattr cap_sys_time+eip

...

Will make check-package happy but xattr attributes will not be taken into
account without any error message.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
