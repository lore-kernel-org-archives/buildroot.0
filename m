From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2020 22:49:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build with jasper
 >= 2.0.17
In-Reply-To: <20200816120341.1090911-1-fontaine.fabrice@gmail.com>
References: <20200816120341.1090911-1-fontaine.fabrice@gmail.com>
Message-ID: <20200816204928.GH24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-08-16 14:03 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/8da00d4b079195f45fe74d879b10db05d74d0559
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...0001-Fix-build-of-grfmt_jpeg2000-cpp.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/opencv3/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
> 
> diff --git a/package/opencv3/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch b/package/opencv3/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
> new file mode 100644
> index 0000000000..e54fab852a
> --- /dev/null
> +++ b/package/opencv3/0001-Fix-build-of-grfmt_jpeg2000-cpp.patch
> @@ -0,0 +1,37 @@
> +From f66fc199a20882c546fa31142e9c0f5a8b3cf983 Mon Sep 17 00:00:00 2001
> +From: Florian Jung <flo@windfis.ch>
> +Date: Wed, 29 Jul 2020 18:51:55 +0200
> +Subject: [PATCH] Fix build of grfmt_jpeg2000.cpp
> +
> +libjasper has recently changed `jas_matrix_get` from a macro to an inline function
> +(389951d071 in https://github.com/jasper-software/jasper), causing the build to fail.
> +
> +[Retrieved from:
> +https://github.com/opencv/opencv/commit/f66fc199a20882c546fa31142e9c0f5a8b3cf983]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + modules/imgcodecs/src/grfmt_jpeg2000.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/modules/imgcodecs/src/grfmt_jpeg2000.cpp b/modules/imgcodecs/src/grfmt_jpeg2000.cpp
> +index fe69f80c86f..0f4d28d6f4d 100644
> +--- a/modules/imgcodecs/src/grfmt_jpeg2000.cpp
> ++++ b/modules/imgcodecs/src/grfmt_jpeg2000.cpp
> +@@ -377,7 +377,7 @@ bool  Jpeg2KDecoder::readComponent8u( uchar *data, void *_buffer,
> + 
> +     for( y = 0; y < yend - ystart; )
> +     {
> +-        jas_seqent_t* pix_row = &jas_matrix_get( buffer, y / ystep, 0 );
> ++        jas_seqent_t* pix_row = jas_matrix_getref( buffer, y / ystep, 0 );
> +         uchar* dst = data + (y - yoffset) * step - xoffset;
> + 
> +         if( xstep == 1 )
> +@@ -443,7 +443,7 @@ bool  Jpeg2KDecoder::readComponent16u( unsigned short *data, void *_buffer,
> + 
> +     for( y = 0; y < yend - ystart; )
> +     {
> +-        jas_seqent_t* pix_row = &jas_matrix_get( buffer, y / ystep, 0 );
> ++        jas_seqent_t* pix_row = jas_matrix_getref( buffer, y / ystep, 0 );
> +         ushort* dst = data + (y - yoffset) * step - xoffset;
> + 
> +         if( xstep == 1 )
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
