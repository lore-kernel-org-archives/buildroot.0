From: Karoly Pados <kp@tec4data.at>
Date: Thu, 16 Mar 2017 07:52:05 +0000
Subject: [Buildroot] [DEPEND] Dependency failed for Serial Getty on
 ttyS0.
In-Reply-To: <b99454a8-c887-7293-7a44-cdcf118e397a@mind.be>
References: <b99454a8-c887-7293-7a44-cdcf118e397a@mind.be>
 <e977bf96-b7ac-3f5e-5a12-4a87f5a9d94e@mind.be>
 <c3cba7c6739845276c207fcf05e970b8@webmail.pados.hu>
 <01f09a9ec9040eecf2423e0349aa0cdc@webmail.pados.hu>
Message-ID: <d5f67bf6b3a97999dafe47f0acf82a2a@webmail.pados.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I've tried a build with a simple config with just systemd and agetty - but I
> didn't manage to boot it in qemu (unrelated reasons). However, in the resulting
> image I see no service request for ttyS0, only for tty1 (i.e. the one you set in
> the Buildroot config). So I don't understand how/why systemd tries to start a
> getty on ttyS0, and why it *doesn't* try to start one on tty1. Can you check in
> your rootfs in /etc/systemd/system where the ttyS0 could come from?
> 

The discrepancy between tty1 and ttyS0 is because I tried both, and you got the .config for the try with the tty1. I have tty1 on the VGA output and ttyS0 on UART, so I tried each variant, before posting to this list without success.

To make sure everything is clean though, I did a complete rebuild yesterday:
- git pulled latest version of 2017.02.x branch
- rm -rf output (probably unnecesarry)
- make clean all

After this things work now, so it seems it was a complete rebuild that was a needed.

Thank you,
Karoly

> [Please don't top-post, but reply inline like I do now.]
> 
> On 13-03-17 21:22, Karoly Pados wrote:
> 
>> Hello,
>> 
>> The config I attached was without agetty, because I already tried enabling it without success (with
>> the same reasoning: I thought to myself "maybe buildroot has no getty if I don't enable agetty").
>> Unfortunately that didn't solve te problem, so my conclusion was missing agetty was the not the
>> cause of the problem, and I went back to my original config.
>> 
>> Based on what you say I do need agetty, but I am sure I also need something else, because even with
>> agetty, I got the same problem. Could you please advise what else could be missing?
> 
> I've tried a build with a simple config with just systemd and agetty - but I
> didn't manage to boot it in qemu (unrelated reasons). However, in the resulting
> image I see no service request for ttyS0, only for tty1 (i.e. the one you set in
> the Buildroot config). So I don't understand how/why systemd tries to start a
> getty on ttyS0, and why it *doesn't* try to start one on tty1. Can you check in
> your rootfs in /etc/systemd/system where the ttyS0 could come from?
> 
> Regards,
> Arnout
> 
>> Any help appreciated,
>> 
>> Greetings,
>> K?roly Pados
>> 
>> This email and any associated attachment are confidential.
>> Unless you belong to the specified recipients, immediately notify the sender.
>> The content may not be copied and given to third parties.
>> ___________________________________________________________________
>> 
>> March 13, 2017 6:28 PM, "Arnout Vandecappelle" <arnout@mind.be> wrote:
>> 
>>> On 13-03-17 12:13, Karoly Pados wrote:
>> 
>> Hello!
>> 
>> I built a buildroot image, using systemd as the init system. The kernel is built using buildroot
>> too, using a custom kernel-.config that is known to work on same hardware when used outside of
>> buildroot.
>> 
>> Most of the booting process succeeds, but towards the end systemd repeatedly tries to stop and
>> start getty, then after a minute or two outputs:
>> [DEPEND] Dependency failed for Serial Getty on ttyS0.
>> 
>> Booting then continues with UTMP, but no login prompt is shown. Not on UART and neither on VGA.
>> I've found out that others who got this same phenomenon had to enable CONFIG_FHANDLE for the
>> kernel, but for me it is already enabled.
>> 
>> Steps I used:
>> - clone buildroot from git
>> - checkout 2017.02.x branch
>> - make menuconfig (enabled systemd, disabled busybox, added a whole lot of other stuff)
>>> ^^^^^^^^^^^^^^^^
>>> When you do this, you'll see the following warning appear:
>>> 
>>> You may need to enable other packages to get a working system
>>> You better know what you're doing!
>>> 
>>> From a quick look through your .config, I see that you don't have a getty
>>> package enabled. Without getty, systemd can't start getty. So you need to enable
>>> the agetty package.
>>> 
>>> Also note that systemd isn't thoroughly tested in Buildroot, even if you do
>>> enable busybox. So it is possible that you may run into other issues. Starting a
>>> getty should work, however.
>>> 
>>> Regards,
>>> Arnout
>> 
>> - make
>> - flashed/installed images from output/images/
>> 
>> Here is a link to my buildroot-config: http://pastebin.com/W8KnZccU
>> 
>> Any help is appreciated.
>> 
>> Greetings,
>> Karoly
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>> --
>>> Arnout Vandecappelle arnout at mind be
>>> Senior Embedded Software Architect +32-16-286500
>>> Essensium/Mind http://www.mind.be
>>> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
>>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>>> GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 
> --
> Arnout Vandecappelle arnout at mind be
> Senior Embedded Software Architect +32-16-286500
> Essensium/Mind http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
