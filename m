From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 7 Feb 2014 22:00:48 +0100
Subject: [Buildroot] [PATCH] linux: don't automatically set
 uevent_helper with mdev /dev management
In-Reply-To: <87wqh6640h.fsf@dell.be.48ers.dk>
References: <769563a34e142e85ec4c.1391761259@argentina>
 <87wqh6640h.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LV=o61iJVycRW-+4boS08=Ar39-uxgUqj6XoqcbzSHmrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> schreef:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> > When mdev /dev management is chosen in the buildroot configuration, the
> > Linux configuration is updated automatically to set option
> > CONFIG_UEVENT_HELPER_PATH to "/sbin/mdev". However, the help text of this
> > option explicitly recommends not setting this option due to large
> > performance impact during boot (experienced first hand by the reporter ?nd
> > author).
>
> > The mdev startup script S10mdev already sets the helper during userspace
> > boot, which will make sure mdev is working correctly.
>
> > Fixes bug #6596: https://bugs.busybox.net/show_bug.cgi?id=6596
>
> > Reported-by: Andreas Koop <andreas.koop@zf.com>
> > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
>Hmm, but the the coldplug handling with 'mdev -s' afaik doesn't handle
>module or firmware loading, so those features will break from this.

Isn't this handled by the installation of the hotplug helper from
S10mdev, after which mdev -s is run?
I.e. everything that happened before S10mdev is caught by 'mdev -s'
and everything after is handled by the hotplug helper, right?

>
>I would be interested in knowing why hotplug is so much slower than
>coldplug. Do you have any idea about how many times mdev gets executed
>during bootup?
>

No, I don't know. I do know that on one particular arm-based single
core system, the time to enter userspace increased from 2 seconds to
10 seconds due to this hotplug helper.

Best regards,
Thomas
