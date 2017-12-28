From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Dec 2017 18:00:17 +0100
Subject: [Buildroot] [RFC 0/2] Handle conflicting files with Busybox
In-Reply-To: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171228170017.GE3428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-13 14:01 +0100, Thomas Petazzoni spake thusly:
> As we discussed during the Prague Buildroot Developers meeting, in
> order to implement per-package SDK, we need to ensure that no package
> overwrites files installed by another package.
> 
> This RFC series is an attempt at solving this problem for Busybox. I
> have not fixed all packages yet: since it is a very boring task to do,
> I wanted to first get some feedback on whether the approach looks
> reasonable or not.
> 
> If the feedback is positive, I'll go ahead and submit proper patches
> that fix all packages that conflict with Busybox.

As I previously said on IRC: I do not much like the big list we will now
have to maintain; that's sad...

However, I like the fact that we can get rid of the many dependencies in
so many packages here and there. :-)

What I would have suggested, though, is to do what Baruch hinted at: use
the noclobber install of Busybox, and then have Busybox depend on all
the packages it provides applets for:

    BUSYBOX_DEPENDENCIES = \
        $(if $(BR2_PACKAGE_COREUTILS),coreutils) \
        $(if $(BR2_PACKAGE_util_LINUX),util-linux) \
        etc...

But unfortunately, the noclobber install option is not usable:

  - first, there is no way to cause a noclobber install;

  - second, the noclobber is not accounted for in the case shell
    wrappers are used.

So, I'm afraid we don't have much choice but to do as your series
does...

Regards,
Yann E. MORIN.

> Thanks for your feedback!
> 
> Thomas
> 
> Thomas Petazzoni (2):
>   busybox: avoid conflict with other packages
>   packages: drop no longer needed busybox dependencies
> 
>  package/bc/bc.mk                   |  5 ----
>  package/binutils/binutils.mk       |  5 ----
>  package/busybox/busybox.mk         | 58 ++++++++++++++++++++++++++++++++++++++
>  package/coreutils/coreutils.mk     |  6 ----
>  package/cpio/cpio.mk               |  1 -
>  package/dcron/dcron.mk             |  5 ----
>  package/debianutils/debianutils.mk |  2 --
>  package/diffutils/diffutils.mk     |  4 ---
>  package/fbset/fbset.mk             |  5 ----
>  package/kmod/kmod.mk               |  3 --
>  package/util-linux/util-linux.mk   |  6 ----
>  11 files changed, 58 insertions(+), 42 deletions(-)
> 
> -- 
> 2.14.3
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
