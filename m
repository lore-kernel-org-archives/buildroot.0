From: Peter Rosin <peda@lysator.liu.se>
Date: Thu, 05 Nov 2015 11:44:08 +0100
Subject: [Buildroot] [PATCH 0/2] bump libtirpc to 1.0.1
In-Reply-To: <20151105100543.4efb53dc@free-electrons.com>
References: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
 <20151105100543.4efb53dc@free-electrons.com>
Message-ID: <563B32F8.8050607@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 2015-11-05 10:05, Thomas Petazzoni wrote:
> Dear Peter Rosin,
>
> On Thu,  5 Nov 2015 09:30:08 +0100, Peter Rosin wrote:
>
>> I'd like to bump libtirpc to 1.0.1. However there is an api incompatibility
>> introduced in 0.3.2 which requires a patch to rpcbind, which I took from
oops, introduced in -> introduced since
>> upstream. The rpcbind patch make rpcbind work with either tirpc 0.3.2 or
>> 1.0.1, so I added that patch first in the series even if it might seem
>> backwards.
> Thanks for those patches. Is rpcbind the only user of libtirpc that is
> affected by the API change ?
>
> Thomas

Good question...

I think so, but who knows? Personally I would have kept libtirpc compatible (that was a
possibility), but upstream decided to make the switch since they didn't know of any users
and wanted to get in line with other tirpc implementations. Then this regression in
rpcbind was discovered, which was rather close to home...

The changed interface was thought to be only for adding custom authenticators to RPC,
something that is thought to be extremely specialized, but the rpcbind use looks like a
workaround for problems getting replies out when using libtirpc somewhat strangely
(again, I don't know rpcbind and have only had a cursory look at the code). If a package
is using libtirpc normally and do no strange things (unlike rpcbind, which probably is
quite special) and don't add its own application specific RPC authenticator, it should not
be affected. But as I said, who knows?

Fixing breakage in libtirpc users should be straightforward if any come up, and another
possibility is to add a patch to revert the final change that removed the old interface.
However, that revert is touching core areas in a number of places and is probably not
fun to keep around for any length of time. It can be added if needed, is that good
enough?

I can only find the upstream discussion in the mail archive at sf, which has a rather
sucky interface, sorry.

Cheers,
Peter

https://sourceforge.net/p/libtirpc/mailman/libtirpc-devel/thread/5630F3AA.6050201%40RedHat.com/#msg34576143
