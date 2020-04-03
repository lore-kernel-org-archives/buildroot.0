From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Apr 2020 22:28:02 +0200
Subject: [Buildroot] [git commit] package/polkit: bump to version 0.116
In-Reply-To: <20200402231049.12916682@windsurf.home>
References: <20191208145140.33E3E8899E@busybox.osuosl.org>
 <20200402231049.12916682@windsurf.home>
Message-ID: <20200403202802.GB22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Adam, Peter, All,

On 2020-04-02 23:10 +0200, Thomas Petazzoni spake thusly:
> On Sun, 8 Dec 2019 15:56:32 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> >  DEVELOPERS                                         |   1 +
> >  .../0001-make-netgroup-support-optional.patch      | 232 +++++++++++++++++++++
> 
> This patch in polkit touches configure.ac, but we don't have
> POLKIT_AUTORECONF = YES, which is not good.
> 
> The issue is that POLKIT_AUTORECONF = YES fails with:
> 
> src/polkit/Makefile.am:106: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
> src/polkitagent/Makefile.am:116: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
> 
> this is because the HAVE_INTROSPECTION automake conditional is defined
> in some m4 file installed by gobject-introspection, so when you have a
> configuration building polkit, but without gobject-introspection, it
> fails.
> 
> This is an issue we already faced with autoreconf: if a m4 macro from
> an optional dependency is used, you need this optional dependency
> installed to have its m4 macros, even if you don't care about this
> particular dependency.
> 
> I don't know of a good work-around for that. Perhaps Yann or Peter have
> some ideas ?

So I see a few options here, not all exlusive to the others:

  - push our patch upstream for the next relase,

  - try and fix our patch so that it does require autorecof (not easy
    I'm afraid)

  - make polkit a glibc-only package, and drop our patch

While the last option may seem lie a big hammer, we have only three
packages that have a dependency on polkit:

  - gvfs, but it's only an onptional dependency

  - systemd, but it's only an optional dependency, and systemd is
    glibc-onlt already

  - udisks, for which it is a mandatory dependency.

But even for udisk the situation is not so grim: now that we have
gobject-introspection, we can eventually bump udisks. And the newer
versions require goi, which is a glibc-only package.

So, making polkit glibc-only is not so bad I believe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
