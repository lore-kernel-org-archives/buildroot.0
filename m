From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 09 Dec 2015 02:22:24 +0000
Subject: [Buildroot] [Bug 8516] New: mkcubiecard.sh uses outdated sfdisk
	switch -D
Message-ID: <bug-8516-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8516

            Bug ID: 8516
           Summary: mkcubiecard.sh uses outdated sfdisk switch -D
           Product: buildroot
           Version: 2015.08
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tudor at tudorholton.com
                CC: buildroot at uclibc.org

The mkcubiecard.sh script contains the following lines:

# ~2048, 16MB, FAT, bootable
# ~rest of drive, Ext4
{
echo 32,512,0x0C,*
echo 544,,,-
} | sfdisk -D $DRIVE


There are two problems with this:
1) On newer versions of sfdisk, the -D switch has been removed.
2) Removing the -D switch from the command allows the script to be interpreted.
 However, the unit sizes are different.  In particular, "32,512,0x0c,*" results
in a partition starting at sector 32, of size 256K.  (Not 2048, size 16MB as
mentioned in the comments) so the latter part of this script fails due to the
partition not being large enough.

My 2c would be to use something like parted which has a similar scripting
language, but which allows us to specify units so that the numbers don't change
meaning on different versions or architectures.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
