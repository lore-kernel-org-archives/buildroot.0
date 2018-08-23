From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Aug 2018 18:36:52 +0200
Subject: [Buildroot] Package with dependency with another git
In-Reply-To: <ea-mime-5b7ed395-49e5-1bbae393@www-1.netcourrier.com>
References: <ea-mime-5b7ed395-49e5-1bbae393@www-1.netcourrier.com>
Message-ID: <20180823163652.GG9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Louis-Paul, All,

On 2018-08-23 17:32 +0200, lpdev at cordier.org spake thusly:
> Currently adding a new package to buildroot, I have a package "A" that fetch its sources on git, and is a cmake-package. This
> package A also require another git repo "B" to be fetched, and a CMake a path in _CONF_OPTS that points to repo "B" must be added.

Meh... Not nice...

> My solution was to create a new package "B" on which package "A" depends on, and use generic-package with no build rules. Buildroot
> is taking care of fetching the sources automatically then.
> 
> However I did not find any way to point on build directory of package B from packagea.mk. Package build are named with the
> following: package_name-version. I am currently pointing to the path manually in my script like this:
> 
> PACKAGEA_CONF_OPTS +=? -DREPOB_DIR=$(BUILD_DIR)/packageb-$(PACKAGEB_VERSION)/
> 
> My questions are:
> 
> - Is it a good practice to do this?

Well, you basically have no other choice, unless you are also in charge
of said packages, in which case maybe having B as a git-submodule of A
could make things a bit easier...

Does B provide a library?

Can B be installed on its own?

Can A be told to use a pre-install B?

> - Is it a good practice to create a package that only fetch sources?

Good practice, not really. But not bad either. We have a few such
packages, which are then used to provide extensions to the linux kernel.
See for example package/aufs/aufs.mk

> - Is there any variable to point to the build dir of a specific package?

$($(PKGNAME)_SRCDIR)

... where you'd replace $(PKGNA<ME) with the name of package B in your
case.

> - Would it be better to add a pre-configure in packagea.mk hook that calls git and fetch the repo B?

Nope, otherwise you'd side-track Buildroot download infra, which alows
doing off-line builds:

    $ make source
    [get coffee and wait]
    [unplug network]
    $ make
    [should succeed]

Regards,
Yann E. MORIN.

> Thank you for you help.
> 
> BR,
> Louis-Paul CORDIER

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
