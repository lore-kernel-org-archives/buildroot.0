From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Apr 2014 10:59:06 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <53577F04.1040409@mind.be>
References: <20140420063009.8B76B100DB9@stock.ovh.net>
 <20140420104812.5bc926a9@skate> <53569BBE.1020707@mind.be>
 <20140422221958.6240077e@skate> <5356E9C2.9050900@mind.be>
 <20140423092209.4d1454ec@skate> <53577F04.1040409@mind.be>
Message-ID: <20140423105906.45732b9f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 23 Apr 2014 10:51:16 +0200, Arnout Vandecappelle wrote:

> > Also, by having a much smaller percentage, I'm wondering if we have a
> > lot less chances to trigger cases that require a fairly significant
> > combination of options to be produced.
> 
>  Do we actually have examples of such a situation, that a combination of
> packages leads to an error? It's more likely to lead to runtime errors I
> expect.

I believe so. For example, the cairo build problem due to GLchar would
only occur if both the sunxi-mali OpenGL implementation was selected
*and* cairo was enabled.

We also have lots of optional dependencies all over the place in many
packages. Those optional dependencies are only triggered is the
dependency is enabled.


> > Yes, that's quite large, but I've anyway increased it to 6 hours. The
> > goal of the time out was *only* to make sure builds entering some quite
> > of infinite loop terminate at some point (we used to have a PowerPC
> > toolchain whose 'ld' was buggy, and was entering an infinite loop when
> > building a certain package).
> 
>  True, if there is currently no situation that the timeout is "real",
> then it doesn't hurt to increase the timeout. And if a real timeout does
> start occuring, we can decrease the timeout again until it is solved.

Indeed. Right now, all the timeouts we see seem to be spurious
timeouts, only caused by the fact that the build is really taking
longer than the timeout, not because there was some infinite loop or
other issue that would have caused the build to actually never
terminate.

A better thing would be to monitor build-time.log while the build is
running, and only abort if the build duration of the *current* package
is higher than a certain limit. This way, instead of having a per-build
timeout, we would have a per-package timeout (which I believe, would be
related to the webkit build time).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
