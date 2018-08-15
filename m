From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Aug 2018 21:02:10 +0200
Subject: [Buildroot] [PATCH 2/8] package/mender: update install of
 config files
In-Reply-To: <CADHdJwBemwZr-AJ+jSGhJem1g70xmWRFC4pb3ajctwFHTjYPeQ@mail.gmail.com>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-3-mirza.krak@northern.tech>
 <20180815143144.587c2045@windsurf>
 <CADHdJwCjktMrL2YQpKbzm45n0UoqpXRLHGjy1PyQJv_SRwH-Ug@mail.gmail.com>
 <20180815194157.782858ac@windsurf>
 <CADHdJwBemwZr-AJ+jSGhJem1g70xmWRFC4pb3ajctwFHTjYPeQ@mail.gmail.com>
Message-ID: <20180815210210.410ca497@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 20:48:27 +0200, Mirza Krak wrote:
> On Wed, Aug 15, 2018 at 7:41 PM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > Hello,
> >
> > On Wed, 15 Aug 2018 14:42:51 +0200, Mirza Krak wrote:
> >  
> >> > Do you know why tenant.conf was added in the current Mender packaging ?
> >> > Was it an old configuration file from previous Mender versions ?  
> >>
> >> This was something that we did deploy in our Yocto recipes (which
> >> might have been source of inspiration for the package in Buildroot),
> >> but it was never actually used for anything. There is an option in
> >> mender.conf for this, TenantToken.  
> >
> > Which is set to ?
> >
> > tenant.conf was the target of a symlink, created in the systemd unit
> > file:
> >
> > /bin/ln -sf /etc/mender/tenant.conf /var/lib/mender/authtentoken
> >
> > How does it work now ?  
> 
> Example:
> 
> /etc/mender/mender.conf
> {
>     TenantToken: "very long base64 encoded string"
> }
> 
> This is a configuration option that has to do with Hosted Mender,
> where you you need to set this for the devices to connect to the
> correct organization in a multi-tenant system.
> 
> I also looked up some details, the removal of tenant.conf usage (and
> /var/lib/mender/authtentoken) was in version 1.2.0, where it was
> switched to be an mender.conf option instead as the example above
> demonstrates. As the first version that was integrated in Buildroot
> was 1.4.0, the inclusion of tenant.conf and the creation of the
> symlink was not necessary.

OK, thanks a lot for this research. Please make this a separate patch
from the rest, with this very good explanation as the commit log.

> >> > The installation path has changed from /var/share, to /usr/share. Why ?  
> >>
> >> /var/share was incorrect, it has always been /usr/share.  
> >
> > So in its current state, the mender package in Buildroot doesn't work ?  
> 
> We need to define works. If we define works as that the mender.service
> is started successfully and the daemon is running, currently this does
> not work. And the path change from /var/share -> /usr/share is one of
> the fixes.

OK, so we want this as a separate patch as well, so that we can apply
it to master and backport to our LTS branch.

> The other one is a "sane" mender.conf file, currently there
> are only "template" values in the file installed that are not replaced
> with actually working values.

It is kind of expected that the mender.conf provided in Buildroot is a
template and needs to be replaced. I don't think it is really possible
to provide an out-of-the-box working solution for update systems. As
you explain below, it requires integration with the bootloader, a
specific organization of the partitions, etc.

> For Mender to actually be able to perform updates (works) it requires
> integration with U-boot and a specific partition layout, as it is A &
> B update solution. Will go in more detail on this in the other thread,
> with similar questions.

OK, thanks!

> > In your next iteration of the patches, could you please clearly
> > separate the bug fixes as separate patches. They should come first in
> > the series, before the improvements/cleanups.  
> 
> Yes, I can do that.

Thanks a lot!

I have to say I'm really pleased to have people with deep knowledge of
Mender taking care of its Buildroot packaging. This will definitely
help in making Mender more usable in the context of Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
