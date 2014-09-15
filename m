From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Mon, 15 Sep 2014 23:16:15 +0200
Subject: [Buildroot] [PATCH 3/4] arch: do not distinguish revisions of
	ARM1136JF-S
In-Reply-To: <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CA+sos79OX4szK9uimm1dVW62UtjOnFewhm2eFDF5sF01owQLHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Sep 15, 2014 at 11:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> In commit 88cf3bb91792c9c04586e14f293d89a6e0c13e1d
> ("arch/Config.in.arm: Use armv6k for arm1136jf-s rev1"), Beno?t
> Th?baudeau added separate options for the revision 0 and revision 1 of
> the ARM1136JF-S processor, so that different -march values could be
> used (armv6j for revision 0, armv6k for revision 1).
>
> However, this is preventing the removal of the BR2_GCC_TARGET_ARCH
> option, which we need to do to give only the CPU type to gcc, and let
> it decide the architecture variant that matches. This is because this
> story of revision 0 vs. revision 1 is the only case where -mcpu
> doesn't fully define the CPU.
>
> Moreover, a quick test with gcc shows that -march=armv6j
> -mcpu=arm1136jf-s is accepted, while -march=armv6k -mcpu=arm1136jf-s
> makes gcc complain: " warning: switch -mcpu=arm1136jf-s conflicts with
> -march=armv6k switch".

Yes, because -mcpu=arm1136jf-s implies -march=armv6j. But how about
keeping -march and -mtune, and removing -mcpu, instead of the
contrary? This would give more flexibility, and full control over the
CPU optimization.

> In addition, gcc 5 will apparently no longer allow to pass all of
> --with-arch, --with-cpu and --with-tune, so we will anyway have to
> rely only on one of them.

What combinations will no longer be supported? Only -mcpu with -march
and -mtune?

[...]

Best regards,
Beno?t
