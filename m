From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Sep 2012 14:59:38 +0000 (UTC)
Subject: [Buildroot] [Bug 5516] New: appended device tree blobs on uImage
	fails
Message-ID: <bug-5516-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5516

           Summary: appended device tree blobs on uImage fails
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: richard.genoud at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The version impacted is 2012.08 (it's not in the list)
the commit 978928e4acb0ee4e335eaf4bf8feca895f372418 adds the ability to append
device tree blobs.
This works great with zImage.
BUT, with uImage there's a problem:
in linux.mk, the line :
cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb >>
$(KERNEL_ARCH_PATH)/boot/zImage
is all right, but after that, the line :
$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) uImage
erases the zImage that has been just done.

that's because in the kernel, the uImage rule is :
$(obj)/uImage:  $(obj)/zImage FORCE
        @$(check_for_multiple_loadaddr)
        $(call if_changed,uimage)
        @echo '  Image $@ is ready'

=> so if we do a make uImage, zImage is overwritten.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
