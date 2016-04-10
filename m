From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Apr 2016 11:41:08 +0200
Subject: [Buildroot] [PATCH v12 00/31] package/freeswitch: new package
Message-ID: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series splits my previous patch into smaller chunks for easier
review as requested by Luca and Thomas.

Instead of enabling or disabling modules in the upstream modules.conf I
decided to delete that file in the first patch to provide a minimal
build for easier review, please keep in mind that I never did a run-time
test with this minimal version. A lot of modules, desired as a default
set, are added with the second patch - all of them have no external
dependencies. The rest of the patch series consists of modules having
some form of dependency, added module by module for easier review.

Regards, Bernd

v12: - removed patches 0002 & 0003
     - 0002 "fixed" a weird linking error when libuuid was missing,
       autoreconf was necessary for this but with freeswitch 1.6.7
       this breaks build with BR2_COMPILER_PARANOID_UNSAFE_PATH=y
       Furthermore the linking error did not occur with 1.6.7, so
       autoreconf was removed as well
     - 0003 "fixed" only a cosmetic problem and also needed autoreconf
     - added support for mod_cv, mod_shout, openldap and mod_flite
     - mod_flite needs a version bump of the flite package, this is
       included in the patch series
v11: - bumped to 1.6.7
     - libvpx & libyuv are now part of the freeswitch source code
     - reworked video support using new option
       BR2_PACKAGE_FREESWITCH_VIDEO
     - removed two patches:
       0001-jpeg.patch is not needed anymore since freeswitch does use
       system libyuv
       0003-FS-8736-resolve-Missing-MEMMOVE-macro-in-spandsp-aut.patch
       was applied upstream
v10: - addressed various comments (Thomas)
     - fixed _LICENSE
     - fixed linking error for target fs_cli when libuuid is disabled
     - shortened subject of enable_mod* patches
     - fixed subject of patch #0003
     - added patch to remove modcheck.sh from build/Makefile.am instead
       of using _PRE_CONFIGURE_HOOKS
     - re-worded comment for FREESWITCH_BOOTSTRAP
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


Bernd Kuhls (31):
  package/freeswitch: new package
  package/freeswitch: enable optional modules
  package/freeswitch: add optional dependency to libuuid
  package/freeswitch: add optional dependency to libedit
  package/freeswitch: enable mod_enum
  package/freeswitch: add optional dependency to libpng
  package/freeswitch: add optional dependency to unixodbc
  package/freeswitch: add optional dependency to freetype
  package/freeswitch: enable mod_yaml
  package/freeswitch: enable mod_lua
  package/freeswitch: enable mod_bv
  package/freeswitch: enable mod_codec2
  package/freeswitch: add optional dependency to libg7221
  package/freeswitch: enable mod_ilbc
  package/freeswitch: enable mod_isac
  package/freeswitch: enable mod_opus
  package/freeswitch: enable mod_portaudio
  package/freeswitch: enable mod_silk
  package/freeswitch: enable mod_sndfile
  package/freeswitch: enable mod_alsa
  package/freeswitch: enable mod_soundtouch
  package/freeswitch: enable mod_xml_rpc
  package/freeswitch: add optional dependency to xz
  package/freeswitch: enable mod_memcache
  package/freeswitch: enable mod_imagick
  package/freeswitch: enable mod_cv
  package/freeswitch: enable mod_shout
  package/freeswitch: add optional dependency to openldap
  package/flite: bump version to 2.0.0
  package/freeswitch: enable mod_flite
  package/freeswitch: enable video support

 package/Config.in                                  |   1 +
 ...lsa-static.patch => 0001-fix-alsa-static.patch} |   4 +-
 .../flite/0001-now-honor-DESTDIR-env.-var.patch    |  30 --
 ...eck.patch => 0002-fix-alsa-version-check.patch} |   4 +-
 package/flite/flite.hash                           |   2 -
 package/flite/flite.mk                             |  24 +-
 package/freeswitch/0001-zrtp.patch                 |  33 +++
 package/freeswitch/Config.in                       |  42 +++
 package/freeswitch/freeswitch.hash                 |   2 +
 package/freeswitch/freeswitch.mk                   | 319 +++++++++++++++++++++
 10 files changed, 405 insertions(+), 56 deletions(-)
 rename package/flite/{0002-fix-alsa-static.patch => 0001-fix-alsa-static.patch} (77%)
 delete mode 100644 package/flite/0001-now-honor-DESTDIR-env.-var.patch
 rename package/flite/{0003-fix-alsa-version-check.patch => 0002-fix-alsa-version-check.patch} (90%)
 delete mode 100644 package/flite/flite.hash
 create mode 100644 package/freeswitch/0001-zrtp.patch
 create mode 100644 package/freeswitch/Config.in
 create mode 100644 package/freeswitch/freeswitch.hash
 create mode 100644 package/freeswitch/freeswitch.mk

-- 
2.8.0.rc3
