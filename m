From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 Nov 2013 23:35:34 +0000 (UTC)
Subject: [Buildroot] [Bug 6704] New: wpa_supplicant: fix wrong path to
 executable file in D-Bus
Message-ID: <bug-6704-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6704

           Summary: wpa_supplicant: fix wrong path to executable file in
                    D-Bus
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sasamy at yandex.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


By default prefix is set to /usr/local

wpa_supplicant-2.0/wpa_supplicant/Makefile

export LIBDIR ?= /usr/local/lib/
export BINDIR ?= /usr/local/sbin/

but should be /usr/lib and /usr/sbin, can be corrected by specifying
environment variables

define WPA_SUPPLICANT_BUILD_CMDS
        $(TARGET_MAKE_ENV) CFLAGS="$(WPA_SUPPLICANT_CFLAGS)" \
                LDFLAGS="$(TARGET_LDFLAGS)" LIBDIR=/usr/lib/ BINDIR=/usr/sbin/
\
                $(MAKE) CC="$(TARGET_CC)" -C $(@D)/$(WPA_SUPPLICANT_SUBDIR)
endef

These variables are used for generating service files for ?-Bus and Systemd

[D-BUS Service]
Name=fi.w1.wpa_supplicant1
Exec=@BINDIR@/wpa_supplicant -u
User=root
SystemdService=wpa_supplicant.service

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
