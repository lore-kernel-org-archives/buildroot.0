From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 1 Jun 2017 13:44:46 -0400
Subject: [Buildroot] [Bug 9926] New: systemd-resolved.service: Failed at
 step NAMESPACE (systemd 233)
In-Reply-To: <bug-9926-163@https.bugs.busybox.net/>
References: <bug-9926-163@https.bugs.busybox.net/>
Message-ID: <CANPyyuN1hfO10fu7PtEjhTzX_CC2tevbbeQd=-H_i5zi8mB=QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 1, 2017 at 11:35 AM, <bugzilla@busybox.net> wrote:

> https://bugs.busybox.net/show_bug.cgi?id=9926
>
>             Bug ID: 9926
>            Summary: systemd-resolved.service: Failed at step NAMESPACE
>                     (systemd 233)
>            Product: buildroot
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P5
>          Component: Other
>           Assignee: unassigned at buildroot.uclibc.org
>           Reporter: posted at heine.so
>                 CC: buildroot at uclibc.org
>   Target Milestone: ---
>
> Hi,
>
> I have a system based on systemd and bash (no busybox).
>
> My systemd package selection is attached under [2].
> With buildroot 2017.02.2 everything was working fine.
>
> I updated my build process to use buildroot 2017.05 which bumps systemd
> from
> 232 to 233.
> Since this these units fail on boot:
>
> systemd-hostnamed.service
>
> systemd-resolved.service
> systemd-timesyncd.service
>
> The Error Message is always the same:
>
> systemd-resolved.service: Failed at step NAMESPACE spawning
> /lib/systemd/systemd-resolved: No such file or directory
> systemd-resolved.service: Main process exited, code=exited,
> status=226/NAMESPACE
>
> The Problem was mentioned before on the ML in 2014 [0]. I don't know how
> it was
> fixed in the end.
>
> When I remove the /var/tmp symlink and create a directory instead it works.
> Another workaround is setting PrivateTmp=no in the service file.
> (These approaches basically follow the instructions at [1])
>
> Since I had no problem with a symlinked /var/tmp in buildroot 2017.02.2 it
> seems like something has changed in systemd 233.
>
> (I tried disabling systemd-tmpfiles but it changed nothing)
>
> Any ideas?
>

I might be way off base because I'm trying to remember a similar problem
from years ago, but I think I was missing a kernel option. Maybe cgroup
namespace support?



>
> Regards,
> Michael
>
> [0] http://lists.busybox.net/pipermail/buildroot/2014-August/104055.html
> [1] https://help.directadmin.com/item.php?id=614
> [2]:
> BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS=y
> BR2_PACKAGE_SYSTEMD=y
> # BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY is not set
> # BR2_PACKAGE_SYSTEMD_BACKLIGHT is not set
> # BR2_PACKAGE_SYSTEMD_BINFMT is not set
> # BR2_PACKAGE_SYSTEMD_COREDUMP is not set
> # BR2_PACKAGE_SYSTEMD_FIRSTBOOT is not set
> # BR2_PACKAGE_SYSTEMD_HIBERNATE is not set
> BR2_PACKAGE_SYSTEMD_HOSTNAMED=y
> BR2_PACKAGE_SYSTEMD_HWDB=y
> # BR2_PACKAGE_SYSTEMD_IMPORTD is not set
> # BR2_PACKAGE_SYSTEMD_LOCALED is not set
> # BR2_PACKAGE_SYSTEMD_LOGIND is not set
> # BR2_PACKAGE_SYSTEMD_MACHINED is not set
> BR2_PACKAGE_SYSTEMD_MYHOSTNAME=y
> BR2_PACKAGE_SYSTEMD_NETWORKD=y
> # BR2_PACKAGE_SYSTEMD_POLKIT is not set
> # BR2_PACKAGE_SYSTEMD_QUOTACHECK is not set
> # BR2_PACKAGE_SYSTEMD_RANDOMSEED is not set
> BR2_PACKAGE_SYSTEMD_RESOLVED=y
> # BR2_PACKAGE_SYSTEMD_RFKILL is not set
> # BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT is not set
> # BR2_PACKAGE_SYSTEMD_SYSUSERS is not set
> BR2_PACKAGE_SYSTEMD_TIMEDATED=y
> BR2_PACKAGE_SYSTEMD_TIMESYNCD=y
> BR2_PACKAGE_SYSTEMD_TMPFILES=y
> BR2_PACKAGE_SYSTEMD_VCONSOLE=y
> # BR2_PACKAGE_SYSTEMD_BOOTCHART is not set
>
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170601/d008acce/attachment.html>
