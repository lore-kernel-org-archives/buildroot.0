From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 3 Jun 2019 18:44:50 +0200
Subject: [Buildroot] [PATCH] linux: enable UEVENT_HELPER when mdev is
 used
In-Reply-To: <87muiyu380.fsf@dell.be.48ers.dk>
References: <20190525130755.25678-1-peter@korsgaard.com>
 <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be>
 <87mujanw9q.fsf@dell.be.48ers.dk>
 <d3a724b9-b9c9-b399-0f32-b3f93d3511a3@mind.be>
 <87muiyu380.fsf@dell.be.48ers.dk>
Message-ID: <9f9e57ff-ba24-a4c0-7be8-48e048e4138f@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On 6/3/19 4:56 PM, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>   >> > start-stop-daemon -S -b -x /sbin/uevent -- mdev
>   >>
>   >> Ahh, so busybox now has a clone of s6-uevent-listener / mdevd-netlink? I
>   >> wasn't aware of that.
> 
>   >  It has been added in 2015 :-)
> 
> As I said, I don't use mdev ;)
> 
>   >> > 1. Bloat the kernel with legacy uevent helper support (this patch).
>   >>
>   >> This is not really bloat, as it just makes the existing implicit
>   >> dependency explicit.
> 
>   >  It is "bloat" because there is a way to avoid it, but the user can't disable it
>   > (even if the user modifies the init script to use uevent so it becomes unneeded,
>   > Buildroot forces the kernel option on).
> 
> Correct.
> 
> 
>   >> > 2. Bloat the kernel with networking even if it is not used for anything else,
>   >> > and bloat busybox with uevent (3.1 kb), and always use uevent.
>   >>
>   >> Networking support adds significant bloat, the other options afaik not.
> 
>   >  Note that it's just CONFIG_NET, not CONFIG_INET. Without CONFIG_NET, you don't
>   > have e.g. the socket() syscall. 90% of the packages will not work (at runtime).
>   > So we're kind of in the same domain as with a custom uClibc config that disables
>   > stuff that most packages depend on.
> 
> How will the uevent daemon work without socket()?
> 
>   >> > 3. Use uevent in the init script but don't enforce anything (with potential
>   >> > silent failures), and explain stuff in the mdev help text.
>   >>
>   >> > 4. Try out all possibilities in the init script - which still fails silently in
>   >> > case neither CONFIG_UEVENT_HELPER nor CONFIG_NET is enabled in the kernel.
>   >>
>   >> >  In my opinion, we definitely should *not* go for option 1. I don't want to be
>   >> > the one that forces the kernel to maintain legacy stuff. I would definitely use
>   >> > uevent.
>   >>
>   >> What advantage does uevent have over the legacy uevent helper? Just
>   >> serialization or anything else?
> 
>   >  It's also more efficient IIUC, but I don't know much of the details.
>   > Admittedly, that efficiency probably goes away with uevent, because it stems
>   > from avoiding a fork, but uevent does exactly that.
> 
> Indeed. Notice that Denys has just merged the daemon mode (-d) support
> for mdev, so from a performance PoV, that is probably what we should
> support rather than uevent + mdev:
> 
> http://lists.busybox.net/pipermail/busybox/2019-June/087305.html


This is great news !

Even then, the S10mdev init script has to be modified to start mdev in 
daemon mode. I could add this to 
http://patchwork.ozlabs.org/patch/1107175/. However, I don't see a good 
way to check if FEATURE_MDEV_DAEMON=y.

I could try to search for the daemon option in the help text
(`mdev 2>&1 | grep "runs mdev as daemon"`),
but this look a bit hackish to me.

> 
> 
>   >> I don't use mdev myself, so I don't really care a lot about what option
>   >> we go for longer term, but given how close 2019.05 is, the only valid
>   >> options for the release are this patch or nothing.
> 
>   >  As Andy indicated, this bug has existed for several years. I really don't see
>   > the need to fix it for 2019.05.
> 
> .. so I didn't.
> 
> 
>   >> Ahh yes, a patch adding an 'echo >/dev/mdev.seq' to S10mdev would be
>   >> nice.
> 
>   >  But not needed if we use uevent :-)
> 
> Not if we unconditionally do it, no.
> 

Regards,

Titouan
