From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jun 2012 13:55:06 +0200
Subject: [Buildroot] how to repopulate /output/target/lib?
In-Reply-To: <CAJkQPOnh+SqhaV5eZ1YQhVzK2cfmzK=StTVSGZ=P1V0Oxgdi3g@mail.gmail.com>
References: <CAJkQPOnh+SqhaV5eZ1YQhVzK2cfmzK=StTVSGZ=P1V0Oxgdi3g@mail.gmail.com>
Message-ID: <20120625135506.29fcf6c9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aras,

Le Mon, 25 Jun 2012 12:46:50 +0100,
Aras Vaichas <aras.vaichas@gmail.com> a ?crit :

> I understand that output/staging holds all the libraries, but how do
> the correct libraries get copied to output/target? How can I trigger
> this action without having to do a "make clean; make"?

So far, we have no supported mechanism other than "make clean; make" to
rebuild the target root filesystem. That's part of the Buildroot
simplicity: we don't try to support partial rebuilds, because it is
very complicated to get 100% right, and we don't want to support
something that is right 90% of the time, but is known to have an
incorrect behavior 10% of the time.

To answer your question, the libraries are installed in
output/target/{usr/,}lib by:

 * The toolchain installation procedure. This one depends on whether
   you're using the internal, external or crosstool-ng backend for your
   toolchain. This part installs the C library and related basic
   libraries (thread, math, rt, etc.).

 * The package installation steps, which should be replayed if you
   remove .stamp_target_installed files, as you did.

Basically, my suggestions to do what you're trying to do is:

 * Don't use a custom skeleton, do your customization in a post-build
   script, because it gets re-run at every build, while the skeleton
   copy is only done once at the beginning of a clean build;

 * When you make a change to a package, just remove this package build
   directory (rm -rf output/build/<pkg>-<version>). This is generally
   enough to check that the new installation results are correct.

 * Use an external toolchain so that doing "make clean; make" is not
   too painful.

 * Ensure you have a fast enough build machine (i.e, not a slow Windows
   laptop that runs Linux inside a VMWare)

I'm applying all those suggestions, and I'm a fairly happy Buildroot
user :)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
