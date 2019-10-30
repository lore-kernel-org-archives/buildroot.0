From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2019 13:02:49 +0000
Subject: [Buildroot] [Bug 12301] New: systemd-journal-gatewayd: config
 options broken
Message-ID: <bug-12301-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12301

            Bug ID: 12301
           Summary: systemd-journal-gatewayd: config options broken
           Product: buildroot
           Version: 2019.08
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

Hi,

I updated my systemd system build to BR 2019.08 and noticed that
systemd-journal-gatewayd was missing in the resulting image.


Commit 2dbce34b3a2c8fc1a854395f6c33df658371eae4 added a config option
BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE to enable the systemd-journal-remote
service.

If it is selected the -Dremote=true flag gets explicitly set. If not it is
explicitly set to false.

But as defined in the systemd config (see [0]) -Dremote=true is used to enable
systemd-journal-remote as well as systemd-journal-gatewayd. There is no switch
to only build one of them.

Further the default value of the -Dremote flag is true (see [1]).

So previous to this commit both binaries are already built and installed when
BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY is set. I verfied this in my built
2019.05.1 image. Both binaries are there.


As with this commit, when BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=Y and
BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE=N is set -Dremote=false is explicitly set
and systemd builds neither of the binaries.



So I would suggest to revert this commit as it breaks configs and adds no
functionality. 
Also I would suggest to extend the description of
BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY to include a mention of
"systemd-journal-remote".


Regards,
Michael

[0] https://github.com/systemd/systemd/blob/master/meson.build#L2207
[1] https://github.com/systemd/systemd/blob/master/meson.build#L1253

-- 
You are receiving this mail because:
You are on the CC list for the bug.
