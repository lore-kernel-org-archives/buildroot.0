From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:00 -0400
Subject: [Buildroot] [PATCH 00/13] Turn OpenSSL into a virtual package
Message-ID: <20171018023213.22644-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LibreSSL support is currently in a pretty bad state of affairs for BuildRoot.
A few months ago I tried to release a patch series that would create the
virtual package "libssl", however due to work constraints, job related stress,
and a lack of time, I was unable to continue supporting the patch series.

I looked over Arnouts comments a few days ago and decided to take another crack
at this patch series. Along with taking some of his advice. ;)

This patch series attempts to address some previous issues brought up by Arnout
by doing the following:

1) Move openssl to libopenssl (Name suggestions would be welcome!)
2) Create a new virutal package named openssl
3) Force softether to depend on libopenssl (see below)
4) Add libressl support patches to the few packages that require it.
5) Fix the two make files that would otherwise fail if libressl was
   selected.
6) Add LibreSSL in as a openssl provider to the openssl package.

Moving openssl to libopenssl provides the following benifits:
- BR2_PACKAGE_OPENSSL is still a visible symbol with no dependencies.
- It does not require a huge patch to convert every instance of
  OpenSSL -> libssl)
- Users will be able to update without ever having to select anything new.
- LibreSSL can be added at a later date to the virtual package.


Why force softether to depend on libopenssl? For several reasons:

softether tries to use SSLv3 functionality as a fallback. LibreSSL doesn't
support SSLv3 anymore. Two main issues prevent a patch:

- Trying to wrap the sslv3 functionality from the source with a guard clause
results in linking errors after compiling is done.
- There are multiple security vulnerabilities with using sslv3.
- There are multiple security issues in github pertaining to using sslv3.
- This project seems to not be updated very often, and the security issues
  are being ignored it seems.

As such, I would just rather not have to figure out how to make the program
work with libressl, and to be honest, OpenVPN is a much better choice anyways.

Comments are welcome and appreciated!

Adam

Adam Duskett (13):
  openssl: new virtual package
  softether: depend on libopenssl
  hostapd: add libressl-support.patch
  ffmpeg: add libressl suport patch
  mosquitto: add libressl support patch
  opusfile: add libressl support patch
  openldap: add libressl support patch
  heirloom-mailx: add libressl support patch
  libevent: add libressl support patch
  wpa_supplicant: add libressl support patch
  ca-certificates: fix installation against libressl
  mosquitto: fix building against libressl
  openssl: add libressl to virtual package

 package/Config.in                                  |   2 -
 package/ca-certificates/ca-certificates.mk         |  14 +-
 package/ffmpeg/0002-fix-libressl-support.patch     |  74 +++++++++
 .../heirloom-mailx/0002-fix-libressl-support.patch |  54 +++++++
 package/hostapd/0001-fix-libressl-support.patch    |  38 +++++
 package/libevent/0002-fix-libressl-support.patch   |  31 ++++
 ...time-building-manpages-if-we-re-not-going.patch |   0
 ...todev-Fix-issue-with-signature-generation.patch |   0
 .../openssl.hash => libopenssl/libopenssl.hash}    |   0
 package/libopenssl/libopenssl.mk                   | 171 +++++++++++++++++++++
 package/libressl/Config.in                         |  20 ---
 package/mosquitto/0001-fix-libressl-support.patch  |  68 ++++++++
 package/mosquitto/mosquitto.mk                     |   5 +
 package/openldap/0004-fix-libressl-support.patch   | 104 +++++++++++++
 package/openssl/Config.in                          |  65 ++++++--
 package/openssl/openssl.mk                         | 165 +-------------------
 package/opusfile/0001-fix-libressl-support.patch   | 119 ++++++++++++++
 package/softether/Config.in                        |   4 +-
 package/softether/softether.hash                   |   3 +-
 package/softether/softether.mk                     |   6 +-
 .../wpa_supplicant/0001-fix-libressl-support.patch |  70 +++++++++
 21 files changed, 812 insertions(+), 201 deletions(-)
 create mode 100644 package/ffmpeg/0002-fix-libressl-support.patch
 create mode 100644 package/heirloom-mailx/0002-fix-libressl-support.patch
 create mode 100644 package/hostapd/0001-fix-libressl-support.patch
 create mode 100644 package/libevent/0002-fix-libressl-support.patch
 rename package/{openssl => libopenssl}/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch (100%)
 rename package/{openssl => libopenssl}/0002-cryptodev-Fix-issue-with-signature-generation.patch (100%)
 rename package/{openssl/openssl.hash => libopenssl/libopenssl.hash} (100%)
 create mode 100644 package/libopenssl/libopenssl.mk
 delete mode 100644 package/libressl/Config.in
 create mode 100644 package/mosquitto/0001-fix-libressl-support.patch
 create mode 100644 package/openldap/0004-fix-libressl-support.patch
 create mode 100644 package/opusfile/0001-fix-libressl-support.patch
 create mode 100644 package/wpa_supplicant/0001-fix-libressl-support.patch

-- 
2.13.6
