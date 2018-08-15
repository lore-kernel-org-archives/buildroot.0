From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Aug 2018 18:00:39 +0200
Subject: [Buildroot] [PATCH 2/3 v3] linux: kconfig needs host-{flex,
 bison} to build the configurators
In-Reply-To: <20180815141838.0a83993c@windsurf>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
 <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
 <20180814162130.00f55418@windsurf> <20180814152743.GJ7915@scaer>
 <ea46788a-f814-7fc8-b9dd-1ce97a59546c@mind.be>
 <20180815141838.0a83993c@windsurf>
Message-ID: <20180815160039.GA2556@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-15 14:18 +0200, Thomas Petazzoni spake thusly:
> On Wed, 15 Aug 2018 00:50:42 +0200, Arnout Vandecappelle wrote:
> >  My position is that we do indeed need our host flex and bison for everything
> > installed in target/ (which implies everything installed in staging/), but not
> > for things installed in host/. We definitely need it for BR2_REPRODUCIBLE.
> > 
> >  It would also be nice if dependencies.sh could do a version check and accept
> > the system flex/bison if it is the right version, like we do for cmake and tar.
> > 
> >  But both of these wishes make things more complicated, so I'm OK with just
> > keeping all current host-flex/bison dependencies.
> 
> In fact, I think adding flex and bison as mandatory dependencies of the
> system is going to cause too much disruption. All the autobuilders
> would start complaining, all the Travis/Gitlab CI setups would have to
> be adjusted, and everyone building in containers/minimal environments
> will be affected.

Yes, they will be affected. If not today, then later, because at some
point we will also bump to require new versions of componentns. Oh,
wait, we already bumped to gcc-4.4 (even if that is mostly transparent).

So I don't think we should refrain from updating, or adding to, our
requirements just because some people will be affected...

> So instead, I'd like to detect if flex/bison are available on the
> system. If they are available, then we use them for the Linux kernel
> configuration process. If they are not available, we build them.
> 
> Instead of:
>   LINUX_KCONFIG_DEPENDENCIES = host-bison host-flex
> I'd prefer to see:
>   LINUX_KCONFIG_DEPENDENCIES = $(BR2_FLEX_HOST_DEPENDENCY) $(BR2_BISON_HOST_DEPENDENCY)

Yeah, why not. That is easy enough.

> And the usual logic in support/dependencies/ to check for bison/flex.
> This will avoid disrupting all existing setups, and still provide the
> speed-up that we don't need to build flex/bison when doing "make
> linux-menuconfig".

Except we will soon to have to build the toolchain to be able to run
linux-menuconfig anyway... So, the flex/bison build time will not be
noticeable, except for external toolchains.

> > > For the linux kernel and other kconfig-based packages, we don't care
> > > which flex/bison are used, because the resulting binaries are not
> > > installed, unless those packages also generate code eventually installed
> > > in host/, staging/ or target/  
> > 
> >  Note that this means you'll still need host-flex/bison for the kernel, because
> > the kernel may build dtc and that gets installed in host...

But they would not be a LINUX_KCONFIG_DEPENDENCIES, just a plain
LINUX_DEPENDENCIES.

Regards,
Yann E. MORIN.

> Are you sure flex/bison are used when building the DTC copy in the
> Linux kernel ? Indeed we only added host-bison/host-flex as
> dependencies of linux in commit
> 1b9faedf32be26d9c983c573ccd98f57fc6f6569, when kconfig stopped shipping
> its pre-generated files. How could DTC be built before
> 1b9faedf32be26d9c983c573ccd98f57fc6f6569 if it required bison/flex ?
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
