From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Sep 2011 22:39:48 +0200
Subject: [Buildroot] New package: portaudio
In-Reply-To: <CA+pfegE9ba4aUw=r+e=Mp7=E7rGLsu-MzOQ_EGKHoUubrOgc8A@mail.gmail.com>
 (Murat Demirten's message of "Sun, 7 Aug 2011 01:42:07 +0300")
References: <CA+pfegE9ba4aUw=r+e=Mp7=E7rGLsu-MzOQ_EGKHoUubrOgc8A@mail.gmail.com>
Message-ID: <874o0h7awb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Murat" == Murat Demirten <mdemirten@yh.com.tr> writes:

 Murat> PortAudio is a free, cross-platform, open-source, audio I/O library.

Thanks, committed with some fixes (see below):

 Murat> Signed-off-by: Murat Demirten <mdemirten@yh.com.tr>
 Murat> ---
 Murat>  package/multimedia/Config.in              |    1 +
 Murat>  package/multimedia/portaudio/Config.in    |   29 +++++++++++++++++++++++++++++
 Murat>  package/multimedia/portaudio/portaudio.mk |   20 ++++++++++++++++++++
 Murat>  3 files changed, 50 insertions(+), 0 deletions(-)
 Murat>  create mode 100644 package/multimedia/portaudio/Config.in
 Murat>  create mode 100644 package/multimedia/portaudio/portaudio.mk

 Murat> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Murat> index 79c601c..40760b7 100644
 Murat> --- a/package/multimedia/Config.in
 Murat> +++ b/package/multimedia/Config.in
 Murat> @@ -37,6 +37,7 @@ source "package/multimedia/mpd/Config.in"
 Murat>  source "package/multimedia/mpg123/Config.in"
 Murat>  source "package/multimedia/mplayer/Config.in"
 Murat>  source "package/multimedia/musepack/Config.in"
 Murat> +source "package/multimedia/portaudio/Config.in"
 Murat>  source "package/multimedia/python-mad/Config.in"
 Murat>  source "package/multimedia/speex/Config.in"
 Murat>  source "package/multimedia/swfdec/Config.in"
 Murat> diff --git a/package/multimedia/portaudio/Config.in
 Murat> b/package/multimedia/portaudio/Config.in
 Murat> new file mode 100644
 Murat> index 0000000..f94d405
 Murat> --- /dev/null
 Murat> +++ b/package/multimedia/portaudio/Config.in
 Murat> @@ -0,0 +1,29 @@
 Murat> +config BR2_PACKAGE_PORTAUDIO
 Murat> +       bool "portaudio"
 Murat> +       select BR2_PACKAGE_ALSA_LIB
 Murat> +       help
 Murat> +         PortAudio is a free, cross-platform, open-source,
 Murat> +         audio I/O library.
 Murat> +
 Murat> +         http://www.portaudio.com/download.html

Config.in files are indented with <tab> rather than spaces. The ALSA_LIB
dependency should be on the alsa option rather than the toplevel
portaudio one.

 Murat> +
 Murat> +config BR2_PACKAGE_PORTAUDIO_ALSA
 Murat> +       bool "With ALSA support"
 Murat> +       depends on BR2_PACKAGE_PORTAUDIO
 Murat> +       default y
 Murat> +       help
 Murat> +         Compile with ALSA support.
 Murat> +
 Murat> +config BR2_PACKAGE_PORTAUDIO_OSS
 Murat> +       bool "With OSS support"
 Murat> +       depends on BR2_PACKAGE_PORTAUDIO
 Murat> +       help
 Murat> +         Compile with OSS support.
 Murat> +
 Murat> +config BR2_PACKAGE_PORTAUDIO_CXX
 Murat> +       bool "Enable C++ bindings"
 Murat> +       depends on BR2_PACKAGE_PORTAUDIO
 Murat> +       default n
 Murat> +       help
 Murat> +         Enables C++ bindings.

This only makes sense if you have enabled C++ support, so you need to
depend on BR2_INSTALL_LIBSTDCPP.

'n' is default, so you can drop that line.

 Murat> +
 Murat> diff --git a/package/multimedia/portaudio/portaudio.mk
 Murat> b/package/multimedia/portaudio/portaudio.mk
 Murat> new file mode 100644
 Murat> index 0000000..5406e11
 Murat> --- /dev/null
 Murat> +++ b/package/multimedia/portaudio/portaudio.mk
 Murat> @@ -0,0 +1,20 @@
 Murat> +################################################################################
 Murat> +#
 Murat> +# portaudio
 Murat> +#
 Murat> +################################################################################
 Murat> +
 Murat> +PORTAUDIO_VERSION = V19
 Murat> +PORTAUDIO_SITE = http://www.portaudio.com/archives
 Murat> +PORTAUDIO_SOURCE = pa_stable_v19_20110326.tgz
 Murat> +PORTAUDIO_INSTALL_STAGING = YES
 Murat> +
 Murat> +PORTAUDIO_DEPENDENCIES = \
 Murat> +       $(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),libalsa)

The alsa-lib make target is 'alsa-lib'


-- 
Bye, Peter Korsgaard
