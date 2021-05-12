From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 May 2021 08:41:59 +0000
Subject: [Buildroot] [Bug 13801] New: toolchainfile.cmake hardcodes
 CMAKE_BUILD_TYPE
Message-ID: <bug-13801-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13801

            Bug ID: 13801
           Summary: toolchainfile.cmake hardcodes CMAKE_BUILD_TYPE
           Product: buildroot
           Version: 2021.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christian.morales.vega at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The toolchainfile.cmake file created by Buildroot says things like "# This
toolchain file can be used both inside and outside Buildroot.". But it's not
really friendly to outside Buildroot users since it hardcodes CMAKE_BUILD_TYPE.

cmake -B build -DCMAKE_BUILD_TYPE=MinSizeRel
-DCMAKE_TOOLCHAIN_FILE=toolchainfile.cmake should use MinSizeRel, not Debug or
Release. Maybe I want to debug my software and want to build it with Debug
CMAKE_BUILD_TYPE even if the rest of Buildroot has been built with Release.


I'm not even sure how much sense it makes to make it Debug or Release based on
BR2_ENABLE_DEBUG
(https://git.busybox.net/buildroot/tree/package/pkg-cmake.mk?id=8036c23d5964cf924d8857cf1a8f711404458950#n269).
BR2_ENABLE_DEBUG is described as "Build packages with debugging symbols
enabled", i.e. it's only effect is supposed to be to add "-g". But by using the
Debug CMAKE_BUILD_TYPE God knows what a specific package will do: it may enable
extra logging, use a way slower algorithm to do some task...

In any case I would argue
https://git.busybox.net/buildroot/tree/package/pkg-cmake.mk?id=8036c23d5964cf924d8857cf1a8f711404458950#n94
is a better place to set a __default__ CMAKE_BUILD_TYPE. Outside Buildroot user
should not be seeing it.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
