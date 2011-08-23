From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:04 +0200
Subject: [Buildroot] [PATCH 0/9] Add cyrus-imapd, cyrus-sasl and exim
Message-ID: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series adds the Cyrus IMAP server and the exim SMTP server to
Buildroot.

As I reported a couple of months ago (see
http://lists.busybox.net/pipermail/buildroot/2011-June/043672.html), I found
some problems on my way.

The currently open problems are:
  - cyrus-sasl: apparent CFLAGS mismatch on saslauthd;
  - cyrus-sasl: makemd5 is wrongly cross-compiled;
  - cyrus-imapd: imtest does not cross-compile correctly;
  - cyrus-imapd: static binaries are huge, cannot build them shared;
  - cyrus-imapd: choose binaries to (build and) install;

The root of these problems is in the poor buildsystem of the two packages.
I could work around the blockers and end up with a system that is working for
my needs, but is not perfect.

This is the best I could get out of Cyrus at the moment and I won't improve it
in the near future, so I'd like to know what other Buildroot developers think,
and whether the whole work could be merged even with these issues pending.

Patch overview:
 - The first five patches prepare the required settings in /etc and the
   directories in the skeleton fs.
 - Patches 6 and 7 add the Cyrus packages. Both have some workaround patches,
   which should be pretty understandable.
 - Patch 8 simply bumps pcre.
 - The last patch adds the exim SMTP server, configured to feed incoming
   e-mail to cyrus-imapd via LMTP over a socket file.

Luca

Luca Ceresoli (9):
  fs/skeleton: add mail group
  fs/skeleton: add cyrus user in group mail
  fs/skeleton: fix /etc/services entries for POP2/POP3
  fs/skeleton: add /etc/services entries for cyrus-imapd
  target/generic: create directories for cyrus-imapd
  cyrus-sasl: add new package
  cyrus-imapd: add new package
  pcre: bump to 8.12 and switch to bz2 tarball
  exim: add new package

 fs/skeleton/etc/group                              |    1 +
 fs/skeleton/etc/passwd                             |    1 +
 fs/skeleton/etc/services                           |   17 +++-
 fs/skeleton/etc/shadow                             |    1 +
 package/Config.in                                  |    3 +
 package/cyrus-imapd/Config.in                      |   31 +++++++
 package/cyrus-imapd/S85cyrus                       |   27 ++++++
 .../cyrus-imapd-disable-guid-assert.patch          |   30 +++++++
 .../cyrus-imapd/cyrus-imapd-disable-imtest.patch   |   36 ++++++++
 package/cyrus-imapd/cyrus-imapd.mk                 |   59 +++++++++++++
 package/cyrus-imapd/cyrus.conf                     |   33 +++++++
 package/cyrus-imapd/imapd.conf                     |    6 ++
 package/cyrus-sasl/Config.in                       |   20 +++++
 .../cyrus-sasl-allow-disabling-saslauthd.patch     |   19 ++++
 package/cyrus-sasl/cyrus-sasl-hostcc.patch         |   27 ++++++
 package/cyrus-sasl/cyrus-sasl.mk                   |   39 +++++++++
 package/exim/Config.in                             |    9 ++
 package/exim/Local-Makefile                        |   15 +++
 package/exim/S86exim                               |   26 ++++++
 .../exim/exim-Build-buildconfig-for-the-host.patch |   23 +++++
 ...n-t-make-backup-copies-of-installed-files.patch |   40 +++++++++
 ...ip-version-check-and-symlink-installation.patch |   40 +++++++++
 package/exim/exim-configure                        |   90 ++++++++++++++++++++
 package/exim/exim.mk                               |   49 +++++++++++
 package/pcre/pcre.mk                               |    3 +-
 target/generic/device_table.txt                    |    4 +
 26 files changed, 644 insertions(+), 5 deletions(-)
 create mode 100644 package/cyrus-imapd/Config.in
 create mode 100755 package/cyrus-imapd/S85cyrus
 create mode 100644 package/cyrus-imapd/cyrus-imapd-disable-guid-assert.patch
 create mode 100644 package/cyrus-imapd/cyrus-imapd-disable-imtest.patch
 create mode 100644 package/cyrus-imapd/cyrus-imapd.mk
 create mode 100644 package/cyrus-imapd/cyrus.conf
 create mode 100644 package/cyrus-imapd/imapd.conf
 create mode 100644 package/cyrus-sasl/Config.in
 create mode 100644 package/cyrus-sasl/cyrus-sasl-allow-disabling-saslauthd.patch
 create mode 100644 package/cyrus-sasl/cyrus-sasl-hostcc.patch
 create mode 100644 package/cyrus-sasl/cyrus-sasl.mk
 create mode 100644 package/exim/Config.in
 create mode 100644 package/exim/Local-Makefile
 create mode 100644 package/exim/S86exim
 create mode 100644 package/exim/exim-Build-buildconfig-for-the-host.patch
 create mode 100644 package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch
 create mode 100644 package/exim/exim-Skip-version-check-and-symlink-installation.patch
 create mode 100644 package/exim/exim-configure
 create mode 100644 package/exim/exim.mk

-- 
1.7.4.1
