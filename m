From: =?windows-1252?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 21 Nov 2012 01:42:43 +0200
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <50A940FA.7020402@petroprogram.com>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
 <509BA71B.6020009@petroprogram.com> <509BD78A.8050908@macrium.com>
 <509BDDDD.3040002@petroprogram.com> <50A1EE50.4010008@mind.be>
 <50A81599.3000002@petroprogram.com> <50A93EBF.6080304@mind.be>
 <50A940FA.7020402@petroprogram.com>
Message-ID: <50AC1573.4090404@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

18.11.2012 22:11, Stefan Fr?berg kirjoitti:
> 18.11.2012 22:02, Arnout Vandecappelle kirjoitti:
>> On 17/11/12 23:54, Stefan Fr?berg wrote:
>> [snip]
>>> But the real problem now is that grub refuses to load. It just shows
>>> Loading stage2 .... and hangs there.
>>>
>>> If I copy my old grub stuff  (namely, the stage2_eltorito file) from
>>> 2012.05 build to inside the boot/grub/ of the
>>> new buildroot generated livecd (of course, first mounted throught
>>> loopback and copied to some other dir for modifying)
>>> and then build the livecd from that manually, it will work and show
>>> grub menu normally.
>>>
>>> I did a quick *md5sum* and *ls* and there indeed is a difference with
>>> the git-version and 2012.05 version of
>>> stage2_eltorito file,  git-version of stage2_eltorito being very
>>> large (258 KB vs. working 103 KB)
>>>
>>  Is this on a x86_64 target? Then a difference is that we removed
>> -fPIC -DPIC from CFLAGS.  Can you try if that makes a difference?
>>
> No, just building i586 target inside 32-bit Fedora 16 host.
>
> Ok, Im now going to rebuild both 2012.05 and latest git again and
> see what happens.
>
> Regards
> Stefan
>
>>  Regards,
>>  Arnout
>

I have now investigated this matter three days and found out the following:

1 )
That size difference (258 KB vs. working 103 KB) was  because in
buildroot grub I had enabled every network NIC available.

But the following was shocking to me:
The working 103 KB stage2_eltorito was not from buildroot at all in the
first place but from Gentoo!
I vaguely remember copying it to buildroot system from my Gentoo setup
several months ago.
Because I found out that the livecd build process did not work.

But this also means that even 2012.05 buildroot grub did not work for me.

2 )

I built my own version of grub with my own uClibc-based distro and found
out that grub is very nit-pick about CFLAGS and LDFLAGS it is feed.
It doesn't like optimiziation very much.
So after unsetting both flags and applying four patches from Gentoo I
managed to run my very own made grub. Yay!! :-)

3 )

Naturally I then tried this CFLAGS and LDFLAGS unsetting in
boot/grub/grub.mk.
Also used only default buildroot configuration, with newest git.
The damn thing still didn't show grub menu! :-(

And now Im beginning to suspect that buildroot grub is very broken as it
is now and needs some serious patching.
The patches it uses (grub_0.97-35.diff.gz) are from old debian tree from
2008!!

I will now  grab the latest debian patches (grub_0.97-66.diff.gz), use
only -Os for CFLAGS and nothing for LDFLAGS and see how far it will take me
this time.

Regards
Stefan
