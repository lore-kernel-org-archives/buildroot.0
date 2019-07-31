From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 00:13:10 +0200
Subject: [Buildroot] [RFC PATCH v4 2/2] iputils: add capability for
 clockdiff, ping, traceroute6
In-Reply-To: <20190731160059.GJ3194@scaer>
References: <20190730213846.7488-1-petr.vorel@gmail.com>
 <20190730213846.7488-2-petr.vorel@gmail.com>
 <20190731160059.GJ3194@scaer>
Message-ID: <20190801001310.644e3dc0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Jul 2019 18:00:59 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > Use cap_net_raw+p (drop +e) as upstream sets that via
> > cap_set_flag(), see https://github.com/iputils/iputils/issues/194  
> 
> So, now we set the capabilities to those exectuables, do they still need
> to be setuid?
> 
> But then, if one really does not want xattr, setuid is still required.

Ah, yes, indeed.

> So, we have no way to express that a file should have either setuid or
> xattrs, except as a big if-block like:
> 
>     ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
>     define IPUTILS_PERMISSIONS
>         /usr/bin/clockdiff    f 0755 0 0 - - - - -
>         |xattr cap_net_raw+p
>     endef
>     else
>     define IPUTILS_PERMISSIONS
>         /usr/bin/clockdiff    f 4755 0 0 - - - - -
>     endef
>     endif
> 
> ... which is what we were trying to avoid in the firstplace...

Yes, but I believe it's the best solution for now, let's keep a
conditional like you're showing here. Which of course makes the change
to makedevs no longer relevant.

I really hope Petr is not going to hate us for all the discussion, back
and forth and change of mind/opinion about this topic :-/

> We could write something like:
> 
>     /usr/bin/clockdiff    f $(MAYBE_SUID)755 0 0 - - - - -
>     |xattr cap_net_raw+p
> 
> Where MAYBE_SUID would be set as:
> 
>     MAYBE_SUID = $(if $(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),0,4)
> 
> But it is starting to be a bit more complex than what you initially
> envisionned, I guess.

Meh, no, please not like this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
