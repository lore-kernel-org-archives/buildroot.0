From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2015 19:29:45 +0200
Subject: [Buildroot] [PATCH 3/3] package/vlc: Improve libGL detection
In-Reply-To: <1433693658-20065-3-git-send-email-bernd.kuhls@t-online.de>
References: <1433693658-20065-1-git-send-email-bernd.kuhls@t-online.de>
 <1433693658-20065-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150607172945.GO3545@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-06-07 18:14 +0200, Bernd Kuhls spake thusly:
> mesa3d defaults to --enable-opengl due to its weird configure.ac:
> http://git.buildroot.net/buildroot/commit/package/mesa3d/mesa3d.mk?id=384d601d4ea2c41bb7928f756bfe88af4d38b38b
> 
> This leads to include/GL/gl.h and lib/pkgconfig/gl.pc being installed
> to STAGING_DIR. These files are enough for vlc to think that libGL.so
> is present which it is not in the defconfig being fixed by this patch.
> 
> Fixes
> http://autobuild.buildroot.net/results/e63/e639dabfb260006acb8a204851b96f9275ce53a7/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/0008-ac-check-lib-gl.patch |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/vlc/0008-ac-check-lib-gl.patch
> 
> diff --git a/package/vlc/0008-ac-check-lib-gl.patch b/package/vlc/0008-ac-check-lib-gl.patch
> new file mode 100644
> index 0000000..7fa46a3
> --- /dev/null
> +++ b/package/vlc/0008-ac-check-lib-gl.patch
> @@ -0,0 +1,18 @@
> +Improve libGL detection
> +
> +The presence of gl.pc does not mean that libGL.so was installed.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr vlc-2.2.1.org/configure.ac vlc-2.2.1/configure.ac
> +--- vlc-2.2.1.org/configure.ac	2015-04-13 09:57:54.000000000 +0200
> ++++ vlc-2.2.1/configure.ac	2015-06-07 17:35:22.014022842 +0200
> +@@ -3054,7 +3054,7 @@
> + 
> + have_gl="no"
> + PKG_CHECK_MODULES([GL], [gl], [
> +-  have_gl="yes"
> ++  AC_CHECK_LIB([GL],  [main],[ have_gl="yes"])

Instead of patching vlc, can't we fix mesa3d, by removing the offending
files when mesa3d is not configured to install them?

This patch only fixes vlc, but there might be other packages that would
mis-detect OpenGL in that situation, so rather than fixing each of
those, it would be better to fix mesa3d.

Regards,
Yann E. MORIN.

> + ], [
> +   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> + #ifdef _WIN32
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
