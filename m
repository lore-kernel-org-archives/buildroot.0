From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Jun 2015 01:05:21 +0000 (UTC)
Subject: [Buildroot] [Bug 8156] New: pkg-kconfig infra broken for
 *-update-{config, defconfig}
Message-ID: <bug-8156-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8156

           Summary: pkg-kconfig infra broken for
                    *-update-{config,defconfig}
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The pkg-kconfig infrastructure seems to be broken in its implementation of the
*-update-{config,defconfig}, for example linux-update-config and
linux-update-defconfig.

Here is a scenario with the kernel that shows the problem:

 1/ Run "make menuconfig"

 2/ Use ARM, enable the Linux kernel, say version 4.0, and use omap2plus as the
defconfig.

 3/ Run "make linux-menuconfig", enable some random option.

 4/ Go back to "make menuconfig", and switch from using the omap2plus defconfig
to a custom config file, say "linux.config"

 5/ Now run "make linux-update-config"

The expected behavior is that Buildroot should copy
output/build/linux-4.0/.config to linux.config.

However, Buildroot tries to do the opposite: it tries to copy linux.config to
output/build/linux-4.0/.config:

thomas at skate:~/projets/buildroot (master)$ LANG=C make linux-update-config
/usr/bin/install -m 0644 linux.config
/home/thomas/projets/buildroot/output/build/linux-4.0/.config
/usr/bin/install: cannot stat 'linux.config': No such file or directory

This is probably a bug in the recent changes of the pkg-config infrastructure.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
