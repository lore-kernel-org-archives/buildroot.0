From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 17 Jun 2013 18:14:35 +0000 (UTC)
Subject: [Buildroot] [Bug 6320] New: Fix kernel compile issue if
 BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION/BR2_LINUX_KERNEL_SOURCE_DIR and
 BR2_LINUX_KERNEL_INTREE_DTS_NAME are defined
Message-ID: <bug-6320-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6320

           Summary: Fix kernel compile issue if
                    BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION/BR2_LINUX_KERNEL_S
                    OURCE_DIR and BR2_LINUX_KERNEL_INTREE_DTS_NAME are
                    defined
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: aronrosenberg at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4946
  --> https://bugs.busybox.net/attachment.cgi?id=4946
Patch to fix issue

If you use BR2_LINUX_KERNEL_SOURCE_DIR and/or
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION along with BR2_LINUX_KERNEL_INTREE_DTS_NAME
the kernel will fail to build.

1. BR2_LINUX_KERNEL_SOURCE_DIR is not properly added when LINUX_BUILD_DTB is
defined so the make command fails.

2. BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION and BR2_LINUX_KERNEL_SOURCE_DIR are
quoted strings and the "wildcard" call can't handle if a double-quote is
contained within it (which happens if BR2_LINUX_KERNEL_INTREE_DTS_NAME or
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION are defined). So if you are using a kernel
newer than 3.8, it will fail the new test and look for the dtb without the dts/
sub-directory.

linux/linux.mk:
        $(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
        $(addprefix
$(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
        $(BINARIES_DIR)/

The attached patch fixes both issues.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
