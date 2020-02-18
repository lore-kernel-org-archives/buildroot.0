From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 18 Feb 2020 23:19:36 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-02-17
In-Reply-To: <5e4ba90a.1c69fb81.f6b82.321eSMTPIN_ADDED_MISSING@mx.google.com>
References: <5e4ba90a.1c69fb81.f6b82.321eSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <2d80dc15-ed7d-1c07-0c15-5c91e4dec148@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 18/02/2020 ? 10:06, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Recent build failures and runtime-tests failures
> ================================================
> 
> This is the list of Buildroot build failures that occurred on
> 2020-02-17, and for which you are a registered architecture developer,
> package developer or defconfig developer. This list also include
> runtime tests failures. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> -------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>  aarch64_be  |         mesa3d-19.3.4          | http://autobuild.buildroot.net/results/b9b6281983388dc22d929887d653da3db60f1f2c

src/gbm/cd6bfad@@gbm at sha/main_backend.c.o: In function `_gbm_create_device':
backend.c:(.text+0x38): undefined reference to `gbm_dri_backend'
backend.c:(.text+0x40): undefined reference to `gbm_dri_backend'
backend.c:(.text+0x74): undefined reference to `gbm_dri_backend'
backend.c:(.text+0x78): undefined reference to `gbm_dri_backend'
collect2: error: ld returned 1 exit status

This issue has been trigged since "package/mesa3d: add option to configure gbm
support"

Before the gbm support was autodetected and enabled only when at least one dri
driver was enabled [1].

The meson build system seems to handle the case where no dri driver is enabled
[2] but it still use main/backend.c source file [3] that use gbm_dri_backend [4].

So, it seems that the GBM support needs a DRI driver unconditionally. Otherwise
the build break.

[1] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/meson.build#L348
[2] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/src/gbm/meson.build#L37
[3] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/src/gbm/meson.build#L24
[4] https://gitlab.freedesktop.org/mesa/mesa/blob/19.3/src/gbm/main/backend.c#L38

Best regards,
Romain


>   aarch64    |         mesa3d-19.3.4          | http://autobuild.buildroot.net/results/f552acdea51614fadd5c11a05387133b7af1531c
>     arm      |         mesa3d-19.3.4          | http://autobuild.buildroot.net/results/4cb5b42f355be081e92619172420a7d18975d2f3
>   powerpc    |         mesa3d-19.3.4          | http://autobuild.buildroot.net/results/116899080e6a88bb8818dfc368444cea26ece34c
>   riscv32    |          ogre-1.12.0           | http://autobuild.buildroot.net/results/a068320f0a1c5909c4e637c33496b6d947df5e73
> 
> 
> 
