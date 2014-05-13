From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 22:05:54 +0200
Subject: [Buildroot] virtual-packages: the case for multiple providers
	selected
In-Reply-To: <20140513180945.GC3507@free.fr>
References: <20140513180945.GC3507@free.fr>
Message-ID: <20140513220554.78579296@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 May 2014 20:09:45 +0200, Yann E. MORIN wrote:

> Two options have been proposed by Thomas P. on IRC:
> 
>   - add a choice to select one and only provider at a time, and make all
>     the providers prompt-less config options so it is not possible to
>     choose more than one at a time;
> 
>   - add a pre-build check that verifies that not two providers of the
>     same feature are selected, and bail out early in the build if that
>     is the case.
> 
> Both of those options have issues.
> 
>   - going with the choice means that it is no longer possible to add a
>     new provider in BR2_EXTERNAL without changing the Buildroot source
>     tree, one of the main selling-point of BR2_EXTERNAL to begin with,

I don't agree that it's the main selling point of BR2_EXTERNAL. The
main selling point was the ability to have package .mk files outside of
the main Buildroot tree. Which remains entirely possible. The only
limitation that a choice introduces is that such an out-of-tree
package .mk file cannot implement a provider for an in-tree virtual
package, without making an in-tree change. It is certainly less nice
than it was, but it clearly doesn't make BR2_EXTERNAL useless at all.

>   - going with the check means that it will still possible to generate
>     such configurations, which means we'd still get autobuild failures
>     for those (unless the autobuilders are tweaked to recognise this,)
>     while it would be a minimal annoyance to the user.

Right, for the autobuilders, it would be a bit annoying. We could also
decide to ignore the problem completely, and have the autobuilder
script reject random configurations that have multiple providers
selected for a given virtual package. I however don't really see how to
implement that in a generic fashion, so we would have to have an
explicit list of all possible providers for all virtual packages.

> I am rather opposed to this, since I believe allowing providers from
> BR2_EXTERNAL is a requirement for BR2_EXTERNAL, and we do want to
> support this situation. After all, I can easily see a BR2_EXTERNAL tree
> with proprietary, non-public providers for 3d and/or video-decoding
> hardware acceleration.

That use case is indeed true.

> On the other hand, kconfig does not expose the number of config item
> that select another one, e.g. it is not possible to know how many
> packages did 'select HAS_EGL', we'd have to resort to the .mk to do the
> calculations and the check. I think this should be doable in a
> relatively non-invasive way, with some Makefile trickery.
> 
> So, what do you guys think of these two proposals? Do you have an
> alternate solution to propose?

The third option is the one I exposed earlier: do nothing, and work
around the problem in the autobuilder scripts.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
