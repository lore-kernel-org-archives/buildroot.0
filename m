From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Aug 2012 11:40:01 +0200
Subject: [Buildroot] [RFC] "select" vs. "depends on" : a proposal for a
 workaround
In-Reply-To: <201208072252.18028.yann.morin.1998@free.fr>
References: <201208072252.18028.yann.morin.1998@free.fr>
Message-ID: <20120809114001.6e9d2a10@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

Le Tue, 7 Aug 2012 22:52:17 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> This is a Request For Comments about the now-infamous dilemn between
> "depends on" vs. "select", and a suggestion to work it around.
> 
> As I am adding some packages (soon to be pushed!), I stumbled upon a
> few cases where I could not select another package because it had
> dependencies my package does not have.
> 
> And as we all know, doing so is A Very Bad Idea (TM).
> 
> So I decided to depend on this package, just printing a message in
> case it's not available. Sad-and-dull life, but life nonetheless...
> 
> But as an afterthought, I thought about a /solution/ to this issue.
> It's best explained with a little bit of code, so consider the
> following:
> 
>   config PKG_LIBFOO_AVAILABLE
>     def_bool y
>     depends on ARM && THREADS && !LFS
> 
>   config PKG_LIBFOO
>     bool "libfoo"
>     depends on PKG_LIBFOO_AVAILABLE
> 
>   comments "libfoo requires ARM and threads, but not Large files"
>     depends on !PKG_LIBFOO_AVAILABLE
> 
> That is, move all the package's dependencies to their own symbol, and
> have the package depends on this symbol.
> 
> Although the gain is not explicit for the package libfoo by itself, it
> becomes much more evident when another package depends on libfoo:
> 
>   config PKG_BAR
>     bool "bar"
>     depends on PKG_LIBFOO_AVAILABLE
>     select PKG_LIBFOO
> 
> This way, it becomes extremely easy to inherit the dependencies of
> libfoo in bar, and still we can select it. If the dependencies of
> libfoo were to change, there would be a single place where to update
> them.
> 
> (And yes, we could/should also have a PKG_BAR_AVAILABLE.)
> 
> This also allows for more involved constructs (which is the actual
> use-case I'm in need for my package):
> 
>   config PKG_BAR
>     bool "bar"
> 
>   config PKG_BAR_OPT
>     bool "bar option"
>     depends on PKG_BAR
>     depends on PKG_LIBFOO_AVAILABLE
>     select PKG_LIBFOO
> 
> (I have tested both constructs with the current kconfig from 3.6-rc1,
> and it behaves as expected.)

Thanks a lot for thinking about this. So, the idea is that every time
there is a "select", we add a corresponding "depends on", and that
since there is inheritance of "depends on", we will not have to
recursively add all the "depends on" on toolchain options on all the
reverse dependencies of a package that need such toolchain options.

Am I understanding your proposal correctly?

> *And* it has no impact whatsoever on the package build infrastructure.
> 
> Of course, this does not have a zero-impact on how to write packages'
> Config.in files, and there is no easy way to convert existing
> packages. But, as for the package infrastructure, this could be a
> step-by-step process by which packages would be converted (enhanced!)
> one after the other.
> 
> Another disadvantage is that it wanders a bit away from the current
> simplicity of writing a single package; complexity that is regained
> later-on when new packages will use it.
> 
> What are your thoughts on this?
> Where's the flaw in my reasoning? ;-)
> Am I rambling on incoherently? ;-)

On my side, I would need to experiment a bit with this on some
real-world example, but it sounds like a nice path to investigate, for
sure.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
