From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 18 Feb 2014 11:03:33 +0100
Subject: [Buildroot] [PATCH 1/2] udev: update udev to new virtual
 package infra.
In-Reply-To: <20140217153745.1e5683e9@skate>
References: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1392632536-16714-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140217114906.5b6aab4a@skate> <20140217143311.GA4920@pc-eric>
 <20140217153745.1e5683e9@skate>
Message-ID: <20140218100331.GA6731@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, Feb 17, 2014 at 03:37:45PM +0100, Thomas Petazzoni wrote:

> > With the <foo>_CONFIGURE_CMDS method, we go through all the dummy steps, and
> > this is very verbose:
> >
> >   >>> udev undefined Extracting
> >   >>> udev undefined Patching
> >   >>> udev undefined Configuring
> >   echo "No Udev implementation selected. Configuration error."
> >   No Udev implementation selected. Configuration error.
> >   exit 1
> >   make: *** [/home/eric/build/elebihan/demo-systemd/arm/build/udev-undefined/.stamp_configured] Erreur 1
> >
> > With the pure Makefile version, the error message is clearer:
> >
> >   package/udev/udev.mk:11: *** No Udev implementation selected. Configuration error. Stop.
>
> Yes, I believe this is better. And the message is given at the very
> beginning of the build, not when udev starts to be built, which is also
> nicer.
I've made some further testing and unfortunately, the pure "make" solution
does not work. The test on <foo>_DEPENDENCIES is performed when the Makefile
is evaluated, whether <foo> virtual package is selected or not.

If virtual package <foo> is not selected, <foo>_DEPENDENCIES will be empty, so
the test is true and the error message is displayed. That's not what we want.

Using <foo>_CONFIGURE_CMDS, the test will only be performed if the package is
selected.

So, I'll stick with the current method (I'll had some '@' to silence the shell
commands though).

Best regards,
ELB
