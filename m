From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 12:13:54 +0100
Subject: [Buildroot] [PATCH 0/9 v2] pkg-infra: better github handling,
	download enhancements (branch yem/download)
Message-ID: <cover.1417863715.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces a few download enhancements, especially related
to how we handle GitHub and other forces.

First, it introduces a way to differentiate the upstream tarball
name from the local tarball name. Please read the post-commit note
about the reason the choice was made that way. It is worth discusing.

Second, it introduces a new concept: a forge, for which we automatically
set the correct values for _SITE, _SOURCE and _UPSTREAM_SOURCE. This
is supposed to serve the same role as our github helper, except it will
allow setting more than one variable, and is extensible to other forges.
Two forges are added: GitHub and Gitorious.

Third, it converts all GitHub-hosted packages from using the github
helper, over to using the new github forge, and all Gitorious-hosted
packages to use the new gitorious forge. This has the side benefit of
using an http:// transport scheme for gitorious packages, when we were
in-so-far using git:// which does pass through restrictive corporate
firewalls/proxies.

Finally, the github helper is removed, as it is no longer used.

To be noted: only two forges were added so far, but others, like
Google Code (32 packages) or Sourceforge (21 packages), can be added
in the future.


Changes v1 -> v2:
  - fix case when _UPSTREAM_SOURCE is not specified (for patches or
    extra downloads, for example)  (Arnout)
  - hashes should reference the loc al filename  (Baruch)
  - add the 'forge' concept, and convert packages accordingly


Regards,
Yann E. MORIN.


