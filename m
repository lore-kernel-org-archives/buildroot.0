From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 9 Mar 2020 23:42:33 +0100
Subject: [Buildroot] [PATCH v6 01/28] package/qt5base: Do not build
 shared libs if BR2_STATIC_LIBS is chosen
In-Reply-To: <20200309222154.0eec932a@windsurf.home>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-2-anaumann@ultratronik.de>
 <20200309222154.0eec932a@windsurf.home>
Message-ID: <20200309234233.23d66662@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 9 Mar 2020 22:21:54 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:


> From package/qt5/Config.in:
>
> menuconfig BR2_PACKAGE_QT5
>         bool "Qt5"
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_USE_WCHAR
>         depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>         depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
>         # no built-in double-conversion support
>         depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
>         depends on !BR2_STATIC_LIBS
>

That is funny, depends on !BR2_nios2 because of double conversion,
just fixed by 'package/qt5base: fix double-conversion compile for nios2' ([1]),
which was a autobuild failure..., but I think QT5 was enabled via
package/pinentry/Config.in without the '!BR2_arc && !BR2_nios2 && !BR2_xtensa'
dependency....

Seems !BR2_nios2 can be dropped immediately from QT5 and !BR2_xtensa' after
back porting the second part from [2]...

Regards,
Peter


[1] https://git.buildroot.net/buildroot/commit/?id=e2fdb41f711db8894f9c5c83f32250728d4c3aa9
[2] https://github.com/google/double-conversion/commit/a54561be5588ac9b16d3c20760b9b554168bb8aa
