From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2009 23:02:13 +0100
Subject: [Buildroot] [git commit master] buildroot;
 move defconfigs to configs/ and print in help
In-Reply-To: <87pr7afeyi.fsf@macbook.be.48ers.dk>
References: <20091004202133.B35E577762@busybox.osuosl.org>
	<20091005084845.023ff120@surf> <873a5y5nbq.fsf@macbook.be.48ers.dk>
	<20091111150359.579df608@surf> <87pr7afeyi.fsf@macbook.be.48ers.dk>
Message-ID: <20091125230213.27e7b090@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 22 Nov 2009 22:05:09 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Thomas> Coming back on this old topic, because I really don't like
>  Thomas> the new way.
> 
> I'm sorry to hear. I do kind of like it ;)

Argh, I still don't like it ;)

> It hasn't? I did update it, and it imho is pretty clear:

Sorry for the mistake, it has been updated. I apologize.

> I don't see the different directory as a big problem (E.G. it doesn't
> seem to be an issue for other projects doing the same, like the Linux
> kernel or U-Boot). If people add packages and/or patches for their
> custom stuff (I know people at the company I work for do this) they'll
> need to look outside their target/device/company/board dir anyway.

Sure, but the things in packages and/or patches are not board-specific.
While the Buildroot configuration files and the associated kernel/u-boot
configuration are board/project specific. Therefore, they should be in
the same location.

> Similary, I don't believe name clashes in configs/ are a big problem
> (like in Linux/U-Boot).

I don't think I raised name clashes as an issue, since I don't think
it's one (even in my solution, the names of the _defconfig files should
be unique).

>  Thomas> Moreover, it breaks the idea of having out-of-tree board
>  Thomas> support. Before this change, it was relatively easy since
>  Thomas> the stuff needed to support one board was centralized in one
>  Thomas> directory (see my proposal at
>  Thomas> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?id=ed47f42a598c665bf42c4e797187f233b955e285).
> 
> Did you rebase? The link doesn't seem to work any more :/

Strange, because it works here. Just in case, I've pasted the patch at
http://free-electrons.com/~thomas/external-boards-proposal.patch.

The patch is *very* simple because all board-specific things are
concentrated into one directory. With your new solution, I have no idea
how I could implement out-of-tree board support, which is something our
users have been asking for.

>  Thomas> To make them more visible to users, I suggest to reorganize
>  Thomas> target/. All board-stuff should be moved to a top-level
>  Thomas> boards/ directory. This directory would have roughly the same
>  Thomas> architecture as the current target/device/ directory.
> 
> I agree, but that's imho not directly related to where to put
> _defconfigs.

It is not directly. But it would really, really look odd to have :

 boards
  - atmel
    - at91sam9263ek with kernel/uClibc/Busybox config files
    - at91sam9260ek with kernel/uClibc/Busybox config files
  - armadeus
    - apf27 with kernel/uClibc/Busybox config files
  - calao
    - usb-a9263 with kernel/uClibc/Busybox config files
 configs
   at91sam9263ek_defconfig
   at91sam9260ek_defconfig
   armadeus_apf27_defconfig
   calao_usb-a9263_defconfig

The _defconfig files really belong to the boards directory. IMO, having
the _defconfig files in a separate directory makes them disconnected
from their corresponding kernel/uClibc/Busybox configuration files.

>  Thomas> And then, to make the defconfig files visible to users, just
>  Thomas> show them in "make help".
> 
> With a find-all-files-ending-in-_defconfig-under-here thing? Could be
> done, but is kind of ugly - Same for make <foo>_defconfig.

Come on, kind of ugly ? It's a one liner for <foo>_defconfig (something
we already had) :

%_defconfig: $(CONFIG)/conf
	cp $(shell find ./target/ -name $@) .config

The "make help" thing is probably of the same one-liner style.

>  >> The stuff in target/device/ tends to get stale over time, so a bit
>  >> more visibility is imho good.
> 
>  Thomas> Let's move it to boards/ then.
> 
> Optimist! ;) I don't think that will significantly change the
> staleness of it though.

For sure moving things around will not prevent staleness. But:

 * That will make board support more visible, and easier to use for
   board vendors ;

 * We could have a maintainer for each board. At -rc1, all board
   maintainers are asked to check their board support. If they don't
   answer before the final release, the board is marked as broken. And
   removed in the next release if no news.

> Yes, but I'm about to put out -rc1, so we have limited time.

-rc1 is out. But I still don't like this change. I usually don't have a
strong opinion on most changes, but I really don't understand this one.

Sincerely,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
