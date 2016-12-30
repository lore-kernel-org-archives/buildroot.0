From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:50 +0100
Subject: [Buildroot] [PATCH 00/52] Add a rather complete asterisk stack
Message-ID: <cover.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This (long!) series introduces Asterisk, the number one free and open
source PBX and VoIP solution.

To be honest, it has not been an easy one... :-/ The most striking
issue I've encountered is that the FLOSS telephony ecosystem seems to
like to have weird buildsystems, to depend on obsolete, legacy and no
longer maintained pieces of code... And not all of this is in the
series; some stuff was grossly too ugly to even consider including it
in Buildroot (I'm looking at you all: ptlib, h323+ and imap).

Besides, I got bored at some point, so not all features of asterisk are
available; a lot are still forcibly disabled, even though we may have
the necessary package in Buildroot already. This is work for a
further-interested party...

So, here what the series does:

  - do some slightly unrelated cleanups in pjsip,

  - introduce a minimalist asterisk, with the bare minimal to make it
    build and be almost barely useable,

  - then incrementally add new features to asterisk, adding new
    packages when required.

Some of those packages are special in their own rights. See individual
commit logs for the nitty-gritty details. ;-)


Regards,
Yann E. MORIN.


The following changes since commit 67f23a77c2260809b94f169fde33ff718ae940c5

  Update for 2016.11.1 (2016-12-29 22:24:06 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 2c4935f525c5e093034b853387b907466af6d0d0

  package/asterisk: add optional jack2 dependency (2016-12-30 11:21:56 +0100)


----------------------------------------------------------------
Bernd Kuhls (1):
      package/libgsm: new package

Yann E. MORIN (51):
      package/libpjsip: disable remaining unspecified options
      package/libpjsip: drop path to staging to find libsrtp
      package/asterisk: new package
      package/asterisk: enable backtrace when available
      package/asterisk: add optional libgsm dependency
      package/asterisk: add optional zlib dependency
      package/asterisk: add optional support for SSL
      package/asterisk: add optional alsa-lib dependency
      package/asterisk: add optional curl dependency
      package/asterisk: add optional neon dependency
      package/asterisk: add optional libogg dependency
      package/asterisk: add optional bluez_utils dependency
      package/asterisk: add optional opus dependency
      package/asterisk: add optional speex dependency
      package/asterisk: add optional libvorbis dependency
      package/asterisk: add optional libilbc dependency
      package/asterisk: add optional portaudio dependency
      package/asterisk: add optional libical dependency
      package/asterisk: add optional openldap dependency
      package/asterisk: add optional freeradius-client dependency
      package/asterisk: add optional libsrtp dependency
      package/dahdi-linux: new package
      package/dahdi-tools: new package
      package/dahdi-tools: add USB support
      package/asterisk: add support for dahdi
      package/libss7: new package
      package/asterisk: add support for SS7
      package/libpri: new package
      package/asterisk: add support for PRI signalling
      package/spandsp: new package
      package/asterisk: add optional spandsp support
      package/libqb: new package
      package/corosync: new package
      package/corosync: add optional dbus support
      package/corosync: add optional snmp support
      package/asterisk: add optional corosync dependency
      package/libpjsip: add option to enable GSM codec
      package/asterisk: add optional netsnmp dependency
      package/libpjsip: add option to enable SPEEX codec
      package/libpjsip: add option to enable G.711 codec
      package/libpjsip: add option to enable G.722 codec
      package/libpjsip: add option to enable G.7221 codec
      package/libpjsip: add option to enable iLBC codec
      package/libpjsip: add option to enable L16 codec
      package/libpjsip: add optional portaudio support
      package/asterisk: add optional pjsip support
      package/asterisk: add optional libcap dependency
      package/asterisk: add optional iconv support
      package/asterisk: enable inotify when possible
      package/asterisk: add optional unixodbc dependency
      package/asterisk: add optional jack2 dependency

 package/Config.in                                  |   9 +
 ...-configure-do-not-configure-in-menuselect.patch |  92 ++++++
 ...02-sounds-do-not-download-and-check-sha1s.patch |  52 +++
 .../0003-configure-fix-detection-of-libcrypt.patch |  62 ++++
 package/asterisk/Config.in                         |  28 ++
 package/asterisk/asterisk.hash                     |   9 +
 package/asterisk/asterisk.mk                       | 363 +++++++++++++++++++++
 package/corosync/Config.in                         |  20 ++
 package/corosync/corosync.hash                     |   2 +
 package/corosync/corosync.mk                       |  60 ++++
 package/dahdi-linux/Config.in                      |  15 +
 package/dahdi-linux/dahdi-linux.hash               |  23 ++
 package/dahdi-linux/dahdi-linux.mk                 |  88 +++++
 package/dahdi-tools/0001-no-build-docs.patch       |  16 +
 package/dahdi-tools/0002-no-perl-manpages.patch    |  37 +++
 package/dahdi-tools/Config.in                      |  23 ++
 package/dahdi-tools/dahdi-tools.hash               |   4 +
 package/dahdi-tools/dahdi-tools.mk                 |  57 ++++
 package/libgsm/0001-misc.patch                     | 205 ++++++++++++
 package/libgsm/Config.in                           |  10 +
 package/libgsm/libgsm.hash                         |   2 +
 package/libgsm/libgsm.mk                           |  47 +++
 package/libpjsip/Config.in                         |  31 ++
 package/libpjsip/libpjsip.mk                       |  68 +++-
 package/libpri/Config.in                           |  21 ++
 package/libpri/libpri.hash                         |   3 +
 package/libpri/libpri.mk                           |  52 +++
 ...fix-CLOCK_MONOTONIC-check-for-cross-compi.patch |  33 ++
 package/libqb/Config.in                            |  12 +
 package/libqb/libqb.hash                           |   2 +
 package/libqb/libqb.mk                             |  32 ++
 package/libss7/Config.in                           |  18 +
 package/libss7/libss7.hash                         |   3 +
 package/libss7/libss7.mk                           |  55 ++++
 package/spandsp/Config.in                          |   9 +
 package/spandsp/spandsp.hash                       |   2 +
 package/spandsp/spandsp.mk                         |  27 ++
 37 files changed, 1586 insertions(+), 6 deletions(-)
 create mode 100644 package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
 create mode 100644 package/asterisk/0002-sounds-do-not-download-and-check-sha1s.patch
 create mode 100644 package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
 create mode 100644 package/asterisk/Config.in
 create mode 100644 package/asterisk/asterisk.hash
 create mode 100644 package/asterisk/asterisk.mk
 create mode 100644 package/corosync/Config.in
 create mode 100644 package/corosync/corosync.hash
 create mode 100644 package/corosync/corosync.mk
 create mode 100644 package/dahdi-linux/Config.in
 create mode 100644 package/dahdi-linux/dahdi-linux.hash
 create mode 100644 package/dahdi-linux/dahdi-linux.mk
 create mode 100644 package/dahdi-tools/0001-no-build-docs.patch
 create mode 100644 package/dahdi-tools/0002-no-perl-manpages.patch
 create mode 100644 package/dahdi-tools/Config.in
 create mode 100644 package/dahdi-tools/dahdi-tools.hash
 create mode 100644 package/dahdi-tools/dahdi-tools.mk
 create mode 100644 package/libgsm/0001-misc.patch
 create mode 100644 package/libgsm/Config.in
 create mode 100644 package/libgsm/libgsm.hash
 create mode 100644 package/libgsm/libgsm.mk
 create mode 100644 package/libpri/Config.in
 create mode 100644 package/libpri/libpri.hash
 create mode 100644 package/libpri/libpri.mk
 create mode 100644 package/libqb/0001-bconfigure-fix-CLOCK_MONOTONIC-check-for-cross-compi.patch
 create mode 100644 package/libqb/Config.in
 create mode 100644 package/libqb/libqb.hash
 create mode 100644 package/libqb/libqb.mk
 create mode 100644 package/libss7/Config.in
 create mode 100644 package/libss7/libss7.hash
 create mode 100644 package/libss7/libss7.mk
 create mode 100644 package/spandsp/Config.in
 create mode 100644 package/spandsp/spandsp.hash
 create mode 100644 package/spandsp/spandsp.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
