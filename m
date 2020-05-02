From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 02 May 2020 20:02:23 +0000
Subject: [Buildroot] [Bug 12841] New: util-linux/sfdisk 2.35.1 fails on
 sector-size header
Message-ID: <bug-12841-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12841

            Bug ID: 12841
           Summary: util-linux/sfdisk 2.35.1 fails on sector-size header
           Product: buildroot
           Version: 2020.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sebaroth at gmx.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

using sfdisk to print out and re-deploy the partition layout fails in version
2.35 and 2.35.1:

# sfdisk -v
sfdisk from util-linux 2.35.1
# sfdisk --dump /dev/sda > sda.partitions
# sfdisk /dev/sda < sda.partitions
...
>>> Script header accepted.
>>> line 5: unsupported command
...

Some more details can be found in this bugreport:
https://gitlab.alpinelinux.org/alpine/aports/issues/11200 (I know Alpine is
unrelated but it's got all the details in there)

Seems like this is fixed upstream already:
https://github.com/karelzak/util-linux/commit/d8c68b52cc939a16f04ec976648a37f5f5de718c

I am wondering if buildroot wants to add a patch to fix this while waiting for
the next util-linux version to be released. Suggested fix:

--- a/libfdisk/src/script.c
+++ b/libfdisk/src/script.c
@@ -837,6 +837,7 @@
                   || strcmp(name, "grain") == 0
                   || strcmp(name, "first-lba") == 0
                   || strcmp(name, "last-lba") == 0
+                  || strcmp(name, "sector-size") == 0
                   || strcmp(name, "table-length") == 0) {
                ;                                       /* whatever is possible
*/
        } else


Thanks in advance!

Sebastian

-- 
You are receiving this mail because:
You are on the CC list for the bug.
