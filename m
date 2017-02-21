From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 21 Feb 2017 09:17:14 +0100
Subject: [Buildroot] [PATCH v5 00/19] Reproducible builds
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <12851589.XERjbWNCZC@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, 

On Tuesday 20 December 2016 14:46:17 CET J?r?me Pouiller wrote:
[...]
> Patches 11 to 19 are nearly a series in the series. Until now, most of binaries
> installed by libtool was configured with RPATH pointingto their build
> directory. Indeed, libtool add this path during compilation in order to be able
> to execute them directly from build directory. This path should normally
> removed during install, but Buildroot disable this behavior (patch 15). Simply
> re-enabling this behavior does not work. Indeed, during relink, libtool try to
> use .la that are not yet patched and fail to find libraries. On another side,
> libtool support usage of a sysroot since v1.5. To enable this support, we have
> to keep original values from .la file (patch 12 and 13) and inform libtool we
> are using a sysroot (patch 11).
> 
> Patch 14 fix a small incompatibility with unsafe path detection.
> 
> Since libtool is now correctly used, it is not more necessary to disable
> install directory sanity check (patch 17).
> 
> From libtool point of view, sysroot is not reachable from $(TARGET_DIR). So,
> during installation to $(TARGET_DIR), it add an entry in RPATH that point to
> $(STAGING_DIR). To fix this problem, we just have to inform libtool that
> $(STAGING_DIR) is reachable (patch 16).
> 
> Finally, I also clean up libtool infra from modification that seems useless now
> (patches 18 and 19).
> 
> I tested this series using internal toolchain and Linaro toolchain with these
> packages:
> 
>     BR2_INIT_SYSTEMD=y       (install public libraries in /usr/lib/systemd)
>     BR2_PACKAGE_LIBCDAUDIO=y (libtool 1.5)
>     BR2_PACKAGE_LIBLO=y      (libtool 2.2)
>     BR2_PACKAGE_MADPLAY=y    (unpatched libtool)
>     BR2_PACKAGE_ALSA_LIB=y   (optional dependency to Madplay)
>     BR2_PACKAGE_PYTHON=y
>     BR2_PACKAGE_PYTHON_PY_PYC=y
>     BR2_PACKAGE_GNUPG2=y
> 
> Except patches 12 and 13, I think whole series is bisectable.
[...]

As I said above, patches 11 to 19 of this series do a strong clean up
of libtool infrastructure. I think these patches are important for two
reasons:

   1. It is the best way to support reproducible build from different
      build paths
   2. Currently BR usage of libtool is not standard. These patches use
      libtool in the right way. It drop unnecessary RPATH from binaries.
      It drop most of patches applied to libtool.

However, this series do very intrusive changes and it is difficult to
review. Consequently, I think it is necessary to apply them very early
in a development cycle. So, I suggest to apply them to 'next' now.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
