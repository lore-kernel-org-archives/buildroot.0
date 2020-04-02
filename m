From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Apr 2020 23:10:49 +0200
Subject: [Buildroot] [git commit] package/polkit: bump to version 0.116
In-Reply-To: <20191208145140.33E3E8899E@busybox.osuosl.org>
References: <20191208145140.33E3E8899E@busybox.osuosl.org>
Message-ID: <20200402231049.12916682@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Sun, 8 Dec 2019 15:56:32 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>  DEVELOPERS                                         |   1 +
>  .../0001-make-netgroup-support-optional.patch      | 232 +++++++++++++++++++++

This patch in polkit touches configure.ac, but we don't have
POLKIT_AUTORECONF = YES, which is not good.

The issue is that POLKIT_AUTORECONF = YES fails with:

src/polkit/Makefile.am:106: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
src/polkitagent/Makefile.am:116: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL

this is because the HAVE_INTROSPECTION automake conditional is defined
in some m4 file installed by gobject-introspection, so when you have a
configuration building polkit, but without gobject-introspection, it
fails.

This is an issue we already faced with autoreconf: if a m4 macro from
an optional dependency is used, you need this optional dependency
installed to have its m4 macros, even if you don't care about this
particular dependency.

I don't know of a good work-around for that. Perhaps Yann or Peter have
some ideas ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
