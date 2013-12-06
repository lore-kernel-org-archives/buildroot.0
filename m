From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Dec 2013 18:07:51 +0100
Subject: [Buildroot] [PATCH 3/3] package/parted: add a host variant
In-Reply-To: <20131206165614.GB3364@free.fr>
References: <cover.1386023329.git.yann.morin.1998@free.fr>
 <1891fdbc7ad11ce084f2be315871eb10573953b7.1386023329.git.yann.morin.1998@free.fr>
 <20131206104811.49d81180@skate> <20131206165614.GB3364@free.fr>
Message-ID: <20131206180751.03555e6e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 6 Dec 2013 17:56:14 +0100, Yann E. MORIN wrote:

> I think we want the same dependency the target parted has. If the target
> parted can handle lvm2 volumes, then we may have to generate them in the
> first place.

Yes, we may. But that seems unlikely. I believe the most common usage
of LVM on embedded platforms is for NAS/storage type devices, and for
those systems, the root filesystem image is generally not on the
LVM/RAID storage I believe, no?

> So, what about:
> 
> # If target-parted can handle lvm volumes, then host-parted
> # should be, too, so as to be able to generate them.
> # If target-parted can't handle lvm volumes, there is no reason
> # for host-aprted to handle them.
> ifeq ($(BR2_PACKAGE_LVM2),y)
> PARTED_DEPENDENCIES += lvm2
> HOST_PARTED_DEPENDENCIES += lvm2
> PARTED_CONF_OPT += --enable-device-mapper
> HOST_PARTED_CONF_OPT += --enable-device-mapper
> else
> PARTED_CONF_OPT += --disable-device-mapper
> HOST_PARTED_CONF_OPT += --disable-device-mapper
> endif

While I do understand the logic behind what you're proposing, I'm not
really comfortable with having the configuration of tools built for the
host changed depending on the target configuration. It seems to be
creating a bad precedent.

> > In the host variant of parted, lvm2 support is never enabled, as I
> > believe it's pretty unlikely that lvm2 support will be needed to
> > generate disk images. This would make PATCH 2/3 of your series
> > unnecessary, of course.
> 
> I don't think we should not be able to generate lvm volumes. I can see
> at least a few cases where it would be needed.
> 
> Of course, we may just add host-parted without lvm support right now,
> and add it later when the need really arises.

Yes, that would be my proposal.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
