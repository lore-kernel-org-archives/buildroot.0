From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Feb 2018 07:55:33 +0100
Subject: [Buildroot] Trouble with offline build
In-Reply-To: <20180228045310.bugxi5bb3w2djjaa@tarshish>
References: <CAMd7AX_bD6b4c2xhnsWPicPCETk9z3bDP4yT9k3Jpd9Op1F8tA@mail.gmail.com>
 <20180228045310.bugxi5bb3w2djjaa@tarshish>
Message-ID: <20180228075533.564a23b7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch, Hello Aaron,

On Wed, 28 Feb 2018 06:53:10 +0200, Baruch Siach wrote:

> > I'm new enough that I'm not even sure why this package is being
> > downloaded.  I must have it in one of the config files, but it's not an
> > obvious.  
> 
> As you can see from the output below, this is a host package (host-lzip). lzip 
> is needed to extract some packages. Buildroot builds this host package only 
> when the host has no lzip installed. The same goes for a number of other 
> dependencies. See support/dependencies/. So you can either install lzip on 
> your build machine, or force the download of lzip with 'make lzip-source'

I obviously entirely agree with Baruch analysis here. However, I am a
bit unhappy about the fact that Buildroot doesn't handle this in a
better way, even though I'm not sure what the better way would be.

I believe Aaron's expectation that given a Buildroot configuration, a
"make source" on machine A should download everything that is needed to
do a build of the same configuration on machine B is a reasonable
expectation.

However, there are several host machine details that prevent this from
happening today:

 - host architecture: we may download a x86 or x86-64 pre-built binary.
   External toolchains come to mind, but also things like pre-built
   rust compiler, or other things like that.

 - Things that we skip building if a suitable version if found on the
   host: host-cmake, host-lzip, host-xzcat, host-tar.

To be honest, I don't really see how to solve that problem. the
host-{cmake,lzip,xzcat,tar} issue could probably be solved by
downloading all of them even if some of them won't be needed (we may
have a "make all-source" that differs from "make source" to avoid "make
source" from downloading useless stuff). However, for the host
architecture difference, I'm not sure how to proceed, and I'm not sure
there is a reasonable solution.

Bottom line: should we document/make it clear that doing a "make
source" on machine A and then do a build on machine B is not
guaranteeing a fully offline build ? It's a bit of a pity, because I
know there are some environment where only a given machine has Internet
access, and the developer machines don't, but I don't see a good way of
solving this in Buildroot.

Any comments or suggestions ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
