From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Jan 2019 10:03:36 +0100
Subject: [Buildroot] [git commit] ffmpeg: fix static linking build
 failure when using libavutil
In-Reply-To: <20190128233144.1433A8132A@busybox.osuosl.org>
References: <20190128233144.1433A8132A@busybox.osuosl.org>
Message-ID: <2b98573b-12e5-5edb-e14c-bf867162f913@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Oopsie...

On 29/01/2019 00:16, Arnout Vandecappelle (Essensium/Mind) wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=483db9908985d023b858c0b59d4016f9abb4b6f9
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> If a package tries to static link with libavutil it fails due to the
> lack of libavutil private dependencies in libavutil.pc (-ldrm in this
> case).
> 
> Add patch to:
> - Check if libdrm is present.
> - Add it to Libs.private: in libavutil.pc if present.

 I didn't want to push this one, it was just a test. The patch no longer applies
to ffmpeg 3.4.5 so this is causing autobuilder breakage. Therefore, I pushed a
revert commit.

 Giulio, FYI, upstream has added an explicit $LIBDRM but not to Libs.Private, so
the static linking case still breaks for the same reason. The patch just needs
to be rebased (and sent upstream).

 Regards,
 Arnout

> 
> Fixes:
> http://autobuild.buildroot.net/results/766/766de487f394490df8c712652ac364ebb4a3ab14/
> http://autobuild.buildroot.net/results/041/041e29dfddb2da3309ac7d34a576c60c5a75fe4d/
> http://autobuild.buildroot.net/results/780/78061b61cfe3f42554a475c048d54dacacfe11d5/
> http://autobuild.buildroot.net/results/275/275e4e0030d26c029085b408cfb272d5633969c6/
> http://autobuild.buildroot.net/results/515/5152dcca58944cf732d09fba6e6c9af8a9243c75/
> http://autobuild.buildroot.net/results/395/395be1a9cab824b82ef34c2ebd84d54243029b33/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...0002-configure-add-LIBDRM-to-Libs.private.patch | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private.patch b/package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private.patch
> new file mode 100644
> index 0000000000..5493473d0f
> --- /dev/null
> +++ b/package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private.patch
> @@ -0,0 +1,68 @@
> +From e1e11d404eec24c158ae1241d6573c263e57a7b9 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +Date: Wed, 17 Oct 2018 13:13:10 +0200
> +Subject: [PATCH] configure: add LIBDRM to Libs.private
> +
> +When static linking programs using ffmpeg libraries, if linking against
> +libavutil, -ldrm is listed before -lavutil. This leads to linking
> +failure due to undefined reference of drmGetVersion() and
> +drmFreeVersion().
> +This is why when pkg-config create libavutil.pc doesn't append -ldrm
> +to Libs.private:.
> +
> +- Create LIBDRM=-ldrm in case libdrm is enabled.
> +- Add privatelibs_avutil variable for explicit private libraries to be
> +  appended to Libs.private:
> +- Add $LIBDRM to privatelibs_avutil.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> +---
> + configure                     | 3 ++-
> + ffbuild/pkgconfig_generate.sh | 3 ++-
> + 2 files changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 7377046d0a..0996d8a85d 100755
> +--- a/configure
> ++++ b/configure
> +@@ -5919,7 +5919,7 @@ enabled libcelt           && require libcelt celt/celt.h celt_decode -lcelt0 &&
> +                                die "ERROR: libcelt must be installed and version must be >= 0.11.0."; }
> + enabled libcaca           && require_pkg_config libcaca caca caca.h caca_create_canvas
> + enabled libdc1394         && require_pkg_config libdc1394 libdc1394-2 dc1394/dc1394.h dc1394_new
> +-enabled libdrm            && require_pkg_config libdrm libdrm xf86drm.h drmGetVersion
> ++enabled libdrm            && require_pkg_config libdrm libdrm xf86drm.h drmGetVersion && LIBDRM="-ldrm"
> + enabled libfdk_aac        && { use_pkg_config libfdk_aac fdk-aac "fdk-aac/aacenc_lib.h" aacEncOpen ||
> +                                { require libfdk_aac fdk-aac/aacenc_lib.h aacEncOpen -lfdk-aac &&
> +                                  warn "using libfdk without pkg-config"; } }
> +@@ -7097,6 +7097,7 @@ LIBPREF=${LIBPREF}
> + LIBSUF=${LIBSUF}
> + 
> + extralibs_avutil="$LIBRT $LIBM"
> ++privatelibs_avutil="$LIBDRM"
> + extralibs_avcodec="$extralibs"
> + extralibs_avformat="$extralibs"
> + extralibs_avdevice="$extralibs"
> +diff --git a/ffbuild/pkgconfig_generate.sh b/ffbuild/pkgconfig_generate.sh
> +index e5de6716d2..b86486a107 100755
> +--- a/ffbuild/pkgconfig_generate.sh
> ++++ b/ffbuild/pkgconfig_generate.sh
> +@@ -13,6 +13,7 @@ name=lib${shortname}
> + fullname=${name}${build_suffix}
> + comment=$2
> + libs=$(eval echo \$extralibs_${shortname})
> ++privatelibs=$(eval echo \$privatelibs_${shortname})
> + deps=$(eval echo \$${shortname}_deps)
> + 
> + for dep in $deps; do
> +@@ -39,7 +40,7 @@ Requires: $($shared || echo $requires)
> + Requires.private: $($shared && echo $requires)
> + Conflicts:
> + Libs: -L\${libdir} $rpath -l${fullname#lib} $($shared || echo $libs)
> +-Libs.private: $($shared && echo $libs)
> ++Libs.private: $($shared && echo $libs) ${privatelibs}
> + Cflags: -I\${includedir}
> + EOF
> + 
> +-- 
> +2.17.1
> +
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
