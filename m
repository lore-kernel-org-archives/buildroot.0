From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 10:18:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-r128:
 bump version to 6.10.0
In-Reply-To: <1430555777-32638-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430555777-32638-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150713101838.26f5954d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  2 May 2015 10:36:17 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-cross-compile.patch                       |   23 ++++++++++++++++++++
>  .../xdriver_xf86-video-r128.hash                   |    2 ++
>  .../xdriver_xf86-video-r128.mk                     |    5 +++--
>  3 files changed, 28 insertions(+), 2 deletions(-)
>  create mode 100644 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash

I've applied your patch. However, could you work on a version of the
0001-cross-compile.patch that can be upstreamed? See below.

>   AC_MSG_CHECKING([whether to include DRI support])
> +@@ -121,7 +127,12 @@
> + AC_MSG_CHECKING([whether to enable EXA support])
> + if test "x$EXA" = xyes; then
> +         AC_MSG_RESULT(yes)
> +-        AC_CHECK_FILE(${sdkdir}/exa.h, [have_exa_h="yes"], [have_exa_h="no"])
> ++	if test "$cross_compiling" = "no" ; then
> ++		AC_CHECK_FILE(${sdkdir}/exa.h,
> ++                      [have_exa_h="yes"], [have_exa_h="no"])
> ++	else
> ++		have_exa_h="yes"
> ++	fi

Are you sure you need to change this? Isn't passing
ac_cv_file_exa_h=yes in the environment of the configure script
sufficient to tell AC_CHECK_FILE that the file is there?

Can you check this and update the patch accordingly? It would be nicer
to do it this way rather than hardcoding in the configure.in script
that exa_h=yes when we're cross-compiling.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
