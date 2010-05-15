From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 15 May 2010 14:09:11 +0000 (UTC)
Subject: [Buildroot] endian issue
References: <201005151547.02656.korgull@home.nl>
Message-ID: <hsm9u7$759$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-05-15, Marcel <korgull@home.nl> wrote:

> I'm using an Atmel sam9g45 using buildroot with linux 2.6.33.
>
> I currently have most of my things working but run into an issue
> which is endian related.
>
> My driver outputs it's data in big-endian mode (ADC data).

Oops. The 9g45 is a little-endian part.

> This is fine with me.

Apparently not, since you're complaining about how it breaks things.  ;)

> I added a package to buildroot with my own software that talks to the
> driver. This package than transfers the results either over ethernet,
> usb or rs232. This all works great as long as I don't perform any
> calculations in the package that I added.

That's because your processor is running in little-endian mode.  Doing
calculations on big-endian data using a little-endian part (or vice
versa) doesn't work.

> When I do so, all data will be messed up and I'm sure it's related to
> endiannes.
n
Indeed it is.

> I think my package is compiled in little-endian mode

I would hope so, since you're running it on a little-endian part.

> and I'm quite sure this is the issue.

The issue is your driver.  Change your driver to return data in the
format expected by your processor (that's little-endian in the case of
the 9g45). Then use standard macros (hton(), htons(), htonl()) to
convert data to "network order" before you ship it out via Ethernet or
USB.

[Don't ask me why Atmel chose little-endian when they designed the
AT91 peripherals.  For anything with a network interface, big-endian
makes a lot more sense to me.  But that debate has been going on for
40 years...]

> I did some byte swapping to proof it's the issue and this byte
> swapping makes things fine. 
>
> Is there any way to compile my package in big-endian mode from
> buildroot ?

Yes.

But doing so will result in object files that don't work.  In fact
you won't even be able to link them.

> Or is there another way I should force this ?

No, you shouldn't force this.  You should fix your driver.  Really.

-- 
Grant
