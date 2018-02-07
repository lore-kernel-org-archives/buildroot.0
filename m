From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Feb 2018 13:36:01 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/gdb: rework dependency for
 C++11
In-Reply-To: <20180207095828.GA2464@scaer>
References: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
 <20180205211015.26819-2-thomas.petazzoni@bootlin.com>
 <20180207095828.GA2464@scaer>
Message-ID: <20180207133602.36f7646a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 7 Feb 2018 10:58:28 +0100, Yann E. MORIN wrote:

> >  - In Config.in, we handle gdb more like a regular target package,
> >    with a Config.in comment when its dependencies are not met. A
> >    hidden boolean BR2_PACKAGE_GDB_NEEDS_CXX11 indicates when the
> >    currently selected version requires C++11. Based on that, we show
> >    the Config.in comment, and add the proper dependencies to
> >    BR2_PACKAGE_GDB. It is worth mentioning that
> >    BR2_PACKAGE_GDB_NEEDS_CXX11 is intentionally created to be !7.10 &&
> >    !7.11 && !7.12 instead of 8.0, because we will gradually add more
> >    C++11-requiring versions, and remove non-C++11-requiring versions.  
> 
> Nice refactoring. :-)

Thanks!


> > +config BR2_PACKAGE_GDB_NEEDS_CXX11
> > +	bool
> > +	default y
> > +	depends on !BR2_GDB_VERSION_7_10
> > +	depends on !BR2_GDB_VERSION_7_11
> > +	depends on !BR2_GDB_VERSION_7_12  
> 
> I would have expected that the various versions would select this,
> i.e. something like:
> 
>     config BR2_PACKAGE_GDB_NEEDS_CXX11
>         bool
> 
> 
>     config BR2_GDB_VERSION_7_10
>         bool "7.10"
> 
>     config BR2_GDB_VERSION_8_0
>         bool "8.0"
>         select BR2_PACKAGE_GDB_NEEDS_CXX11

But this doesn't work; The BR2_GDB_VERSION_8_0 symbol is only enabled
if we build a host variant of gdb. If we build just the target
variant, then no version is selected at all, and therefore this symbol
would not be selected.

So in fact, even my code is slightly wrong: it becomes correct once the
default version of gdb is 8.0, but it is wrong when the default version
is still 7.12 (which is the case at the time my patch is introduced).

Indeed, when my patch is introduced, 7.12 is the default gdb version,
used if you build only the target gdb. When you build just the target
gdb version, BR2_GDB_VERSION_7_12 is not enabled, and therefore
BR2_PACKAGE_GDB_NEEDS_CXX11=y even if it's not true.

So I should adjust that. I could use the BR2_GDB_VERSION string
option, which exists regardless of whether host gdb is enabled or not.
Or I could rely on BR2_PACKAGE_HOST_GDB somehow.

Meh. This is crappy :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
