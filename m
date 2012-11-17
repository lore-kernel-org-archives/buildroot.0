From: =?windows-1252?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 18 Nov 2012 00:54:17 +0200
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <50A1EE50.4010008@mind.be>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
 <509BA71B.6020009@petroprogram.com> <509BD78A.8050908@macrium.com>
 <509BDDDD.3040002@petroprogram.com> <50A1EE50.4010008@mind.be>
Message-ID: <50A81599.3000002@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, has there been some changes to grub 0.97 (aka legacy version) or
the way grub is compiled
since buildroot 2012.05 ?

Today I copied my old, 2012.05 buildroot .config to latest git-version
and tried to build live cd the buildroot way.

Building went mostly smoothly with just few errors in using custom
busybox config (that i have always been using),
it's login applet and the linux-pam.   And dbus was complaining about
missing /var/lib/ directory in target).

These were not a big deal to fix.

But the real problem now is that grub refuses to load. It just shows
Loading stage2 .... and hangs there.

If I copy my old grub stuff  (namely, the stage2_eltorito file) from
2012.05 build to inside the boot/grub/ of the
new buildroot generated livecd (of course, first mounted throught
loopback and copied to some other dir for modifying)
and then build the livecd from that manually, it will work and show grub
menu normally.

I did a quick *md5sum* and *ls* and there indeed is a difference with
the git-version and 2012.05 version of
stage2_eltorito file,  git-version of stage2_eltorito being very large
(258 KB vs. working 103 KB)

Even tought I have not changed anything in my working 2012.05 buildroot
.config when I copied it
to newer git-version.
(same gcc version, same optimizations, same binutils etc...)

Regards
Stefan

13.11.2012 8:53, Arnout Vandecappelle kirjoitti:
> On 08/11/12 17:29, Stefan Fr?berg wrote:
>> If you ever want to use the maximum compression method supported by
>> modern kernels (XZ compression)
>> then change that initramfs generation command to this:
>>
>> find .  -not \( -path "./boot" -prune \) -print0 | cpio --null -ov
>> --format=newc
>>   | xz --check=crc32>  /livecd/initramfs.xz
>>
>> Without that --check=crc32 parameter you won't be able to boot
>> XZ-compressed initramfs.
>
>  It would be good to have this in buildroot.  Care to add a config option
> BR2_TARGET_ROOTFS_CPIO_XZ?  Using host-xz, of course, since not all
> systems
> have xz installed.
>
>
>  Regards,
>  Arnout

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121118/443c2576/attachment.html>
