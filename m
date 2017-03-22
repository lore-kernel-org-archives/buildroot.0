From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Mar 2017 09:23:28 +0000
Subject: [Buildroot] [Bug 9771] New: toolchain-external misses lib directory
 when copying sysroot
Message-ID: <bug-9771-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9771

            Bug ID: 9771
           Summary: toolchain-external misses lib directory when copying
                    sysroot
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sir.ferdek+buildroot at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I have x86_64 cross-toolchain build using crosstool-ng framework, not too old
commit from master branch, circa half month old. I was unable to use it with
buildroot due to wrong toolchain installation performed by buildroot.

Packages' autoconf scripts complain about unusable compiler, due to missing
libgcc_s.so which is in x86_64-unknown-linux-gnu/sysroot/lib

The lib directory is not copied by buildroot during install phase.

This little fix below allowed me to build my system image, although I would
like to ask you if this is complete - I guess no. The reason I ask is that I
saw very complicated logic somewhere in pkg-toolchain-external.mk and I suspect
that this is the place where it should be fixed...

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 2f73ebb..cab92dd 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -88,7 +88,7 @@ copy_toolchain_sysroot = \
        ARCH_SUBDIR="$(strip $3)"; \
        ARCH_LIB_DIR="$(strip $4)" ; \
        SUPPORT_LIB_DIR="$(strip $5)" ; \
-       for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
+       for i in etc lib $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
                if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
                        continue ; \
                fi ; \

-- 
You are receiving this mail because:
You are on the CC list for the bug.
