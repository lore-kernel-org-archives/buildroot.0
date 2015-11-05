From: Alexander Dahl <post@lespocky.de>
Date: Thu, 05 Nov 2015 09:31:47 +0100
Subject: [Buildroot] [PATCH 2/2] fastd: add new package
In-Reply-To: <20151104222134.792979c1@free-electrons.com>
References: <1446102782-4565-1-git-send-email-post@lespocky.de>
 <1446102782-4565-2-git-send-email-post@lespocky.de>
 <20151104222134.792979c1@free-electrons.com>
Message-ID: <9074e4810a20f47dbda9b9d401a04bdf@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei Thomas,

Am 2015-11-04 22:21, schrieb Thomas Petazzoni:
> This commit log again contained some "personal" messages, so I reworded
> it.

Okay, I understand. :-)

> I also did a few other changes:
> 
>     [Thomas:
>      - Get rid of trailing spaces in Config.in

Sorry, I usually check this before committing. :-/

>      - Remove the BR2_PACKAGE_FASTD_OPENSSL, and simply rely on
>        BR2_PACKAGE_OPENSSL

I'm not sure if I like this, because it is less flexible, but if this is
common practice in buildroot, okay.

>      - Remove -DWITH_CAPABILITIES=TRUE, since libcap support is anyway
>        mandatory.

Buildroot builds only Linux based systems, right? Then fastd sets this
to ON by itself in cmake/config.cmake so it can be removed, okay.

> Could you submit your LTO related patch to the upstream project and
> get it merged, so that next time we update the fastd package we can
> get rid of the patch?

I suppose the upstream author will not apply it. I had a somewhat long
discussion in IRC with him. As stated in the patch his goal is to use
LTO to reduce binary size (binaries compiled with lto are actually
smaller and on a device with 4 MB flash this matters). However the cmake
approach (as I understood the cmake docs, which are very thin on this
topic) is like presented in my patch (which in fact does not work, but I
would just wait for an upcoming cmake version getting this right). 

What I tried first was just setting -DENABLE_LTO=OFF which was not
enough, compiling failed, because of the cmake hacks included in fastd
choosing wrong binutils. This hack is removed by my patch. In OpenWRT
the fastd author got a patch upstream enabling the plugins option in the
toolchain. I assumed this would not work with buildroot where you have
fine grained options to configure the toolchain.

Another option would for the fastd buildroot package could be to require
a toolchain with LTO support and just enable the related cmake option.

Thanks for review. :-)

Alex

-- 
?With the first link, the chain is forged. The first speech censured,
the first thought forbidden, the first freedom denied, chains us all
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: 02C8 A590 7FE5 CA5F 3601  D1D5 8FBA 7744 CC87 10D0 ***