The following changes since commit c5f0e93d2cc6107cce249e1f11158aeccb4a3449:

  rp-pppoe: install default conf file (2014-12-03 23:26:21 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/download

for you to fetch changes up to cfd6a26419331267f1351dc1e32c0ff36f65612a:

  pkg-infra: remove the legacy github helper (2014-12-06 11:40:38 +0100)

----------------------------------------------------------------
Yann E. MORIN (9):
      pkg-infra: allow specifying the local tarball name when calling DOWNLOAD
      pkg-infra: differentiate remote tarball name from local filename
      docs/manual: document the new variable FOO_UPSTREAM_SOURCE
      pkg-infra: add support for GitHub as a forge
      pkg-infra: add support for Gitorious as a forge
      docs/manual: document the new forges we support: github and gitorious
      packages: switch to using the github forge
      packages: switch to using the gitorious forge
      pkg-infra: remove the legacy github helper

 boot/at91bootstrap3/at91bootstrap3.mk              |  3 +-
 boot/xloader/xloader.mk                            |  3 +-
 docs/manual/adding-packages-directory.txt          |  8 +++-
 docs/manual/adding-packages-generic.txt            | 27 ++++++++++--
 docs/manual/adding-packages-tips.txt               | 50 +++++++++++++++++-----
 package/a10disp/a10disp.mk                         |  3 +-
 package/am335x-pru-package/am335x-pru-package.mk   |  3 +-
 package/apitrace/apitrace.mk                       |  3 +-
 package/avrdude/avrdude.mk                         |  3 +-
 package/bandwidthd/bandwidthd.mk                   |  3 +-
 package/bcache-tools/bcache-tools.mk               |  3 +-
 package/binutils/binutils.mk                       |  3 +-
 package/can-utils/can-utils.mk                     |  3 +-
 package/civetweb/civetweb.mk                       |  3 +-
 package/cppzmq/cppzmq.mk                           |  3 +-
 package/cpuload/cpuload.mk                         |  3 +-
 package/czmq/czmq.mk                               |  3 +-
 package/e2tools/e2tools.mk                         |  3 +-
 package/faifa/faifa.mk                             |  3 +-
 package/fb-test-app/fb-test-app.mk                 |  3 +-
 package/filemq/filemq.mk                           |  3 +-
 package/flann/flann.mk                             |  3 +-
 package/freerdp/freerdp.mk                         |  3 +-
 package/gcc/gcc.mk                                 |  3 +-
 package/gdb/gdb.mk                                 |  6 ++-
 package/glm/glm.mk                                 |  3 +-
 package/inotify-tools/inotify-tools.mk             |  3 +-
 package/input-event-daemon/input-event-daemon.mk   |  3 +-
 package/jack2/jack2.mk                             |  3 +-
 package/jquery-keyboard/jquery-keyboard.mk         |  3 +-
 package/jsmin/jsmin.mk                             |  3 +-
 package/json-javascript/json-javascript.mk         |  3 +-
 package/kexec-lite/kexec-lite.mk                   |  3 +-
 package/ktap/ktap.mk                               |  3 +-
 package/lcdapi/lcdapi.mk                           |  3 +-
 package/libatomic_ops/libatomic_ops.mk             |  3 +-
 package/libcec/libcec.mk                           |  3 +-
 package/libcofi/libcofi.mk                         |  3 +-
 package/libconfuse/libconfuse.mk                   |  3 +-
 package/libenca/libenca.mk                         |  3 +-
 package/libevent/libevent.mk                       |  3 +-
 package/libiqrf/libiqrf.mk                         |  3 +-
 package/liblog4c-localtime/liblog4c-localtime.mk   |  3 +-
 package/libndp/libndp.mk                           |  3 +-
 package/libnfs/libnfs.mk                           |  3 +-
 package/librtlsdr/librtlsdr.mk                     |  3 +-
 package/libsha1/libsha1.mk                         |  3 +-
 package/libshairplay/libshairplay.mk               |  3 +-
 package/libsoc/libsoc.mk                           |  3 +-
 package/libstrophe/libstrophe.mk                   |  3 +-
 package/libtpl/libtpl.mk                           |  3 +-
 package/libuv/libuv.mk                             |  3 +-
 package/linenoise/linenoise.mk                     |  3 +-
 package/ljsyscall/ljsyscall.mk                     |  3 +-
 package/lpc3250loader/lpc3250loader.mk             |  3 +-
 package/lua-ev/lua-ev.mk                           |  3 +-
 package/lua-msgpack-native/lua-msgpack-native.mk   |  3 +-
 package/luaexpatutils/luaexpatutils.mk             |  3 +-
 package/luaposix/luaposix.mk                       |  3 +-
 package/lz4/lz4.mk                                 |  3 +-
 package/mongoose/mongoose.mk                       |  3 +-
 package/mrouted/mrouted.mk                         |  3 +-
 package/mtdev2tuio/mtdev2tuio.mk                   |  3 +-
 package/ne10/ne10.mk                               |  3 +-
 package/neardal/neardal.mk                         |  3 +-
 package/omap-u-boot-utils/omap-u-boot-utils.mk     |  3 +-
 package/on2-8170-modules/on2-8170-modules.mk       |  3 +-
 package/opencv/opencv.mk                           |  3 +-
 package/pifmrds/pifmrds.mk                         |  3 +-
 package/pkg-download.mk                            |  7 ++-
 package/pkg-generic.mk                             | 16 ++++++-
 package/pps-tools/pps-tools.mk                     |  3 +-
 package/protobuf-c/protobuf-c.mk                   |  3 +-
 .../python-configshell-fb/python-configshell-fb.mk |  3 +-
 package/python-ipy/python-ipy.mk                   |  3 +-
 package/python-itsdangerous/python-itsdangerous.mk |  3 +-
 package/python-libconfig/python-libconfig.mk       |  3 +-
 package/python-pyusb/python-pyusb.mk               |  3 +-
 package/python-rtslib-fb/python-rtslib-fb.mk       |  3 +-
 package/python-webpy/python-webpy.mk               |  3 +-
 package/qdecoder/qdecoder.mk                       |  3 +-
 package/qhull/qhull.mk                             |  3 +-
 package/qjson/qjson.mk                             |  3 +-
 package/qlibc/qlibc.mk                             |  3 +-
 package/qtuio/qtuio.mk                             |  3 +-
 package/rapidjson/rapidjson.mk                     |  3 +-
 package/rpi-firmware/rpi-firmware.mk               |  3 +-
 package/rpi-userland/rpi-userland.mk               |  3 +-
 package/sconeserver/sconeserver.mk                 |  3 +-
 package/shairport-sync/shairport-sync.mk           |  3 +-
 package/smack/smack.mk                             |  3 +-
 package/snappy/snappy.mk                           |  3 +-
 .../snowball-hdmiservice/snowball-hdmiservice.mk   |  3 +-
 package/socketcand/socketcand.mk                   |  3 +-
 package/sqlcipher/sqlcipher.mk                     |  3 +-
 package/sunxi-boards/sunxi-boards.mk               |  3 +-
 package/sunxi-cedarx/sunxi-cedarx.mk               |  3 +-
 package/sunxi-mali-prop/sunxi-mali-prop.mk         |  3 +-
 package/sunxi-mali/sunxi-mali.mk                   |  3 +-
 package/sunxi-tools/sunxi-tools.mk                 |  3 +-
 package/targetcli-fb/targetcli-fb.mk               |  3 +-
 package/ti-uim/ti-uim.mk                           |  3 +-
 package/ti-utils/ti-utils.mk                       |  3 +-
 package/tinyalsa/tinyalsa.mk                       |  3 +-
 package/tinymembench/tinymembench.mk               |  3 +-
 package/trinity/trinity.mk                         |  3 +-
 package/tslib/tslib.mk                             |  3 +-
 package/tvheadend/tvheadend.mk                     |  3 +-
 package/tzdump/tzdump.mk                           |  3 +-
 package/uclibc/uclibc.mk                           |  3 +-
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk         |  3 +-
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk         |  3 +-
 package/xinetd/xinetd.mk                           |  3 +-
 package/xl2tp/xl2tp.mk                             |  3 +-
 package/yajl/yajl.mk                               |  3 +-
 package/ympd/ympd.mk                               |  3 +-
 package/zlog/zlog.mk                               |  3 +-
 package/zmqpp/zmqpp.mk                             |  3 +-
 package/znc/znc.mk                                 |  3 +-
 package/zyre/zyre.mk                               |  3 +-
 120 files changed, 320 insertions(+), 136 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
