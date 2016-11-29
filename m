From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Nov 2016 09:55:16 +0100
Subject: [Buildroot] Investigating a parallel installation failure
In-Reply-To: <20161129023613.GB4657@tungsten.ozlabs.ibm.com>
References: <20161128234621.0e512742@free-electrons.com>
 <20161129023613.GB4657@tungsten.ozlabs.ibm.com>
Message-ID: <20161129095516.4d54e2c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Nov 2016 13:36:13 +1100, Sam Bobroff wrote:

> I couldn't replicate this, but I tried hacking strace into the process
> so I could see if usb_modeswitch_dispatcher was being deleted during the
> build. It looks like it is, by the C compiler -- presumably removing the
> existing output file before it writes a new one.

And then that makes sense, indeed.

> So you could see an interleaving where Make has seen the file but it's
> deleted either just before, or during, /usr/bin/install. And this can
> happen as long as Make thinks its OK to run those two rules in parallel.
> 
> If that's correct, you could try converting the dependency on
> usb_modeswitch_dispatcher (which, as you point out, isn't really working
> anyway) into an order only dependency (or you could even just delete it
> -- it doesn't seem to do anything necessary unless you're running a
> "make install-static" without having first done a "make static" but
> buildroot does that). This really isn't fixing the whole problem (IMHO
> the makefile is quite broken) but it might hack around it by not forcing
> the unnecessary recompilation thus avoiding the racy delete.

Or we simply use $(MAKE1) to build/install this package, which is
anyway quite small, and avoid the problem altogether. I also agree that
the Makefile is quite broken, and I'm not sure we want to fix it (it
would require a complete rewrite).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
