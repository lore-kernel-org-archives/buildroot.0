From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Oct 2015 18:42:02 +0200
Subject: [Buildroot] [PATCH 1/1 v3] package/unscd: new package
In-Reply-To: <20151012143542.GA21707@dkarchlinux64.gateway.pace.com>
References: <1444399839-10680-1-git-send-email-rdkehn@yahoo.com>
 <20151010145055.GC3640@free.fr>
 <CAGduivzbZ7254DV3ya++mSQ1wj1QT93xViq7urj2WP2SS7z9Tw@mail.gmail.com>
 <20151012143542.GA21707@dkarchlinux64.gateway.pace.com>
Message-ID: <20151012164202.GB3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, MAxime, All,

On 2015-10-12 09:35 -0500, rdkehn at yahoo.com spake thusly:
> On Mon, Oct 12, 2015 at 10:34:09AM +0200, Maxime Hadjinlian wrote:
[--SNIP--]
> > nscd is a part of glibc, and looking at the code of glibc 2.22, the startup
> > script and systemd init file are included in the source. So I have a few
> > questions:
> > 
> > Why is this not a part of the glibc package as an option ?
> 
> ... good point.
> 
> I see glibc nscd (I'm using glibc 2.21) is built but not installed.
> Is the suggestion to add a nscd configuration option to glibc for
> native nscd or unscd?
> 
> If unscd is selected, only glibc nscd support files will be
> installed.

I would well see something along the lines of:

  - in toolchain/toolchain-common/in, add this:

    config BR2_GLIBC_NSCD
        bool "Install nscd"
        depends on BR2_TOOLCHAIN_USES_GLIBC

  - in package/unscd/Cofnig.in:

    config BR2_PACKAGE_UNSCD
        bool "unscd"
        depends on BR2_TOOLCHAIN_USES_GLIBC
        depends on !BR2_GLIBC_NSCD
        help
          unscd is a blabla replacement blabla...

          http://example.net/home/of/unscd

    comment "unscd needs an (e)glibc toolchain"
        depends on !BR2_TOOLCHAIN_USES_GLIBC

Note that we do not make BR2_GLIBC_NSCD an option of the glibc package,
because we also want to handle external toolchains. So it has to be a
toolchain option, not a package option.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
