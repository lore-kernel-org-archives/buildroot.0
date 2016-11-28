From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 23:46:21 +0100
Subject: [Buildroot] Investigating a parallel installation failure
Message-ID: <20161128234621.0e512742@free-electrons.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hello,

Tonight, I've been trying to investigate a build failure of
usb_modeswitch that occurred three times:

  http://autobuild.buildroot.net/results/06e/06e6f510415933b55eb8814284f63109dace3402/build-end.log
  http://autobuild.buildroot.net/results/f3f/f3fa30a11b68721b81b5696b089f4a7528d580ad/build-end.log
  http://autobuild.buildroot.net/results/b11/b11df0218500ff29c2a067f58f196a7b26c027f0/build-end.log

Every time, the installation fails with:

install: cannot stat `usb_modeswitch_dispatcher': No such file or directory

What we can see is that usb_modeswitch_dispatcher is first built during
the build step:

[3m>>> usb_modeswitch 2.3.0 Building[23m
[...]
/home/peko/autobuild/instance-1/output/host/usr/bin/i586-linux-gcc dispatcher.c  jim/libjim.a -Ijim -o usb_modeswitch_dispatcher -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_GNU_SOURCE -Wall -I.
[...]

And then again during the install step, after which it tries to be
installed:

[3m>>> usb_modeswitch 2.3.0 Installing to target[23m
[...]
/home/peko/autobuild/instance-1/output/host/usr/bin/i586-linux-gcc dispatcher.c  jim/libjim.a -Ijim -o usb_modeswitch_dispatcher -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os 
[...]
install -D --mode=755 usb_modeswitch_dispatcher /home/peko/autobuild/instance-1/output/target/usr/sbin/usb_modeswitch_dispatcher
install: cannot stat `usb_modeswitch_dispatcher': No such file or directory

The reason why it gets rebuilt is because, in the Makefile:

===

dispatcher-static: jim/libjim.a dispatcher.c usb_modeswitch.string
        $(CC) dispatcher.c $(LDFLAGS) jim/libjim.a -Ijim -o usb_modeswitch_dispatcher $(CFLAGS)

install-static: dispatcher-static install-common

===

Since dispatcher-static is a phony target, it gets rebuilt everytime it
is depended on, which explains why usb_modeswitch_dispatcher is built
both at build time and install time.

However, it does not explain why we have this race. What might explain
it, but I'm not sure to fully understand is that 'install-common' is
defined as follows:

===

install-common: $(PROG) usb_modeswitch_dispatcher
        install -D --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
        install -D --mode=755 usb_modeswitch.sh $(UDEVDIR)/usb_modeswitch
        install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
        install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
        install -D --mode=644 usb_modeswitch_dispatcher.1 $(MANDIR)/usb_modeswitch_dispatcher.1
        install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher

===

So install-common depends on the non-phy usb_modeswitch_dispatcher
target... which in fact doesn't exist anywhere in the Makefile! So if
the usb_modeswitch_dispatcher file has not been already produced, this
should lead to a "No such target" error message from make (which is not
what we get).

So I can see that the dispatcher-static and install-common targets get
executed simultaneously, but it should rather trigger a "No such
target" message for the missing usb_modeswitch_dispatcher rather than a
failure during the installation of usb_modeswitch_dispatcher itself.

Anyone understands what's going on here?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
