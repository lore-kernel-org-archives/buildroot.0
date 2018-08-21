From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Aug 2018 00:08:40 +0200
Subject: [Buildroot] [PATCH next 0/4] btrfs-progs related improvements
In-Reply-To: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
References: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180821220840.GT15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas, All,

On 2018-08-21 23:59 +0200, Thomas Petazzoni spake thusly:
> Following the addition of host-btrfs-progs recently by Robert
> J. Heywood, I wondered why e2fsprogs was needed as a
> dependency. Indeed, why would btrfs need the library of a completely
> different filesystem?
> 
> Turns out it's because btrfs-progs can optionally build a tool called
> btrfs-convert, to convert an ext2 or reiserfs filesystem to a btrfs
> one, and this tool needs e2fsprogs as a dependency to support ext2
> filesystem conversion. But this is completely optional.
> 
> For the host variant, I don't think it makes sense to support that at
> all, so we forcibly disable building btrfs-convert.
> 
> For the target variant, e2fsprogs is turned into an automatic optional
> dependency: when available, btrfs-convert is compiled with ext2
> support, otherwise btrfs-convert is not built at all. We don't take
> into account reiserfs support because we don't have the corresponding
> libraries packaged in Buildroot.
> 
> While doing this work on the host variant, I noticed the e2fsprogs and
> lzo host libraries were only available as static libraries. So I went
> ahead and fixed that as well.

There is one thing you forgot to do: enable support for zstd, now that
we have a package for it. ;-p

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> 
> Thomas Petazzoni (4):
>   lzo: build shared library for the host
>   e2fsprogs: build shared library for the host
>   btrfs-progs: drop dependency on e2fsprogs by not building
>     btrfs-convert
>   btrfs-progs: make e2fsprogs an optional dependency
> 
>  package/btrfs-progs/Config.in      |  1 -
>  package/btrfs-progs/btrfs-progs.mk | 20 +++++++++++++++++---
>  package/e2fsprogs/e2fsprogs.mk     |  3 ++-
>  package/lzo/lzo.mk                 |  2 ++
>  4 files changed, 21 insertions(+), 5 deletions(-)
> 
> -- 
> 2.14.4
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
