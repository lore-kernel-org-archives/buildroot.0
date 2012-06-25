From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jun 2012 15:10:15 +0200
Subject: [Buildroot] how to repopulate /output/target/lib?
In-Reply-To: <CAJkQPOm=27BykDt-jkfFExR6bSKJhtgK-TUFQbZ=bDkyOi38pA@mail.gmail.com>
References: <CAJkQPOnh+SqhaV5eZ1YQhVzK2cfmzK=StTVSGZ=P1V0Oxgdi3g@mail.gmail.com>
 <20120625135506.29fcf6c9@skate>
 <CAJkQPOm=27BykDt-jkfFExR6bSKJhtgK-TUFQbZ=bDkyOi38pA@mail.gmail.com>
Message-ID: <20120625151015.14bd842b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aras,

Please keep the list Cc'ed for replies.

Le Mon, 25 Jun 2012 13:55:03 +0100,
Aras Vaichas <aras.vaichas@gmail.com> a ?crit :

> > ?* The toolchain installation procedure. This one depends on whether
> > ? you're using the internal, external or crosstool-ng backend for your
> > ? toolchain. This part installs the C library and related basic
> > ? libraries (thread, math, rt, etc.).
> 
> Thank you for this hint. I found the Makefile responsible and I am now
> able to repopulate the entire output/target directory. I had to remove
> output/stamps/ct-ng-toolchain-installed in order to trigger the
> library copying code. I wasn't sure if removing this file would
> retrigger the entire toolchain build so I was wary of removing it.
> 
> To summarise, this is what I do to recreate output/target (reinstall
> all packages) from scratch:
> 
> # find -name .stamp_target_installed | xargs rm
> # rm -rf output/target
> # rm output/build/.root
> # rm output/stamps/ct-ng-toolchain-installed
> # make
> 
> As you mentioned before, Buildroot doesn't support partial rebuilds so
> I don't guarantee what I did will work in 100% of cases, but it
> certainly does make life a little easier. :)

Sure. The thing is that such a workflow might generate an inconsistent
target root filesystem: you reinstall into the target only the
libraries that are enabled now, but if some libraries previously
selected are installed in the staging/ directory, but have been removed
from menuconfig in the mean time, they are no longer installed in the
target, giving you an inconsistent target root filesystem.
> 
> > ?* Ensure you have a fast enough build machine (i.e, not a slow Windows
> > ? laptop that runs Linux inside a VMWare)
> 
> Unfortunately that is what I have been given for my development, so
> building the toolchain is a day lost.

You should request a more powerful machine.

> I have seen some previous posts about building two copies of Buildroot -
> one for the toolchain, the other for development. I think I will re-read
> them and implement an external toolchain.

If you use the ct-ng backend, then just use Crosstool-NG outside of
Buildroot to generate your toolchain, and import it into Buildroot
using the external toolchain backend.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
