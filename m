From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 May 2019 21:56:17 +0200
Subject: [Buildroot] [PATCH] linux: enable UEVENT_HELPER when mdev is
 used
In-Reply-To: <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be> (Arnout
 Vandecappelle's message of "Sat, 25 May 2019 17:24:15 +0200")
References: <20190525130755.25678-1-peter@korsgaard.com>
 <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be>
Message-ID: <87mujanw9q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 25/05/2019 15:07, Peter Korsgaard wrote:
 >> S10mdev uses /proc/sys/kernel/hotplug, which is only available if
 >> CONFIG_UEVENT_HELPER is enabled in the kernel, so ensure it is.

 >  So, I take a look at it, and it's a little bit more complicated...

 >  Busybox *does* have support for the "new" netlink-based uevent interface, but
 > that interface needs a daemon that keeps running and they separated that daemon
 > into a separate process, called uevent. So, in the "new" way, you should do
 > something like (not tried, just based on source code):

 > start-stop-daemon -S -b -x /sbin/uevent -- mdev

Ahh, so busybox now has a clone of s6-uevent-listener / mdevd-netlink? I
wasn't aware of that.

There is also patches floating for a daemon mode for mdev:
https://www.mail-archive.com/busybox at busybox.net/msg25938.html
and separately, mdevd exists: https://skarnet.org/software/mdevd/

 >  So, these are our options:

 > 1. Bloat the kernel with legacy uevent helper support (this patch).

This is not really bloat, as it just makes the existing implicit
dependency explicit.


 > 2. Bloat the kernel with networking even if it is not used for anything else,
 > and bloat busybox with uevent (3.1 kb), and always use uevent.

Networking support adds significant bloat, the other options afaik not.


> 3. Use uevent in the init script but don't enforce anything (with potential
 > silent failures), and explain stuff in the mdev help text.

 > 4. Try out all possibilities in the init script - which still fails silently in
 > case neither CONFIG_UEVENT_HELPER nor CONFIG_NET is enabled in the kernel.

 >  In my opinion, we definitely should *not* go for option 1. I don't want to be
 > the one that forces the kernel to maintain legacy stuff. I would definitely use
 > uevent.

What advantage does uevent have over the legacy uevent helper? Just
serialization or anything else?


 > On the other hand, I really don't like it when we force changes into
 > busybox or kernel configs. Since it's really likely that CONFIG_NET is enabled
 > in the kernel, and since our default busybox config (but not the minimal one)
 > does enable uevent, I think that option 3 is the way to go.

I don't use mdev myself, so I don't really care a lot about what option
we go for longer term, but given how close 2019.05 is, the only valid
options for the release are this patch or nothing.

I have no problems with patches (for next) moving our mdev logic to
netdev instead if people are interested.


 >  By the way, with netlink, the event are properly serialized, and uevent makes
 > sure that only one mdev subprocess is created so it maintains the serialisation.
 > So, it is no longer needed to create /dev/mdev.seq (which, for some reason, we
 > currently don't do...).

Ahh yes, a patch adding an 'echo >/dev/mdev.seq' to S10mdev would be
nice.

-- 
Bye, Peter Korsgaard
