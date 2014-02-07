From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 7 Feb 2014 22:16:13 +0100
Subject: [Buildroot] [PATCH] linux: don't automatically set
 uevent_helper with mdev /dev management
In-Reply-To: <87ob2i63cg.fsf@dell.be.48ers.dk>
References: <769563a34e142e85ec4c.1391761259@argentina>
 <87wqh6640h.fsf@dell.be.48ers.dk>
 <CAAXf6LV=o61iJVycRW-+4boS08=Ar39-uxgUqj6XoqcbzSHmrA@mail.gmail.com>
 <87ob2i63cg.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWNtuuivOXDhqMbK+3kh6t1vBHCOmU1D-9+PJqi_wjLjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Feb 7, 2014 at 10:05 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>  >> Hmm, but the the coldplug handling with 'mdev -s' afaik doesn't handle
>  >> module or firmware loading, so those features will break from this.
>
>  > Isn't this handled by the installation of the hotplug helper from
>  > S10mdev, after which mdev -s is run?
>
> Yes, if the events happen after that line, but not if they happen
> before.
>
>  > I.e. everything that happened before S10mdev is caught by 'mdev -s'
>  > and everything after is handled by the hotplug helper, right?
>
> No, mdev -s only scans /sys for devices and create the corresponding
> device nodes (already done by devtmpfs) and execute whatever commands
> you have defined, it afaik doesn't handle module load or firmware requests.

When you say 'module load', the only relevant consequence of that is
the creation of nodes in /sys that may need corresponding entries in
/dev right? So this is covered by the S10mdev script, as far as I see.
What else would happen in 'module load' that mdev does not cover?

I'm not familiar enough with firmware requests to talk about that.

However, the kernel configuration says: "This should not be used
today, because usual systems create many events at bootup or device
discovery in a very short time frame. One forked process per event can
create so many processes that it creates a high system load, or on
smaller systems it is known to create out-of-memory situations during
bootup."

So then I wonder, how is it supposed to work for module load and
firmware loading if you can't use this option. Or put another way: are
you sure we need to set the uevent_helper_path for that?

>
>
>  >> I would be interested in knowing why hotplug is so much slower than
>  >> coldplug. Do you have any idea about how many times mdev gets executed
>  >> during bootup?
>  >>
>
>  > No, I don't know. I do know that on one particular arm-based single
>  > core system, the time to enter userspace increased from 2 seconds to
>  > 10 seconds due to this hotplug helper.
>
> Funky. I personally have never used mdev, but that sounds pretty
> extreme.

It's a large increase yes, but it's what we measured.
Another system (4-core powerpc) had about 1-2 seconds increase.

Best regards,
Thomas
