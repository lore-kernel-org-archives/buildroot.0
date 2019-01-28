From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Jan 2019 18:12:47 +0100
Subject: [Buildroot] Linux extension from a BR2_EXTERNAL tree
In-Reply-To: <20190128172511.754500e4@windsurf>
References: <20190128172511.754500e4@windsurf>
Message-ID: <20190128171247.GH7130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-28 17:25 +0100, Thomas Petazzoni spake thusly:
> I am trying to implement a Linux extension, which applies a bunch of
> patches to the Linux kernel tree, as a package in a BR2_EXTERNAL tree.
[--SNIP--]
> When I build the kernel, it does run the MUSDK_MARVELL_PREPARE_KERNEL
> command, but the musdk-marvell dependency was not prepared up to its
> patching step (it was not even extracted at all), causing the
> MUSDK_MARVELL_PREPARE_KERNEL hook to fail.
> 
> So it seems like adding an entry to the LINUX_EXTENSIONS variable
> *after* linux/linux.mk has been processed works fine for the hook
> registration, but not for the dependency addition. This looks odd to
> me. The generic-package infrastructure does seem to have all the
> necessary double-dollars to make sure the evaluation is delayed to the
> time of use, but it seems to not be sufficient.
> 
> I am missing something obvious here ? I am not sure if I'm seeing
> something that's easily fixable, or something that is just plain
> impossible due to how make works.

It is imposible to do, indeed, because the dependency registration is
expanded by the generic-package infra, see:

    package/pkg-generic.mk at 744:

    $$($(2)_TARGET_CONFIGURE):? | $$($(2)_FINAL_DEPENDENCIES)

So, opnce you have registered the linux package, the line above has
already been evaluated, but your br2-exte5rnal tree has not yet been
parsed, so LINUX_FINAL_DEPENDENCIES does not (yeT) contain the name of
your package.

So, there is no easy way to solve this issue.

Either we scan br2-external before our own packages, or we implement a
mechanism for post-poning the evaluation of packages to after the
br2-external trees have been parsed.

I am fond of neither solution, though, because that would allow
br2-external tree to actuall muck around with existing packages.

In the first case, this could allow a br2-external tree to inject new
dependencies to a package, for example, or to pre-seed variables to
change the way a package's .mk is evaluated, etc...

The second option would allow a br2-external tree to completely override
an exiting package with its very own version, thus breaking a lot of
assumptions made by the system as a whole.

Of course, your use-case is all too valid, but unfortunately, I don't
see a solution... :-(

FTR, I was also thinking of a way for a br2-external tree to provide
pre-built toolchains, or to provide providers of virtual packages that
are a choice (e.g. libjpeg), but in either case it is also very
difficult.to do.

FTR2, I had already implemented my solution 2 (post-pone package
evaluation) in the past, just as a proof-of-concept, but I don't think I
ever posted the patches (but discussing it at the time, the idea was not
very well received anyway, IIRC).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
