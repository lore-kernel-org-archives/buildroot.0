From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 19 Sep 2009 15:40:30 +0000 (UTC)
Subject: [Buildroot] [Bug 619] New: netkittelnet requires netkitbase to
 install, but there's no dependency
Message-ID: <bug-619-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=619

           Summary: netkittelnet requires netkitbase to install, but there's
                    no dependency
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sethml at ofb.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I just ran into another netkittelnet issue:

/home/build/toolchain-2009-09-18/usr/bin/arm-linux-uclibcgnueabi-gcc  telnetd.o
state.o termstat.o slc.o sys_term.o utility.o global.o setproctitle.o -lutil
-lutil -o telnetd
make[2]: Leaving directory
`/home/build/buildroot-2009.08-2009.09.18/build_arm/netkit-telnet-0.17/telnetd'
make[1]: Leaving directory
`/home/build/buildroot-2009.08-2009.09.18/build_arm/netkit-telnet-0.17'
/home/build/toolchain-2009-09-18/usr/bin/arm-linux-uclibcgnueabi-strip
--remove-section=.comment --remove-section=.note
/home/build/buildroot-2009.08-2009.09.18/build_arm/netkit-telnet-0.17/telnetd/telnetd
# Only install a few selected items...
mkdir -p
/home/build/buildroot-2009.08-2009.09.18/project_build_arm/uclibc/root/usr/sbin
rm -f
/home/build/buildroot-2009.08-2009.09.18/project_build_arm/uclibc/root/usr/sbin/telnetd
cp
/home/build/buildroot-2009.08-2009.09.18/build_arm/netkit-telnet-0.17/telnetd/telnetd
/home/build/buildroot-2009.08-2009.09.18/project_build_arm/uclibc/root/usr/sbin/telnetd
# Enable telnet in inetd
/home/build/buildroot-2009.08-2009.09.18/toolchain_build_arm/bin/sed -i -e
"s~^#telnet.*~telnet\tstream\ttcp\tnowait\troot\t/usr/sbin/telnetd\t/usr/sbin/telnetd~;"
/home/build/buildroot-2009.08-2009.09.18/project_build_arm/uclibc/root/etc/inetd.conf
/home/build/buildroot-2009.08-2009.09.18/toolchain_build_arm/bin/sed: can't
read
/home/build/buildroot-2009.08-2009.09.18/project_build_arm/uclibc/root/etc/inetd.conf:
No such file or directory
make: ***
[/home/build/buildroot-2009.08-2009.09.18/project_build_arm/uclibc/root/usr/sbin/telnetd]
Error 2


It appears that netkittelnet assumes that inetd was installed by netkitbase,
but it's Config.in does not specify such a dependency:

config BR2_PACKAGE_NETKITTELNET
        bool "netkittelnet"
        help
          Standard Linux telnet client and server.

          ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/


If the telnetd in busybox is equally good, perhaps netkittelnet should just be
removed in favor of including the busybox options in the main menus?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
