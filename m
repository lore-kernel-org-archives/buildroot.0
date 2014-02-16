From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 16 Feb 2014 21:37:36 +0100
Subject: [Buildroot] [PATCH v6 4/4] xbmc: new package
In-Reply-To: <f8ef4090-214d-48a3-ae77-b96a198a527a@email.android.com>
References: <1392557273-3522-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392557273-3522-5-git-send-email-maxime.hadjinlian@gmail.com>
 <f8ef4090-214d-48a3-ae77-b96a198a527a@email.android.com>
Message-ID: <CAGduivz4GNjY6db9fPk_Br4arAnE+40LCO8Misv-hUmrzUVvHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,
On Sun, Feb 16, 2014 at 8:55 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Maxime,
>
> Maxime Hadjinlian <maxime.hadjinlian@gmail.com> schreef:
>>XBMC is an award-winning free and open source (GPL) software media player and
>>entertainment hub for digital media.
>>This package was originally found at : https://github.com/huceke/buildroot-rbp
>>By gimli <ebsi4711@gmail.com>
>>
>>Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>>Cc: gimli <ebsi4711@gmail.com>
>>---
>>Changes v5 -> v6:
>>  - Fix missing depends on OpenGL (Yann E. Morin)
>>  - Remove LIBCEC_RBP Config option (Yann E. Morin)
>>  - Fix dependency that were, in the end, not optionnal (Martin Bark)
>>  - Fix OpenGL check (Martin Bark)
>>  - Uses BR2_HOST_NEEDS_JAVA (Martin Bark)
>>  - None
>>Changes v4 -> v5:
>>  - Remove MAKE1, seems to work fine with parallel build.
>>Changes v3 -> v4:
>>  - Rework init script
>>  - Add systemd startup service
>>Changes v2 -> v3:
>>  - Fix indent
>>  - Change librtmp to rtmpdump
>>Changes v1 -> v2:
>>  - Fix header (Yann E. Morin)
>>  - Fix comment on toolchain option (Peter Korsgaard)
>>---
>> package/Config.in                                  |   1 +
>> package/xbmc/Config.in                             | 166 ++++++++++++++++++++
>> package/xbmc/S50xbmc                               |  41 +++++
>> package/xbmc/xbmc-0001-Fixup-include-path.patch    |  79 ++++++++++
>> .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 167 +++++++++++++++++++++
>> package/xbmc/xbmc.mk                               | 149 ++++++++++++++++++
>> package/xbmc/xbmc.service                          |  12 ++
>> 7 files changed, 615 insertions(+)
>> create mode 100644 package/xbmc/Config.in
>> create mode 100755 package/xbmc/S50xbmc
>> create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
>> create mode 100644 package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
>> create mode 100644 package/xbmc/xbmc.mk
>> create mode 100644 package/xbmc/xbmc.service
>>
>>diff --git a/package/Config.in b/package/Config.in
>>index 6c3e769..5f32a28 100644
>>--- a/package/Config.in
>>+++ b/package/Config.in
>>@@ -26,6 +26,7 @@ source "package/tstools/Config.in"
>> source "package/vlc/Config.in"
>> source "package/vorbis-tools/Config.in"
>> source "package/wavpack/Config.in"
>>+source "package/xbmc/Config.in"
>> source "package/yavta/Config.in"
>> endmenu
>>
>>diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
>>new file mode 100644
>>index 0000000..3395e7e
>>--- /dev/null
>>+++ b/package/xbmc/Config.in
>>@@ -0,0 +1,166 @@
>>+comment "xbmc requires an OpenGL-capable backend"
>>+      depends on !(BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
>>+
>>+# External toolchain are required because of a missing bitdefs.h
>>+comment "xbmc needs an (e)glibc external toolchain w/ C++ and WCHAR"
>
> Please have a look at the manual regarding the exact format of these comments.
> Above wchar should be all lowercase...
>
>>+      depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR) || BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_BUILDROOT
>
> Why do you check on !uclibc if you really mean glibc?
No particular reason, it went on with the "negative" logic going on in
this line. But you are right, it would express better what I am trying
to achieve.

