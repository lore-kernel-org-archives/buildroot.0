From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Sep 2016 18:56:31 +0000
Subject: [Buildroot] [Bug 9251] New: Shared C++ libraries for Microblaze
 results in Segmentation Fault
Message-ID: <bug-9251-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9251

            Bug ID: 9251
           Summary: Shared C++ libraries for Microblaze results in
                    Segmentation Fault
           Product: buildroot
           Version: 2016.08
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: scotttimothye at johndeere.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

It appears that enabling C++ and shared libraries does not work for Microblaze
targets.  When a simple Hello World C++ application is executed, it results in
a Segmentation Fault.  This occurs before any code in the app is executed
(presumably the fault is occurring in the libstdc++ startup code.)

Host environment: Linux Mint 15, 32-bit x86 platform.  wbx has also replicated
it on an x86_64 system with similar results.

Steps to reproduce using buildroot git hash
ed5604ed9e378c3f8814d7f92ec66fd855b8245c:

1) make qemu_microblazeel_mmu_defconfig
2) make menuconfig
- Toolchain: enable C++ support
3) make
4) cat > hello.cpp
int main(void){}
5) output/host/usr/bin/microblazeel-linux-g++ hello.cpp -o
output/target/root/hello
6) make
7) Running qemu 2.5.1.1:
qemu-system-microblazeel -M petalogix-s3adsp1800 -serial stdio -kernel
output/images/linux.bin
8) Let the system boot.  Login w/password "root"
9) ./hello
-> Segmentation Fault.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
