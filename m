From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:17:48 +0100
Subject: [Buildroot] [PATCHv3 00/74] Misc package improvements
Message-ID: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series does miscellaneous improvements to packages, mainly:

 * Convert the remaining init script installation logic to
   <pkg>_INSTALL_INIT_SYSV.

 * Do not install or remove man pages in packages, since we don't care
   about documentation in the target.

 * Fixup a number of "for" loops to properly bail out if one iteration
   of the loop fails instead of silently ignoring the error. Not all
   for loops have been inspected yet, so it's only a partial work.

 * Install init scripts and configuration files unconditionally, even
   though the skeleton has installed its own version of the
   file. People are encouraged to use the rootfs overlay or the
   post-build script mechanisms.

 * Misc other small stuff.

Changes since v2:

 - Fix commit title of the commit making the dmraid init script
   installation unconditional, it was referring to busybox while the
   commit is about dmraid. Noticed by Baruch.

 - Fix commit messages of netatalk, gpsd, samba, input-event-daemon,
   which were missing some words. Noticed by Baruch.

Changes since v1:

 - Rebase on top of the next branch.
 - Add more patches to remove the conditional installations.

Best regards,

Thomas

Thomas Petazzoni (74):
  vsftpd: use <pkg>_INSTALL_INIT_SYSV and rename init script
  vsftpd: don't install manpages
  vsftpd: rename patches to the new naming convention
  radvd: use <pkg>_INSTALL_INIT_SYSV
  thttpd: use the <pkg>_INSTALL_INIT_SYSV mechanism
  busybox: use <pkg>_INSTALL_INIT_SYSV mechanism
  portmap: use <pkg>_INSTALL_INIT_SYSV mechanism
  portmap: don't install manpages
  portmap: improve installation of binaries
  stunnel: use the <pkg>_INSTALL_INIT_SYSV mechanism
  gdk-pixbuf: use <pkg>_INSTALL_INIT_SYSV mechanism
  proftpd: use <pkg>_INSTALL_INIT_SYSV mechanism
  samba: use <pkg>_INSTALL_INIT_SYSV mechanism
  input-event-daemon: use <pkg>_INSTALL_INIT_SYSV mechanism
  ifplugd: use <pkg>_INSTALL_INIT_SYSV mechanism
  nfs-utils: use <pkg>_INSTALL_INIT_SYSV mechanism
  netatalk: use <pkg>_INSTALL_INIT_SYSV mechanism
  mongoose: use <pkg>_INSTALL_INIT_SYSV mechanism
  gpsd: use <pkg>_INSTALL_INIT_SYSV mechanism
  olsr: use <pkg>_INSTALL_INIT_SYSV mechanism
  pango: use <pkg>_INSTALL_INIT_SYSV mechanism
  xapp_xdm: use <pkg>_INSTALL_INIT_SYSV mechanism
  tftpd: use <pkg>_INSTALL_INIT_SYSV mechanism
  openvpn: use <pkg>_INSTALL_INIT_SYSV mechanism
  tinyhttpd: use <pkg>_INSTALL_INIT_SYSV mechanism
  at: use <pkg>_INSTALL_INIT_SYSV mechanism
  mpd: use <pkg>_INSTALL_INIT_SYSV mechanism
  snowball-init: use <pkg>_INSTALL_INIT_SYSV mechanism
  wipe: don't install man pages
  ndisc6: remove man page related code
  tree: don't install man page
  iostat: don't install man page
  iostat: remove legacy code
  pptp-linux: don't install man page
  gnupg: don't both removing a man page
  rp-pppoe: don't install man pages
  rp-pppoe: bail out of installation fails
  alsa-utils: add error handling to for loop
  coreutils: add error handling to for loop
  ebtables: add error handling to for loop
  flot: add error handling to for loop
  googlefontdirectory: add error handling to for loop
  gptfdisk: add error handling to for loop
  irda-utils: add error handling to for loop
  jimtcl: add error handling to for loop
  live555: add error handling to for loop
  lockfile-progs: add error handling to for loop
  qt5base: add error handling to for loop
  qtuio: add error handling to for loop
  sound-theme-borealis: add error handling to for loop
  xenomai: add error handling to for loop
  aiccu: install init script and config file unconditionally
  busybox: install init script and config file unconditionally
  dmraid: install init script unconditionally
  iucode-tool: install init script unconditionally
  lighttpd: install init script and config file unconditionally
  rpcbind: install init script unconditionally
  rsyslog: install init script and config file unconditionally
  transmission: install init script unconditionally
  stunnel: install configuration file unconditionally
  input-event-daemon: install configuration file unconditionally
  fluxbox: install session file unconditionally
  proftpd: install configuration file unconditionally
  samba: install configuration file unconditionally
  logrotate: install configuration file unconditionally
  nss-mdns: install configuration file unconditionally
  ifplugd: install configuration files unconditionally
  sysklogd: install configuration file unconditionally
  screen: install configuration file unconditionally
  usbmount: install configuration file unconditionally
  php: install configuration file unconditionally
  inadyn: install configuration file unconditionally
  mpd: install configuration file unconditionally
  toolchain: install nssswitch.conf configuration file unconditionally

 package/aiccu/aiccu.mk                             |  6 +--
 package/alsa-utils/alsa-utils.mk                   |  2 +-
 package/at/at.mk                                   |  4 +-
 package/busybox/busybox.mk                         | 35 ++++++++--------
 package/coreutils/coreutils.mk                     |  2 +-
 package/dmraid/dmraid.mk                           |  5 +--
 package/ebtables/ebtables.mk                       |  2 +-
 package/flot/flot.mk                               |  2 +-
 package/fluxbox/fluxbox.mk                         |  4 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                   |  4 +-
 package/gnupg/gnupg.mk                             |  3 +-
 package/googlefontdirectory/googlefontdirectory.mk |  2 +-
 package/gpsd/gpsd.mk                               |  9 +++--
 package/gptfdisk/gptfdisk.mk                       |  2 +-
 package/ifplugd/ifplugd.mk                         | 19 +++++----
 package/inadyn/inadyn.mk                           |  6 +--
 package/input-event-daemon/input-event-daemon.mk   | 13 +++---
 package/iostat/iostat.mk                           |  4 --
 package/irda-utils/irda-utils.mk                   |  2 +-
 package/iucode-tool/iucode-tool.mk                 |  5 +--
 package/jimtcl/jimtcl.mk                           |  2 +-
 package/lighttpd/lighttpd.mk                       | 46 ++++++++--------------
 package/live555/live555.mk                         |  2 +-
 package/lockfile-progs/lockfile-progs.mk           |  2 +-
 package/logrotate/logrotate.mk                     |  4 +-
 package/mongoose/mongoose.mk                       |  3 ++
 package/mpd/mpd.mk                                 | 12 +++---
 package/ndisc6/ndisc6.mk                           |  7 +---
 package/netatalk/netatalk.mk                       |  9 ++---
 package/nfs-utils/nfs-utils.mk                     |  9 +++--
 package/nss-mdns/nss-mdns.mk                       |  4 +-
 package/olsr/olsr.mk                               |  5 ++-
 package/openvpn/openvpn.mk                         |  3 ++
 package/pango/pango.mk                             |  4 +-
 package/php/php.mk                                 |  6 +--
 package/portmap/portmap.mk                         | 14 +++----
 package/pptp-linux/pptp-linux.mk                   |  1 -
 package/proftpd/proftpd.mk                         | 11 +++---
 package/qt5/qt5base/qt5base.mk                     |  2 +-
 package/qtuio/qtuio.mk                             |  6 +--
 package/radvd/radvd.mk                             |  6 +--
 package/rp-pppoe/rp-pppoe.mk                       |  5 +--
 package/rpcbind/rpcbind.mk                         |  5 +--
 package/rsyslog/rsyslog.mk                         | 14 +++----
 package/samba/samba.mk                             | 17 ++++----
 package/screen/screen.mk                           |  4 +-
 package/snowball-init/snowball-init.mk             |  2 +-
 .../sound-theme-borealis/sound-theme-borealis.mk   |  2 +-
 package/stunnel/stunnel.mk                         | 14 ++++---
 package/sysklogd/sysklogd.mk                       |  6 +--
 package/tftpd/tftpd.mk                             |  5 ++-
 package/thttpd/thttpd.mk                           |  7 +++-
 package/tinyhttpd/tinyhttpd.mk                     |  5 ++-
 package/transmission/transmission.mk               |  5 +--
 package/tree/tree.mk                               |  2 -
 package/usbmount/usbmount.mk                       |  4 +-
 ...px-builddef.patch => 0001-utmpx-builddef.patch} |  0
 ...efile.patch => 0002-dont-force-largefile.patch} |  0
 package/vsftpd/{vsftpd-init => S70vsftpd}          |  0
 package/vsftpd/vsftpd.mk                           | 11 ++----
 package/wipe/wipe.mk                               |  1 -
 package/x11r7/xapp_xdm/xapp_xdm.mk                 |  4 +-
 package/xenomai/xenomai.mk                         |  2 +-
 toolchain/toolchain.mk                             |  6 +--
 64 files changed, 177 insertions(+), 233 deletions(-)
 rename package/vsftpd/{vsftpd-0001-utmpx-builddef.patch => 0001-utmpx-builddef.patch} (100%)
 rename package/vsftpd/{vsftpd-dont-force-largefile.patch => 0002-dont-force-largefile.patch} (100%)
 rename package/vsftpd/{vsftpd-init => S70vsftpd} (100%)

-- 
2.1.0
