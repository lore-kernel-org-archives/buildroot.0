From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jul 2019 00:09:45 +0200
Subject: [Buildroot] [PATCH] package/opencv3: allow to use pkg-config
 while cross-compiling
In-Reply-To: <20190723195040.5698-1-romain.naour@smile.fr>
References: <20190723195040.5698-1-romain.naour@smile.fr>
Message-ID: <20190724000945.4d3c47d6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Jul 2019 21:50:40 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Since version 3.4.1 [1], opencv disable pkg-config while cross-compiling to
> avoid host headers/libraries poisoning.
> 
> Due to this, opencv fail to detect ffmpeg, gstreamer and gtk dependencies
> even if	the corresponding support is requested by
> BR2_PACKAGE_OPENCV3_WITH_{FFMPEG,GSTREAMER,GTK2,GTK3}.
> 
> Maybe other dependencies are affected by this issue...
> 
> While configuring opencv we can notice the following messages:
> "-- OpenCV disables pkg-config to avoid using of host libraries. Consider using PKG_CONFIG_LIBDIR to specify target SYSROOT"
> "-- Can't find ffmpeg - 'pkg-config' utility is missing"
> 
> As the result ffmpeg and gstreamer are not enabled:
> --   Video I/O:
> --     FFMPEG:                      NO
> --       avcodec:                   NO
> --       avformat:                  NO
> --       avutil:                    NO
> --       swscale:                   NO
> --       avresample:                NO
> --     GStreamer:                   NO
> --     libv4l/libv4l2:              NO
> --     v4l/v4l2:                    linux/videodev2.h
> 
> We can fixes this by adding a new option OPENCV_ENABLE_PKG_CONFIG=ON
> 
> --   Video I/O:
> --     FFMPEG:                      YES
> --       avcodec:                   YES (ver 58.35.100)
> --       avformat:                  YES (ver 58.20.100)
> --       avutil:                    YES (ver 56.22.100)
> --       swscale:                   YES (ver 5.3.100)
> --       avresample:                YES (ver 4.0.0)
> --     GStreamer:
> --       base:                      YES (ver 1.16.0)
> --       video:                     YES (ver 1.16.0)
> --       app:                       YES (ver 1.16.0)
> --       riff:                      YES (ver 1.16.0)
> --       pbutils:                   YES (ver 1.16.0)
> --     libv4l/libv4l2:              NO
> --     v4l/v4l2:                    linux/videodev2.h
> 
> Add host-pkgconf in the dependencies.
> 
> If there is a path poisoning issue, it will be detected by the toolchain
> paranoid wrapper.
> 
> [1] https://github.com/opencv/opencv/commit/c4f9ff0285130bd8bcf9d87a9ea6949bdd7e9e5d
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> This patch should be backported to Buildroot 2019.02 that use opencv 3.4.2.
> ---
>  package/opencv3/opencv3.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