Note that this should go away pretty soon, there is a patch in XBMC
Gotham (next version, which should be out soon) which fix uClibc
build. It could be back ported for us, but at the moment, I don't
really see the point.
>
>>+
>>+menuconfig BR2_PACKAGE_XBMC
>>+      bool "xbmc"
>>+      select BR2_HOST_NEEDS_JAVA
>>+      select BR2_PACKAGE_BOOST
>>+      select BR2_PACKAGE_BOOST_THREAD
>>+      select BR2_PACKAGE_BZIP2
>>+      select BR2_PACKAGE_EXPAT
>>+      select BR2_PACKAGE_FLAC
>>+      select BR2_PACKAGE_FONTCONFIG
>>+      select BR2_PACKAGE_FREETYPE
>>+      select BR2_PACKAGE_JASPER
>>+      select BR2_PACKAGE_JPEG
>>+      select BR2_PACKAGE_LIBASS
>>+      select BR2_PACKAGE_LIBCDIO
>>+      select BR2_PACKAGE_LIBCURL
>>+      select BR2_PACKAGE_LIBFRIBIDI
>>+      select BR2_PACKAGE_LIBGCRYPT
>>+      select BR2_PACKAGE_LIBID3TAG
>>+      select BR2_PACKAGE_LIBMAD
>>+      select BR2_PACKAGE_LIBMODPLUG
>>+      select BR2_PACKAGE_LIBMPEG2
>>+      select BR2_PACKAGE_LIBOGG
>>+      select BR2_PACKAGE_LIBPLIST
>>+      select BR2_PACKAGE_LIBPNG
>>+      select BR2_PACKAGE_LIBSAMPLERATE
>>+      select BR2_PACKAGE_LIBUNGIF
>>+      select BR2_PACKAGE_LIBVORBIS
>>+      select BR2_PACKAGE_LIBXML2
>>+      select BR2_PACKAGE_LZO
>>+      select BR2_PACKAGE_NCURSES
>>+      select BR2_PACKAGE_OPENSSL
>>+      select BR2_PACKAGE_PCRE
>>+      select BR2_PACKAGE_PYTHON
>>+      select BR2_PACKAGE_PYTHON_BSDDB
>>+      select BR2_PACKAGE_PYTHON_BZIP2
>>+      select BR2_PACKAGE_PYTHON_CURSES
>>+      select BR2_PACKAGE_PYTHON_PYEXPAT
>>+      select BR2_PACKAGE_PYTHON_READLINE
>>+      select BR2_PACKAGE_PYTHON_SQLITE
>>+      select BR2_PACKAGE_PYTHON_SSL
>>+      select BR2_PACKAGE_PYTHON_UNICODEDATA
>>+      select BR2_PACKAGE_PYTHON_ZLIB
>>+      select BR2_PACKAGE_READLINE
>>+      select BR2_PACKAGE_SQLITE
>>+      select BR2_PACKAGE_TAGLIB
>>+      select BR2_PACKAGE_TIFF
>>+      select BR2_PACKAGE_TIFF
>>+      select BR2_PACKAGE_TINYXML
>>+      select BR2_PACKAGE_YAJL
>>+      select BR2_PACKAGE_ZLIB
>>+      depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && !BR2_TOOLCHAIN_USES_UCLIBC
>>+      depends on BR2_PACKAGE_HAS_OPENGL_EGL || BR2_PACKAGE_HAS_OPENGL_ES
>>+      depends on !BR2_TOOLCHAIN_BUILDROOT
>>+      help
>>+        XBMC is an award-winning free and open source (GPL) software
>>+        media player and entertainment hub for digital media.
>>+
>>+        http://xbmc.org
>>+
>>+if BR2_PACKAGE_XBMC
>>+
>>+config BR2_PACKAGE_XBMC_AVAHI
>>+      bool "avahi"
>>+      select BR2_PACKAGE_AVAHI
>>+      select BR2_PACKAGE_AVAHI_DAEMON
>>+      help
>>+        Enable Avahi support.
>>+        Select this if you want XBMC to support Bonjour protocol.
>>+
>>+config BR2_PACKAGE_XBMC_DBUS
>>+      bool "dbus"
>>+      select BR2_PACKAGE_DBUS
>>+      help
>>+        Enable DBUS support
>>+
>>+config BR2_PACKAGE_XBMC_LIBBLURAY
>>+      bool "libbluray"
>>+      select BR2_PACKAGE_LIBBLURAY
>>+      help
>>+        Enable bluray input support.
>>+        Select this if you want to play back bluray content.
>
> As you're using capitalization on the other technologies in the config options,
> I'd expect the same for bluray (correct capitalization to be looked up)
>
>>+
>>+config BR2_PACKAGE_XBMC_LIBCEC
>>+      bool "libcec"
>>+      select BR2_PACKAGE_LIBCEC
>>+      depends on BR2_INSTALL_LIBSTDCPP
>>+      depends on BR2_USE_WCHAR
>>+      help
>>+        Enable CEC support.
>>+        Select this if you want XBMC to support HDMI CEC.
>
> Explaining the acronym cec here would be nice...
>
>>+
>>+comment "libcec requires a toolchain with C++ and WCHAR support"
>>+      depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
>
> Comment is not according to the manual.
>
>>+
>>+config BR2_PACKAGE_XBMC_LIBMICROHTTPD
>>+      bool "libmicrohttpd"
>>+      select BR2_PACKAGE_LIBMICROHTTPD
>>+      help
>>+        Enable webserver feature
>>+
>>+config BR2_PACKAGE_XBMC_LIBNFS
>>+      bool "libnfs"
>>+      select BR2_PACKAGE_LIBNFS
>>+      depends on BR2_LARGEFILE
>>+      depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>>+      help
>>+        Enable NFS server support.
>>+
>>+comment "libnfs support requires a toolchain with LARGEFILE and RPC support"
>>+      depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_NATIVE_RPC)
>
> Comment not ok.
>
>>+
>>+config BR2_PACKAGE_XBMC_RTMPDUMP
>>+      bool "librtmp"
>>+      select BR2_PACKAGE_RTMPDUMP
>>+      help
>>+        Enable rtmp input support.
>>+        Select this if you want to play back rtmp stream.
>>+
>>+config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
>>+      bool "libshairport"
>>+      select BR2_PACKAGE_LIBSHAIRPLAY
>>+      depends on BR2_INET_IPV6
>>+      help
>>+        Enable shairport support.
>>+        Select this if you want to stream content from Apple device.
>
> an Apple device
>
>>+
>>+comment "libshairport support requires a toolchain with IPV6 support"
>>+      depends on !(BR2_INET_IPV6)
>
> Comment not ok.
>
>>+
>>+config BR2_PACKAGE_XBMC_LIBSMBCLIENT
>>+      bool "libsmbclient"
>>+      select BR2_PACKAGE_SAMBA
>>+      select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
>>+      help
>>+        Enable Samba support
>>+
>>+config BR2_PACKAGE_XBMC_LIBTHEORA
>>+      bool "libtheora"
>>+      select BR2_PACKAGE_LIBTHEORA
>>+      help
>>+        Enable theora input support.
>>+        Select this if you want to play back OGG/OGV files (Video).
>>+
>>+config BR2_PACKAGE_XBMC_LIBUSB
>>+      bool "libusb"
>>+      depends on BR2_TOOLCHAIN_HAS_THREADS
>>+      select BR2_PACKAGE_LIBUSB
>>+      select BR2_PACKAGE_LIBUSB_COMPAT
>>+      help
>>+        Enable libusb support.
>>+
>>+config BR2_PACKAGE_XBMC_WAVPACK
>>+      bool "wavpack"
>>+      select BR2_PACKAGE_WAVPACK
>>+      help
>>+        Enable wavpack input support.
>>+        Select this if you want to play back WV files.
>>+
>>+endif
>
Thanks for you comments, I have fixed the capitalisation issues.
> Best regards,
> Thomas
>
