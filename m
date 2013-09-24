From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Sep 2013 08:30:28 +0200
Subject: [Buildroot] [PATCH v2 11/17] refpolicy: new package
In-Reply-To: <OF0AE894A4.B1D82316-ON86257BEF.005CA11D-86257BEF.00782938@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378936777-28308-12-git-send-email-clshotwe@rockwellcollins.com>
 <20130918071804.2548927a@skate>
 <OF0AE894A4.B1D82316-ON86257BEF.005CA11D-86257BEF.00782938@rockwellcollins.com>
Message-ID: <20130924083028.7949259b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Mon, 23 Sep 2013 16:52:32 -0500, Clayton Shotwell wrote:

> The different distributions add a few changes that are specific to
> the distribution. I looked through the distributions and none of them
> really fit with the way buildroot works so I am going to remove this
> option from the config.

Ok.


> > Do we have a chance of getting this patch merged upstream? We don't
> > like to carry feature patches in Buildroot, so if a feature doesn't
> > exist upstream, or is so broken upstream and never going 
> > to be fixed,
> > then we prefer to not support it at all.
> > 
> > If fixing this upstream is an on-going effort, then no 
> > problem to carry
> > the patch in Buildroot.
> 
> There has been work on the upstream in relation to these fixes. I
> have pulled down the latest upstream software and it builds without
> any problems. This patch will be able to be removed when the next
> version is released.

Ok, perfect.

> There are many changes that need to be made for
> things to work with buildroot that I have not made yet. I don't have
> the resources to customize the refpolicy to work completely, as is,
> with buildroot. Currently, a lot of the paths listed in the policy do
> not match the way buildroot works. This is especially true with the
> init scripts. Would it be best to make a bunch of modifications to
> the refpolicy to make it work for buildroot? I'm not sure the best
> way to proceed with this.

I believe we can merge the refpolicy in its current state (i.e not
fully perfect for Buildroot usage), with a clear comment in the
Config.in that says so. And then you can continue the development and
add more fixes to the refpolicy package as you progress towards making
it fully usable in a Buildroot environment.

The thing I'm more worried about is that if we need Buildroot-specific
changes, will we have to keep them as patches within Buildroot forever?

> > Do we really need all those dependencies? I've tried to 
> > draw a diagram
> > of all the host and target dependencies between all these SELinux
> > packages, but I must admit I get a bit lost. If you could give some
> > general comments on why the various target/host variants of each
> > package are needed, that'd be really great.
> 
> I will create a diagram and submit it with the documentation that
> needs to be created.  Hopefully that will be done by the end of the
> week but I am pretty busy with several things right now. 

No problem. Note that I had a look at the SELinux handbook (but it's
*very* long), and especially the diagram that they have. It was
certainly helpful, but it does not clarify an aspect that is essential
in a Buildroot context: what component is used on the target, what
component is used only on the build machine.


> > > +   # Currently, semodule is unabled to compile the 
> > policy during the build so 
> > > +   # the modules must be compiled into the policy 
> > during the first boot.  This 
> > > +   # is done by the S12selinux startup script.
> > > +   #( export PATH=$(TARGET_PATH); \
> > > +   #   $(HOST_DIR)/usr/sbin/semodule -v -n -p $
> > (TARGET_DIR) -s $(BR2_PACKAGE_REFPOLICY_NAME) \
> > > +   #      -b $(@D)/base.pp -i $(shell ls $(@D)/*.pp | 
> > grep -v base); \
> > > +   #)
> > 
> > So if this was done at build time, we could avoid having a bunch of
> > tools on the target?
> 
> This is only for the modular policy.  The monolithic policy will be 
> completely built on the host and saved to the target.  I could
> probably go through and pair down a bunch of dependencies based on
> that.  I'll look into that and make some changes.

That'd be great, I believe. Especially since you're stating earlier
that the monolithic policy is the most efficient one, and recommended
for usage on embedded systems, I believe it'd be good to not have the
tools to build policies on the target if they are not needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
