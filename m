From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 18 Jun 2019 08:59:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/iputils: move binaries to the
 location also used by Busybox
In-Reply-To: <20190618084657.64bd21e4@windsurf>
References: <20190616200919.4378-1-thomas.petazzoni@bootlin.com>
 <20190617202402.GA8498@x230> <20190618084657.64bd21e4@windsurf>
Message-ID: <20190618065929.GC8350@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Hello Petr,

> Thanks for the feedback.

> On Mon, 17 Jun 2019 22:24:03 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > > iputils installs several programs that are also implemented as applets
> > > in Busybox. Two of these (arping and tftpd) are installed by iputils
> > > in /bin, while Busybox installs them in /usr/sbin, causing both to be  
> >      ^
> > I guess you mean /usr/bin

> Gah, indeed. Unfortunately, the v2 of my patch has already been applied
> by Arnout, and it has the same issue.
Yes, I've noticed yesterday after sending review :).
But this is just a tiny detail.

> > Although I'm not keen on changing binary default location,
> > this is simple straightforward solution. Alternative would be to disable busybox
> > config CONFIG_ARPING (with support/kconfig/merge_config.sh), but that'd be too
> > complicated. Thus ack

> Adjusting the Busybox configuration is not the choice we have made to
> solve this problem. Instead, the way we have chosen to solve the
> conflict between Busybox applets and the "full-blown" variant of the
> same tools is by:

>  - Making "busybox" depend on all packages that provide the full-blown
>    variants, so that those full-blown variants are built/installed
>    before Busybox.

>  - Ensure the Busybox installation process does not overwrite the
>    full-blown variants when they are already installed.

> This ensures that at the end of the build, if a full-blown variant is
> installed, it takes precedence over the Busybox applet.

> The drawback is while the Busybox symlink is not installed, the actual
> code is present in the Busybox binary.

Thanks for an explanation. Having a bit bigger binary it's not a big deal.
If this is a problem for any reason, fortunately user can supply it's own
busybox config.
I guess you took this direction because it's much simpler than messing with
busybox config (the solution I suggested).

> > Just small research about iputils install directories.
> > busybox keeps mixed dirs /usr/{s,}bin and /{s,}bin (locations which were before
> > usrmerge concept), ping is indeed in /bin [1].
> > Debian chose also mixing /usr/{s,}bin and /{s,}bin [2]

> > But I'm concern about /{usr/,}/bin vs. /{usr/,}/sbin.
> > iputils before starting to use  meson didn't have any default location.
> > There was iputils.spec file [3] (now deleted), which suggested some locations,
> > but was marked as for testing purposes only. It had different paths than busybox
> > and Debian use. I guess I have to accept that there was no consensus and
> > therefore are differences in paths across both upstreams and distros.

> Due to the way we handle the Busybox applet vs. full-blown variant
> conflict (detailed above), we really need the full-blown variant to be
> installed at the same location as the corresponding Busybox applet.
Understand.

> Thomas

Kind regards,
Petr
