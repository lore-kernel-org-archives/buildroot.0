From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 00:44:52 +0100
Subject: [Buildroot] [git commit] lcdproc: fix autobuilder failures
In-Reply-To: <20121115230738.33E869A031@busybox.osuosl.org>
References: <20121115230738.33E869A031@busybox.osuosl.org>
Message-ID: <20121116004452.635cf645@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 16 Nov 2012 00:06:10 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=ffdb08d2219d2613f3aa9b20c30b20090948dded
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The lcdproc version bump to 0.5.6 has resulted in autobuilder failures such as
> the following.
> 
>   http://autobuild.buildroot.org/results/9967bc20a6094e836c4c18ff2cd30edef143bb8e/build-end.log
> 
> The 0.5.6 release added a new glcd driver, which requires the freetype and zlib
> libraries. This patch makes the lcdproc package depend on freetype and zlib.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/lcdproc/Config.in  |    2 ++
>  package/lcdproc/lcdproc.mk |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
> index 820f4ea..e0afc44 100644
> --- a/package/lcdproc/Config.in
> +++ b/package/lcdproc/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_LCDPROC
>         bool "lcdproc"
> +       select BR2_PACKAGE_FREETYPE
>         select BR2_PACKAGE_NCURSES
> +       select BR2_PACKAGE_ZLIB
>         help
>           LCD display driver daemon and clients
>  
> diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
> index aa204f1..2a80289 100644
> --- a/package/lcdproc/lcdproc.mk
> +++ b/package/lcdproc/lcdproc.mk
> @@ -16,6 +16,6 @@ ifeq ($(BR2_PACKAGE_LCDPROC_MENUS),y)
>  LCDPROC_CONF_OPT += --enable-lcdproc-menus
>  endif
>  
> -LCDPROC_DEPENDENCIES = ncurses
> +LCDPROC_DEPENDENCIES = freetype ncurses zlib

Looking at the build failure (which got triggered again today), I am a
bit suspicious about this fix. The build failure is:

/scratch/peko/host/usr/bin/ccache /scratch/peko/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -I/scratch/peko/host/usr/include/freetype2 -I/scratch/peko/host/usr/include   -fPIC -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -Wno-unused-function -shared  -o glcd.so glcd-glcd_drv.o glcd-glcd-render.o libLCD.a  glcd-t6963.o t6963_low.o -L/scratch/peko/host/usr/lib -lfreetype -lz -lbz2    -ldl 
/scratch/peko/host/usr/lib/libfreetype.so: file not recognized: File format not recognized

The problem here is not a missing dependency on freetype, but rather
the fact that we have -I and -L options pointing to host headers and
libraries, while we are building something on the target. So maybe
adding freetype and zlib as dependencies work around the problem, but I
suspect that those wrong -I and -L lines might still be there, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
