From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 15 Feb 2014 00:51:31 +0100
Subject: [Buildroot] [PATCH v5 5/5] xbmc: new package
In-Reply-To: <52FE9FDE.4090102@barkynet.com>
References: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392332394-27935-6-git-send-email-maxime.hadjinlian@gmail.com>
 <52FE9FDE.4090102@barkynet.com>
Message-ID: <CAGduivznzC=-rK3hspNjykR6a5MTpTR2oCWW=M=tN3jgsq13vA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin, all
On Fri, Feb 14, 2014 at 11:59 PM, Martin Bark <martin@barkynet.com> wrote:
> Maxime,
>
> Below are some comments, hope they help.
>
>
> On 13/02/14 22:59, Maxime Hadjinlian wrote:
>>
>> XBMC is an award-winning free and open source (GPL) software media player
>> and
>> entertainment hub for digital media.
>> This package was originally found at :
>> https://github.com/huceke/buildroot-rbp
>> By gimli <ebsi4711@gmail.com>
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> Cc: gimli <ebsi4711@gmail.com>
>> ---
>> Changes v4 -> v5:
>>    - Remove MAKE1, seems to work fine with parallel build.
>> Changes v3 -> v4:
>>    - Rework init script
>>    - Add systemd startup service
>> Changes v2 -> v3:
>>    - Fix indent
>>    - Change librtmp to rtmpdump
>> Changes v1 -> v2:
>>    - Fix header (Yann E. Morin)
>>    - Fix comment on toolchain option (Peter Korsgaard)
>> ---
>>   package/Config.in                                  |   1 +
>>   package/xbmc/Config.in                             | 202
>> +++++++++++++++++++++
>>   package/xbmc/S50xbmc                               |  41 +++++
>>   package/xbmc/xbmc-0001-Fixup-include-path.patch    |  79 ++++++++
>>   .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 167
>> +++++++++++++++++
>>   package/xbmc/xbmc.mk                               | 175
>> ++++++++++++++++++
>>   package/xbmc/xbmc.service                          |  12 ++
>>   7 files changed, 677 insertions(+)
>>   create mode 100644 package/xbmc/Config.in
>>   create mode 100755 package/xbmc/S50xbmc
>>   create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
>>   create mode 100644
>> package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
>>   create mode 100644 package/xbmc/xbmc.mk
>>   create mode 100644 package/xbmc/xbmc.service
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 6c3e769..5f32a28 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -26,6 +26,7 @@ source "package/tstools/Config.in"
>>   source "package/vlc/Config.in"
>>   source "package/vorbis-tools/Config.in"
>>   source "package/wavpack/Config.in"
>> +source "package/xbmc/Config.in"
>>   source "package/yavta/Config.in"
>>   endmenu
>>
>> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
>> new file mode 100644
>> index 0000000..e3e96ef
>> --- /dev/null
>> +++ b/package/xbmc/Config.in
>> @@ -0,0 +1,202 @@
>> +comment "xbmc requires an OpenGL-capable backend"
>> +       depends on !(BR2_PACKAGE_HAS_OPENGL_EGL &&
>> BR2_PACKAGE_HAS_OPENGL_ES)
>> +
>> +# External toolchain are required because of a missing bitdefs.h
>> +comment "xbmc needs an (e)glibc external toolchain w/ C++ and WCHAR"
>> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR) ||
>> BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_BUILDROOT
>> +
>> +menuconfig BR2_PACKAGE_XBMC
>> +       bool "xbmc"
>> +       select BR2_PACKAGE_BOOST
>> +       select BR2_PACKAGE_BOOST_THREAD
>> +       select BR2_PACKAGE_BZIP2
>> +       select BR2_PACKAGE_EXPAT
>> +       select BR2_PACKAGE_JASPER
>> +       select BR2_PACKAGE_LIBCDIO
>> +       select BR2_PACKAGE_LIBCURL
>> +       select BR2_PACKAGE_LIBFRIBIDI
>> +       select BR2_PACKAGE_LIBGCRYPT
>> +       select BR2_PACKAGE_LIBMODPLUG
>> +       select BR2_PACKAGE_LIBMPEG2
>> +       select BR2_PACKAGE_LIBUNGIF
>> +       select BR2_PACKAGE_LZO
>> +       select BR2_PACKAGE_OPENSSL
>> +       select BR2_PACKAGE_PCRE
>> +       select BR2_PACKAGE_PYTHON
>> +       select BR2_PACKAGE_PYTHON_BSDDB
>> +       select BR2_PACKAGE_PYTHON_BZIP2
>> +       select BR2_PACKAGE_PYTHON_CURSES
>> +       select BR2_PACKAGE_PYTHON_PYEXPAT
>> +       select BR2_PACKAGE_PYTHON_READLINE
>> +       select BR2_PACKAGE_PYTHON_SQLITE
>> +       select BR2_PACKAGE_PYTHON_SSL
>> +       select BR2_PACKAGE_PYTHON_UNICODEDATA
>> +       select BR2_PACKAGE_PYTHON_ZLIB
>> +       select BR2_PACKAGE_READLINE
>> +       select BR2_PACKAGE_SQLITE
>> +       select BR2_PACKAGE_TAGLIB
>> +       select BR2_PACKAGE_TIFF
>> +       select BR2_PACKAGE_TINYXML
>> +       select BR2_PACKAGE_YAJL
>> +       select BR2_PACKAGE_ZLIB
>> +       depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR &&
>> !BR2_TOOLCHAIN_USES_UCLIBC
>> +       depends on !BR2_TOOLCHAIN_BUILDROOT
>
>
> I think you have missed the following
>
>   depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES
>
Well, I have omitted it because it causes a recursive dependency with
the rpi packages and I did not know how to fix this, so I kinda hoped
for someone to come up with a better solution :).
> Currently you can compile xbmc without any opengl support and it just fails
> at the configure step.
True, I did not really expand my test here. I shall do that.
>
> -- snip --
>
>
>> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
>> new file mode 100644
>> index 0000000..db43a9f
>> --- /dev/null
>> +++ b/package/xbmc/xbmc.mk
>> @@ -0,0 +1,175 @@
>>
>> +################################################################################
>> +#
>> +# xbmc
>> +#
>>
>> +################################################################################
>> +
>> +XBMC_VERSION = 12.3-Frodo
>> +XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
>> +XBMC_LICENSE = GPLv2
>> +XBMC_LICENSE_FILES = LICENSE.GPL
>> +XBMC_DEPENDENCIES = host-lzo host-sdl_image host-swig
>
>
> I think you need to add host-gperf, i had to add this for xmbc to compile.
host-gperf ? I never needed that, why should it be needed ?
>
>
>> +XBMC_DEPENDENCIES += libmpeg2 bzip2 libcdio python lzo zlib libgcrypt
>> openssl \
>> +       sqlite fontconfig freetype jasper jpeg libmodplug libpng libungif
>> tiff \
>> +       libcurl boost libfribidi ncurses pcre libplist readline expat
>> libxml2 yajl \
>> +       tinyxml taglib
>
>
> The config.in does not select fontconfig, freetype, jpeg, libpng, tiff,
> ncurses, libplist and libxml2 but you specify them as dependencies.  Are
> these really dependencies? Should config.in select them?
Yes they are dependencies, and you are right, they should be selected
in Config.in, I'll fix this.
>
>
>> +
>> +XBMC_CONF_ENV += PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)"
>> +XBMC_CONF_ENV += PYTHON_LDFLAGS="-L$(STAGING_DIR)/usr/lib/
>> -lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm"
>> +XBMC_CONF_ENV +=
>> PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)"
>> +XBMC_CONF_ENV +=
>> PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
>> +XBMC_CONF_ENV += PYTHON_NOVERSIONCHECK="no-check"
>> +XBMC_CONF_ENV += TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
>> +
>> +XBMC_CONF_OPT += --disable-sdl --disable-x11 --disable-xrandr
>> --disable-openmax \
>> +       --disable-optical-drive --disable-dvdcss --disable-joystick \
>> +       --disable-debug --disable-crystalhd --disable-vtbdecoder
>> --disable-vaapi \
>> +       --disable-vdpau --disable-pulse --disable-projectm
>> --enable-optimizations \
>> +       --disable-alsa --disable-ssh --disable-hal --disable-mysql
>> +
>> +ifeq ($(BR2_arm),y)
>> +XBMC_CONF_OPT += --enable-gles --disable-gl
>> +endif
>
>
> Should this be ifeq ($(BR2_PACKAGE_HAS_OPENGL_EGL),y) ? If xbmc requires on
> opengl is this test even needed ?
True, when I wrote this patch, this variable did not exists and I
forgot to change it. I'll look into it.
>
> Thanks
>
> Martin
Thanks for your review and comments.
