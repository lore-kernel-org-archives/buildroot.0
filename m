From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Nov 2018 19:52:26 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of
 kernel code
In-Reply-To: <20181107174411.0b67a064@windsurf>
References: <20181107100605.13141-1-nicolas.carrier@orolia.com>
 <CANQCQpb6BYDMXJTDKEXKgpmBG1jHjOt2G1_eDF_cSVbCM=x=nw@mail.gmail.com>
 <PR1PR06MB49557D35D7EB1F1D03DEFDD784C40@PR1PR06MB4955.eurprd06.prod.outlook.com>
 <20181107174411.0b67a064@windsurf>
Message-ID: <20181107185226.GB4702@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, Thomas, All,

On 2018-11-07 17:44 +0100, Thomas Petazzoni spake thusly:
> On Wed, 7 Nov 2018 14:40:39 +0000, Nicolas Carrier wrote:
> > I have a workspace managed by google repo, which fetches the sources
> > of the external git repositories for which we have created .mk
> > buildroot Makefiles.
> > 
> > Because the sources are cloned by repo, I don't want them to be
> > fetched by buildroot, hence I used "_SITE_METHOD = local" for all the
> > packages.
> > 
> > For linux and u-boot, I can't do that because they dont support the
> > local method and I think there is no reason to make these two
> > packages an exception.
> 
> Well your patch is actually making u-boot and linux be exceptions. What
> if someone wants to build busybox from a local source tree ? And qt5 ?
> And openssl ? And then this other package ?

Exactly what I was about to write.

> As you can see, this approach does not really scale: we would have to
> add Config.in options to all packages to say "please build using the
> source code from folder XYZ instead of the normal upstream source
> code". That's why we have chosen to support this use case using
> OVERRIDE_SRCDIR.
> 
> > As for modifying the local.mk file to put some LINUX_OVERRIDE_SRCDIR
> > value inside, I want to avoid it because it would force me to version
> > the local.mk file for things to work out-of-the-box. Versionning this
> > file is problematic because developers needing to modify it
> > temporarily may commit it by error.
> 
> Here is what you could do:
> 
>  - Set BR2_PACKAGE_OVERRIDE_FILE to point to whatever file you like
>    instead of local.mk, say package-overrides.mk.
> 
>  - In this file, you set LINUX_OVERRIDE_SRCDIR as appropriate, but you
>    also do
> 
>    -include local.mk
> 
> And then you version control package-overrides.mk. Then your developer
> can continue locally to tinker with local.mk to have their own custom
> OVERRIDE_SRCDIR, and still have LINUX_OVERRIDE_SRCDIR used.

Exactly what I was going to suggest, e.g.:

    BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/package-overrides.mk"

which would contain something like:

    LINUX_OVERRIDE_SRCDIR="$(TOPDIR)/../sources/linux"
    -include local.mk

Obviously, you want this file to always be used, so you set it in your
defconfig files.

Alternatively, you can try to even be smart and snarky, and add a file
in your Buildroot tree, name 'GNUmakefile'. GNU make will favour using
that one if it is present, so you could do something like:

    $ cat GNUMakefile
    LINUX_OVERRIDE_SRCDIR="$(TOPDIR)/../sources/linux"
    include $(dir $(lastword $(MAKEFILE_LIST)))Makefile

This way, you do not even have to remember to set it in your defconfig
files. But this is really snarky.

> Alternatively, maybe we should decide that linux and u-boot are special
> packages, and just like for those packages we support fetching from
> custom tarballs and custom Git repositories, we should support fetching
> from custom local directories (this is what your patch implements, but
> until now, we have resisted going into this direction).

I would say we should not go that route, otherwise it would be difficult
to resist adding yet more exceptions, for people that have local "forks"
for some packages. And then it becomes a nightmare to maintain.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
