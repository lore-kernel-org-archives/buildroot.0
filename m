From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 8 Sep 2014 09:23:02 +0000
Subject: [Buildroot] [PATCH 1/2] libtirpc: add dependency on atomic
	operations
In-Reply-To: <20140908092306.12308c5a@free-electrons.com>
References: <1410157964-8422-1-git-send-email-abrodkin@synopsys.com>
 <1410157964-8422-2-git-send-email-abrodkin@synopsys.com>
 <20140908092306.12308c5a@free-electrons.com>
Message-ID: <1410168181.4784.16.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-09-08 at 09:23 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> That's not that simple because you forget to update the comments: they
> should not be displayed if the architecture doesn't have the atomic
> intrinsics. And this is where things start to be really, really weird.

> > diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
> > index ec19d8e..36b12b7 100644
> > --- a/package/conntrack-tools/Config.in
> > +++ b/package/conntrack-tools/Config.in
> > @@ -3,6 +3,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
> >  	depends on BR2_INET_IPV6
> >  	depends on BR2_LARGEFILE
> >  	depends on BR2_USE_MMU # fork()
> > +	depends on BR2_ARCH_HAS_ATOMICS # libtirpc
> 
> That's not correct: if the toolchain has native RPC support, we do not
> need libtirpc, so there is no need to depend on BR2_ARCH_HAS_ATOMICS in
> this case.
> 
> I already tried to solve this thing, but it's much more complicated
> than just adding a bunch of "depends on".

So I assume there's no sense for me to try fixing comments, right?
I mean if this won't work either or introduce new problems as you meant.

Then what could be our next steps to accommodate possibility of
existence/absence of atomic ops?

This is especially important for ARC where these ops are optional.
The simplest solution could be to enable BR2_ARCH_HAS_ATOMICS for ARC by
default, but this will just attempt to escape from real problem.

And as I saw from other autobuild results other architectures are
affected like Blackfin for example.

If this is that complicated we may try to discuss it in person on
Buildroot summit in few weeks.

-Alexey
