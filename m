From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Dec 2010 09:28:03 +0000 (UTC)
Subject: [Buildroot] [Bug 2929] New: genext2fs: couldn't allocate a block
	(no free space)
Message-ID: <bug-2929-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2929

           Summary: genext2fs: couldn't allocate a block (no free space)
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: andyg1001 at hotmail.co.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


fs/ext2/genext2fs.sh is incorrectly calculating the size required to create an
ext2 image file, and it seems to happen when the size of the image exceeds
500Mb (but I haven't done precise testing to determine this).

This is the command genext2fs.sh is using:

genext2fs -d /home/test/buildroot-2010.11/target -U
/home/test/buildroot-2010.11/images/rootfs.ext2 -b 525096 -N 5242

du on the target directory returns 508712
find | wc -l in the target directory returns 4842

Modifying the call to genext2fs with -b 529712 (i.e. 508712+21000) makes an
image without errors and e2fsck rootfs.ext2 tells me "4440/5720 files,
529506/529712 blocks", so it should be possible to create the image with 529506
blocks, but 21000 seems a good enough "guess".

Does this information help?  If you need further information or testing, let me
know.

Thanks
Andy

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
