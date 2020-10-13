From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 13 Oct 2020 13:53:34 +0000
Subject: [Buildroot] [Bug 13271] New: systemd-resolved: /etc/resolv.conf
 link broken on per-package build
Message-ID: <bug-13271-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13271

            Bug ID: 13271
           Summary: systemd-resolved: /etc/resolv.conf link broken on
                    per-package build
           Product: buildroot
           Version: 2020.08.1
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

Issue:

systemd-resolved needs the /etc/resolv.conf entry like this:

/etc/resolv.conf -> ../run/systemd/resolve/stub-resolv.conf

When using per-package build this isn't the case anymore. It still has the
default value from the skeleton:

/etc/resolv.conf -> ../tmp/resolv.conf


Analysis:

this is the code currently creating the link:

ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
define SYSTEMD_INSTALL_RESOLVCONF_HOOK
        ln -sf ../run/systemd/resolve/resolv.conf \
                $(TARGET_DIR)/etc/resolv.conf
endef


As I learned on irc this doesn't work with per-package build as it is not
allowed to alter files from another package (even the skeleton). So this is why
it doesn't work.


Conclusion:

I'm not sure if this is properly fixable by the systemd package itself or if
this needs a removal from the skeleton with all its consequences.

Any Ideas welcome...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
