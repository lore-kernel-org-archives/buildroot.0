From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Fri, 3 Jan 2014 11:41:13 -0800
Subject: [Buildroot] [PATCH 1/1] skeleton: add systemd network.service
	unit
In-Reply-To: <20140103201333.7f4edd47@skate>
References: <1388713112-4686-1-git-send-email-vsergeev@kumunetworks.com>
 <20140103201333.7f4edd47@skate>
Message-ID: <CAPyrzo0q7Y3Tf1LOaCe4LK78a7sZrVdToLfnzp4Tc4kow=-nKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hah, sorry. I forgot the reply all. This was supposed to be my follow up
discussion email:

Hello buildroot,

I'm submitting this in hopes of catching up network init in systemd with
that of busybox init, which is currently served by /etc/init.d/S40network.
This patch adds and enables network.service (which assumes ifup / ifdown
exists and uses them like /etc/init.d/S40network does).

I also wanted to bring up a more general issue:

Currently, it seems that the /etc/init.d scripts are copied over blindly
from the target skeleton to the target even if systemd (and not busybox) is
the chosen init system. Moving forward, having both busybox and systemd
init files in the skeleton, like this patch would have, will always clutter
/etc/ with some unused init files in the target system, since only one init
system will be active.

Should such init files be conditional targets in system/system.mk?  Or
should S40network be owned and copied over by package/busybox, and
network.service be owned and copied over by package/systemd, instead of
having them included statically in the target skeleton?

Thanks,
~vsergeev
Ivan Sergeev


On Fri, Jan 3, 2014 at 11:13 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Ivan Sergeev,
>
> On Thu,  2 Jan 2014 17:38:32 -0800, Ivan Sergeev wrote:
> > Add and enable a systemd unit file to bring up / down network with ifup /
> > ifdown, analogous to the skeleton/etc/init.d/S40network init script.
> >
> > Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
> > ---
> >  .../system/multi-user.target.wants/network.service  |  1 +
> >  system/skeleton/etc/systemd/system/network.service  | 21
> +++++++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >  create mode 120000
> system/skeleton/etc/systemd/system/multi-user.target.wants/network.service
> >  create mode 100644 system/skeleton/etc/systemd/system/network.service
>
> We probably want to make that conditional on the type of init system
> that is used, no?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140103/5487751a/attachment.html>
