From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 07 Jan 2009 20:26:17 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <20090107184338.GA12169@zelow.no>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no> <87aba4pj4w.fsf@macbook.be.48ers.dk>
	<20090106183243.GA28479@zelow.no> <873afwnu6n.fsf@macbook.be.48ers.dk>
	<1231268970.32308.230.camel@elrond.atmel.com>
	<20090107184338.GA12169@zelow.no>
Message-ID: <1231356377.32308.424.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-07 klockan 19:43 +0100 skrev Thomas Lundquist:
> On Tue, Jan 06, 2009 at 08:09:30PM +0100, Ulf Samuelsson wrote:
> > 
> > A typical issue that pops up from time to time is that
> > people build the toolchain with a certain configuration
> > and then finds that they need a different configurtion
> > to build a package, and do not realize that they 
> > need to rebuild the toolchain for the changes to take effect.
> 
> Which is why...
> 
> > It would be good to resolve this, and this is why I have
> > proposed to separate toolchain build.
> 
> ..This is a bad idea.
> 
> (Since the rebuild should be automagic if there are 
>  changes in configurations that requires one.)

It doesn't rebuild automatically right now.

I think that this is the main reason why I think 
the toolchain should be separate.

When the toolchain has been build it should generate
Config.in files automatically, which is included
by the Buildroot Config.in.

You will then have access to the toolchain
parameters, but you will not have the ability
to add packages depending on non avaialble options.

You will have to go back and reconfigure the toolchain
when then will then be forced to be rebuilt.

gcctools:	toolchain/.config
		make -C toolchain 
		touch $@

and then the toolchain is automatically rebuilt
everytime the toolchain configuration is changed.

If you can change an option easily which forces the rebuild
of a toolchian, then you can also change an option by
mistake making you lose a couple of hours...

> 
> > With SYSROOT in gcc-4 there is really no reason 
> > to induce people to rebuild the toolchain,
> > and we might want to support downloading a binary toolchain as well.
> 
> The only way to support this should be through the "external toolchain" 
> thingie. (And that should have it's own maintainer, one that uses this)
> 

If you separate the build then (almost) everyone will build
then native toolchain and then use it as an external toolchain.

> 
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
