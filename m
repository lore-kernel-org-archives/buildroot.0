From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 11 Jun 2015 13:39:01 +0300
Subject: [Buildroot] default getty port
Message-ID: <1434019141.26331.141.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Yesterday suddenly discovered the commit 131300e6f1d0 (system: run getty
on boot console by default) in the mainline.

I tried to play with the patch a bit and got confused. It would be nice
if someone could clarify a situation.

(In our environment we are using something like
console=tty1 console=ttyS0,115200n8
as kernel command line with the specific patch to
system/skeleton/inittab to always run getty on /dev/tty1.)

First of all, /dev/tty0 (as proposed in the example in the commit
message) has special meaning in Linux. You can't just use it as a
console since it refers to current foreground console in the kernel.
Moreover, it has no record in the /etc/securetty (and of course it
shouldn't be there by security reasons!). So, we have to use any virtual
console but tty0.

Next thing is /dev/console as parameter to getty. I don't know if it
supposed to work on some configurations, but in our case it makes things
weird: when I type 'root' + Enter on the local (tty1) console I got one
more 'r' printed and password is asked. Looks like racy input
between /dev/console and /dev/tty1 since it is the same at that point.

I also am not sure about validity of B0. I didn't check actual kernel
code, though it might go down to the driver level where not all drivers
behave the same when got B0.

So, for my opinion the patch brought more problems than tries to solve.

I would be happy to understand the background deeply and correct myself.

-- 
Andy Shevchenko <andriy.shevchenko@intel.com>
Intel Finland Oy
