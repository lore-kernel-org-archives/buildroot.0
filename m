From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat,  7 Dec 2019 19:00:36 +0100
Subject: [Buildroot] [PATCH v3 00/13] use host-systemd to enable units
Message-ID: <20191207180049.3245578-1-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


As discussed during the buildroot dev days, upstream systemd now relies
on systemctl to enable units at install time.

The patch bumping systemd to v243 in buildroot did add the logic to
handle that through Makefiles.

This patch adds support for compiling host-systemd and using it to
enable all units.

* 0001-new-recipe-host-systemd.patch
I might have missed some build-dependencies. Please review carefully

* 0002-use-host-systemctl-preset-all-to-enable-units.patch
Use the previous patch to simplify the systemd recipe

* 0003-fix-tty-handling.patch
TTY handling is tricky. Separate it in its own patch

Everything else deals with updating the packages

Version 3
* udevadm now uses libsystemd. Added it to RPATH tweaks
* added a blurb to the buildroot manual about preset-all
* use a blind configuration symbol to enable host-systemd
* rpi-userland : systemd service was removed upstream, no more upgrade needed
* document in patch2 that some packages might be automatically enabled
* remove systemd patch for DefaultInstance : merged upstream
* use SYSTEMD_PKGDIR and WPA_SUPPLICANT_PKGDIR where needed
* replace echo with printf in systemd.mk
* added SoB everywere
* added Yann's Reviewed-by where appropriate
* sysrepo/sysrepo.mk: fix systemd install dir
* syslog-ng/syslog-ng.mk: implement default instance properly
* alsa-utils/alsa-utils.mk: implement WantedBy, also remove manual install
* rauc/rauc.mk: implement WantedBy properly


