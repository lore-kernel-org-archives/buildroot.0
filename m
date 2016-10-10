From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Oct 2016 15:34:19 +0000
Subject: [Buildroot] [Bug 9341] New: avahi-utils does not compile with
	uClibc + libglib2
Message-ID: <bug-9341-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9341

            Bug ID: 9341
           Summary: avahi-utils does not compile with uClibc + libglib2
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: johan.oudinet at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6746
  --> https://bugs.busybox.net/attachment.cgi?id=6746&action=edit
rpi2_avahi_dbus_libglib2_defconfig

When compiling the avahi package in both buildroot 2016.08 and master (from
Today), I get the following error message:
------8<------8<------8<------8<------8<------8<------
Making all in avahi-utils
  CC       avahi_browse-avahi-browse.o
  CC       avahi_browse-sigint.o
  CC       avahi_resolve-avahi-resolve.o
  CC       avahi_resolve-sigint.o
  CC       avahi_publish-avahi-publish.o
  CC       avahi_set_host_name-avahi-set-host-name.o
  CC       avahi_publish-sigint.o
  CC       avahi_set_host_name-sigint.o
  CCLD     avahi-set-host-name
  CCLD     avahi-resolve
  CCLD     avahi-publish
  CCLD     avahi-browse
/home/johan/Documents/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabihf/5.4.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld:
avahi_set_host_name-avahi-set-host-name.o: undefined reference to symbol
'libintl_dgettext'
/home/johan/Documents/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libintl.so.8:
error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status
Makefile:632: recipe for target 'avahi-set-host-name' failed
------8<------8<------8<------8<------8<------8<------

To reproduce this bug, start from the defconfig for RPI 2
(raspberrypi2_defconfig), then select dbus, libglib2, avahi, and avahi-daemon
(or use the attached defconfig).

Note, a workaround is to also select BR2_TOOLCHAIN_BUILDROOT_LOCALE. So,
avahi.mk adds libintl since BR2_NEEDS_GETTEXT_IF_LOCALE is defined.

I don't know how to solve this issue properly.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
