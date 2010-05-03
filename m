From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 3 May 2010 12:22:04 +0200
Subject: [Buildroot] gst-plugins-ugly fail to build
In-Reply-To: <4BDEA010.4010509@digi.com>
References: <4BDEA010.4010509@digi.com>
Message-ID: <o2h4d28d4b51005030322o6b82f627t9d62f6877ac21147@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems the LD_LIBRARY_PATH stuff has made some colateral damages ;)
You're the second person to report such a bug.

This patch : http://lists.busybox.net/pipermail/buildroot/2010-April/034042.html
might fix the problem.


On Mon, May 3, 2010 at 12:06 PM, Javier Viguera <javier.viguera@digi.com> wrote:
> Hi all,
>
> Seems that somehow a host library is leaking when cross-building
> gst-plugins-ugly for ARM.
>
> My current setup is latest buildroot (git sha1 0cd0d0647) with external
> toolchain built with crosstool-NG (arm + eglibc toolchain).
>
> The error reported is:
>
> libtool: link:
> /usr/local/DigiEL-5.5/x-tools/arm-unknown-linux-gnueabi/bin/arm-linux-gcc
> -O3 -mcpu=cortex-a8 -mfpu=neon -ftree-vectorize -mfloat-abi=softfp
> -ffast-math -fsingle-precision-constant -O3 ?-mabi=aapcs-linux
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot
> /data/repo/buildroot.git/output/staging/ -shared
> .libs/libgstmpegaudioparse_la-plugin.o
> .libs/libgstmpegaudioparse_la-gstmpegaudioparse.o
> .libs/libgstmpegaudioparse_la-gstxingmux.o ? -Wl,-rpath
> -Wl,/data/repo/buildroot.git/output/host/usr/lib -Wl,-rpath
> -Wl,/data/repo/buildroot.git/output/host/usr/lib -lgstbase-0.10
> -L/data/repo/buildroot.git/output/host/lib
> -L/data/repo/buildroot.git/output/host/usr/lib -lgstreamer-0.10
> /data/repo/buildroot.git/output/host/usr/lib/libgobject-2.0.so
> /data/repo/buildroot.git/output/host/usr/lib/libgmodule-2.0.so -ldl
> /data/repo/buildroot.git/output/host/usr/lib/libgthread-2.0.so -lpthread
> -lrt -lxml2 /data/repo/buildroot.git/output/host/usr/lib/libglib-2.0.so
> -lintl ?-mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mabi=aapcs-linux
> -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mabi=aapcs-linux -pthread
> -pthread ? -pthread -Wl,-soname -Wl,libgstmpegaudioparse.so
> -Wl,-version-script -Wl,.libs/libgstmpegaudioparse.ver -o
> .libs/libgstmpegaudioparse.so
>
>> /data/repo/buildroot.git/output/host/usr/lib/libgobject-2.0.so: could not
>> read symbols: File in wrong format
>> collect2: ld returned 1 exit status
>
> So it seems that it's trying to link a library built for the host while
> cross-compiling for the target and it fails.
>
> Attached also the failing buildroot config file for anyone to reproduce. I
> have also a complete build.log file but it is about 175KB compressed so i
> guess the list won't accept such big files.
>
> Does anyone have the same problem? Known bug?
>
> --
> Regards,
>
> Javier Viguera
> Software Engineer
>
> Digi International Spain, S.A.
> http://www.digi.com
>
> #
> # Automatically generated make config: don't edit
> # Mon May ?3 11:35:20 2010
> #
> BR2_HAVE_DOT_CONFIG=y
> BR2_VERSION="2010.05-git"
> # BR2_alpha is not set
> BR2_arm=y
> # BR2_armeb is not set
> # BR2_avr32 is not set
> # BR2_cris is not set
> # BR2_ia64 is not set
> # BR2_i386 is not set
> # BR2_m68k is not set
> # BR2_mips is not set
> # BR2_mipsel is not set
> # BR2_powerpc is not set
> # BR2_sh is not set
> # BR2_sh64 is not set
> # BR2_sparc is not set
> # BR2_sparc64 is not set
> # BR2_x86_64 is not set
> # BR2_xtensa is not set
> BR2_generic_arm=y
> # BR2_arm7tdmi is not set
> # BR2_arm610 is not set
> # BR2_arm710 is not set
> # BR2_arm720t is not set
> # BR2_arm920t is not set
> # BR2_arm922t is not set
> # BR2_arm926t is not set
> # BR2_arm10t is not set
> # BR2_arm1136jf_s is not set
> # BR2_arm1176jz_s is not set
> # BR2_arm1176jzf_s is not set
>
> #
> # cortex-A8 needs gcc >= 4.4.x
> #
> # BR2_cortex_a8 is not set
> # BR2_sa110 is not set
> # BR2_sa1100 is not set
> # BR2_xscale is not set
> # BR2_iwmmxt is not set
> BR2_ARM_TYPE="GENERIC_ARM"
> BR2_ARM_EABI=y
> # BR2_ARM_OABI is not set
> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_ABI="aapcs-linux"
>
> #
> # Target options
> #
>
> #
> # Preset Devices
> #
> # BR2_TARGET_ARMLTD is not set
> # BR2_TARGET_ATMEL is not set
> # BR2_TARGET_KWIKBYTE is not set
> BR2_TARGET_GENERIC_HOSTNAME="buildroot"
> BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
> # BR2_TARGET_GENERIC_GETTY is not set
>
> #
> # Build options
> #
>
> #
> # Commands
> #
> BR2_WGET="wget --passive-ftp -nd"
> BR2_SVN_CO="svn co"
> BR2_SVN_UP="svn up"
> BR2_BZR_CO="bzr co"
> BR2_BZR_UP="bzr up"
> BR2_GIT="git clone"
> BR2_ZCAT="gzip -d -c"
> BR2_BZCAT="bzcat"
> BR2_TAR_OPTIONS=""
> BR2_DL_DIR="$(TOPDIR)/dl"
> BR2_COPYTO=""
> BR2_STAGING_DIR="$(BASE_DIR)/staging"
>
> #
> # Mirrors and Download locations
> #
> BR2_PRIMARY_SITE=""
> BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
> BR2_SOURCEFORGE_MIRROR="easynews"
> BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
> BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
> BR2_DEBIAN_MIRROR="http://ftp.debian.org"
> BR2_JLEVEL=4
> # BR2_DEPRECATED is not set
> # BR2_ENABLE_DEBUG is not set
> BR2_STRIP_strip=y
> # BR2_STRIP_sstrip is not set
> # BR2_STRIP_none is not set
> # BR2_OPTIMIZE_0 is not set
> # BR2_OPTIMIZE_1 is not set
> # BR2_OPTIMIZE_2 is not set
> BR2_OPTIMIZE_3=y
> # BR2_OPTIMIZE_S is not set
> # BR2_PREFER_STATIC_LIB is not set
> # BR2_HAVE_DOCUMENTATION is not set
> # BR2_HAVE_DEVFILES is not set
>
> #
> # Advanced
> #
> # BR2_CONFIG_CACHE is not set
>
> #
> # Toolchain
> #
> # BR2_TOOLCHAIN_BUILDROOT is not set
> BR2_TOOLCHAIN_EXTERNAL=y
> # BR2_TOOLCHAIN_EXTERNAL_UCLIBC is not set
> BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_STRIP=y
>
> #
> # Gdb Options
> #
> # BR2_PACKAGE_GDB is not set
>
> #
> # Gdb debugger for the target needs WCHAR support in toolchain
> #
> # BR2_PACKAGE_GDB_SERVER is not set
> # BR2_PACKAGE_GDB_HOST is not set
>
> #
> # Common Toolchain Options
> #
> BR2_LARGEFILE=y
> BR2_INET_IPV6=y
> BR2_INET_RPC=y
> BR2_ENABLE_LOCALE=y
> # BR2_ENABLE_LOCALE_PURGE is not set
> BR2_USE_WCHAR=y
> BR2_PREFER_SOFT_FLOAT=y
> # BR2_SOFT_FLOAT is not set
> # BR2_USE_SSP is not set
> # BR2_PTHREADS_NONE is not set
> # BR2_PTHREADS is not set
> BR2_PTHREADS_OLD=y
> # BR2_PTHREADS_NATIVE is not set
> BR2_PROGRAM_INVOCATION=y
> BR2_GCC_CROSS_CXX=y
> BR2_INSTALL_LIBSTDCPP=y
> BR2_TARGET_OPTIMIZATION="-O3 -mcpu=cortex-a8 -mfpu=neon -ftree-vectorize
> -mfloat-abi=softfp -ffast-math -fsingle-precision-constant"
> BR2_TOOLCHAIN_EXTERNAL_PATH="/usr/local/DigiEL-5.5/x-tools/arm-unknown-linux-gnueabi"
> BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
>
> #
> # Package Selection for the target
> #
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> # BR2_PACKAGE_CUSTOMIZE is not set
>
> #
> # Audio and video libraries and applications
> #
> # BR2_PACKAGE_ALSA_LIB is not set
> # BR2_PACKAGE_AUMIX is not set
> # BR2_PACKAGE_FLAC is not set
> BR2_PACKAGE_GSTREAMER=y
> BR2_PACKAGE_GSTREAMER_LIBXML2=y
> BR2_PACKAGE_GST_PLUGINS_BASE=y
>
> #
> # dependency-less plugins
> #
> # BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER is not set
> # BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP is not set
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOCONVERT=y
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORATE=y
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE=y
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE=y
> # BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_GDP is not set
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK=y
> # BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE is not set
> # BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TCP is not set
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TYPEFIND=y
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEORATE=y
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOSCALE=y
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VOLUME=y
>
> #
> # plugins with external dependencies (there may be more available)
> #
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG=y
> # BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO is not set
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA=y
> BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS=y
> BR2_PACKAGE_GST_PLUGINS_GOOD=y
> # BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PNG is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB is not set
>
> #
> # dependency-less plugins
> #
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ALPHA is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_APETAG is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOFX is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUPARSE is not set
> BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
> BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AVI=y
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CUTTER is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUGUTILS is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEINTERLACE is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EFFECTV is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EQUALIZER is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLV is not set
> BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ICYDEMUX is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1 is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LEVEL is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIFILE is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIPART is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_REPLAYGAIN is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTP is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTPMANAGER is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTSP is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SMPTE is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOCROP is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVENC is not set
> BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE=y
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_Y4M is not set
>
> #
> # plugins with external dependencies
> #
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC is not set
> BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS=y
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC is not set
> # BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX is not set
> BR2_PACKAGE_GST_PLUGINS_BAD=y
>
> #
> # dependency-less plugins
> #
> BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AACPARSE=y
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFFPARSE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AMRPARSE is not set
> BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX=y
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HDVPARSE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER is not set
> BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGDEMUX=y
> BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX=y
> BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEG4VIDEOPARSE=y
> BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGVIDEOPARSE=y
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MVE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MXF is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NSF is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NUVDEMUX is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_QTMUX is not set
> BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE=y
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMANAGER is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SELECTOR is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SHAPEWIPE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VALVE is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_XDGMIME is not set
>
> #
> # plugins with external dependencies (there may be more available)
> #
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB is not set
> BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV=y
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OSS4 is not set
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL is not set
> BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TREMOR=y
> # BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD is not set
> BR2_PACKAGE_GST_PLUGINS_UGLY=y
>
> #
> # dependency-less plugins
> #
> # BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ASFDEMUX is not set
> # BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC is not set
> # BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDSUB is not set
> # BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_IEC958 is not set
> BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGAUDIOPARSE=y
> BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGSTREAM=y
> # BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_REALMEDIA is not set
> # BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_SYNAESTHESIA is not set
>
> #
> # plugins with external dependencies (there may be more available)
> #
> BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG=y
> BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD=y
> # BR2_PACKAGE_LIBCDAUDIO is not set
> # BR2_PACKAGE_LIBDVDREAD is not set
> # BR2_PACKAGE_LIBDVDNAV is not set
> BR2_PACKAGE_LIBID3TAG=y
> BR2_PACKAGE_LIBMAD=y
> # BR2_PACKAGE_LIBMMS is not set
> # BR2_PACKAGE_LIBMPD is not set
> BR2_PACKAGE_LIBOGG=y
> # BR2_PACKAGE_LIBSNDFILE is not set
> BR2_PACKAGE_LIBTHEORA=y
> BR2_PACKAGE_LIBVORBIS=y
> # BR2_PACKAGE_MADPLAY is not set
> # BR2_PACKAGE_MPG123 is not set
> # BR2_PACKAGE_MPLAYER is not set
> # BR2_PACKAGE_SPEEX is not set
> # BR2_PACKAGE_SWFDEC is not set
> # BR2_PACKAGE_FESTIVAL is not set
> # BR2_PACKAGE_TAGLIB is not set
> BR2_PACKAGE_TREMOR=y
> # BR2_PACKAGE_VLC is not set
>
> #
> # Compressors and decompressors
> #
> # BR2_PACKAGE_BZIP2 is not set
> # BR2_PACKAGE_GZIP is not set
> # BR2_PACKAGE_LZOP is not set
> # BR2_PACKAGE_LZMA is not set
>
> #
> # Debugging, profiling and benchmark
> #
> # BR2_PACKAGE_DMALLOC is not set
> # BR2_PACKAGE_KEXEC is not set
> # BR2_PACKAGE_LMBENCH is not set
> # BR2_PACKAGE_LSOF is not set
> # BR2_PACKAGE_LTP-TESTSUITE is not set
> # BR2_PACKAGE_LTRACE is not set
> # BR2_PACKAGE_MEMSTAT is not set
> # BR2_PACKAGE_NETPERF is not set
> # BR2_PACKAGE_OPROFILE is not set
> # BR2_PACKAGE_STRACE is not set
>
> #
> # Development tools
> #
> # BR2_PACKAGE_AUTOCONF is not set
> # BR2_PACKAGE_AUTOMAKE is not set
> # BR2_PACKAGE_BISON is not set
> # BR2_PACKAGE_BSDIFF is not set
> # BR2_PACKAGE_CCACHE_TARGET is not set
> # BR2_PACKAGE_COREUTILS is not set
> # BR2_PACKAGE_CVS is not set
> # BR2_PACKAGE_DIFFUTILS is not set
> # BR2_PACKAGE_DISTCC is not set
> # BR2_PACKAGE_FAKEROOT is not set
> # BR2_PACKAGE_FINDUTILS is not set
> # BR2_PACKAGE_FLEX is not set
> # BR2_PACKAGE_GAWK is not set
>
> #
> # native toolchain needs development files in target filesystem
> #
> BR2_PACKAGE_GETTEXT=y
> # BR2_PACKAGE_GETTEXT_STATIC is not set
> BR2_PACKAGE_LIBINTL=y
> # BR2_PACKAGE_LIBGMP is not set
> # BR2_PACKAGE_GPERF is not set
> # BR2_PACKAGE_GREP is not set
> # BR2_PACKAGE_INTLTOOL is not set
> # BR2_PACKAGE_MAKE is not set
> # BR2_PACKAGE_LIBMPFR is not set
> # BR2_PACKAGE_LIBTOOL is not set
> # BR2_PACKAGE_M4 is not set
> # BR2_PACKAGE_PATCH is not set
> # BR2_PACKAGE_PKG_CONFIG is not set
> # BR2_PACKAGE_SED is not set
> # BR2_PACKAGE_TAR is not set
>
> #
> # Games
> #
> # BR2_PACKAGE_GNUCHESS is not set
> # BR2_PACKAGE_PRBOOM is not set
>
> #
> # Graphic libraries and applications (graphic/text)
> #
>
> #
> # graphic libraries
> #
> # BR2_PACKAGE_DIRECTFB is not set
> # BR2_PACKAGE_FBDUMP is not set
> # BR2_PACKAGE_FBSET is not set
> # BR2_PACKAGE_FBV is not set
> # BR2_PACKAGE_IMAGEMAGICK is not set
> # BR2_PACKAGE_LINUX_FUSION is not set
> # BR2_PACKAGE_SDL is not set
>
> #
> # other GUIs
> #
> # BR2_PACKAGE_QT is not set
> # BR2_PACKAGE_XORG7 is not set
>
> #
> # X libraries and helper libraries
> #
> # BR2_PACKAGE_LIBERATION is not set
>
> #
> # X Window managers
> #
>
> #
> # X applications
> #
> # BR2_PACKAGE_GOB2 is not set
> # BR2_PACKAGE_SYLPHEED is not set
>
> #
> # Hardware handling
> #
> # BR2_PACKAGE_CDRKIT is not set
> # BR2_PACKAGE_CRAMFS is not set
> # BR2_PACKAGE_DBUS is not set
> # BR2_PACKAGE_DEVMEM2 is not set
> # BR2_PACKAGE_DMRAID is not set
> # BR2_PACKAGE_DOSFSTOOLS is not set
> # BR2_PACKAGE_E2FSPROGS is not set
> # BR2_PACKAGE_EEPROG is not set
> # BR2_PACKAGE_FCONFIG is not set
> # BR2_PACKAGE_FIS is not set
> # BR2_PACKAGE_GADGETFS_TEST is not set
> # BR2_PACKAGE_GENEXT2FS is not set
> # BR2_PACKAGE_GENROMFS is not set
> # BR2_PACKAGE_GVFS is not set
> # BR2_PACKAGE_HAL is not set
> # BR2_PACKAGE_HDPARM is not set
> # BR2_PACKAGE_HOTPLUG is not set
> # BR2_PACKAGE_HWDATA is not set
> # BR2_PACKAGE_I2C_TOOLS is not set
> # BR2_PACKAGE_INPUT_TOOLS is not set
> # BR2_PACKAGE_IOSTAT is not set
> # BR2_PACKAGE_LM_SENSORS is not set
> # BR2_PACKAGE_LVM2 is not set
> # BR2_PACKAGE_MAKEDEVS is not set
> # BR2_PACKAGE_MDADM is not set
> # BR2_PACKAGE_MEMTESTER is not set
> # BR2_PACKAGE_MTD is not set
> # BR2_PACKAGE_NTFS_3G is not set
> # BR2_PACKAGE_NTFSPROGS is not set
> # BR2_PACKAGE_PCIUTILS is not set
> # BR2_PACKAGE_SETSERIAL is not set
> # BR2_PACKAGE_SFDISK is not set
> # BR2_PACKAGE_SMARTMONTOOLS is not set
> # BR2_PACKAGE_SQUASHFS is not set
> # BR2_PACKAGE_SYSSTAT is not set
> # BR2_PACKAGE_UDEV is not set
> # BR2_PACKAGE_USB_MODESWITCH is not set
> # BR2_PACKAGE_USBMOUNT is not set
> # BR2_PACKAGE_USBUTILS is not set
> # BR2_PACKAGE_WIPE is not set
> # BR2_PACKAGE_XFSPROGS is not set
>
> #
> # Interpreter languages and scripting
> #
> # BR2_PACKAGE_HASERL is not set
> # BR2_PACKAGE_LUA is not set
> # BR2_PACKAGE_MICROPERL is not set
> # BR2_PACKAGE_PHP is not set
> # BR2_PACKAGE_PYTHON is not set
> # BR2_PACKAGE_RUBY is not set
> # BR2_PACKAGE_TCL is not set
>
> #
> # Libraries
> #
>
> #
> # Compression and decompression
> #
> # BR2_PACKAGE_LIBARCHIVE is not set
> # BR2_PACKAGE_LZO is not set
> BR2_PACKAGE_ZLIB=y
>
> #
> # Crypto
> #
> # BR2_PACKAGE_BEECRYPT is not set
> # BR2_PACKAGE_LIBGCRYPT is not set
> # BR2_PACKAGE_LIBGPG_ERROR is not set
> # BR2_PACKAGE_OPENSSL is not set
>
> #
> # Database
> #
> # BR2_PACKAGE_BERKELEYDB is not set
> # BR2_PACKAGE_MYSQL_CLIENT is not set
> # BR2_PACKAGE_SQLITE is not set
>
> #
> # Filesystem
> #
> # BR2_PACKAGE_GAMIN is not set
> # BR2_PACKAGE_LIBCONFIG is not set
> # BR2_PACKAGE_LIBCONFUSE is not set
> # BR2_PACKAGE_LIBFUSE is not set
> # BR2_PACKAGE_LIBLOCKFILE is not set
> # BR2_PACKAGE_LIBSYSFS is not set
>
> #
> # Graphics
> #
> # BR2_PACKAGE_ATK is not set
> # BR2_PACKAGE_CAIRO is not set
> # BR2_PACKAGE_FONTCONFIG is not set
> # BR2_PACKAGE_FREETYPE is not set
> # BR2_PACKAGE_JPEG is not set
> # BR2_PACKAGE_LIBART is not set
> # BR2_PACKAGE_LIBPNG is not set
> # BR2_PACKAGE_LIBUNGIF is not set
> # BR2_PACKAGE_PANGO is not set
> # BR2_PACKAGE_PIXMAN is not set
> # BR2_PACKAGE_TIFF is not set
> # BR2_PACKAGE_WEBKIT is not set
>
> #
> # Hardware handling
> #
> # BR2_PACKAGE_LIBAIO is not set
> # BR2_PACKAGE_LIBRAW1394 is not set
> # BR2_PACKAGE_TSLIB is not set
> # BR2_PACKAGE_LIBUSB is not set
>
> #
> # Java
> #
> # BR2_PACKAGE_CLASSPATH is not set
>
> #
> # Networking
> #
> # BR2_PACKAGE_LIBCGI is not set
> # BR2_PACKAGE_LIBCGICC is not set
> # BR2_PACKAGE_LIBCURL is not set
> # BR2_PACKAGE_LIBDNET is not set
> # BR2_PACKAGE_LIBEXOSIP2 is not set
> # BR2_PACKAGE_LIBIDN is not set
> # BR2_PACKAGE_LIBMICROHTTPD is not set
> # BR2_PACKAGE_NEON is not set
> # BR2_PACKAGE_LIBNL is not set
> # BR2_PACKAGE_LIBPCAP is not set
> # BR2_PACKAGE_LIBOSIP2 is not set
> # BR2_PACKAGE_LIBRSYNC is not set
> # BR2_PACKAGE_LIBSOUP is not set
> # BR2_PACKAGE_LIBUPNP is not set
>
> #
> # Other
> #
> # BR2_PACKAGE_LIBATOMIC_OPS is not set
> # BR2_PACKAGE_LIBCAP is not set
> # BR2_PACKAGE_LIBDAEMON is not set
> # BR2_PACKAGE_LIBELF is not set
> # BR2_PACKAGE_LIBEVENT is not set
> # BR2_PACKAGE_LIBGLIB12 is not set
> BR2_PACKAGE_LIBGLIB2=y
> BR2_PACKAGE_LIBOIL=y
> # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
>
> #
> # Text and terminal handling
> #
> # BR2_PACKAGE_ENCHANT is not set
> # BR2_PACKAGE_ICU is not set
> # BR2_PACKAGE_LIBICONV is not set
> # BR2_PACKAGE_NCURSES is not set
> # BR2_PACKAGE_NEWT is not set
> # BR2_PACKAGE_PCRE is not set
> # BR2_PACKAGE_POPT is not set
> # BR2_PACKAGE_READLINE is not set
> # BR2_PACKAGE_SLANG is not set
>
> #
> # XML
> #
> # BR2_PACKAGE_EXPAT is not set
> # BR2_PACKAGE_EZXML is not set
> # BR2_PACKAGE_LIBXML_PARSER_PERL is not set
> BR2_PACKAGE_LIBXML2=y
> # BR2_PACKAGE_LIBXSLT is not set
> # BR2_PACKAGE_XERCES is not set
>
> #
> # Miscellaneous
> #
> # BR2_PACKAGE_SHARED_MIME_INFO is not set
>
> #
> # Networking applications
> #
> # BR2_PACKAGE_ARGUS is not set
> # BR2_PACKAGE_AVAHI is not set
> # BR2_PACKAGE_AXEL is not set
> # BR2_PACKAGE_BOA is not set
> # BR2_PACKAGE_BIND is not set
> # BR2_PACKAGE_BMON is not set
> # BR2_PACKAGE_BRIDGE is not set
> # BR2_PACKAGE_CTORRENT is not set
> # BR2_PACKAGE_CUPS is not set
> # BR2_PACKAGE_ISC_DHCP is not set
> # BR2_PACKAGE_DNSMASQ is not set
> # BR2_PACKAGE_DROPBEAR is not set
> # BR2_PACKAGE_ETHTOOL is not set
> # BR2_PACKAGE_HOSTAPD is not set
> # BR2_PACKAGE_IFPLUGD is not set
> # BR2_PACKAGE_IPERF is not set
> # BR2_PACKAGE_IPROUTE2 is not set
> # BR2_PACKAGE_IPSEC_TOOLS is not set
> # BR2_PACKAGE_IPTABLES is not set
> # BR2_PACKAGE_IW is not set
> # BR2_PACKAGE_KISMET is not set
> # BR2_PACKAGE_L2TP is not set
> # BR2_PACKAGE_LIGHTTPD is not set
> # BR2_PACKAGE_LINKS is not set
> # BR2_PACKAGE_LRZSZ is not set
> # BR2_PACKAGE_MIIDIAG is not set
> # BR2_PACKAGE_MROUTED is not set
> # BR2_PACKAGE_MUTT is not set
> # BR2_PACKAGE_NBD is not set
> # BR2_PACKAGE_NCFTP is not set
> # BR2_PACKAGE_NETCAT is not set
> # BR2_PACKAGE_NETKITBASE is not set
> # BR2_PACKAGE_NETKITTELNET is not set
> # BR2_PACKAGE_NETPLUG is not set
> # BR2_PACKAGE_NETSNMP is not set
> # BR2_PACKAGE_NETSTAT_NAT is not set
> # BR2_PACKAGE_NFS_UTILS is not set
> # BR2_PACKAGE_NTP is not set
> # BR2_PACKAGE_OLSR is not set
> # BR2_PACKAGE_OPENNTPD is not set
> # BR2_PACKAGE_OPENSSH is not set
> # BR2_PACKAGE_OPENVPN is not set
> # BR2_PACKAGE_PORTMAP is not set
> # BR2_PACKAGE_PPPD is not set
> # BR2_PACKAGE_RADVD is not set
> # BR2_PACKAGE_RP_PPPOE is not set
> # BR2_PACKAGE_PPTP_LINUX is not set
> # BR2_PACKAGE_PROFTPD is not set
> # BR2_PACKAGE_QUAGGA is not set
> # BR2_PACKAGE_RSYNC is not set
> # BR2_PACKAGE_SAMBA is not set
> # BR2_PACKAGE_SER2NET is not set
> # BR2_PACKAGE_SOCAT is not set
> # BR2_PACKAGE_SPAWN_FCGI is not set
> # BR2_PACKAGE_SQUID is not set
> # BR2_PACKAGE_STUNNEL is not set
> # BR2_PACKAGE_TCPDUMP is not set
> # BR2_PACKAGE_DHCPDUMP is not set
> # BR2_PACKAGE_TCPREPLAY is not set
> # BR2_PACKAGE_TFTPD is not set
> # BR2_PACKAGE_THTTPD is not set
> # BR2_PACKAGE_TINYHTTPD is not set
> # BR2_PACKAGE_TN5250 is not set
> # BR2_PACKAGE_TTCP is not set
> # BR2_PACKAGE_UDPCAST is not set
> # BR2_PACKAGE_VPNC is not set
> # BR2_PACKAGE_VSFTPD is not set
> # BR2_PACKAGE_VTUN is not set
> # BR2_PACKAGE_WEBIF is not set
> # BR2_PACKAGE_WGET is not set
> # BR2_PACKAGE_WIRELESS_TOOLS is not set
> # BR2_PACKAGE_WPA_SUPPLICANT is not set
>
> #
> # Package managers
> #
> # BR2_PACKAGE_IPKG is not set
> # BR2_PACKAGE_PORTAGE is not set
>
> #
> # rpm requires libneon with SSL, XML and ZLIB support
> #
>
> #
> # Shell and utilities
> #
> # BR2_PACKAGE_AT is not set
> # BR2_PACKAGE_BASH is not set
> # BR2_PACKAGE_DASH is not set
> # BR2_PACKAGE_DIALOG is not set
> # BR2_PACKAGE_FILE is not set
> # BR2_PACKAGE_LOCKFILE_PROGS is not set
> # BR2_PACKAGE_LOGROTATE is not set
> # BR2_PACKAGE_SCREEN is not set
> # BR2_PACKAGE_SUDO is not set
> # BR2_PACKAGE_WHICH is not set
>
> #
> # System tools
> #
> # BR2_PACKAGE_BOOTUTILS is not set
> # BR2_PACKAGE_MODULE_INIT_TOOLS is not set
> # BR2_PACKAGE_PROCPS is not set
> # BR2_PACKAGE_PSMISC is not set
> # BR2_PACKAGE_SYSKLOGD is not set
> # BR2_PACKAGE_SYSVINIT is not set
> # BR2_PACKAGE_UTIL-LINUX is not set
>
> #
> # Text editors and viewers
> #
> # BR2_PACKAGE_ED is not set
> # BR2_PACKAGE_LESS is not set
> # BR2_PACKAGE_NANO is not set
> # BR2_PACKAGE_UEMACS is not set
> # BR2_PACKAGE_VIM is not set
>
> #
> # Target filesystem options
> #
> BR2_ROOTFS_POST_BUILD_SCRIPT=""
> BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
> # BR2_TARGET_ROOTFS_CRAMFS is not set
> # BR2_TARGET_ROOTFS_CLOOP is not set
> # BR2_TARGET_ROOTFS_EXT2 is not set
> # BR2_TARGET_ROOTFS_JFFS2 is not set
> # BR2_TARGET_ROOTFS_UBIFS is not set
> # BR2_TARGET_ROOTFS_SQUASHFS is not set
> # BR2_TARGET_ROOTFS_TAR is not set
> # BR2_TARGET_ROOTFS_CPIO is not set
> # BR2_TARGET_ROOTFS_INITRAMFS is not set
> # BR2_TARGET_ROOTFS_ROMFS is not set
>
> #
> # Bootloaders
> #
> # BR2_TARGET_UBOOT is not set
>
> #
> # Kernel
> #
> BR2_KERNEL_none=y
> # BR2_KERNEL_LINUX_ADVANCED is not set
> # BR2_KERNEL_LINUX is not set
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
