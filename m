From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 May 2018 08:02:53 +0200
Subject: [Buildroot] [PATCH 1/1] libcurl: fix build with ssh2 and static
 mbedtls
In-Reply-To: <CAPi7W82RE+8-7eLJJ7vu4vsBfOxBHrBWrz0v3ZZG3gt+1XG+fA@mail.gmail.com>
References: <20180521114108.20916-1-fontaine.fabrice@gmail.com>
 <20180522230637.49906e43@windsurf>
 <CAPi7W82RE+8-7eLJJ7vu4vsBfOxBHrBWrz0v3ZZG3gt+1XG+fA@mail.gmail.com>
Message-ID: <20180523080253.06426712@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 May 2018 23:43:00 +0200, Fabrice Fontaine wrote:

> > Either it's a direct dependency of ssh2 and it should be in Libs. Or
> > it's an indirect dependency of ssh2 and should only be used when static
> > linking, in which case it should be only in Libs.private.
> >
> > Section thing that looks weird is: why a full path to libmbedcrypto.a
> > and not a -l flag ?
> >  
> Indeed, this seems pretty weird to me too.
> This patch to libssh2 was added recently to buildroot (see
> http://patchwork.ozlabs.org/patch/888395) by Baruch (now in cc).
> It seems that this full path is returned by the AC_LIB_HAVE_LINKFLAGS
> function, see https://github.com/libssh2/libssh2/blob/master/acinclude.m4.
> So, perhaps we could find a better patch for libssh2 instead of patching
> libcurl.

Indeed the resulting .pc file from libssh2 looks strange. But however,
I think your change to libcurl remains valid. 'pkg-config --libs' is
what should be used to get the linker flags. I don't see why libcurl
should filter the options and only keep the -l options. Other linker
options may be important.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
