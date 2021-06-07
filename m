From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Jun 2021 14:57:22 +0000
Subject: [Buildroot] [Bug 13836] New: package build failure when target
 install set to no on pkg-generic pkg types
Message-ID: <bug-13836-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13836

            Bug ID: 13836
           Summary: package build failure when target install set to no on
                    pkg-generic pkg types
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matthew.weber at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Here are the relevant assumptions/if's:

Buildroot 2021.02.x 
( based on git log review, should also apply to master )

Package A is pkg-generic
Package A is the last "pkg-generic" package built
Package A has PACKAGE_A_INSTALL_TARGET = NO

Then this error occurs:
/bin/sh: /home/tbuild/myboard/build/package_a/.files-list.after: No such file
or directory
make[1]: *** [/home/tbuild/myboard/build/package_a/.stamp_installed] Error 1
make: *** [_all] Error 2

because of assumptions with this target in rc-buildroot/package/pkg-generic.mk:
# Final installation step, completed when all installation steps
# (host, images, staging, target) have completed
$(BUILD_DIR)/%/.stamp_installed:
        @$(call pkg_size_after,$(TARGET_DIR))
        @$(call pkg_size_after,$(STAGING_DIR),-staging)
        @$(call pkg_size_after,$(HOST_DIR),-host)
        @$(call check_bin_arch)
        $(Q)touch $@

Ugly solution that worked:
simply remove the PACKAGE_A_INSTALL_TARGET = NO

Possible solution:

1) use a package type other than pkg-generic?
2) change the buildroot logic to subtract INSTALL_TARGET = NO packages from
this target build step.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
