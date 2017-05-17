From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 May 2017 12:46:42 +0000
Subject: [Buildroot] [Bug 9881] New: systemd-resolved not setting
	resolv.conf link
Message-ID: <bug-9881-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9881

            Bug ID: 9881
           Summary: systemd-resolved not setting resolv.conf link
           Product: buildroot
           Version: 2017.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: posted at heine.so
                CC: buildroot at uclibc.org
  Target Milestone: ---

I have a configuration with Network-Manager and systemd-resolved but without
systemd-networkd.

This leads to a system with an invalid resolv.conf configuration.

The built system still has this configuration from skeleton:
/etc/resolv.conf -> ../tmp/resolv.conf

systemd is not touching /etc/resolv.conf since it exists (but points to
nothing.)


the systemd.mk defines this:

define SYSTEMD_INSTALL_RESOLVCONF_HOOK
        ln -sf ../run/systemd/resolve/resolv.conf \
                $(TARGET_DIR)/etc/resolv.conf
endef

But this is only used when systemd-networkd is selected. I guess this should
also be done when only BR2_PACKAGE_SYSTEMD_RESOLVED is selected.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
