From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 15 Oct 2012 15:51:30 +0200
Subject: [Buildroot] [UNSURE] State of Perl: remaining questions
In-Reply-To: <20121014203524.5dc66a9d@skate>
References: <20121014203524.5dc66a9d@skate>
Message-ID: <CAB0FRsuK1DVFdLX=2UQdum-Zd=-aMWyQ6Bg+SETRsXS-3emX6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/14 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Hello Peter,
>
> As we discussed on IRC, here is my opinion on the state of the Perl
> patch set from Fran?ois and the remaining points of discussion.
>
>  * I am fine with patches 1/10, 2/10, 3/10, 4/10, 5/10, 6/10. I think
>    those patches could be committed now.
>
>  * I have asked Fran?ois to refactor a bit the removal of microperl
>    (patches 7/10, 8/10 and 10/10). In the end, it will make no
>    difference, it's just the order in which are done that will be
>    different. But this also requests for your approval to remove the
>    microperl package without having a deprecation period. I believe
>    that since we're adding a full Perl installation instead, there
>    should be no problem in doing this.

I added the removal of microperl in my patch serie in the last position (10/10).
But in my mind, this patch will be applied after a deprecation cycle.
I wasn't been explicit about this, because I think that deprecation
cycle is mandatory.

Fran?ois

>
>  * I am still not fully convinced by 9/10, the integration of
>    cpanminus, and I will give some details below.
>
> Fran?ois will correct me if I'm wrong, but cpanminus is a tool that
> easily allows to download and build Perl modules, taking care of the
> necessary dependencies. It is a bit like easy_install for Python, if
> I'm correct.
>
> So the idea is that instead of having Buildroot packages for each and
> every Perl module, you only have cpanminus, which provides two important
> Kconfig knobs:
>
>  * BR2_PACKAGE_CPANMINUS_MODULES, thanks to which you provide a
>    space-separated list of Perl modules you want.
>
>  * BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES, thanks to which you
>    provide a space-separated list of Buildroot packages that are native
>    dependencies needed to build the Perl modules listed in
>    BR2_PACKAGE_CPANMINUS_MODULES.
>
> For example, BR2_PACKAGE_CPANMINUS_MODULES can be "Curses::UI" to get
> the Perl module of this name, in which case
> BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES has to be "curses" so that
> our "curses" package gets built as a dependency of cpanminus.
>
> So, cpanminus is doing its own package management, download process,
> dependency tracking, which to me creates a number of problems:
>
>  *) No integration with the licensing infrastructure. The individual
>     Perl modules are not visible in terms of licensing report. This is
>     maybe not a big issue since most of them are released under the
>     Artistic license.
>
>  *) No integration with the download mechanisms of Buildroot. So it
>     doesn't put the downloaded tarballs in $(DL_DIR), doesn't take care
>     of $(BR2_PRIMARY_SITE), breaks "make source", "make external-deps",
>     prevents people from having guarantees to make offline builds
>     (unless they create a specific cpan mirror, of course).
>
>  *) The dependency tracking seems a bit fragile, i.e the user needs to
>     know on which native package a given Perl module depend. This is
>     maybe not that problematic, we can assume that the developer crazy
>     enough to write Perl code will know his dependencies :-)
>
> On the other end, as Arnout and Francois have noted, create Buildroot
> packages for each and every Perl module around is going to bring us a
> crazy number of packages. Perl modules are apparently even more split
> in fine-grained components than Python packages are, so the number of
> dependencies and components if even larger.
>
> Note that I am not carrying a strong NAK on cpanminus, I am just
> pointing out how it moves away from the normal Buildroot
> infrastructure, and which problems it generates. I will not oppose to
> see it merged, I don't plan to be using it myself.
>
> So to summarize, the only part of this series that to me remains a bit
> controversial is this cpanminus thing, patch 9/10.
>
> I would like to thank again Fran?ois for his excellent persistence and
> perseverance in his work on the Lua and Perl stuff in Buildroot. This
> is _highly_ appreciated. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
