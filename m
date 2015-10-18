From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 18 Oct 2015 21:52:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdcadec: Add -fPIC to static
 build, enable shared build
In-Reply-To: <20151018210520.0c6971da@free-electrons.com>
References: <1445184515-6049-1-git-send-email-bernd.kuhls@t-online.de>
 <20151018210520.0c6971da@free-electrons.com>
Message-ID: <CAHXCMMLUFrW7TRn9qQDZE2PUBXUyZbCT8pKe8fP5B4TYZv75-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Bernd,

On Sun, Oct 18, 2015 at 9:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Bernd,
>
> On Sun, 18 Oct 2015 18:08:35 +0200, Bernd Kuhls wrote:
>> Adding -fPIC fixes
>> http://autobuild.buildroot.net/results/a19/a19023e094cbed491444665d6839a9e65a8eee6c/
>> http://autobuild.buildroot.net/results/98d/98dde028d1d6199f05c904b498bc39bbaa112aa6/
>> http://autobuild.buildroot.net/results/4ff/4ffcae6cae419df35e8ca29d429ee178bcf31882/
>> http://autobuild.buildroot.net/results/8ce/8ced16874255ace4923f6b8888c3fca07f28b804/

The coomit message is not as detailed and clear as it should be for
this tricky fix... :-/

>
> None of these configurations have BR2_STATIC_LIBS=y, so I fail to see
> why adding -fPIC when BR2_STATIC_LIBS=y would fix those issues.
>
> Moreover, using -fPIC for statically linked configurations generally
> doesn't make sense: the point of PIC code is to be Position
> Independent, which is needed for shared libraries. But not for
> statically linked programs.

AFAI understand these build failures, the problem comes from the
static library libdcadec.a that is unconditionnally built.
When the config has BR2_SHARED_LIBS=y, this static library got built
without -fPIC, then is used by ffmpeg to be linked against for some
shared objects libraries (e.g. libavcodec.so). That's right here that
error occurs.

>
>> The upstream Makefile also allows building a shared library if
>> CONFIG_SHARED=1 is added to _BUILD_CMDS.
>
> This probably fixes the problem however.

To fix this the options are:
1) build libdcadec as a shared library, if it is supported;
2) or, add -fPIC when BR2_SHARED_LIBS=y;
3) or, unconditionally add -fPIC.

My preference is option 1).

>
> So, can you explain the addition of -fPIC for BR2_STATIC_LIBS=y
> configurations?

IIRC, -fPIC on static libs does not have any harmful consequences,
only a slight overhead at some point due to some indirection.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
