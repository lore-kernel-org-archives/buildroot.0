From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Dec 2015 19:32:29 +0000 (UTC)
Subject: [Buildroot] [Bug 8501] New: gunzip fails to uncompress files
Message-ID: <bug-8501-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8501

           Summary: gunzip fails to uncompress files
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rush0033 at hotmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 6231
  --> https://bugs.busybox.net/attachment.cgi?id=6231
Buildroot .config file

In buildroot-2015.11, the busybox gunzip applet fails to uncompress some files,
even those created with the busybox gzip applet.  There is no error information
printed to the screen, but the value of the exit code (e.g. echo $?) is 1.  The
issue appears to be related to the content of the files.

For example, these steps work correctly:
  dd if=/dev/urandom bs=512 count=10000 of=test_random
  gzip test_random
  gunzip test_random.gz

However, these steps fail to uncompress the file:
  dd if=/dev/zero bs=512 count=10000 of=test_zero
  gzip test_zero
  gunzip test_zero.gz

The test_zero.gz file produced by the busybox gzip applet can be uncompressed
by another computer running Linux.  So it appears to be a valid file.

This issue did not exist in 2015.11-rc1, but appears to have manifested in
2015.11-rc2 and is still present in the final release of 2015.11.

This issue occurs with a clean stock x86 build of buildroot.  The .config file
used is attached.  

Linux Kernel: 3.18.24 x86_64
Buildroot userland running as an x86 32-bit initrd image

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
