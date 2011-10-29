From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 29 Oct 2011 15:30:00 +0000 (UTC)
Subject: [Buildroot] [Bug 4399] New: Unable to use Ubuntu 11.10 arm cross
	compiler
Message-ID: <bug-4399-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4399

           Summary: Unable to use Ubuntu 11.10 arm cross compiler
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fenixk19 at mail.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Attempt to use ubuntu arm cross-compiler (package gcc-4.6-arm-linux-gnueabi) as
an external toolchain fails with the following message:

Checking external toolchain settings
Incorrect selection of the C library
make: ***
[/home/fenixk19/Development/samsung/OS/buildroot/output/stamps/ext-toolchain-checked]
?????? 255

Thats because there is a string in ext-tool.mk:
SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC)
-print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; 

But "arm-linux-gnueabi-gcc -print-file-name=libc.a" returns
"/usr/lib/gcc/arm-linux-gnueabi/4.6.1/../../../../arm-linux-gnueabi/lib/../lib/libc.a"

So sed works with wrong pattern here. This should be 's:lib/libc\.a::;' for
Ubuntu.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
