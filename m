From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 19:41:12 +0200
Subject: [Buildroot] xorg with nodm/xdm init.d script conflicts causes
 blank screen
In-Reply-To: <e18d5ea17ba0b23913db2136db94d67a@smartguide.com.au>
References: <e18d5ea17ba0b23913db2136db94d67a@smartguide.com.au>
Message-ID: <20190913194112.49f3fa68@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Tudor,

Thanks for your report. I'm adding in Cc Bernd who added the Xorg init
script, and Ezequiel Garcia, who contributed the nodm package.

On Fri, 13 Sep 2019 16:24:52 +1000
Tudor Holton <tudor@smartguide.com.au> wrote:

> Hello awesome buildroot people, :-)
> 
> If I select the X.org server BR2_PACKAGE_XSERVER_XORG_SERVER and a 
> display manager like BR2_PACKAGE_NODM, then I get 2 files in 
> /etc/init.d:
> 
> S40xorg which starts the server /usr/sbin/Xorg first and
> S90nodm which then tries to start another copy of Xorg (to call 
> /etc/X11/Xsession and get everything on the display).
> 
> Obviously, this doesn't work because nodm can't start a second X server, 
> and the visual result is a black screen.  The only solution I can see is 
> a post-build script to remove the S40xorg script to disable X and allow 
> nodm to manage X.

So it means that starting /usr/bin/nodm in fact starts another X.org
server. I would have expected S40xorg to start the X.org server, and
then S90nodm to start the display manager inside the X.org server
started by S40xorg, but apparently it's not the case.

> I've tried looking for:
> (a) A way to tell Xorg that nodm is the default application
> (b) A way to tell nodm that an Xorg is already running (the S90nodm 
> script reads /etc/default/* but NODM_XINIT is now ignored and there 
> aren't any other obvious options to nodm)
> (c) To use a different display manager, xdm, but they all seem to insert 
> an init.d file that's in the range S90-S99 and follow the same 
> presumption (that X has not started)

So if all display manager all start their own X.org server instance, it
means that perhaps S40xorg should only be installed if there's no
display manager enabled ?

> What's the best (future-proof) approach to getting a display manager 
> working with X in buildroot?

Bernd, Ezequiel, any suggestion here ?

> P.S. (As an aside, why don't more buildroot init scripts use 
> /etc/default config files?)

Because we need more contributions to make our init scripts consistent
and use /etc/default config files! :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
