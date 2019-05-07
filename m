From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 May 2019 22:40:18 +0200
Subject: [Buildroot] [RFC PATCH] package/util-linux: build libraries as
 a separate package
In-Reply-To: <20190507215424.791e69d3@windsurf>
References: <20190507165158.10427-1-unixmania@gmail.com>
 <20190507215424.791e69d3@windsurf>
Message-ID: <20190507204018.GH6887@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-05-07 21:54 +0200, Thomas Petazzoni spake thusly:
> Hello Carlos,
> 
> On Tue,  7 May 2019 13:51:58 -0300
> unixmania at gmail.com wrote:
> 
> > The findmount and lsblk utilities need udev to work correctly but cannot
> > be built with udev support because the packages providing libudev (eudev
> > and systemd) depend on util-linux, creating a chicken-egg problem. Solve
> > it by means of the following changes:
> 
> Thanks a lot for working on this topic. It is obviously becoming a
> nightmare :-/

Indeed, this is not a nice situation.

However, here is what I propose we do

 1- introduce util-linux-libs as you did, with a blind kconfig option
    (i.e. BR2_PACKAGE_UTIL_LINUX_LIBS exists but has no a prompt)
 2- update util-linux to depend on util=linux-libs when it is enabled
 3- change the existing udev providers (eudev and systemd) to depend on
    and select util-linux-libs instead of util-linux

So yes, this means that we end up with the libs installed twice. That
would be reported by the check-uniq-file step.

However, I believe this is really not a problem in fact. chekc-uniq-file
was initially introduced in preparation of top-level parallel build, but
the reason it was introduced is no longer 100% valid, as the trend is
now to install to a per-package target/ dir, and assemble the whole at
the end, in a reproducible order.

And even if check-uniq-files would still be needed, we could teach it to
ignore specific cases, like this util-linux vs. util-linux-libs duality.

So, in case upstream is not amenable to splitting util-linux, or at
least teach it to separate the libs and progs builds, or while waiting
they do it, we can prepare the above.

And when they finally release a version that can build either only libs
or only progs, we'll be ready and we'll just have to adpat both
packages' CONF_OPTS to pass appropriate --enable and --disable flags.

Regards,
Yann E. MORIN.

> > - Add the util-linux-libs package, which provides libblkid, libfdisk,
> >   libmount, libsmartcols and libuuid. It needs a small patch to
> >   install the uuidd.h header, used to build the uuidd utility.
> > - Make util-linux depend on util-linux-libs and build only the programs.
> >   This requires a quite intrusive patch that modifies Makefile.am and
> >   some Makemodule.am files, thus requiring AUTORECONF.
> 
> Could you get in touch with upstream util-linux, expose the problem,
> and see if they would be willing to merge some changes that would help
> building only the programs ?
> 
> The best would of course be for upstream to realize that there is now a
> circular dependency, and that it should be broken up by splitting
> util-linux upstream itself in two separate projects.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
