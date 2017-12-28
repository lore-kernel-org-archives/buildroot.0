From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Dec 2017 20:11:13 +0100
Subject: [Buildroot] [RFC 0/2] Handle conflicting files with Busybox
In-Reply-To: <20171228180159.ffefqkowcxhegl7g@tarshish>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171228170017.GE3428@scaer>
 <20171228180412.34c81ce2@windsurf.home>
 <20171228172030.GF3428@scaer>
 <20171228180159.ffefqkowcxhegl7g@tarshish>
Message-ID: <20171228191113.GG3428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, Thomas, All,

On 2017-12-28 20:01 +0200, Baruch Siach spake thusly:
> On Thu, Dec 28, 2017 at 06:20:30PM +0100, Yann E. MORIN wrote:
> > On 2017-12-28 18:04 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> > > There is however one remaining debate: my patch series tweaks the
> > > Busybox configuration to not build the support for applets for which
> > > the functionality is provided by a full-featured program. But Baruch
> > > didn't like this tweaking of the Busybox configuration, and would
> > > prefer to not install the symlinks, and leave the Busybox configuration
> > > unchanged (which means we have lots of Busybox applets built into
> > > Busybox that are not really used on the target).
> > > 
> > > Do you have an opinion on this specific topic ?
> > 
> > I prefer they be explicitly disabled as you did.
> 
> As I said earlier, I don't like this heavy handed modification of the Busybox 
> configuration. I'm not sure how robust this solution would be, as there might 
> be unintended consequences. Kconfig 'select' and 'depends' contribute to that. 
> I prefer to keep config modifications to minimum.

Agreed that the 'select' things in busybox' Kconfig could be an issue.
But do we have applets that get select-ed by another?

In current busybox, there is no applet that is select-ed:

    $ git grep -E 'config:[[:space:]]+\<select ' |cut -d : -f 2- |sort -u
    //config:select FEATURE_BZIP2_DECOMPRESS
    //config:se     lect FEATURE_GZIP_DECOMPRESS
    //config:select FEATURE_IP_ADDRESS
    //conf  ig:select FEATURE_IP_LINK
    //config:select FEATURE_IP_NEIGH
    //config:           select FEATURE_IP_ROUTE
    //config:select FEATURE_IP_RULE
    //config:sele       ct FEATURE_IP_TUNNEL
    //config:select FEATURE_SEAMLESS_GZ
    //config:sel        ect FEATURE_SYSLOG
    //config:select LONG_OPTS
    //config:select PLATFORM        _LINUX
    //config:select PLATFORM_LINUX # statfs()
    //config:select PLAT        FORM_LINUX #sysinfo()
    //config:select TLS
    //config:select VOLUMEID

None of those are actual applets.

But OK, there is no guarantee that this will continue to be the case.

As an aside, we currently disable a bunch of Busybox options, of which
only three applets: swapon, swapoff, ash.

> > First, because this is a security issue that there is dead code: these
> > applets are still usable by calling 'busybox foo' for example, and that
> > is a security issue.
> 
> That is no different than the current behaviour.

Indeed not really.

But it's not because we're doing something bad today, that we should
pursue in this direction! ;-)

In the end, my preference is still to do as Thomas proposed...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
