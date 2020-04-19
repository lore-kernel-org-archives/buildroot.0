From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2020 15:24:18 +0200
Subject: [Buildroot] [PATCH v2 3/5] package/dmraid: use modules-load to
 load the kernel module
In-Reply-To: <20200419144903.2a3bbc78@windsurf.home>
References: <20200418221411.1549783-1-unixmania@gmail.com>
 <20200418221411.1549783-4-unixmania@gmail.com>
 <20200419104239.GV5853@scaer>
 <20200419144903.2a3bbc78@windsurf.home>
Message-ID: <20200419132418.GB5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Carlos, All,

On 2020-04-19 14:49 +0200, Thomas Petazzoni spake thusly:
> On Sun, 19 Apr 2020 12:42:39 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Can't we simply have a modules table, like we have the device amd user
> > tables? Something like:
> > 
> >     define DMRAID_MODULES
> >         dm-stuff
> >         dm-blurb
> >         dm-blabla
> >     endef
> > 
> > And then have the package and rootfs infrastructures handle that like
> > the other tables?
> 
> If we're going to do that, then we don't need an infra at all,
> package/dmraid/ can simply contain a file with the list of modules,
> which gets installed to /usr/lib/modules-load.d/.

Right, adding an infra just to copy a file would over-engineering.

> I think the idea here was to avoid maintaining the list of dmraid
> modules, and ensure it is generated automatically from the list of
> installed modules. But even that is not guaranteed to work 100%, for
> example if one day dmraid adds a module that doesn't match the
> dm[_-]mod.ko* expression.

But suddenly, it strikes me as odd that the dmraid package has to list
the modules built by the kernel.

Those modules should be auto-loaded on-demand, no?

For dmraid, we may load just the main module, dm-mod, as was done so
far, and leave to the user the responsibility to provide a module file
to load whatever exact module they need?

I would be OK for a long list, but this complex code repeated over and
over again for each package that needs to load modules, is just ugly to
me...

Also, this created files during the target-finalize step, and so those
files are not accounted to the package that installed them.

In the end, I guess such a functionality is mostly useful for those
out-of-tree modules that do not behave properly, and need manual
loading. In which case, those packages know what modules to list, and
they can do so during the installation step (directly or as part of a
post-install hook). Using target-finalize is not so nice...

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
