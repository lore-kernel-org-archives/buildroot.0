From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 11 Jun 2015 13:50:54 +0000
Subject: [Buildroot] default getty port
In-Reply-To: <1434019141.26331.141.camel@linux.intel.com>
References: <1434019141.26331.141.camel@linux.intel.com>
Message-ID: <1434030653.2817.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andy,

On Thu, 2015-06-11 at 13:39 +0300, Andy Shevchenko wrote:
> I tried to play with the patch a bit and got confused. It would be
> nice if someone could clarify a situation.

So let me try to help you here.

> (In our environment we are using something like
> console=tty1 console=ttyS0,115200n8
> as kernel command line with the specific patch to
> system/skeleton/inittab to always run getty on /dev/tty1.)
> 
> First of all, /dev/tty0 (as proposed in the example in the commit
> message) has special meaning in Linux. You can't just use it as a
> console since it refers to current foreground console in the kernel.
> Moreover, it has no record in the /etc/securetty (and of course it
> shouldn't be there by security reasons!). So, we have to use any 
> virtual console but tty0.

Speaking about example in commit message note that it clearly mentions
that the last "console" item will be used for instantiation of getty,
so in the particular example getty will be run on "ttyS3".

> Next thing is /dev/console as parameter to getty. I don't know if it
> supposed to work on some configurations, but in our case it makes 
> things weird: when I type 'root' + Enter on the local (tty1) console 
> I got one more 'r' printed and password is asked. Looks like racy 
> input between /dev/console and /dev/tty1 since it is the same at that
> point.

Hm... probably your problem happens because you select that option and
also have another entry for getty in inittab.

And to make things a bit more clear I'd like to see your /etc/inittab
that is generated with Buildroot (essentially with your
customizations).

If I'm not mistaken behavior that you describe (request for password)
happens if corresponding tty doesn't exist in /etc/securetty list.
Thomas may correct me if I'm wrong here.

> I also am not sure about validity of B0. I didn't check actual kernel
> code, though it might go down to the driver level where not all 
> drivers behave the same when got B0.

Well I cannot answer for all drivers but from what I saw personally it
worked nice. Probably there're exceptions in drivers but it has to be
confirmed I guess.

> So, for my opinion the patch brought more problems than tries to 
> solve.

Let's try to solve your problems first.
And even this patch doesn't work for you there's a simple work-around
with explicit specification of tty device you want to use with getty.

We're talking about default value for getty's tty and I think even if
"console" is not the best option for all but equally ttyS0 doesn't work
well for many of us - there're lots of boards with non-16550 serial
ports.

And if we're talking about regression for devices with ttyS0 and new
default ("console") I would rather add "ttyS0" in defconfigs for
affected devices in Buildroot.

> I would be happy to understand the background deeply and correct 
> myself.

Not sure if my comments make sense but I really tried to help :)

-Alexey
