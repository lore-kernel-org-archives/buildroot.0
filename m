From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Sep 2019 22:20:51 +0200
Subject: [Buildroot] [PATCH] package:gnuradio: bump to 3.8.0.0
In-Reply-To: <1567690842-33954-2-git-send-email-gwenj@trabucayre.com>
References: <1567690842-33954-1-git-send-email-gwenj@trabucayre.com>
 <1567690842-33954-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <fa451cf4-92f2-1f3e-1be3-d062a6d0a43c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/09/2019 15:40, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since 2019/08/09 a new version of gnuradio is available.
> This patch bump to this version with some modifications:
> - suppress the applied patch 0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
> - add a patch to have boost unit_test_framework optional instead of mandatory

 Has this been sent upstream?

> - add boost atomic (used by pmt), log4cpp (now mandatory) and gmp as
>   dependencies
> - suppress BR2_PACKAGE_GNURADIO_LOG no more available since log4cpp is mandatory

 You should say explicitly in the commit message that Config.in.legacy handling
is not needed because GR_LOG is now always enabled.

> - add -mfpu=neon if the compiler support this to avoid volk test failure
> 
> Since 2019/08/09 a new version of gnuradio is available.
> This patch bump to this version with some modifications:
> - suppress the applied patch 0001-socket_pdu_impl.cc-fix-build-with-boost-1.70.0.patch
> - add a patch to have boost unit_test_framework optional instead of mandatory
> - add boost atomic (used by pmt), log4cpp (now mandatory) and gmp as dependencies
> - suppress the no more available BR2_PACKAGE_GNURADIO_LOG, since log4cpp is mandatory
> - add -mfpu=neon if the compiler support this to avoid volk test failure

 Copy-paste error? :-)

> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[snip]
>  # CFLAGS to decide whether to build the NEON functions or not, and
>  # wants to see the string 'armv7' in the CFLAGS.
>  ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_HAS_NEON),yy)
> -GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -march=armv7-a"
> +GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -march=armv7-a -mfpu=neon"

 This change seems to conflict with the comment above. The comment says that the
CMakeLists look for the march=armv7-a to decide whether to enable NEON or not.
That kind of seems counter to passing -mfpu=neon in CFLAGS explicitly.

 So at least, the comment above should be updated. And probably the
-march=armv7-a is no longer needed. Or maybe it still is.

 Regards,
 Arnout


>  endif
>  
>  # As soon as -mfpu=neon is supported by the compiler, gnuradio will try
