From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Tue, 19 Nov 2019 10:58:50 +0100
Subject: [Buildroot] [PATCH v2 0/9] use host-systemd to enable units
In-Reply-To: <20191111172443.6874-1-jeremy.rosen@smile.fr>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
Message-ID: <CAFvCimVciKS3Shr8C=AM5mL5DiYoq-XtTSm1fhQqtsOW5tDpJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody

please do not apply this serie immediately.

some patches in the next branches have added new systemd units, so I will
need to do a review and a v3
(reviewing the core patch itself is still very welcomed)

I will send a v3 when appropriate

Cheers
Jeremy

Le lun. 11 nov. 2019 ? 18:24, J?r?my Rosen <jeremy.rosen@smile.fr> a ?crit :

> As discussed during the buildroot dev days, upstream systemd now relies
> on systemctl to enable units at install time.
>
> The patch bumping systemd to v243 in buildroot did add the logic to
> handle that through Makefiles.
>
> This patch adds support for compiling host-systemd and using it to
> enable all units.
>
> * 0001-new-recipe-host-systemd.patch
> I might have missed some build-dependencies. Please review carefully
>
> * 0002-use-host-systemctl-preset-all-to-enable-units.patch
> Use the previous patch to simplify the systemd recipe
>
> * 0003-fix-tty-handling.patch
> TTY handling is tricky. Separate it in its own patch
>
> Everything else deals with updating the packages
>
> Version 2
> * run check-package
> * removed host-side configuration option
> * rework tty-handling to work with the now-upstreamed fix,
>   carry the corresponding patch locally until next systemd bump
>
> * package/dante : dropped patch. it is now default-enabled
> * package/linuxptp : enable both units by default
> * package/tor : dropped patch. it is now default-enabled
> * package/sysklogd : dropped patch. it is now default-enabled
> * package/targetfbcli : dropped patch. it is now default-enabled
> * package/docker : dropped patch. both service and socket are now enabled
> * package/avahi : dropped patch. it is now default-enabled
> * package/wpa_supplicant : enabled the daemon but not the templates
>   a patch in upstream-systemd has been submited
>   a patch in upstream wpa_supplicant has been around since 2014 :(
>
>
> J?r?my Rosen (9):
>   new recipe : host-systemd
>   use host-systemctl preset all to enable units
>   fix tty handling
>   fix trivial packages with buildroot-provided services
>   fix trivial cases, upstream-provided services
>   package/connman: adapt to preset-all
>   package/linuxptp adapt to preset-all
>   package/network-manager: adapt to preset-all
>   package/wpa_supplicant: adapt for preset-all
>
>  package/acpid/acpid.mk                        |   3 -
>  package/apache/apache.mk                      |   3 -
>  package/audit/audit.mk                        |   4 -
>  package/avahi/avahi.mk                        |   8 -
>  package/babeld/babeld.mk                      |   5 -
>  package/bandwidthd/bandwidthd.mk              |   5 -
>  package/bind/bind.mk                          |   5 -
>  package/bluez5_utils/bluez5_utils.mk          |   8 -
>  package/boinc/boinc.mk                        |   5 -
>  package/brltty/brltty.mk                      |   4 -
>  package/chrony/chrony.mk                      |   3 -
>  package/collectd/collectd.mk                  |   3 -
>  package/connman/connman.mk                    |   6 -
>  package/darkhttpd/darkhttpd.mk                |   3 -
>  package/dcron/dcron.mk                        |   3 -
>  package/dhcp/dhcp.mk                          |   5 -
>  package/dhcpcd/dhcpcd.mk                      |   3 -
>  package/domoticz/domoticz.mk                  |   3 -
>  package/dropbear/dropbear.mk                  |   3 -
>  package/exim/exim.mk                          |   3 -
>  package/fail2ban/fail2ban.mk                  |   3 -
>  package/freescale-imx/imx-uuc/imx-uuc.mk      |   3 -
>  package/gerbera/gerbera.mk                    |   6 -
>  package/haveged/haveged.mk                    |   3 -
>  package/i2pd/i2pd.mk                          |   3 -
>  package/ifupdown-scripts/ifupdown-scripts.mk  |   3 -
>  package/igd2-for-linux/igd2-for-linux.mk      |   3 -
>  package/inadyn/inadyn.mk                      |   3 -
>  .../input-event-daemon/input-event-daemon.mk  |   3 -
>  package/irqbalance/irqbalance.mk              |   3 -
>  package/iucode-tool/iucode-tool.mk            |   3 -
>  package/kodi/kodi.mk                          |   5 -
>  package/lighttpd/lighttpd.mk                  |   6 -
>  .../linuxptp/linuxptp-system-clock.service    |   1 -
>  package/linuxptp/linuxptp.mk                  |   3 -
>  package/lldpd/lldpd.mk                        |   6 -
>  package/mariadb/mariadb.mk                    |   3 -
>  package/mender/mender.mk                      |   3 -
>  package/mini-snmpd/mini-snmpd.mk              |   3 -
>  package/minidlna/minidlna.mk                  |   5 -
>  package/minissdpd/minissdpd.mk                |   3 -
>  package/mosquitto/mosquitto.mk                |   3 -
>  package/motion/motion.mk                      |   3 -
>  package/netplug/netplug.mk                    |   3 -
>  package/network-manager/network-manager.mk    |   7 -
>  package/nfs-utils/nfs-utils.mk                |  16 --
>  package/nginx/nginx.mk                        |   5 -
>  package/nss-pam-ldapd/nss-pam-ldapd.mk        |   3 -
>  package/ntp/ntp.mk                            |   3 -
>  package/ofono/ofono.mk                        |   6 -
>  package/olsr/olsr.mk                          |   3 -
>  package/openntpd/openntpd.mk                  |   3 -
>  package/openssh/openssh.mk                    |   3 -
>  package/openvmtools/openvmtools.mk            |   3 -
>  package/oracle-mysql/oracle-mysql.mk          |   3 -
>  package/pcsc-lite/pcsc-lite.mk                |   6 -
>  package/php/php.mk                            |   3 -
>  package/postgresql/postgresql.mk              |   3 -
>  package/proftpd/proftpd.mk                    |   3 -
>  package/psplash/psplash.mk                    |   6 -
>  package/ptpd/ptpd.mk                          |   3 -
>  package/ptpd2/ptpd2.mk                        |   3 -
>  package/pulseaudio/pulseaudio.mk              |   3 -
>  package/python-web2py/python-web2py.mk        |   3 -
>  package/rabbitmq-server/rabbitmq-server.mk    |   5 -
>  package/redis/redis.mk                        |   3 -
>  package/rng-tools/rng-tools.mk                |   3 -
>  package/rpcbind/rpcbind.mk                    |   3 -
>  package/rpi-userland/rpi-userland.mk          |   3 -
>  package/rsyslog/rsyslog.mk                    |  14 --
>  package/rygel/rygel.mk                        |   3 -
>  package/sane-backends/sane-backends.mk        |   6 -
>  package/squid/squid.mk                        |   3 -
>  package/sshguard/sshguard.mk                  |   3 -
>  package/supervisor/supervisor.mk              |   3 -
>  package/suricata/suricata.mk                  |   3 -
>  .../systemd-bootchart/systemd-bootchart.mk    |   6 -
>  .../0002-allow-an-empty-DefaultInstance.patch |  28 +++
>  package/systemd/80-buildroot.preset           |   4 +
>  package/systemd/Config.in                     |   1 +
>  package/systemd/systemd.mk                    | 221 ++++++++++--------
>  package/tcf-agent/tcf-agent.mk                |   3 -
>  package/thttpd/thttpd.mk                      |   3 -
>  package/ti-gfx/ti-gfx.mk                      |   3 -
>  package/tinyhttpd/tinyhttpd.mk                |   3 -
>  package/transmission/transmission.mk          |   3 -
>  package/triggerhappy/triggerhappy.mk          |   3 -
>  package/upmpdcli/upmpdcli.mk                  |   3 -
>  .../wpa_supplicant/50-wpa_supplicant.preset   |   4 +
>  package/wpa_supplicant/wpa_supplicant.mk      |   2 +
>  90 files changed, 164 insertions(+), 431 deletions(-)
>  create mode 100644
> package/systemd/0002-allow-an-empty-DefaultInstance.patch
>  create mode 100644 package/systemd/80-buildroot.preset
>  create mode 100644 package/wpa_supplicant/50-wpa_supplicant.preset
>
> --
> 2.24.0.rc1
>
>

-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191119/ba3a90a0/attachment.html>
