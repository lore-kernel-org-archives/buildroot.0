From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 00:08:36 +0200
Subject: [Buildroot] [PATCH 1/5] legal-info: extract even
 no-redistribute packages
In-Reply-To: <53A20203.8040406@lucaceresoli.net>
References: <cover.1402758331.git.yann.morin.1998@free.fr>
 <0a92bc2be59aa08b015e19b86ce31b8767bdbf43.1402758331.git.yann.morin.1998@free.fr>
 <53A20203.8040406@lucaceresoli.net>
Message-ID: <20140621220836.GB21004@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-06-18 23:17 +0200, Luca Ceresoli spake thusly:
> Dear Yann,
> 
> Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >Currently, if a package is marked _REDISTRIBUTE = NO, then legal-info
> >will not try to extract it first.
> >
> >If that package also declares some _LICENSE_FILES, legal-info fails
> >if it is the only action we're trying to run:
> >
> >     $ cat defconfig
> >     BR2_INIT_NONE=y
> >     BR2_PACKAGE_LIBFSLCODEC=y
> >     $ make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
> >     $ make libfslcodec-legal-info
> >     /bin/sh: /home/ymorin/dev/buildroot/O/legal-info/licenses.txt: No such file or directory
> >     make[1]: *** [libfslcodec-legal-info] Error 1
> 
> Note that the present patchset does not solve _this_ error.
> 
> The error that your patchset _does_ solve is:
> 
>   $ make BR2_DL_DIR=~/src legal-info-prepare libfslcodec-legal-info
>   >>>   Collecting legal info
>   cat:
> /home/murray/devel/buildroot-test/output/build/libfslcodec-3.5.7-1.0.0/EULA:
> No such file or directory
>   make: *** [libfslcodec-legal-info] Error 1

Well, that's not even the error I'm trying to solve. In fact, I'm trying
to solve this:

    $ cat defconfig
    BR2_arm=y
    BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
    BR2_PACKAGE_LIBFSLCODEC=y
    $ make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
    $ make legal-info
    [--SNIP--]
    cat: /home/ymorin/dev/buildroot/O/build/libfslcodec-3.5.7-1.0.0/EULA: No
    such file or directory

> The error that you reported due to the fact that output/legal-info has
> not been created yet.

Indeed. I was a bit too fast at writing the commit log (it happens quite
often these days, I must be moire careful.) Sorry.

> For real cases I don't see a big point in
> running anything else than `make legal-info`.

So do I.

[--SNIP--]
> >This implies that we now need to explicitly add PKG-source as a dependency
> >of legal-info for packages we want to save (ie. redistributable, non-local
> >and non-overriden packages).
> 
> Said this way, it looks like we're adding a dependency. Instead we are
> changing the dependence from PKG-extract to PKG-source, which is one
> step less (-extract implies -source), so bottom line we are removing a
> dependency.
> 
> Better explained IMO:
>  This implies that we now need only PKG-source, not PKG-extract anymore,
>  as a dependency of legal-info for packages we want to save (.....).

OK, will rephrase.

[--SNIP--]
> >+# If the package declares _LICENSE_FILES, we need to extract it,
> >+# for overriden, local or normal remote packages alike, whether
> 
> Ditto.

Will fix that and the others.

[--SNIP--]
> With the above fixed, and once rebased on top of master, and since I'm
> OK with all of the very few code lines you touched:
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> [Quick test on top of e00c631ef4aa, will test again once rebased]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

OK, thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
