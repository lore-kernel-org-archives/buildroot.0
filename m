From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Oct 2018 15:37:39 +0000
Subject: [Buildroot] [Bug 11411] New: check-uniq-files issue
Message-ID: <bug-11411-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11411

            Bug ID: 11411
           Summary: check-uniq-files issue
           Product: buildroot
           Version: 2018.02.4
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

The check-uniq-files script is returning lots of false positive when successive
builds are launched.

Those detected in the target directory seems to be coming from automatic
stripping that is done in the final step in the target directory:
STRIP_FIND_CMD = find $(TARGET_DIR)
ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS)))
STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call
qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
endif
STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)

When run this commmand modify the modification date of the stripped files, so
on next build, the check-uniq-files script will detect all modified files as
being touched by all packages e.g.:

Warning: target file "./usr/lib/libdevmapper-event-lvm2thin.so" is touched by
more than one package: [u'lvm2', u'popt', u'util-linux', u'cryptsetup',
u'expat', u'dbus', u'e2fsprogs', u'kmod', u'eudev', u'libpng', u'freetype',
u'libopenssl', u'ffmpeg', u'giflib', u'icu', u'libffi', u'pcre', u'libglib2',
u'harfbuzz', u'hdparm', u'ifupdown-scripts', u'initscripts', u'iperf', u'iw',
u'jpeg-turbo', u'jpeg', u'json-glib', u'libcap', u'openssl', u'libcurl',
u'libevent', u'libexif', u'libnspr', u'sqlite', u'libnss', u'liburiparser',
u'libxml2', u'monit', u'openssh', u'udev', u'pciutils', u'strace', u'sysvinit',
u'wireless-regdb', u'wpa_supplicant', u'netgem_bluez5_utils', u'brcm-patchram',
u'netgem-azure-c-shared-utility', u'netgem-azure-uamqp-c',
u'netgem-azure-umqtt-c', u'netgem-azure-iot-sdk-c', u'netgem_boot-bin',
u'netgem_boot', u'netgem_erpc', u'cobalt', u'netgem-bootloader',
u'netgem_nexus_standby', u'netgem_secure_dma_code',
u'realtek_8822BE_BT_driver', u'busybox']

Maybe the -p strip option could be used to avoid this issue ?

Regards.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
