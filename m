From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 May 2010 20:53:15 +0000 (UTC)
Subject: [Buildroot] [Bug 1771] New: Fakeroot and the
 target/generic/device_table.txt create bad device nodes.
Message-ID: <bug-1771-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1771

           Summary: Fakeroot and the target/generic/device_table.txt
                    create bad device nodes.
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: akennedy at drs-tem.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


BUILD=Slackware 12.0 (slightly modified)
TARGET=ARM
Filesystem=Jffs2.

brw-r----- 1 root root  3,  1 2010-04-27 09:55 hda
brw-r----- 1 root root  3,  1 2010-04-27 09:55 hda1
brw-r----- 1 root root  3,  2 2010-04-27 09:55 hda2
<SNIP>
brw-r----- 1 root root  3, 65 2010-04-27 09:55 hdb
brw-r----- 1 root root  3, 65 2010-04-27 09:55 hdb1
brw-r----- 1 root root  3, 66 2010-04-27 09:55 hdb2
<SNIP>
brw-r----- 1 root root 22,  0 2010-04-27 09:55 hdc
brw-r----- 1 root root 22,  0 2010-05-13 15:23 hdc0
brw-r----- 1 root root 22,  1 2010-04-27 09:55 hdc1
brw-r----- 1 root root 22,  2 2010-04-27 09:55 hdc2
<SNIP>

I attempted something "new" with the above.  For /dev/hdc* I made the following
change in target/generic/device_table.txt to see what whould happen:

/dev/hda        b       640     0       0       3       0       0       0      
-
/dev/hda        b       640     0       0       3       1       1       1      
15
/dev/hdb        b       640     0       0       3       64      0       0      
-
/dev/hdb        b       640     0       0       3       65      1       1      
15
#/dev/hdc       b       640     0       0       22      0       0       0      
-
#/dev/hdc       b       640     0       0       22      1       1       1      
15
/dev/hdc        b       640     0       0       22      0       0       1      
15

As you see from the above, the devices get made /dev/hdc (correctly), but then
/dev/hdc0 (what's that!?!) however, hda and hdb are completely wrong.

For me the fix is simple, I make the correction to the file as I did for hdc
for any others that I need like that, then I run a post script that deletes any
occurance of hd.0.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
