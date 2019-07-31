From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 1 Aug 2019 00:24:01 +0200
Subject: [Buildroot] [RFC PATCH v4 2/2] iputils: add capability for
 clockdiff, ping, traceroute6
In-Reply-To: <20190801001310.644e3dc0@windsurf.home>
References: <20190730213846.7488-1-petr.vorel@gmail.com>
 <20190730213846.7488-2-petr.vorel@gmail.com>
 <20190731160059.GJ3194@scaer>
 <20190801001310.644e3dc0@windsurf.home>
Message-ID: <20190731222400.GB5083@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann,

I've sent v5 before your mail, sorry for forgetting to Cc you.
> Hello,

> On Wed, 31 Jul 2019 18:00:59 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > > Use cap_net_raw+p (drop +e) as upstream sets that via
> > > cap_set_flag(), see https://github.com/iputils/iputils/issues/194  

> > So, now we set the capabilities to those exectuables, do they still need
> > to be setuid?

> > But then, if one really does not want xattr, setuid is still required.

> Ah, yes, indeed.

> > So, we have no way to express that a file should have either setuid or
> > xattrs, except as a big if-block like:

> >     ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
> >     define IPUTILS_PERMISSIONS
> >         /usr/bin/clockdiff    f 0755 0 0 - - - - -
> >         |xattr cap_net_raw+p
> >     endef
> >     else
> >     define IPUTILS_PERMISSIONS
> >         /usr/bin/clockdiff    f 4755 0 0 - - - - -
> >     endef
> >     endif

> > ... which is what we were trying to avoid in the firstplace...

> Yes, but I believe it's the best solution for now, let's keep a
> conditional like you're showing here. Which of course makes the change
> to makedevs no longer relevant.
Sure :). So merge the original version [1], related only to iputils?

> I really hope Petr is not going to hate us for all the discussion, back
> and forth and change of mind/opinion about this topic :-/
No, not at all :).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1138055/
