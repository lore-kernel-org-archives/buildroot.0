From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Jun 2020 22:05:07 +0000
Subject: [Buildroot] [Bug 13011] New: Incorrect selection of gcc version
Message-ID: <bug-13011-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13011

            Bug ID: 13011
           Summary: Incorrect selection of gcc version
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: vernon2gm at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi:

I use buildroot External toolchain
$ make menuconfig
Toolchain  --->
    External toolchain gcc version (9.x)  ---> 

gcc is ubuntu20.04 by `sudo apt install gcc` install, it's version is 9.3.0, so
gcc -dumpversion is 9

but toolchain/helpers.mk check_gcc_version function to display error
I fixed this bug, as follows:

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 44d0c83d1e..7c7819f9a6 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -184,7 +184,7 @@ check_gcc_version = \
                exit 0 ; \
        fi; \
        real_version=`$(1) -dumpversion` ; \
-       if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
+       if [[ ! "$${real_version}" =~ ^$${expected_version} ]] ; then \
                printf "Incorrect selection of gcc version: expected %s.x, got
%s\n" \
                        "$${expected_version}" "$${real_version}" ; \
                exit 1 ; \

-- 
You are receiving this mail because:
You are on the CC list for the bug.
