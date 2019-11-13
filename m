From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2019 16:17:13 +0100
Subject: [Buildroot] [PATCH 00/11] Fix license incompatibility with readline
Message-ID: <20191113151724.12155-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We have a number of packages where we (optionally) link with readline,
even though the license of the package isn't compatible with the
license of readline (GPL-3.0+), E.G. for packages licensed under
GPL-2.0 only.

This series aims to fix that. I've tried to review the entire tree,
and this is what I found:

atftp: ok (GPL-2.0+)
augeas: ok (LGPL-2.1+)
bash: ok (GPL-3.0+)
bind: ok (MPL-2.0)
bird: ok (GPL-2.0+)
bluez-alsa: ok (MIT)
bluez-tools: ok (GPL-2.0+)
bluez5_utils: ok (GPL-2.0+)
bluez_utils: ok (GPL-2.0+)
chrony: fixed (GPL-2.0)
connman: fixed (GPL-2.0/GPL-2.0+)
dropwatch: unclear, reported https://github.com/nhorman/dropwatch/issues/14
gawk: ok (GPL-3.0+)
gdbm: ok (GPL-3.0+)
gnuchess: ok (GPL-3.0+)
ipmitool: ok (BSD-3-Clause)
ipsec-tools: ok (BSD-3-Clause)
iwd: ok (GPL-3.0+)
jack1: ok (GPL-2.0+)
jack2: ok (GPL-2.0+)
kodi: fixed (GPL-2.0)
lftp: ok (GPL-3.0+)
libkrb5: ok (MIT)
libnfc: ok (LGPL-3.0+)
lldpd: ok (ISC)
lua:: ok (MIT)
lvm2: fixed (GPL-2.0)
miraclecast: ok (LGPL-2.1+)
mariadb: fixed (GPL-2.0)
neardal: fixed (GPL-2.0)
network-manager: ok (GPL-2.0+)
nftables: NOK? (GPL-2.0)
open-lldp: NOK (drop?)
openipmi: ok (GPL-2.0+)
oracle-mysql: fixed (GPL-2.0)
parted: ok (GPL-3.0+)
php: ok (PHP)
postgresql: ok (PostgreSQL)
python: ok (Python-2.0)
python3: ok (Python-2.0)
qt5base: ok (GPL-2.0+/GPL-3.0)
quagga: ok (GPL-2.0+)
ruby: ok (Ruby)
samba4: ok (GPL-3.0+)
slang: ok (GPL-2.0+)
socat: fixed (GPL-2.0)
softether: ok (Apache-2.0)
sqlcipher: ok (BSD-3-Clause)
sqlite: ok (Public domain)
udftools: ok (GPL-2.0+)
unixodbc: ok (GPL-2.0+)
util-linux: ok (GPL-2.0+)
wpa_supplicant: ok (BSD-3-Clause)
xorriso: ok (GPL-3.0+)
ytree: NOK? (GPL-2.0), mail sent to upstream, no response

Linking with the older bundled copies of readline in mariadb &
oracle-mysql, isn't very nice - But there is not much we can do
besides packaging the old GPL-2.0+ version of readline, and that then
leads to issues withe file conflicts when both readline versions are
enabled.

I haven't been able to find a license exception for nftables (it does
have one for openssl though), but I do see that E.G. Debian also links
it against a modern readline:

https://packages.debian.org/buster/nftables

Similar for open-lldp. The upstream website seems to be down, so
perhaps the package should simply be dropped?

I have mailed ytree upstream to clarify licensing, but so far without
any reply.

Peter Korsgaard (11):
  package/chrony: use libedit for command line editing
  package/connman: clarify license of client code
  package/dropwatch: license is GPL-2.0+
  package/ipsec-tools: add license information
  package/kodi: drop readline dependency
  package/kodi: add hash for license file
  package/lvm2: drop optional readline dependency
  package/mariadb: use bundled GPL-2.0+ libreadline
  package/neardal: unconditionally use libedit
  package/oracle-mysql: use bundled GPL-2.0+ libreadline
  package/socat: drop optional readline dependency

 package/chrony/chrony.mk             |  7 ++++---
 package/connman/connman.mk           |  1 +
 package/dropwatch/dropwatch.mk       |  2 +-
 package/ipsec-tools/ipsec-tools.hash |  3 +++
 package/ipsec-tools/ipsec-tools.mk   |  2 ++
 package/kodi/Config.in               |  2 --
 package/kodi/kodi.hash               |  2 ++
 package/kodi/kodi.mk                 |  1 -
 package/lvm2/lvm2.mk                 |  7 +------
 package/mariadb/mariadb.mk           |  6 ++++--
 package/mysql/Config.in              |  2 --
 package/neardal/Config.in            |  2 +-
 package/neardal/neardal.mk           | 10 +---------
 package/oracle-mysql/oracle-mysql.mk |  4 ++--
 package/socat/socat.mk               |  8 ++------
 15 files changed, 24 insertions(+), 35 deletions(-)

-- 
2.20.1
