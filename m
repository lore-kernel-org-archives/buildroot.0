From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 22:02:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdcadec: Add -fPIC to static
 build, enable shared build
In-Reply-To: <CAHXCMMLUFrW7TRn9qQDZE2PUBXUyZbCT8pKe8fP5B4TYZv75-A@mail.gmail.com>
References: <1445184515-6049-1-git-send-email-bernd.kuhls@t-online.de>
 <20151018210520.0c6971da@free-electrons.com>
 <CAHXCMMLUFrW7TRn9qQDZE2PUBXUyZbCT8pKe8fP5B4TYZv75-A@mail.gmail.com>
Message-ID: <20151018220201.077078ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Oct 2015 21:52:38 +0200, Samuel Martin wrote:

> > None of these configurations have BR2_STATIC_LIBS=y, so I fail to see
> > why adding -fPIC when BR2_STATIC_LIBS=y would fix those issues.
> >
> > Moreover, using -fPIC for statically linked configurations generally
> > doesn't make sense: the point of PIC code is to be Position
> > Independent, which is needed for shared libraries. But not for
> > statically linked programs.
> 
> AFAI understand these build failures, the problem comes from the
> static library libdcadec.a that is unconditionnally built.
> When the config has BR2_SHARED_LIBS=y, this static library got built
> without -fPIC, then is used by ffmpeg to be linked against for some
> shared objects libraries (e.g. libavcodec.so). That's right here that
> error occurs.

This, I'm OK with.

> >> The upstream Makefile also allows building a shared library if
> >> CONFIG_SHARED=1 is added to _BUILD_CMDS.
> >
> > This probably fixes the problem however.
> 
> To fix this the options are:
> 1) build libdcadec as a shared library, if it is supported;
> 2) or, add -fPIC when BR2_SHARED_LIBS=y;
> 3) or, unconditionally add -fPIC.
> 
> My preference is option 1).

Obviously, (1) is the right solution here.

> > So, can you explain the addition of -fPIC for BR2_STATIC_LIBS=y
> > configurations?
> 
> IIRC, -fPIC on static libs does not have any harmful consequences,
> only a slight overhead at some point due to some indirection.

Correct. But it doesn't make sense to explicitly add -fPIC when
BR2_STATIC_LIBS=y.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
