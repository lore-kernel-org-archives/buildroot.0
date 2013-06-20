From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 18:42:22 +0200
Subject: [Buildroot] Xenomai package not extracted in time
In-Reply-To: <02de01ce6dd0$bb38f3a0$31aadae0$@spamcop.net>
References: <02de01ce6dd0$bb38f3a0$31aadae0$@spamcop.net>
Message-ID: <20130620184222.37b73ce2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gpontis at spamcop.net,

On Thu, 20 Jun 2013 09:10:50 -0700, gpontis at spamcop.net wrote:

> I'm working with buildroot 2013.05, ARM, and Xenomai 2.6.2.1. As part of
> making Xenomai go, there is a kernel patch. I keep that patch under my board
> directory and point to it with BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH. The
> build is failing because a script (from Xenomai) that is used to apply this
> patch is not available. It is not available because the Xenomai package has
> not been extracted yet. If I manually extract the Xenomai package once then
> all goes ahead smoothly. A few versions back of Xenomai and buildroot, this
> worked automatically. I don't know if I broke something or if the BR
> environment has somehow changed. But can someone offer guidance on how to
> fix it so he manual step is not necessary ?

Ok, I see where the problem is. The Xenomai Linux extension code in
linux/linux-ext-xenomai.mk properly makes the 'linux' package depends
on the 'xenomai' package. However, the dependencies are only handled at
the configure step of all packages. I.e, before the Linux configuration
starts, you have the guarantee that Xenomai will have been built (and
therefore extracted).

However, in the case of the Xenomai extension, the Xenomai package is
needed during the *patch* step of Linux, to ensure that the
prepare-kernel.sh script of Xenomai is available to patch the kernel.

And guess what? The reason why it's broken now is because we changed
the dependency handling to support... RTAI!

See commit a473a616d27e46951a23d90249a31b08006098bf ("package: change
ordering of steps").

Maybe I don't have both of my eyes fully opened, but reading the RTAI
stuff, I don't see how it can work. It pulls "rtai-patch" as a
dependency of Linux, and then uses RTAI patches in the patch step of
Linux. But the dependency 'rtai-patch' is only guaranteed to be pulled
in before 'linux-configure' starts, not before 'linux-patch' starts.
How can this stuff work?

I guess this needs some testing and investigation :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
