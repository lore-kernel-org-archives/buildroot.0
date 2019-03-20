From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 23:58:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/gerbera: fix static build with
 vorbis
In-Reply-To: <20190320222123.18503-1-fontaine.fabrice@gmail.com>
References: <20190320222123.18503-1-fontaine.fabrice@gmail.com>
Message-ID: <976fbf1f-80dc-267d-9c54-e231bedb3dc7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/03/2019 23:21, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/2b99fabd798db84a0fce26ad696c58e54c6ff626
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...FMPEG.cmake-fix-static-linking-with-vorbi.patch | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/gerbera/0002-cmake-FindFFMPEG.cmake-fix-static-linking-with-vorbi.patch
> 
> diff --git a/package/gerbera/0002-cmake-FindFFMPEG.cmake-fix-static-linking-with-vorbi.patch b/package/gerbera/0002-cmake-FindFFMPEG.cmake-fix-static-linking-with-vorbi.patch
> new file mode 100644
> index 0000000000..7a7e9874ea
> --- /dev/null
> +++ b/package/gerbera/0002-cmake-FindFFMPEG.cmake-fix-static-linking-with-vorbi.patch
> @@ -0,0 +1,48 @@
> +From 61fb053773b04e9379e0367ec80aaa9848d7cbbc Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 20 Mar 2019 23:03:33 +0100
> +Subject: [PATCH] cmake/FindFFMPEG.cmake: fix static linking with vorbis
> +
> +Add ogg to FFMPEG_LIBRARIES in FindFFMPEG.cmake otherwise static
> +linking will fail as ogg is a dependency of vorbis
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/2b99fabd798db84a0fce26ad696c58e54c6ff626
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/gerbera/gerbera/pull/434]
> +---
> + cmake/FindFFMPEG.cmake | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/cmake/FindFFMPEG.cmake b/cmake/FindFFMPEG.cmake
> +index 7e9b0396..0a4a409f 100644
> +--- a/cmake/FindFFMPEG.cmake
> ++++ b/cmake/FindFFMPEG.cmake
> +@@ -107,6 +107,11 @@ FIND_LIBRARY(FFMPEG_vorbis_LIBRARY vorbis
> +         /usr/lib
> +         )
> + 
> ++FIND_LIBRARY(FFMPEG_ogg_LIBRARY ogg
> ++        /usr/local/lib
> ++        /usr/lib
> ++        )
> ++
> + FIND_LIBRARY(FFMPEG_dc1394_LIBRARY dc1394_control
> +         /usr/local/lib
> +         /usr/lib
> +@@ -176,6 +181,11 @@ IF (FFMPEG_INCLUDE_DIR)
> +                     LIST(APPEND FFMPEG_LIBRARIES ${FFMPEG_vorbis_LIBRARY})
> +                 ENDIF (FFMPEG_vorbis_LIBRARY)
> + 
> ++                # ogg is a dependency of vorbis 
> ++                IF (FFMPEG_ogg_LIBRARY)

 Shouldn't this be under the FFMPEG_vorbis_LIBRARY condition then?

 Regards,
 Arnout

> ++                    LIST(APPEND FFMPEG_LIBRARIES ${FFMPEG_ogg_LIBRARY})
> ++                ENDIF (FFMPEG_ogg_LIBRARY)
> ++
> +                 IF (FFMPEG_dc1394_LIBRARY)
> +                     LIST(APPEND FFMPEG_LIBRARIES ${FFMPEG_dc1394_LIBRARY})
> +                 ENDIF (FFMPEG_dc1394_LIBRARY)
> +-- 
> +2.14.1
> +
> 
