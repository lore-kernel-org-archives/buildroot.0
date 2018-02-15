From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 15 Feb 2018 13:42:13 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BJan_Kundr=E1t=5D__=5BPATCH_1/3=5D_?=
 =?iso-8859-1?q?systemd=3A_Ensure_/run_and_/var/run_are_the_same_on_R/O_ro?=
 =?iso-8859-1?q?otfs?=
In-Reply-To: <87eflnyxjy.fsf@paral.in>
References: <87k1vfz2m4.fsf@paral.in> <87eflnyxjy.fsf@paral.in>
Message-ID: <4c98d294-42c6-45f7-b518-f5d7901ad0db@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ?tvrtek 15. ?nora 2018 0:13:37 CET, Christian Stewart wrote:
>> From: Jan Kundr?t <jan.kundrat@cesnet.cz>
>> I'm leaving that one to someone who is more familiar with systemd and
>> buildroot conventions. My box now boots again, so I'm happy :).
>> 
>> [1] https://bugs.freedesktop.org/show_bug.cgi?id=101628
>> 
>> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz> ...
>
> I applied this patch, thanks. Unfortunately, it seems the problem is
> still occurring. Maybe it's a different problem?
>
>
> [   16.650294] systemd[1]: System is tainted: var-run-bad

Systemd reports that your /var/run is "bad". From what you wrote later, 
that's indeed the root cause which should be fixed.

Now, my patch fixed it only for a read-only rootfs. I assumed that 
everything worked well on a regular, r/w rootfs.

Can you please:

- state whether you're using a read-only or read-write rootfs 
(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW config option),
- confirm that you completely nuked your build dir after applying this 
patch,
- check which packages actually provide your /var/run and /run, and how 
your setup looks like, i.e.:
  - grep ,./run build/packages-file-list.txt
  - grep ,./var build/packages-file-list.txt
  - grep dbus build/packages-file-list.txt | grep run
- how is your /etc/fstab?

> # ls /var/run/

These are not sufficient as they do not show the type of the individual 
items. `ls -al` should be better.

> If I link dbus like so:
>
> # ln -s /var/run/dbus/ /run/dbus
>
> It seems then that everything works fine.

Yeah, that's it. Based on how I read the code, though, this should already 
happen on a regular installation without a r/o rootfs...

Cheers,
Jan
