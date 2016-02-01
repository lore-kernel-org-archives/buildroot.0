From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 16:46:58 +0100
Subject: [Buildroot] [PATCH v2 00/17] Rework atomic handling
In-Reply-To: <20160201163806.33d566ba@pcviktorin.fit.vutbr.cz>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160201144730.7ca660e9@pcviktorin.fit.vutbr.cz>
 <20160201161926.3b2488f8@free-electrons.com>
 <20160201163806.33d566ba@pcviktorin.fit.vutbr.cz>
Message-ID: <20160201164658.054a0b8b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Mon, 1 Feb 2016 16:38:06 +0100, Jan Viktorin wrote:

> > Ah, so you're doing some Microblaze stuff? If so, some help would
> > definitely be welcome to maintain this platform.
> 
> Unfortunately, this is just a single test on MicroBlaze after quite a
> long time. We've moved on to Zynq...

Still you are our (only?) Microblaze user, so on you falls the
responsibility of improving the Microblaze support :-)

> So, this the source of my confusion. Yes, I thought that libatomic and
> libatomic_ops are related or same as I couldn't find libatomic anywhere in the
> Buildroot. Thanks for clarification.

OK. However, still you have a point: it seems like libatomic_ops can
use atomic built-ins from the compiler, so we should be able to enable
its support on more architectures than what we have today.

> If I have a library that links with __atomic_* calls I just need to
> link with libatomic when building for MicroBlaze, is that correct?

As long as you have >= gcc 4.7, you can link with -latomic and you'll
get the __atomic built-ins. See my table in PATCH 1 of this series. For
Microblaze, it says:

Microblaze     -  -  Y  -    L  L  Y  L   4.9

Which means that the __atomic functions for 4-byte types are built-in
(no need for -latomic). However, for 1-byte, 2-byte and 8-byte types,
-latomic is needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
