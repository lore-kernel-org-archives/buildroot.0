From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 18:33:08 +0200
Subject: [Buildroot] [PATCH 0/4] Sanetize packages version
In-Reply-To: <da51251f-4903-fd0c-0e49-7cb0d9f5ea3c@mind.be>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612092624.1ca7836d@windsurf>
 <627e16bb-a937-a00e-7d03-7373c69433ca@bootlin.com>
 <20190612165020.441113ee@windsurf>
 <a5f09272-46f4-5092-8f4f-12d319b7266c@bootlin.com>
 <da51251f-4903-fd0c-0e49-7cb0d9f5ea3c@mind.be>
Message-ID: <20190623183308.3bfbc24d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jun 2019 22:32:29 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > - android-tools:        4.2.2+git20130218
> > The downloaded version is fetch from launchpad, the RM version
> > corresponds to the android version because sources for this tool are not
> > distributed alone.  
> 
>  I wonder why we're using this launchpad version instead of the upstream
> version. Maybe the original contributor (a certain Thomas P) remembers that?

The upstream android-tools from Google doesn't have any reasonable
build system: it only has a bunch of Android.mk, which requires the
entire Android stuff to be pulled in to be used. The Debian/Ubuntu
version has an alternate build system with a few makefiles that get the
job done.

> > - bandwidthd:           2.0.1-auto-r11
> > The downloaded version is not the original bandwithd but a fork that
> > uses automake, this fork appends -auto-rXX to the actual version.  
> 
>  We should keep the suffix then.
> 
>  Actually, there's another fork under NethServer that seems a little more
> active. It's also used by OpenWrt.
> 
>  But the sourceforge repo that hasn't seen activity in 15 years that
> release-monitoring refers to is definitely not OK :-)

Perhaps we should register a separate bandwidthd-auto project in
release-monitoring.org that tracks the bandwidthd fork we're using, and
create a bandwidthd -> bandwidthd-auto mapping in RM.

> > - imx-alsa-plugins:     rel_imx_4.9.x_1.0.0_ga
> > - imx-mkimage:          rel_imx_4.14.78_1.0.0_ga
> > I The 4.9.x seems to be related to freescale but I'm not sure about the
> > *_ga suffix.  
> 
>  The 4.9.x / 4.14.78 is the kernel version; the 1.0.0 is the freescale release
> on top of that. Obviously these packages really have nothing to do with the
> kernel version, but they distribute everything as a single SDK and the kernel
> version is the anchor.

Most of these vendor-specific packages often have very weird version
numbering, I'm not sure it will be easy for RM to track these. To me,
such packages are not really the priority of things we want to
check/monitor with RM.

> > - luarocks fetched packages: luasql-0.2.2.1-1
> > A large amount of lua packages have a -1 suffix. This suffix is not
> > present on release-monitoring, so I think we should remove it.
> > The thing is: the `luarocks-package` function seems to use the
> > <pkg>_VERSION variable.
> > Remove suffix for those packages will probably require to modify a bit
> > the way luarocks packages are handle.  
> 
>  Hm, good point... The -1 is the packaging version. Sometimes it needs to be
> repackaged and you get a -2. And for some reason, sometimes it's -0.
> 
>  I don't see a convenient way to work around this...

The only solution that I can see is changing the luarocks infra to use
something else than <pkg>_VERSION, like <pkg>_LUAROCKS_VERSION, and
have packages provide this variable.

> > If we achieve to modify these packages, the only packages left would be
> > those with a commit id as version.  
> 
>  Commit ID is no problem.

Agreed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
