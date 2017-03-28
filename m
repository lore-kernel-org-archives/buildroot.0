From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Mar 2017 20:43:17 +0000
Subject: [Buildroot] [Bug 9771] toolchain-external misses lib directory when
 copying sysroot
In-Reply-To: <bug-9771-163@https.bugs.busybox.net/>
References: <bug-9771-163@https.bugs.busybox.net/>
Message-ID: <bug-9771-163-vQGqVIWK2R@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
OK, so the issue is that some libraries are in <sysroot>/lib64 (C library) and
some others are in <sysroot>/lib (gcc runtime), which is not something
Buildroot handles I believe.

Buildroot does a:

$ ./bin/x86_64-unknown-linux-gnu-gcc -print-file-name=libc.a
/home/thomas/dl/x86_64-unknown-linux-gnu/bin/../x86_64-unknown-linux-gnu/sysroot/usr/lib/../lib64/libc.a

And therefore decides that ARCH_LIB_DIR is "lib64", and therefore looks only in
<sysroot>/lib64 for libraries and not in <sysroot>/lib.

Is this a recent change in Crosstool-NG ? The old Crosstool-NG toolchain we
have at
http://autobuild.buildroot.net/toolchains/tarballs/x86_64-ctng_locales-linux-gnu.tar.xz
has everything in <sysroot>/lib, with <sysroot>/lib64 being a symbolic link to
<sysroot>/lib.

So, are we looking at a Buildroot bug, or a Crosstool-NG bug?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
