From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Feb 2016 16:26:50 +0100
Subject: [Buildroot] [PATCH/next v9 00/28] package/freeswitch: new package
Message-ID: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series splits my previous patch into smaller chunks for easier
review as requested by Luca and Thomas. I also removed all options from
Config.in.

Instead of enabling or disabling modules in the upstream modules.conf I
decided to delete that file in the first patch to provide a minimal
build for easier review, please keep in mind that I never did a run-time
test with this minimal version. A lot of modules, desired as a default
set, are added with the second patch - all of them have no external
dependencies. The rest of the patch series consists of modules having
some form of dependency, added module by module for easier review.

Regards, Bernd

v9: - added comment about bundled 3rd-party libraries (Romain)
    - renamed some POST_PATCH_HOOKS into PRE_CONFIGURE_HOOKS (Romain)
    - replaced autoreconf fix for spandsp (added in v6) with upstream
      commit, removed dependency to host-autoconf-archive
v8: - rebased against branch next
v7: - removed all Kconfig suboptions
    - squashed zrtp patch into main patch
    - updated platform support checks for zrtp and mod_isac
    - renamed zrtp patch to 0002-zrtp.patch and updated it to fix PPC
    - enabled missing modules:
      mod_g723_1, mod_g729, mod_loopback and mod_say_*
v6: - bumped to version 1.6.6
    - fixed autoreconf bug in libs/spandsp/ introduced by version bump
    - added hint for dynamic libs to comment in Config.in (Ricardo)
    - changed dependency from libjpeg to jpeg (Ricardo)
    - fixed -Werror bug using FREESWITCH_CONF_ENV,
      removed 0001-cross_git.patch (Ricardo)
    - re-numbered patches
v5: - bumped to version 1.6.5
    - split patch into smaller chunks (Luca, Thomas)
    - removed most of the options from Config.in
    - added several new modules
    - compilation with uClibc-ng is fixed
v4: - bumped to version 1.6.2
v3: - bumped to version 1.6.0, added hash
    - to compile with uClibc-NG this patch is needed:
      http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=1.0&id=5a167e319ca2bee566d330d1c901d76dc53deea7
      http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/126450/focus=127191
    - removed python module, cross compiling to 32bit on 64bit host is
      broken:
      http://lists.busybox.net/pipermail/buildroot/2011-August/045039.html
    - added reverse dependencies from vlc
    - added comment to 0002-jpeg.patch
v2: - addressed various comments (Thomas)


Bernd Kuhls (28):
  package/freeswitch: new package
  package/freeswitch: enable optional modules
  package/freeswitch: add optional dependency to libuuid
  package/freeswitch: add optional dependency to libedit
  package/freeswitch: enable mod_enum, add optional dependency to
    libldns
  package/freeswitch: add optional dependency to libpng
  package/freeswitch: add optional dependency to unixodbc
  package/freeswitch: add optional dependency to freetype
  package/freeswitch: enable mod_yaml, add optional dependency to
    libyaml
  package/freeswitch: enable mod_lua, add optional dependency to lua
  package/freeswitch: enable mod_fsv, add optional dependencies to
    libvpx & libyuv
  package/freeswitch: enable mod_av, add optional dependencies to
    ffmpeg, libvpx & libyuv
  package/freeswitch: enable mod_vpx, add optional dependency to libvpx
  package/freeswitch: enable mod_bv, add optional dependency to
    libbroadvoice
  package/freeswitch: enable mod_codec2, add optional dependency to
    libcodec2
  package/freeswitch: add optional dependency to libg7221
  package/freeswitch: enable mod_ilbc, add optional dependency to
    libilbc
  package/freeswitch: enable mod_isac
  package/freeswitch: enable mod_opus, add optional dependency to opus
  package/freeswitch: enable mod_portaudio, add optional dependency to
    portaudio
  package/freeswitch: enable mod_silk, add optional dependency to
    libsilk
  package/freeswitch: enable mod_sndfile, add optional dependency to
    libsndfile
  package/freeswitch: enable mod_alsa, add optional dependency to
    alsa-lib
  package/freeswitch: enable mod_soundtouch, add optional dependency to
    libsoundtouch
  package/freeswitch: enable mod_xml_rpc
  package/freeswitch: enable mod_imagick, add optional dependencies to
    imagemagick, libvpx & libyuv
  package/freeswitch: enable mod_memcache, add optional dependency to
    libmemcached
  package/freeswitch: add optional dependency to xz

 package/Config.in                                  |   1 +
 package/freeswitch/0001-jpeg.patch                 |  31 +++
 package/freeswitch/0002-zrtp.patch                 |  33 +++
 ...olve-Missing-MEMMOVE-macro-in-spandsp-aut.patch |  71 +++++
 package/freeswitch/Config.in                       |  28 ++
 package/freeswitch/freeswitch.hash                 |   2 +
 package/freeswitch/freeswitch.mk                   | 291 +++++++++++++++++++++
 7 files changed, 457 insertions(+)
 create mode 100644 package/freeswitch/0001-jpeg.patch
 create mode 100644 package/freeswitch/0002-zrtp.patch
 create mode 100644 package/freeswitch/0003-FS-8736-resolve-Missing-MEMMOVE-macro-in-spandsp-aut.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.hash
 create mode 100644 package/freeswitch/freeswitch.mk

-- 
2.7.0
