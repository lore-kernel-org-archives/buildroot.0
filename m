From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Feb 2018 18:34:41 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/gdb: rework dependency for
 C++11
In-Reply-To: <20180207133602.36f7646a@windsurf>
References: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
 <20180205211015.26819-2-thomas.petazzoni@bootlin.com>
 <20180207095828.GA2464@scaer> <20180207133602.36f7646a@windsurf>
Message-ID: <20180207173440.GA2250@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-02-07 13:36 +0100, Thomas Petazzoni spake thusly:
> On Wed, 7 Feb 2018 10:58:28 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > > +config BR2_PACKAGE_GDB_NEEDS_CXX11
> > > +	bool
> > > +	default y
> > > +	depends on !BR2_GDB_VERSION_7_10
> > > +	depends on !BR2_GDB_VERSION_7_11
> > > +	depends on !BR2_GDB_VERSION_7_12  
> > I would have expected that the various versions would select this,
> > i.e. something like:
> > 
> >     config BR2_PACKAGE_GDB_NEEDS_CXX11
> >         bool
> > 
> > 
> >     config BR2_GDB_VERSION_7_10
> >         bool "7.10"
> > 
> >     config BR2_GDB_VERSION_8_0
> >         bool "8.0"
> >         select BR2_PACKAGE_GDB_NEEDS_CXX11
> 
> But this doesn't work; The BR2_GDB_VERSION_8_0 symbol is only enabled
> if we build a host variant of gdb. If we build just the target
> variant, then no version is selected at all, and therefore this symbol
> would not be selected.

Gah, I missed that...

> So in fact, even my code is slightly wrong: it becomes correct once the
> default version of gdb is 8.0, but it is wrong when the default version
> is still 7.12 (which is the case at the time my patch is introduced).
> 
> Indeed, when my patch is introduced, 7.12 is the default gdb version,
> used if you build only the target gdb. When you build just the target
> gdb version, BR2_GDB_VERSION_7_12 is not enabled, and therefore
> BR2_PACKAGE_GDB_NEEDS_CXX11=y even if it's not true.
> 
> So I should adjust that. I could use the BR2_GDB_VERSION string
> option, which exists regardless of whether host gdb is enabled or not.
> Or I could rely on BR2_PACKAGE_HOST_GDB somehow.
> 
> Meh. This is crappy :)

OK, I think I have an idea about all this mess... But since I can have
pretty weird ideas, I make no promise that it will materialise into
something usefull...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
