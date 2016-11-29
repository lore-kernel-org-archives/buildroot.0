From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 29 Nov 2016 13:36:13 +1100
Subject: [Buildroot] Investigating a parallel installation failure
In-Reply-To: <20161128234621.0e512742@free-electrons.com>
References: <20161128234621.0e512742@free-electrons.com>
Message-ID: <20161129023613.GB4657@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

On Mon, Nov 28, 2016 at 11:46:21PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Tonight, I've been trying to investigate a build failure of
> usb_modeswitch that occurred three times:
> 
>   http://autobuild.buildroot.net/results/06e/06e6f510415933b55eb8814284f63109dace3402/build-end.log
>   http://autobuild.buildroot.net/results/f3f/f3fa30a11b68721b81b5696b089f4a7528d580ad/build-end.log
>   http://autobuild.buildroot.net/results/b11/b11df0218500ff29c2a067f58f196a7b26c027f0/build-end.log
> 
> Every time, the installation fails with:
> 
> install: cannot stat `usb_modeswitch_dispatcher': No such file or directory
> 
> What we can see is that usb_modeswitch_dispatcher is first built during
> the build step:
> 
> [3m>>> usb_modeswitch 2.3.0 Building[23m
> [...]
> /home/peko/autobuild/instance-1/output/host/usr/bin/i586-linux-gcc dispatcher.c  jim/libjim.a -Ijim -o usb_modeswitch_dispatcher -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_GNU_SOURCE -Wall -I.
> [...]
> 
> And then again during the install step, after which it tries to be
> installed:
> 
> [3m>>> usb_modeswitch 2.3.0 Installing to target[23m
> [...]
> /home/peko/autobuild/instance-1/output/host/usr/bin/i586-linux-gcc dispatcher.c  jim/libjim.a -Ijim -o usb_modeswitch_dispatcher -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os 
> [...]
> install -D --mode=755 usb_modeswitch_dispatcher /home/peko/autobuild/instance-1/output/target/usr/sbin/usb_modeswitch_dispatcher
> install: cannot stat `usb_modeswitch_dispatcher': No such file or directory
> 
> The reason why it gets rebuilt is because, in the Makefile:
> 
> ===
> 
> dispatcher-static: jim/libjim.a dispatcher.c usb_modeswitch.string
>         $(CC) dispatcher.c $(LDFLAGS) jim/libjim.a -Ijim -o usb_modeswitch_dispatcher $(CFLAGS)
> 
> install-static: dispatcher-static install-common
> 
> ===
> 
> Since dispatcher-static is a phony target, it gets rebuilt everytime it
> is depended on, which explains why usb_modeswitch_dispatcher is built
> both at build time and install time.
> 
> However, it does not explain why we have this race. What might explain
> it, but I'm not sure to fully understand is that 'install-common' is
> defined as follows:
> 
> ===
> 
> install-common: $(PROG) usb_modeswitch_dispatcher
>         install -D --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
>         install -D --mode=755 usb_modeswitch.sh $(UDEVDIR)/usb_modeswitch
>         install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
>         install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
>         install -D --mode=644 usb_modeswitch_dispatcher.1 $(MANDIR)/usb_modeswitch_dispatcher.1
>         install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
> 
> ===
> 
> So install-common depends on the non-phy usb_modeswitch_dispatcher
> target... which in fact doesn't exist anywhere in the Makefile! So if
> the usb_modeswitch_dispatcher file has not been already produced, this
> should lead to a "No such target" error message from make (which is not
> what we get).
> 
> So I can see that the dispatcher-static and install-common targets get
> executed simultaneously, but it should rather trigger a "No such
> target" message for the missing usb_modeswitch_dispatcher rather than a
> failure during the installation of usb_modeswitch_dispatcher itself.
> 
> Anyone understands what's going on here?
> 
> Thomas

I couldn't replicate this, but I tried hacking strace into the process
so I could see if usb_modeswitch_dispatcher was being deleted during the
build. It looks like it is, by the C compiler -- presumably removing the
existing output file before it writes a new one.

So you could see an interleaving where Make has seen the file but it's
deleted either just before, or during, /usr/bin/install. And this can
happen as long as Make thinks its OK to run those two rules in parallel.

If that's correct, you could try converting the dependency on
usb_modeswitch_dispatcher (which, as you point out, isn't really working
anyway) into an order only dependency (or you could even just delete it
-- it doesn't seem to do anything necessary unless you're running a
"make install-static" without having first done a "make static" but
buildroot does that). This really isn't fixing the whole problem (IMHO
the makefile is quite broken) but it might hack around it by not forcing
the unnecessary recompilation thus avoiding the racy delete.

e.g.

--- a/Makefile	2016-11-29 13:29:55.238791205 +1100
+++ b/Makefile	2016-11-29 13:30:47.967090359 +1100
@@ -89,11 +89,11 @@
 
 install: install-script
 
-install-script: dispatcher-script install-common
+install-script: install-common | dispatcher-script
 
-install-shared: dispatcher-shared install-common
+install-shared: install-common | dispatcher-shared
 
-install-static: dispatcher-static install-common
+install-static: install-common | dispatcher-static
 
 uninstall:
 	$(RM) $(SBINDIR)/usb_modeswitch

Good luck,
Sam.