J?r?my Rosen (13):
  new recipe : host-systemd
  use host-systemctl preset all to enable units
  fix tty handling
  fix trivial packages with buildroot-provided services
  fix trivial cases, upstream-provided services
  package/connman: adapt to preset-all
  package/linuxptp adapt to preset-all
  package/network-manager: adapt to preset-all
  package/wpa_supplicant: adapt for preset-all
  package/sysrepo: update to new systemd
  package/syslog-ng: implement default using DefaultInstance
  package/rauc: add a WantedBy section to the unit
  package/alsa-utils: add a WantedBy section to the unit

 docs/manual/adding-packages-generic.txt       |   4 +
 package/Config.in.host                        |   1 +
 package/acpid/acpid.mk                        |   3 -
 package/alsa-utils/alsa-utils.mk              |   9 +-
 package/apache/apache.mk                      |   3 -
 package/audit/audit.mk                        |   4 -
 package/avahi/avahi.mk                        |   8 -
 package/babeld/babeld.mk                      |   5 -
 package/bandwidthd/bandwidthd.mk              |   5 -
 package/bind/bind.mk                          |   5 -
 package/bluez5_utils/bluez5_utils.mk          |   8 -
 package/boinc/boinc.mk                        |   5 -
 package/brltty/brltty.mk                      |   4 -
 package/chrony/chrony.mk                      |   3 -
 package/collectd/collectd.mk                  |   3 -
 package/connman/connman.mk                    |   6 -
 package/darkhttpd/darkhttpd.mk                |   3 -
 package/dcron/dcron.mk                        |   3 -
 package/dhcp/dhcp.mk                          |   5 -
 package/dhcpcd/dhcpcd.mk                      |   3 -
 package/docker-engine/docker-engine.mk        |   3 -
 package/domoticz/domoticz.mk                  |   3 -
 package/dropbear/dropbear.mk                  |   3 -
 package/exim/exim.mk                          |   3 -
 package/fail2ban/fail2ban.mk                  |   3 -
 package/freescale-imx/imx-uuc/imx-uuc.mk      |   3 -
 package/gerbera/gerbera.mk                    |   6 -
 package/haveged/haveged.mk                    |   3 -
 package/i2pd/i2pd.mk                          |   3 -
 package/ifupdown-scripts/ifupdown-scripts.mk  |   3 -
 package/igd2-for-linux/igd2-for-linux.mk      |   3 -
 package/inadyn/inadyn.mk                      |   3 -
 .../input-event-daemon/input-event-daemon.mk  |   3 -
 package/iputils/iputils.mk                    |  16 --
 package/irqbalance/irqbalance.mk              |   3 -
 package/iucode-tool/iucode-tool.mk            |   3 -
 package/kodi/kodi.mk                          |   5 -
 package/lighttpd/lighttpd.mk                  |   6 -
 .../linuxptp/linuxptp-system-clock.service    |   1 -
 package/linuxptp/linuxptp.mk                  |   3 -
 package/lldpd/lldpd.mk                        |   6 -
 package/mariadb/mariadb.mk                    |   3 -
 package/mender/mender.mk                      |   3 -
 package/mini-snmpd/mini-snmpd.mk              |   3 -
 package/minidlna/minidlna.mk                  |   5 -
 package/minissdpd/minissdpd.mk                |   3 -
 package/mosquitto/mosquitto.mk                |   3 -
 package/motion/motion.mk                      |   3 -
 package/netplug/netplug.mk                    |   3 -
 package/network-manager/network-manager.mk    |   7 -
 package/nfs-utils/nfs-utils.mk                |  16 --
 package/nginx/nginx.mk                        |   5 -
 package/nss-pam-ldapd/nss-pam-ldapd.mk        |   3 -
 package/ntp/ntp.mk                            |   3 -
 package/ofono/ofono.mk                        |   6 -
 package/olsr/olsr.mk                          |   3 -
 package/openntpd/openntpd.mk                  |   3 -
 package/openssh/openssh.mk                    |   3 -
 package/openvmtools/openvmtools.mk            |   3 -
 package/oracle-mysql/oracle-mysql.mk          |   3 -
 package/pcsc-lite/pcsc-lite.mk                |   6 -
 package/php/php.mk                            |   3 -
 package/postgresql/postgresql.mk              |   3 -
 package/proftpd/proftpd.mk                    |   3 -
 package/psplash/psplash.mk                    |   6 -
 package/ptpd/ptpd.mk                          |   3 -
 package/ptpd2/ptpd2.mk                        |   3 -
 package/pulseaudio/pulseaudio.mk              |   3 -
 package/python-web2py/python-web2py.mk        |   3 -
 package/rabbitmq-server/rabbitmq-server.mk    |   5 -
 package/rauc/rauc.mk                          |   5 +-
 package/redis/redis.mk                        |   3 -
 package/rng-tools/rng-tools.mk                |   3 -
 package/rpcbind/rpcbind.mk                    |   3 -
 package/rsyslog/rsyslog.mk                    |  14 --
 package/rygel/rygel.mk                        |   3 -
 package/samba4/samba4.mk                      |   7 -
 package/sane-backends/sane-backends.mk        |   6 -
 package/squid/squid.mk                        |   3 -
 package/sshguard/sshguard.mk                  |   3 -
 package/supervisor/supervisor.mk              |   3 -
 package/suricata/suricata.mk                  |   3 -
 package/sysklogd/sysklogd.mk                  |   5 -
 package/syslog-ng/syslog-ng.mk                |   7 +-
 package/sysrepo/sysrepo.mk                    |  10 +-
 .../systemd-bootchart/systemd-bootchart.mk    |   6 -
 package/systemd/80-buildroot.preset           |   4 +
 package/systemd/Config.in                     |   1 +
 package/systemd/Config.in.host                |   3 +
 package/systemd/systemd.mk                    | 219 ++++++++++--------
 package/tcf-agent/tcf-agent.mk                |   3 -
 package/thttpd/thttpd.mk                      |   3 -
 package/ti-gfx/ti-gfx.mk                      |   3 -
 package/tinyhttpd/tinyhttpd.mk                |   3 -
 package/transmission/transmission.mk          |   3 -
 package/triggerhappy/triggerhappy.mk          |   3 -
 package/upmpdcli/upmpdcli.mk                  |   3 -
 .../wpa_supplicant/50-wpa_supplicant.preset   |   4 +
 package/wpa_supplicant/wpa_supplicant.mk      |   2 +
 99 files changed, 149 insertions(+), 483 deletions(-)
 create mode 100644 package/systemd/80-buildroot.preset
 create mode 100644 package/systemd/Config.in.host
 create mode 100644 package/wpa_supplicant/50-wpa_supplicant.preset

-- 
2.24.0
