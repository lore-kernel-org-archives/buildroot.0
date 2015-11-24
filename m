From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Nov 2015 19:39:06 +0100
Subject: [Buildroot] [PATCH 3/3] package/gcc: align gcc-final
 configure-cmds to the generic ones
In-Reply-To: <20151123211441.5135a9d2@free-electrons.com>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <4d9f7a6896c496372a4f415987e60eeeac79225b.1448202976.git.yann.morin.1998@free.fr>
 <20151123211441.5135a9d2@free-electrons.com>
Message-ID: <20151124183906.GA3904@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-23 21:14 +0100, Thomas Petazzoni spake thusly:
> On Sun, 22 Nov 2015 15:39:43 +0100, Yann E. MORIN wrote:
> > Since 7d6c79 (Compile static versions of gcc libraries) was applied, the
> > generic configure commands have been updated, but those changes have not
> > been propagated to the gcc-final custom configure commands.
> > 
> > Update the gcc-final custom configure commands to better match the
> > generic ones.
> > 
> > We do not propagate --disable-dependency-tracking because it breaks the
> > build, and --enable-shared (because of 169141a).
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> A little bit like Arnout, I am not sure to see the value of fully
> aligning the configure commands just for the sake of it.

My reasoning is that, when we update the ./configure command in the
infra, it's always for a good reason. The current set of options is the
result of many successive fixes to so many build failures and corner
cases, that we applied over time, and that we know ensure a proper
build, hopefully in even the harshest conditions.

It seems logical that we propagate those options to all packages that
have to override the ./configure command (unless said options actually
prevent the package from building, obviously). For gcc, we already know
that the additional options (except the omitted ones) are not causing
problems when building gcc-initial, at least (and I actually tested that
they did not cause build failures in gcc-final either, on: arm, mips,
i386 and xtensa).

That way, when we update the command in the infra, we can easily
propagate it down to overriding packages.

> Another possibility is to add a mechanism in the infra to exclude some
> generic config options from being used. But I tend to hate package
> infrastructure that are needed only for one package, especially when
> there is a way of not changing the infrastructure (which is the case
> here).

Let's see how many autotools packages do redefine their ./configure
command:

    $ git grep -l -E 'eval \$\((host-)?autotools-package' |wc -l
    1055

So, we have roughly 1055 (minus the manual) packages using the autotools
(or the host-autotools) infra.

    $ grep CONFIGURE_CMDS $(git grep -l -E 'eval \$\((host-)?autotools-package') |wc -l
    10

So, we have 8 (one hit is in the manual, one in a comment) packages that
override their ./configure command, with the associated reason:

  - berkeleydb: does not support in-tree build

  - fbv:        does not support cross-compilation

  - ffmpeg:     does not support --target and such

  - gcc-final:  needs --enable-static and not --enable-shared, does not
                support in-tree build, misses options from the infra

  - glibc:      does not support in-tree build, needs bash to execute
                ./configure, needs -O2 in CFLAGS, touches two files
                after the ./configure, uses extra options and misses
                some from the infra

  - libgtk3:    host variant redefines all of the configure, build and
                install commands, to build just the strictly required
                stuff

  - libplayer:  does not support --target and --host

  - mdadm:      does nothing!

So, it seems we could go with some cleanup there (any taker?):

  - fbv, ffmpeg, libplayer, mdadm:
                are not autotools packages, should be switched to the
                generic package infrastructure

  - libgtk3:    host variant should be switched to the generic package
                infrastructure

We'd be left with just three packages, berkeleydb, gcc-final and glibc.
The common symptom for all three in the inability to build in-tree.
Wecould probably ad dsupport for this in the gneeric infra, but it does
not make sense to work on the infra just for those three cases, when you
have a series do it so unconditionally, and for all the infras.

So, only gcc-final needs to ditch one option. It does not make sense to
add support in the infra just for this case.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
