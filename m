From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jan 2019 12:51:52 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/waf: add a blind
 Config.in.host
In-Reply-To: <1865313a-73fb-7fb2-9b1c-3918fc79b290@mind.be>
References: <20181223171950.3979-1-casantos@datacom.com.br>
 <20181226223005.71dca29a@windsurf> <20181226215521.GL14286@scaer>
 <20190103225052.3feb76c6@windsurf> <20190103220652.GG5991@scaer>
 <1865313a-73fb-7fb2-9b1c-3918fc79b290@mind.be>
Message-ID: <20190104115152.GL5991@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-01-04 12:06 +0100, Arnout Vandecappelle spake thusly:
> On 03/01/2019 23:06, Yann E. MORIN wrote:
> > On 2019-01-03 22:50 +0100, Thomas Petazzoni spake thusly:
> >> On Wed, 26 Dec 2018 22:55:21 +0100, Yann E. MORIN wrote:
[--SNIP--]
> >>> So, no, I'm not happy with that direction...
> >>>
> >>>     config BR2_PACKAGE_FOO
> >>>         bool "foo"
> >>>         select BR2_PACKAGE_HOST_AUTOCONF
> >>>         select BR2_PACKAGE_HOST_AUTOMAKE
> >>>         select BR2_PACKAGE_HOST_LIBTOOL
> >>>         select BR2_PACKAGE_MAYBE_HOST_TAR
> >>>         select BR2_PACKAGE_MAYBE_HOST_FLEX_FOR_KCONFIG
> >>>         select BR2_PACKAGE_MAYBE_HOST_BISON_FOR_KCONFIG
> >>>         select BR2_PACKAGE_HOST_PKGCONF
> >>>
> >>> Unles we're planning on hiding that away into meta-config, like:
> >>>
> >>>     config BR2_PACKAGE_FOO
> >>>         bool "foo"
> >>>         select BR2_AUTOTOOLS_PACKAGE # mimick $(eval $(autotools-package))
> >>>         select BR2_PACKAGE_HOST_PKGCONF_BECAUSE_IT_S_NOT_MANDATORY
> 
>  This looks acceptable to me...

Except this is still missing a lot of things (I just got bored writing
the stuff).

> >>> And still, the optionally-required host packages like tar, flex et al.
> >>> are not covered...
> 
>  tar at least is rather easy to overcome: we can add environment variables that
> pass the results of dependencies.mk to Kconfig. And for things that are
> conditional like lzip we can use a combination of the two.

Well, the problem is not how to pass the information to Kconfig: we
already know how to do it (e.g. host gcc version). The problem is that
packages should select the host-packages they need, then:

  - it is very verbose in packages, as you can see above,

  - we need to invent a new semantic for conditional packages.

[--SNIP--]
>  Note, however, that the only reason to require Config.in.host for *all*
> packages is that it allows us to have a (partial) check that for each make

Why do you say "partial" in "a (partial) check"? If we can't do aproper
and complete check, then there is no reason to add Config.in.host for
all packages...

> dependency, the Kconfig dependency exists as well (i.e., check that all
> dependencies are in PACKAGES).

And then, what does that brings us?

> That's not a very strong reason. So I would be
> perfectly fine with making this a "soft" requirement (possibly verified with
> checkpackage).
> 
>  The tricky thing is that when a package does have a Config.in.host option, we
> really want it to be selected in *all* cases that it is built. So ideally we
> should have a way to verify that...

Yes, the same as we currently check that all packages in FOO_DEPENDENCIES
are indeed enabled when they do ahve a corresonding *_KCONFIG_VAR, see:

    https://git.buildroot.org/buildroot/tree/Makefile#n547

Except the check is now limted to target packages only.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
