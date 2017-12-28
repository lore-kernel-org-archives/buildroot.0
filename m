From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Dec 2017 18:20:30 +0100
Subject: [Buildroot] [RFC 0/2] Handle conflicting files with Busybox
In-Reply-To: <20171228180412.34c81ce2@windsurf.home>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171228170017.GE3428@scaer>
 <20171228180412.34c81ce2@windsurf.home>
Message-ID: <20171228172030.GF3428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-28 18:04 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> Thanks for the feedback.
> 
> On Thu, 28 Dec 2017 18:00:17 +0100, Yann E. MORIN wrote:
> 
> > > This RFC series is an attempt at solving this problem for Busybox. I
> > > have not fixed all packages yet: since it is a very boring task to do,
> > > I wanted to first get some feedback on whether the approach looks
> > > reasonable or not.
> > > 
> > > If the feedback is positive, I'll go ahead and submit proper patches
> > > that fix all packages that conflict with Busybox.  
> > 
> > As I previously said on IRC: I do not much like the big list we will now
> > have to maintain; that's sad...
> 
> Even though I agree it's not nice to maintain, I think it's unavoidable
> if we want to solve the overwriting issue.

So that we are on the same line: I do agree with the underlying reason
for the change, yes. I'm just trying to see if there are better ways to
go with that.

> > However, I like the fact that we can get rid of the many dependencies in
> > so many packages here and there. :-)
> > 
> > What I would have suggested, though, is to do what Baruch hinted at: use
> > the noclobber install of Busybox, and then have Busybox depend on all
> > the packages it provides applets for:
> > 
> >     BUSYBOX_DEPENDENCIES = \
> >         $(if $(BR2_PACKAGE_COREUTILS),coreutils) \
> >         $(if $(BR2_PACKAGE_util_LINUX),util-linux) \
> >         etc...
> > 
> > But unfortunately, the noclobber install option is not usable:
> > 
> >   - first, there is no way to cause a noclobber install;
> > 
> >   - second, the noclobber is not accounted for in the case shell
> >     wrappers are used.
> > 
> > So, I'm afraid we don't have much choice but to do as your series
> > does...
> 
> There is however one remaining debate: my patch series tweaks the
> Busybox configuration to not build the support for applets for which
> the functionality is provided by a full-featured program. But Baruch
> didn't like this tweaking of the Busybox configuration, and would
> prefer to not install the symlinks, and leave the Busybox configuration
> unchanged (which means we have lots of Busybox applets built into
> Busybox that are not really used on the target).
> 
> Do you have an opinion on this specific topic ?

I prefer they be explicitly disabled as you did.

First, because this is a security issue that there is dead code: these
applets are still usable by calling 'busybox foo' for example, and that
is a security issue.

Second, yes it gains a bit of space. But that is not so compelling,
becasue if you already have the big buddies enabled, a few kB lost
inBusybox is not that much of a burden anyway...

> Another question is whether we want to have this logic centralized in
> busybox.mk, or spread into the packages that provide the full-featured
> variants of the applets ? The latter may have some variable definition
> ordering issues though.

Please leave it centralised in busybox.mk.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
