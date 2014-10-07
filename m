From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 15:00:28 +0200
Subject: [Buildroot] [git commit] .mk files: bulk aligment and whitespace
	cleanup of assignments
Message-ID: <20141007133909.1BDADAECDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f268f7131b9e0ef90f1135461a719d9f5292853e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Buildroot coding style defines one space around make assignments and
does not align the assignment symbols.

This patch does a bulk fix of offending packages. The package
infrastructures (or more in general assignments to calculated variable
names, like $(2)_FOO) are not touched.

Alignment of line continuation characters (\) is kept as-is.

The sed command used to do this replacement is:
find * -name "*.mk" | xargs sed -i \
    -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\s*$#\1 \2#'
    -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\s*\([^\\]\+\)$#\1 \2 \3#'
    -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\s*\([^\\ \t]\+\s*\\\)\s*$#\1 \2 \3#'
    -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\(\s*\\\)#\1 \2\3#'

Brief explanation of this command:
    ^\([A-Z0-9a-z_]\+\)     a regular variable at the beginning of the line
    \([?:+]\?=\)            any assignment character =, :=, ?=, +=
    \([^\\]\+\)             any string not containing a line continuation
    \([^\\ \t]\+\s*\\\)     string, optional whitespace, followed by a
                            line continuation character
    \(\s*\\\)               optional whitespace, followed by a line
                            continuation character

Hence, the first subexpression handles empty assignments, the second
handles regular assignments, the third handles regular assignments with
line continuation, and the fourth empty assignments with line
continuation.

This expression was tested on following test text: (initial tab not
included)

	FOO     = spaces before
	FOO     =   spaces before and after
	FOO	= tab before
	FOO	  = tab and spaces before
	FOO =	tab after
	FOO =	   tab and spaces after
	FOO =   	spaces and tab after
	FOO =    \
	FOO = bar \
	FOO = bar space    \
	FOO   =		   \
	GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
	FOO     += spaces before
	FOO     ?=   spaces before and after
	FOO     :=
	FOO     =
	FOO	=
	FOO	  =
	FOO =
	   $(MAKE1) CROSS_COMPILE=$(TARGET_CROSS) -C
	AT91BOOTSTRAP3_DEFCONFIG = \
	AXEL_DISABLE_I18N=--i18n=0

