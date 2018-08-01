From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 09:05:48 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: Really use host-dtc
In-Reply-To: <ea2ac147-3c9f-a85d-83ea-84f33a0d52e4@mind.be>
References: <20180726103630.8643-1-david.degrave@mind.be>
 <20180726103630.8643-2-david.degrave@mind.be>
 <20180728214834.3496b200@windsurf>
 <CAD6XyYyrv809pmGMg3M_9wFekQ2c1JfnKRQ3w8bvqFhG4tVYeA@mail.gmail.com>
 <20180731205154.62967de8@windsurf>
 <ea2ac147-3c9f-a85d-83ea-84f33a0d52e4@mind.be>
Message-ID: <20180801090548.0c92457b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Aug 2018 00:14:08 +0200, Arnout Vandecappelle wrote:

> > I think the optional dependency on host-dtc depends from a time where
> > U-Boot did not have its own copy of DTC. I'm not sure it makes a lot of
> > sense now.  
> 
>  ... but we still want to support those older U-Boot versions, so we can't
> remove it.

Absolutely.

But the case found by David is not a case where U-Boot needs a DTC
available on the host: it tries to use its own internal DTC, but
forgets to build it. That's a bug in U-Boot.

>  Ideally, we should find out between which two versions it is needed, and
> mention that in the help text.
> 
> > If U-Boot tries to use ./scripts/dtc/dtc, then it should have built it.
> > If it didn't build it but tries to use it nonetheless, it sounds like a
> > bug in U-Boot.  
> 
>  Oh yes, now I see it, it's indeed a bug in U-Boot. CONFIG_OF_LIST should either
> depend on CONFIG_OF_CONTROL or select it, otherwise dtc is not built.

Right, so it's indeed a bug in U-Boot. That being said, the change
proposed by David is not too bad: it makes sense to use the host DTC if
it was built, rather than the one built by U-Boot. It's just that the
initial problem explanation wasn't really complete enough, so I was a
bit confused.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
