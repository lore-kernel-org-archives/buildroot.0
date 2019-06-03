From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jun 2019 16:56:47 +0200
Subject: [Buildroot] [PATCH] linux: enable UEVENT_HELPER when mdev is
 used
In-Reply-To: <d3a724b9-b9c9-b399-0f32-b3f93d3511a3@mind.be> (Arnout
 Vandecappelle's message of "Sun, 26 May 2019 11:05:14 +0200")
References: <20190525130755.25678-1-peter@korsgaard.com>
 <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be>
 <87mujanw9q.fsf@dell.be.48ers.dk>
 <d3a724b9-b9c9-b399-0f32-b3f93d3511a3@mind.be>
Message-ID: <87muiyu380.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > start-stop-daemon -S -b -x /sbin/uevent -- mdev
 >> 
 >> Ahh, so busybox now has a clone of s6-uevent-listener / mdevd-netlink? I
 >> wasn't aware of that.

 >  It has been added in 2015 :-)

As I said, I don't use mdev ;)

 >> > 1. Bloat the kernel with legacy uevent helper support (this patch).
 >> 
 >> This is not really bloat, as it just makes the existing implicit
 >> dependency explicit.

 >  It is "bloat" because there is a way to avoid it, but the user can't disable it
 > (even if the user modifies the init script to use uevent so it becomes unneeded,
 > Buildroot forces the kernel option on).

Correct.


 >> > 2. Bloat the kernel with networking even if it is not used for anything else,
 >> > and bloat busybox with uevent (3.1 kb), and always use uevent.
 >> 
 >> Networking support adds significant bloat, the other options afaik not.

 >  Note that it's just CONFIG_NET, not CONFIG_INET. Without CONFIG_NET, you don't
 > have e.g. the socket() syscall. 90% of the packages will not work (at runtime).
 > So we're kind of in the same domain as with a custom uClibc config that disables
 > stuff that most packages depend on.

How will the uevent daemon work without socket()?

 >> > 3. Use uevent in the init script but don't enforce anything (with potential
 >> > silent failures), and explain stuff in the mdev help text.
 >> 
 >> > 4. Try out all possibilities in the init script - which still fails silently in
 >> > case neither CONFIG_UEVENT_HELPER nor CONFIG_NET is enabled in the kernel.
 >> 
 >> >  In my opinion, we definitely should *not* go for option 1. I don't want to be
 >> > the one that forces the kernel to maintain legacy stuff. I would definitely use
 >> > uevent.
 >> 
 >> What advantage does uevent have over the legacy uevent helper? Just
 >> serialization or anything else?

 >  It's also more efficient IIUC, but I don't know much of the details.
 > Admittedly, that efficiency probably goes away with uevent, because it stems
 > from avoiding a fork, but uevent does exactly that.

Indeed. Notice that Denys has just merged the daemon mode (-d) support
for mdev, so from a performance PoV, that is probably what we should
support rather than uevent + mdev:

http://lists.busybox.net/pipermail/busybox/2019-June/087305.html


 >> I don't use mdev myself, so I don't really care a lot about what option
 >> we go for longer term, but given how close 2019.05 is, the only valid
 >> options for the release are this patch or nothing.

 >  As Andy indicated, this bug has existed for several years. I really don't see
 > the need to fix it for 2019.05.

.. so I didn't.


 >> Ahh yes, a patch adding an 'echo >/dev/mdev.seq' to S10mdev would be
 >> nice.

 >  But not needed if we use uevent :-)

Not if we unconditionally do it, no.

-- 
Bye, Peter Korsgaard
