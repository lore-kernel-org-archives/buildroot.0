From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Apr 2017 20:03:04 +0000
Subject: [Buildroot] [Bug 9846] New: musl libc not installed correctly in
	target folder
Message-ID: <bug-9846-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9846

            Bug ID: 9846
           Summary: musl libc not installed correctly in target folder
           Product: buildroot
           Version: 2017.02.1
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: stefan at nilsson.tk
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7051
  --> https://bugs.busybox.net/attachment.cgi?id=7051&action=edit
defconfigs for glibc/musl respectively

I am the deveveloper of a custom i386 based embedded Linux system, and I am
using buildroot to create the system images that goes into it.

I am currently running on the master branch of buildroot as of yesterday
2016-04-26 (6538125 package/pcsc-lite: bump version to 1.8.20) since I wanted
to try out the newly added s6 stuff:

However, I usually build my linux system using glibc and the busybox init
system. Yesterday I wanted to try out the musl libc to see how it performed
compared to glibc. But when changing to musl libc and after a "make clean"
"make", which goes through without issues, it appears as musl libc is not
installed correctly in the target folder.

When building with glibc as option, I get the following files in my
output/target/lib (among a bunch of others):

/lib/libc.so -> libc.so.6*
/lib/libc.so.6 -> libc-2.24.so*
/lib/libc-2.24.so*
/lib/ld-linux.so.2 -> ld-2.24.so*
/lib/ld-2.24.so*

When building with musl, I only get:

/lib/ld-musl-i386.so.1 -> /lib/libc.so
/lib/libc.so -> libc.so.6

So there is a symlink to libc.so.6, but file it points to does not exist which
makes my init fail to execute during boot.

When looking in my output/build/musl-1.1.16/lib, I guess I have the missing
files:

libc.a
libc.so*

But these seems to never be copied to the target folder correctly,...

If I manually copy the contents of output/build/musl-1.1.16/lib/ to /lib on my
target system (and remove the libc.so symlink), my init works as expected, and
I can boot it completely.

I have attached my buildroot defconfig for both configurations.

Best Regards
Stefan Nilsson

-- 
You are receiving this mail because:
You are on the CC list for the bug.
