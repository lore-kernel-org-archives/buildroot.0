From: Romain Izard <romain.izard.pro@gmail.com>
Date: Mon, 25 Apr 2016 18:42:39 +0200
Subject: [Buildroot] [PATCH] core/pkg-kconfig: use olddefconfig when
	available
In-Reply-To: <20160425153508.43945e3c@free-electrons.com>
References: <1461433564-21311-1-git-send-email-yann.morin.1998@free.fr>
 <20160425153508.43945e3c@free-electrons.com>
Message-ID: <CAGkQfmNa9MDGNWT2Ygn4B1R5i61frSoyiET+FojiW+8G02ZfcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-04-25 15:35 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> I am sorry, but I had to revert this commit. While it works in simple
> situations, it badly breaks the Busybox build in some situations:
>
>   http://autobuild.buildroot.org/?reason=busybox-1.24.2
>
> With just Busybox enabled in a minimal configuration, everything is
> fine. Enable "libtirpc" in the configuration, do a full rebuild ->
> Busybox will fail to build. I don't know if it's related specifically
> to libtirpc or to some of its dependencies, but it fails.
>
> A very quick research couldn't spot the source of the problem, so I
> simply reverted for now. Could you work on this and submit a new
> version of the patch that addresses this problem?
>

When testing with qemu_x86_defconfig, libtirpc and busybox I reproduce
the issue. Calling 'make busybox-menuconfig' returns errors when
updating the config file to merge buildroot-managed options with the new
busybox config file, as it tries to launch olddefconfig.

The first error in the build is "bash: command not found".

There is a problem with the shell command we tried to generate, as the
command line contains multiple levels of backticks. This comes from
libtirpc, which uses backticks to generate its CFLAGS.

It is possible to fix this by replacing the backticks in the
(2)_REGEN_DOT_CONFIG macro. Unfortunately, $(...) is detected by
make as its own syntax, so it is necessarily to use quadruple dollars.

The v6 revision of the patch, as it did not use backticks, did not have
this problem.

Best regards,
-- 
Romain Izard
