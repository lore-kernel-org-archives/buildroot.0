From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 19:42:19 +0100
Subject: [Buildroot] [PATCH v3 0/3] [RFC] Reinstall Targets
In-Reply-To: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
References: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20141210184219.GD3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, All,

On 2014-11-28 09:25 -0600, Doug Kehn spake thusly:
> This RFC proposes adding the following targets to pkg-generic.mk:
>     <package>-reinstall
>     <package>-reinstall-target
>     <package>-reinstall-staging
>     <package>-reinstall-images
>     <package>-reinstall-host
> 
> These targets remove the package's .stamp_*_installed file to allow the
> reinstall to execute.  The only method I presently know of to reinstall a
> package is to make <package>-rebuild.  The proposed targets allow a package
> reinstall without, unnecessarily incurring a rebuild of the package.

We've discussed this series during the Patchwork cleanupsession
yesterday.

Peter was concerned about the overhead of those new rules, so it was
decided I would do some testing before/after this pach was applied.

Here are the results of my testing.

All testing was done on the same machine, Core-i5 @2.5GHz, 12GiB RAM,
and Samsung 840pro SSD, machine otherwise compeltely idle. Before
running the tests, I warmed the cache with: tar cf - . >/dev/null

All tests were run on top of ed592d6: poppler: Install files into staging
(master at the time I did the tests). Tests were out-of-tree, and the
output was consigned to oblivion with >/dev/null an executed in the
displayed sequence.

                                            Before      After

  * make defconfig                           1.28        1.27
    make defconfig                           0.34        0.34
    [disable luajit]
    make help                                2.72        2.79

  * make defconfig allyespackageconfig       1.34        1.38
    make defconfig allyespackageconfig       0.44        0.44
    [disable luajit]
    make help                                2.77        2.87
    [switch to external toolchain, make allyespackageconfig, disable luajit]
    make toolchain                          21.05       21.73

[*] marks starting from a clean output directory.

I had to disable luajit, because both it and lua are providers of
luainterpreter.

So, it seems the overhead is negligible.

So, the conclusion is: OK! ;-)

I'll do some further review on the code a bit later, but otherwise we
decided to accept that feature.

Thank you!

Regards,
Yann E. MORIN.

> In addition to allowing a reinstall to staging and/or target output
> directories, the proposed targets allow selected packages to be
> installed to a different 'target' directory.  For example, I attempt to
> keep software updates as small as possible; therefore, I cherry-pick
> files to include in the update package.  If I know packages foo and bar
> have been updated, the following will install those packages to a
> directory that can be further processed to generate the desired update
> package.
> 
> make TARGET_DIR=${PWD}/update foo-reinstall-target
> 
> make TARGET_DIR=${PWD}/update bar-reinstall-target
> 
> Doug Kehn (3):
>   pkg-generic.mk: reinstall targets
>   manual: reinstall targets
>   manual: style update
> 
>  docs/manual/package-make-target.txt | 26 ++++++++++++++++++++------
>  package/pkg-generic.mk              | 22 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 6 deletions(-)
> 
> ---
> Changes v2 -> v3:
>   - Move style updates to separate patch (requested by Thomos)
> 
> Changes v1 -> v2:
>   - Reworked to include reinstall target (requested by Thomas)
>   - Updated documentation
> 
> -- 
> 1.9.1
> 
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
