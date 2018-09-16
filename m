From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 22:22:24 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix static linking build failure
 when using libavutil
In-Reply-To: <20180911204230.15890-1-giulio.benetti@micronovasrl.com>
References: <20180911204230.15890-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180916222224.519fa1f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Tue, 11 Sep 2018 22:42:30 +0200, Giulio Benetti wrote:
> When static linking programs using ffmpeg libraries, if linking against
> libavutil, -ldrm is listed before -lavutil.

I think this is not relevant in the explanation, the fact that motion
links with libdrm directly is independent from the fact that ffmpeg may
use libdrm internally.

> This leads to linking failure
> due to undefined reference of drmGetVersion() and drmFreeVersion().
> This is why when pkg-config generates libavutil.pc doesn't append -ldrm

pkg-config does not generate .pc files, it only reads them.

> after -lavutil.
> Subsequentely if a package uses pkg-config and ffmpeg it will load
> library dependencies from libavutil.pc without placing -ldrm at the tail.

Well, the fact that it's at the tail is a detail, but the main problem
is that the libavutil.pc file does not list *at all* the dependency on
libdrm.

> Without this fix the only way is to workaround the problem directly in
> the single package, like this:

"the single package" is not very clear, I would say "in each package
using ffmpeg".

> https://github.com/buildroot/buildroot/commit/daf7dd87f4d93923df5e757fd43b3ad214a4a2ae
> 
> Add patch to assure -ldrm comes after -lavutil when static linking.

No, that's not what the patch does. The patch ensures that libavutil.pc
tells pkg-config that linking against libdrm is needed.


> ++enabled libdrm            && require_pkg_config libdrm libdrm xf86drm.h drmGetVersion && LIBDRM="-ldrm"
> + enabled libfdk_aac        && { use_pkg_config libfdk_aac fdk-aac "fdk-aac/aacenc_lib.h" aacEncOpen ||
> +                                { require libfdk_aac fdk-aac/aacenc_lib.h aacEncOpen -lfdk-aac &&
> +                                  warn "using libfdk without pkg-config"; } }
> +@@ -7096,7 +7096,7 @@ source_path=${source_path}
> + LIBPREF=${LIBPREF}
> + LIBSUF=${LIBSUF}
> + 
> +-extralibs_avutil="$LIBRT $LIBM"
> ++extralibs_avutil="$LIBDRM $LIBRT $LIBM"

This fix is in fact not the most correct one. Indeed, it does the
following change to libavutil.pc:

-Libs: -L${libdir}  -lavutil -lm
+Libs: -L${libdir}  -lavutil -ldrm -lm

but the proper change would be:

 Libs: -L${libdir}  -lavutil -lm
-Libs.private:
+Libs.private: -ldrm

Indeed, when we're dynamic linking, there is no need to link consumers
of libavutil with libdrm. It is only when we're statically linking that
it should be done. And that's exactly what Libs vs. Libs.private is for.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