After this bulk change, following manual fixups were done:
- fix line continuation alignment in cegui06 and spice (the sed
  expression leaves the number of whitespace between the value and line
  continuation character intact, but the whitespace before that could have
  changed, causing misalignment.
- qt5base was reverted, as this package uses extensive alignment which
  actually makes the code more readable.

Finally, the end result was manually reviewed.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Cc: Yann E. Morin <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk  |   10 +-
 boot/grub/grub.mk                                  |    4 +-
 boot/syslinux/syslinux.mk                          |    4 +-
 boot/uboot/uboot.mk                                |   44 ++++++------
 boot/xloader/xloader.mk                            |    4 +-
 fs/ext2/ext2.mk                                    |    2 +-
 fs/romfs/romfs.mk                                  |    2 +-
 linux/linux.mk                                     |    2 +-
 package/atftp/atftp.mk                             |    2 +-
 package/axel/axel.mk                               |    2 +-
 package/bind/bind.mk                               |    2 +-
 package/ccache/ccache.mk                           |    4 +-
 package/cegui06/cegui06.mk                         |   16 ++--
 package/celt051/celt051.mk                         |   12 ++--
 package/cjson/cjson.mk                             |   10 +-
 package/copas/copas.mk                             |    2 +-
 package/coxpcall/coxpcall.mk                       |    2 +-
 package/dbus/dbus.mk                               |    2 +-
 package/dhcpdump/dhcpdump.mk                       |    2 +-
 package/dmidecode/dmidecode.mk                     |    2 +-
 package/dtc/dtc.mk                                 |   20 +++---
 package/dvbsnoop/dvbsnoop.mk                       |    8 +-
 package/ecryptfs-utils/ecryptfs-utils.mk           |   14 ++--
 package/efl/libedje/libedje.mk                     |    2 +-
 package/eigen/eigen.mk                             |    2 +-
 package/freescale-imx/freescale-imx.mk             |    2 +-
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |    4 +-
 package/freescale-imx/imx-lib/imx-lib.mk           |    2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk           |    2 +-
 package/gcc/gcc-final/gcc-final.mk                 |    4 +-
 package/gcc/gcc-initial/gcc-initial.mk             |    4 +-
 package/gdb/gdb.mk                                 |    2 +-
 package/genimage/genimage.mk                       |   10 +-
 package/genpart/genpart.mk                         |    8 +-
 package/git/git.mk                                 |   10 +-
 package/gnu-efi/gnu-efi.mk                         |    4 +-
 package/grantlee/grantlee.mk                       |    2 +-
 package/heirloom-mailx/heirloom-mailx.mk           |    4 +-
 package/igh-ethercat/igh-ethercat.mk               |    6 +-
 package/keyutils/keyutils.mk                       |   10 +-
 package/lbase64/lbase64.mk                         |    2 +-
 package/lftp/lftp.mk                               |    2 +-
 package/libatasmart/libatasmart.mk                 |    2 +-
 package/libffi/libffi.mk                           |    2 +-
 package/libmbim/libmbim.mk                         |    4 +-
 package/libnspr/libnspr.mk                         |    2 +-
 package/libqmi/libqmi.mk                           |    4 +-
 package/libreplaygain/libreplaygain.mk             |    2 +-
 package/libseccomp/libseccomp.mk                   |   16 ++--
 package/libsvg-cairo/libsvg-cairo.mk               |   10 +-
 package/libsvg/libsvg.mk                           |   10 +-
 package/liburcu/liburcu.mk                         |    4 +-
 package/linux-fusion/linux-fusion.mk               |    6 +-
 package/ljlinenoise/ljlinenoise.mk                 |    2 +-
 package/lmbench/lmbench.mk                         |    2 +-
 package/localedef/localedef.mk                     |    4 +-
 package/lpty/lpty.mk                               |    2 +-
 package/lrandom/lrandom.mk                         |    2 +-
 package/lsqlite3/lsqlite3.mk                       |    2 +-
 package/ltp-testsuite/ltp-testsuite.mk             |    4 +-
 package/lttng-babeltrace/lttng-babeltrace.mk       |    4 +-
 package/lttng-libust/lttng-libust.mk               |    8 +-
 package/lttng-modules/lttng-modules.mk             |    4 +-
 package/lttng-tools/lttng-tools.mk                 |    4 +-
 package/lua-coat/lua-coat.mk                       |    2 +-
 package/lua-coatpersistent/lua-coatpersistent.mk   |    2 +-
 package/lua-csnappy/lua-csnappy.mk                 |    2 +-
 package/lua-messagepack/lua-messagepack.mk         |    2 +-
 package/lua-testmore/lua-testmore.mk               |    2 +-
 package/luabitop/luabitop.mk                       |    2 +-
 package/luajit/luajit.mk                           |    8 +-
 package/luajson/luajson.mk                         |    2 +-
 package/lualogging/lualogging.mk                   |    2 +-
 package/luarocks/luarocks.mk                       |    2 +-
 package/luasec/luasec.mk                           |    2 +-
 package/luasocket/luasocket.mk                     |    2 +-
 package/luasql-sqlite3/luasql-sqlite3.mk           |    2 +-
 package/lunit/lunit.mk                             |    2 +-
 package/lzlib/lzlib.mk                             |    2 +-
 package/mii-diag/mii-diag.mk                       |    6 +-
 package/mmc-utils/mmc-utils.mk                     |    2 +-
 package/mplayer/mplayer.mk                         |    4 +-
 package/musepack/musepack.mk                       |    2 +-
 package/nodejs/nodejs.mk                           |   12 ++--
 package/on2-8170-modules/on2-8170-modules.mk       |    2 +-
 package/orbit/orbit.mk                             |    2 +-
 package/pciutils/pciutils.mk                       |    2 +-
 package/perl/perl.mk                               |    4 +-
 package/php/php.mk                                 |    2 +-
 package/picocom/picocom.mk                         |    2 +-
 package/pinentry/pinentry.mk                       |    2 +-
 package/pkg-download.mk                            |   12 ++--
 package/pkg-perl.mk                                |    2 +-
 package/pkg-utils.mk                               |   12 ++--
 package/proftpd/proftpd.mk                         |    2 +-
 package/python-dialog/python-dialog.mk             |    4 +-
 package/python-ipy/python-ipy.mk                   |    2 +-
 package/python-mad/python-mad.mk                   |    4 +-
 package/python-netifaces/python-netifaces.mk       |    4 +-
 package/python-protobuf/python-protobuf.mk         |    4 +-
 package/python-pyparsing/python-pyparsing.mk       |   12 ++--
 package/python-pyro/python-pyro.mk                 |    4 +-
 package/python-serial/python-serial.mk             |    4 +-
 package/python/python.mk                           |   10 +-
 package/python3/python3.mk                         |    2 +-
 package/qemu/qemu.mk                               |    2 +-
 package/qextserialport/qextserialport.mk           |    4 +-
 package/qjson/qjson.mk                             |    2 +-
 package/qt/qt.mk                                   |   80 ++++++++++----------
 package/qwt/qwt.mk                                 |    2 +-
 package/rings/rings.mk                             |    2 +-
 package/rpcbind/rpcbind.mk                         |    4 +-
 package/rtai/rtai.mk                               |    4 +-
 package/sam-ba/sam-ba.mk                           |    4 +-
 package/sg3_utils/sg3_utils.mk                     |    2 +-
 package/slirp/slirp.mk                             |    8 +-
 package/spice-protocol/spice-protocol.mk           |   10 +-
 package/spice/spice.mk                             |   14 ++--
 package/sysvinit/sysvinit.mk                       |    6 +-
 package/tcllib/tcllib.mk                           |   12 ++--
 package/tftpd/tftpd.mk                             |    6 +-
 package/thttpd/thttpd.mk                           |    2 +-
 package/tstools/tstools.mk                         |    4 +-
 package/tvheadend/tvheadend.mk                     |    2 +-
 package/uboot-tools/uboot-tools.mk                 |    4 +-
 package/udisks/udisks.mk                           |    2 +-
 package/usbredir/usbredir.mk                       |   16 ++--
 package/valgrind/valgrind.mk                       |    4 +-
 package/vde2/vde2.mk                               |   12 ++--
 package/vpnc/vpnc.mk                               |   10 +-
 package/xinetd/xinetd.mk                           |    6 +-
 package/zxing/zxing.mk                             |    2 +-
 support/dependencies/dependencies.mk               |    4 +-
 toolchain/toolchain-external/toolchain-external.mk |   52 +++++++-------
 134 files changed, 396 insertions(+), 396 deletions(-)

Patch is too large, so refusing to show it
