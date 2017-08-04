From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  4 Aug 2017 14:55:11 -0400
Subject: [Buildroot] [PATCH 00/10] libssl: new package
Message-ID: <20170804185521.12320-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After spending over 20 hours building, testing, and compiling all of the
packages currently in Buildroot that select or depend on OpenSSL against
libressl, I believe it would be a good fit for a Virtual package.

As we all know, LibreSSL is supposed to be a drop-in replacement for
OpenSSL 1.0.x, and for the most part it is.  There are however; a few
small quirks.

 - Packages that support both OpenSSL 1.1 and 1.0 tend to have a macro
   that checks the OpenSSL version.  Because LibreSSL reports as 2.5.5
   (at the time of this writing), these packages try to use the 1.1 API
   and fail to compile.  This is easily fixed with a quick addition to
   the version check macro in the code.
   
 - Packages that use RAND_egd.
   RAND_egd was removed in LibreSSL. However, LibreSSL does have the define
   OPENSSL_NO_EGD.  The solution is to guard the code calling RAND_egd
   (https://wiki.freebsd.org/LibreSSL/PatchingPorts#EGD)
   
 - Packages still using SSLv3.
   SSLv3 support was removed from LibreSSL. However, LibreSSL does have the
   define OPENSSL_NO_SSL3.  The solution is to guard the code calling
   any SSLv3_ function with this check.
   (https://wiki.freebsd.org/LibreSSL/PatchingPorts#EGD)
   
Other than a few packages that require a patch to fix these common errors:

 - 119 packages compiled without any issues.
 - 12 packages need a small patch to fix compiling against libressl.
 - 2 packages need a tweak to their make files to fix compiling against
   libressl.
 - 4 packages need to be updated to support compiling against libressl.
 - 5 packages as of now can't compile against LibreSSL.

As such, 97% of all packages in BuildRoot as of today support LibreSSL
with either no, or very little modification.  Therefor, I believe the SSL
Library is a good candidate for a virtual package.

To make this happen I perform the following steps:

 - Add libssl as a new virtual package, and add OpenSSL as the only option.
   This prevents any package from breaking.
   
 - Add OpenSSL as a dependency to the broken packages.
 
 - Convert all other packages that don't have OpenSSL as a dependency
   from openssl to libssl.
   
 - Bump any packages that need to be updated to build against libreSSL to
   the current version.
   
 - Fix any make files that would cause LibreSSL from not working.
 
 - Add fix-libressl-support.patch to any packages that need a patch to
   compile against libressl.
   
 - Add LibreSSL as an option to libssl.
  

Adam Duskett (10):
  libssl: new virtual package
  add openssl as a dependency to certain packages
  convert dependencies to libssl
  perl-net-ssleay: update to version 1.81
  netatalk: bump to version 3.1.9
  freerdp: bump to version 9a00b25adc6604f4fbe7c1d69aa4e5663d4d3863
  softether: bump to version
    471de39ddf91be0a6a020a68fd6c4c20ef5ba702cb8b5da12ae8350493819ed8
  libssl: fix make files for libressl
  add fix-libressl-support patches
  libssl: add libressl as a option

 package/Config.in                                  |   4 +-
 package/aircrack-ng/Config.in                      |   2 +-
 package/aircrack-ng/aircrack-ng.mk                 |   2 +-
 package/alljoyn-base/Config.in                     |   2 +-
 package/alljoyn-base/alljoyn-base.mk               |   2 +-
 package/alljoyn/Config.in                          |   2 +-
 package/alljoyn/alljoyn.mk                         |   2 +-
 package/android-tools/Config.in                    |   4 +-
 package/android-tools/android-tools.mk             |   6 +-
 package/apache/0003-fix-libressl-support.patch     | 277 +++++++++++++++++++++
 package/apache/apache.mk                           |   4 +-
 package/apr-util/apr-util.mk                       |   4 +-
 package/azure-iot-sdk-c/Config.in                  |   2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk         |   2 +-
 package/bind/bind.mk                               |   4 +-
 package/botan/botan.mk                             |   4 +-
 package/c-icap/c-icap.mk                           |   4 +-
 package/ca-certificates/ca-certificates.mk         |  16 +-
 package/civetweb/civetweb.mk                       |   4 +-
 package/clamav/Config.in                           |   2 +-
 package/clamav/clamav.mk                           |   2 +-
 package/collectd/Config.in                         |   2 +-
 package/coreutils/coreutils.mk                     |   4 +-
 package/cryptsetup/cryptsetup.mk                   |   4 +-
 package/ctorrent/ctorrent.mk                       |   4 +-
 package/curlftpfs/Config.in                        |   2 +-
 package/dillo/dillo.mk                             |   4 +-
 package/domoticz/Config.in                         |   2 +-
 package/domoticz/domoticz.mk                       |   2 +-
 package/dovecot/Config.in                          |   2 +-
 package/dovecot/dovecot.mk                         |   2 +-
 package/easy-rsa/Config.in                         |   4 +-
 package/ecryptfs-utils/ecryptfs-utils.mk           |   4 +-
 package/efl/efl.mk                                 |   6 +-
 package/ejabberd/Config.in                         |   2 +-
 package/ejabberd/ejabberd.mk                       |   2 +-
 package/erlang-p1-tls/Config.in                    |   2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk             |   2 +-
 package/erlang/erlang.mk                           |   6 +-
 package/exim/exim.mk                               |   4 +-
 package/fastd/fastd.mk                             |   4 +-
 package/fetchmail/Config.in                        |   2 +-
 package/fetchmail/fetchmail.mk                     |   2 +-
 package/ffmpeg/0002-fix-libressl-support.patch     |  74 ++++++
 package/ffmpeg/ffmpeg.mk                           |   4 +-
 package/filemq/Config.in                           |   2 +-
 package/filemq/filemq.mk                           |   2 +-
 package/flickcurl/Config.in                        |   2 +-
 .../freerdp/0001-fix-building-shared-libs.patch    |  26 --
 .../freerdp/0002-add-support-for-tz-package.patch  |  30 ---
 package/freerdp/0003-add-missing-define.patch      |  44 ----
 package/freerdp/0004-ffmpeg30.patch                |  74 ------
 package/freerdp/Config.in                          |   2 +-
 package/freerdp/freerdp.hash                       |   2 +-
 package/freerdp/freerdp.mk                         |   4 +-
 package/freeswitch/Config.in                       |   2 +-
 package/freeswitch/freeswitch.mk                   |   2 +-
 package/git-crypt/Config.in                        |   2 +-
 package/git-crypt/git-crypt.mk                     |   2 +-
 package/git/git.mk                                 |   4 +-
 package/gstreamer/gst-plugins-bad/Config.in        |   2 +-
 .../gstreamer/gst-plugins-bad/gst-plugins-bad.mk   |   2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in      |   4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |   4 +-
 .../heirloom-mailx/0002-fix-libressl-support.patch |  54 ++++
 package/heirloom-mailx/heirloom-mailx.mk           |   4 +-
 package/hostapd/0001-fix-libressl-support.patch    |  38 +++
 package/hostapd/hostapd.mk                         |   4 +-
 package/ibrcommon/ibrcommon.mk                     |   4 +-
 package/ibrdtnd/ibrdtnd.mk                         |   4 +-
 package/inadyn/inadyn.mk                           |   4 +-
 package/ipmitool/Config.in                         |   2 +-
 package/ipmitool/ipmitool.mk                       |   2 +-
 package/ipmiutil/ipmiutil.mk                       |   4 +-
 package/ipsec-tools/Config.in                      |   2 +-
 package/ipsec-tools/ipsec-tools.mk                 |   2 +-
 package/iputils/iputils.mk                         |   4 +-
 package/irssi/Config.in                            |   2 +-
 package/irssi/irssi.mk                             |   2 +-
 package/janus-gateway/Config.in                    |   2 +-
 package/keepalived/Config.in                       |   2 +-
 package/keepalived/keepalived.mk                   |   2 +-
 package/kodi/Config.in                             |   2 +-
 package/kodi/kodi.mk                               |   2 +-
 package/lftp/0003-libressl-support.patch           |  35 +++
 package/lftp/Config.in                             |   2 +-
 package/lftp/lftp.mk                               |   4 +-
 package/libarchive/libarchive.mk                   |   4 +-
 package/libcurl/libcurl.mk                         |   6 +-
 package/libeXosip2/libeXosip2.mk                   |   4 +-
 package/libesmtp/libesmtp.mk                       |   2 +-
 package/libevent/0002-fix-libressl-support.patch   |  26 ++
 package/libevent/libevent.mk                       |   4 +-
 package/libfreefare/Config.in                      |   2 +-
 package/libfreefare/libfreefare.mk                 |   2 +-
 package/libldns/Config.in                          |   2 +-
 package/libldns/libldns.mk                         |   2 +-
 package/liboauth/Config.in                         |   2 +-
 package/liboauth/liboauth.mk                       |   2 +-
 package/libpjsip/libpjsip.mk                       |   4 +-
 package/libressl/Config.in                         |   2 +-
 package/libressl/libressl.mk                       |   2 +
 package/libshout/libshout.mk                       |   4 +-
 package/libsrtp/libsrtp.mk                         |   4 +-
 package/libssh/Config.in                           |   2 +-
 package/libssh/libssh.mk                           |   2 +-
 package/libssh2/Config.in                          |   2 +-
 package/libssh2/libssh2.mk                         |   2 +-
 package/libssl/Config.in                           |  27 ++
 package/libssl/libssl.mk                           |   8 +
 package/libstrophe/Config.in                       |   2 +-
 package/libstrophe/libstrophe.mk                   |   2 +-
 package/libvncserver/libvncserver.mk               |   4 +-
 package/libwebsock/libwebsock.mk                   |   4 +-
 package/libwebsockets/libwebsockets.mk             |   2 +-
 package/lighttpd/Config.in                         |   2 +-
 package/lighttpd/lighttpd.mk                       |   4 +-
 package/links/links.mk                             |   4 +-
 package/luacrypto/Config.in                        |   2 +-
 package/luacrypto/luacrypto.mk                     |   2 +-
 package/luaossl/Config.in                          |   2 +-
 package/luaossl/luaossl.mk                         |   2 +-
 package/luasec/Config.in                           |   2 +-
 package/luasec/luasec.mk                           |   2 +-
 package/luvi/Config.in                             |   5 +-
 package/mariadb/mariadb.mk                         |   2 +-
 package/mongodb/mongodb.mk                         |   4 +-
 package/mongoose/mongoose.mk                       |   4 +-
 package/monit/monit.mk                             |   4 +-
 package/mosh/Config.in                             |   2 +-
 package/mosh/mosh.mk                               |   4 +-
 package/mosquitto/0001-fix-libressl-support.patch  |  63 +++++
 package/mosquitto/mosquitto.mk                     |   7 +-
 package/msmtp/msmtp.mk                             |   4 +-
 package/mutt/mutt.mk                               |   4 +-
 package/mysql/Config.in                            |   2 +-
 package/neon/Config.in                             |   2 +-
 package/neon/neon.mk                               |   2 +-
 package/netatalk/Config.in                         |   2 +-
 package/netatalk/netatalk.hash                     |   6 +-
 package/netatalk/netatalk.mk                       |   4 +-
 package/netsnmp/Config.in                          |   2 +-
 package/netsnmp/netsnmp.mk                         |   4 +-
 package/nginx-upload/Config.in                     |   2 +-
 package/nginx-upload/nginx-upload.mk               |   2 +-
 package/nginx/Config.in                            |  10 +-
 package/nginx/nginx.mk                             |  10 +-
 package/nmap/nmap.mk                               |   4 +-
 package/nodejs/Config.in                           |   6 +-
 package/ntp/0004-libressl-support.patch            | 106 ++++++++
 package/ntp/Config.in                              |   2 +-
 package/ntp/ntp.mk                                 |   2 +-
 package/nut/nut.mk                                 |   4 +-
 package/omniorb/omniorb.mk                         |   4 +-
 package/openipmi/openipmi.mk                       |   4 +-
 package/openldap/0004-fix-libressl-support.patch   |  99 ++++++++
 package/openldap/openldap.mk                       |   8 +-
 package/openssh/Config.in                          |   2 +-
 package/openssh/openssh.mk                         |   2 +-
 package/openssl/Config.in                          |   1 +
 package/openssl/openssl.mk                         |   1 +
 package/openswan/openswan.mk                       |   4 +-
 package/openvmtools/openvmtools.mk                 |   4 +-
 package/openvpn/Config.in                          |   2 +-
 package/openvpn/openvpn.mk                         |   2 +-
 package/opusfile/0001-fix-libressl-support.patch   |  82 ++++++
 package/opusfile/opusfile.mk                       |   4 +-
 package/oracle-mysql/oracle-mysql.mk               |   4 +-
 package/paho-mqtt-c/paho-mqtt-c.mk                 |   4 +-
 package/perl-crypt-openssl-random/Config.in        |   2 +-
 .../perl-crypt-openssl-random.mk                   |   2 +-
 package/perl-net-ssleay/Config.in                  |   2 +-
 package/perl-net-ssleay/perl-net-ssleay.hash       |   4 +-
 package/perl-net-ssleay/perl-net-ssleay.mk         |   4 +-
 package/php/php.mk                                 |   2 +-
 package/poco/Config.in                             |   4 +-
 package/postgresql/postgresql.mk                   |   4 +-
 package/pound/Config.in                            |   2 +-
 package/pound/pound.mk                             |   2 +-
 package/pure-ftpd/pure-ftpd.mk                     |   4 +-
 package/python-cryptography/Config.in              |   5 +-
 package/python/Config.in                           |   4 +-
 package/python/python.mk                           |   4 +-
 package/python3/Config.in                          |   2 +-
 package/python3/python3.mk                         |   2 +-
 package/qt-webkit-kiosk/Config.in                  |   2 +-
 package/qt/Config.in                               |   2 +-
 package/qt/qt.mk                                   |   2 +-
 package/qt5/qt5base/qt5base.mk                     |   4 +-
 package/qt5/qt5enginio/Config.in                   |   2 +-
 package/qt5/qt5enginio/qt5enginio.mk               |   2 +-
 package/rabbitmq-c/rabbitmq-c.mk                   |   4 +-
 package/rabbitmq-server/Config.in                  |   2 +-
 package/rauc/Config.in                             |   5 +-
 package/rdesktop/Config.in                         |   2 +-
 package/rdesktop/rdesktop.mk                       |   2 +-
 package/rhash/rhash.mk                             |   4 +-
 package/rtmpdump/rtmpdump.mk                       |   4 +-
 package/rtorrent/Config.in                         |   2 +-
 package/ruby/ruby.mk                               |   4 +-
 package/sconeserver/sconeserver.mk                 |   4 +-
 package/scrypt/Config.in                           |   2 +-
 package/scrypt/scrypt.mk                           |   2 +-
 package/shairport-sync/Config.in                   |   2 +-
 package/shairport-sync/shairport-sync.mk           |   6 +-
 package/shellinabox/Config.in                      |   2 +-
 package/shellinabox/shellinabox.mk                 |   2 +-
 package/sngrep/sngrep.mk                           |   4 +-
 package/snmppp/Config.in                           |   2 +-
 package/snmppp/snmppp.mk                           |   2 +-
 package/socat/socat.mk                             |   4 +-
 package/sofia-sip/sofia-sip.mk                     |   4 +-
 package/softether/0010-fix-libressl-support.patch  |  33 +++
 package/softether/Config.in                        |   2 +-
 package/softether/softether.hash                   |   2 +-
 package/softether/softether.mk                     |   6 +-
 package/spice/Config.in                            |   2 +-
 package/spice/spice.mk                             |   2 +-
 package/sqlcipher/Config.in                        |   2 +-
 package/sqlcipher/sqlcipher.mk                     |   2 +-
 package/squid/squid.mk                             |   4 +-
 package/strongswan/Config.in                       |   2 +-
 package/stunnel/Config.in                          |   5 +-
 package/swupdate/Config.in                         |   2 +-
 package/swupdate/swupdate.mk                       |   4 +-
 package/sylpheed/sylpheed.mk                       |   4 +-
 package/synergy/Config.in                          |   2 +-
 package/synergy/synergy.mk                         |   2 +-
 package/syslog-ng/Config.in                        |   2 +-
 package/syslog-ng/syslog-ng.mk                     |   2 +-
 package/thrift/Config.in                           |   2 +-
 package/tinc/Config.in                             |   2 +-
 package/tinc/tinc.mk                               |   2 +-
 package/tn5250/tn5250.mk                           |   4 +-
 package/tor/Config.in                              |   2 +-
 package/tor/tor.mk                                 |   2 +-
 package/tpm-tools/Config.in                        |   2 +-
 package/tpm-tools/tpm-tools.mk                     |   2 +-
 package/transmission/Config.in                     |   2 +-
 package/transmission/transmission.mk               |   2 +-
 package/trousers/Config.in                         |   2 +-
 package/trousers/trousers.mk                       |   2 +-
 package/turbolua/turbolua.mk                       |   4 +-
 package/tvheadend/Config.in                        |   2 +-
 package/uboot-tools/Config.in                      |   2 +-
 package/uboot-tools/uboot-tools.mk                 |   4 +-
 package/ustream-ssl/Config.in                      |   2 +-
 package/ustream-ssl/ustream-ssl.mk                 |   2 +-
 package/vboot-utils/vboot-utils.mk                 |   2 +-
 package/vsftpd/vsftpd.mk                           |   4 +-
 package/vtun/Config.in                             |   2 +-
 package/vtun/vtun.mk                               |   2 +-
 package/wget/wget.mk                               |   4 +-
 .../wpa_supplicant/0001-fix-libressl-support.patch |  70 ++++++
 package/wpa_supplicant/wpa_supplicant.mk           |   6 +-
 package/x11r7/xserver_xorg-server/Config.in        |   2 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |   4 +-
 package/x11vnc/x11vnc.mk                           |   4 +-
 package/xen/Config.in                              |   2 +-
 package/xen/xen.mk                                 |   2 +-
 package/xl2tp/Config.in                            |   2 +-
 package/xl2tp/xl2tp.mk                             |   2 +-
 package/znc/znc.mk                                 |   4 +-
 263 files changed, 1379 insertions(+), 530 deletions(-)
 create mode 100644 package/apache/0003-fix-libressl-support.patch
 create mode 100644 package/ffmpeg/0002-fix-libressl-support.patch
 delete mode 100644 package/freerdp/0001-fix-building-shared-libs.patch
 delete mode 100644 package/freerdp/0002-add-support-for-tz-package.patch
 delete mode 100644 package/freerdp/0003-add-missing-define.patch
 delete mode 100644 package/freerdp/0004-ffmpeg30.patch
 create mode 100644 package/heirloom-mailx/0002-fix-libressl-support.patch
 create mode 100644 package/hostapd/0001-fix-libressl-support.patch
 create mode 100644 package/lftp/0003-libressl-support.patch
 create mode 100644 package/libevent/0002-fix-libressl-support.patch
 create mode 100644 package/libssl/Config.in
 create mode 100644 package/libssl/libssl.mk
 create mode 100644 package/mosquitto/0001-fix-libressl-support.patch
 create mode 100644 package/ntp/0004-libressl-support.patch
 create mode 100644 package/openldap/0004-fix-libressl-support.patch
 create mode 100644 package/opusfile/0001-fix-libressl-support.patch
 create mode 100644 package/softether/0010-fix-libressl-support.patch
 create mode 100644 package/wpa_supplicant/0001-fix-libressl-support.patch

-- 
2.13.3
