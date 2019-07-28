From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 28 Jul 2019 08:10:20 +0200
Subject: [Buildroot] [PATCH v4 0/3] package/mpd: bump to version 0.21.11
Message-ID: <20190728061023.5283-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MPD switched from Autotools to the Meson build system. This is not
really a big deal except that the Qobuz plugin depends on libgcrypt.

The issue is, that libgcrypt version 1.8.4 only provides its own config
file `libgcrypt-config` instead of a pkg-config file. Every custom config
file needs to be added to the `[binary]` section in the cross-compilation.conf
file, so that Meson correctly detects the path for the custom config file
instead of using the one find in `PATH`, which directs to the host.

v1 of bumping mpd to the 0.21 version added `libgcrypt-config` to the
cross-compilation.conf.in file which has the drawback, that this
variable is creeping into the global cross-compilation file.

v2 added the staging path early to PATH, which is not a wise idea, because
$(STAGING_DIR)/usr/bin contains binaries compiled for the target.

There was an ongoing discussion, how to add support to the meson
infrastructure to allow adding entries to the `[binaries]` section on
the per-package cross-compilation file. It turned out, that the current
meson infrastructure needs some changes to support adding multi-line
entries.

v3 does not try to fix the meson build infrastructure, but adds an
upstream patch to libgcrypt to provide a pkg-config file. pkg-config
files are preferred over custom config files and meson will correctly
detect libgcrypt without changing the meson infrastructure. This makes
bumping mpd to the 0.21.x version branch much easier.

v4 bumps mpd to version 0.21.11 (instead of 0.21.7) and do not uses
squased patches.

J?rg Krause (3):
  package/libgcrypt: replace reconfigure patch with upstream patch
  package/libgcrypt: add upstream patch to add pkg-config file
  package/mpd: bump to version 0.21.11

 ...ult-to-underscore-yes-for-cross-buil.patch |  48 +++++
 package/libgcrypt/0001-reconfigure.patch      |  27 ---
 ...-libgcrypt.pc-generated-by-configure.patch |  93 +++++++++
 .../0003-build-Fix-libgcrypt.pc.patch         |  31 +++
 package/libgcrypt/libgcrypt.mk                |   5 +-
 ...gure.ac-check-if-libatomic-is-needed.patch |  40 ----
 package/mpd/Config.in                         |  29 ++-
 package/mpd/mpd.hash                          |   2 +-
 package/mpd/mpd.mk                            | 176 +++++++++---------
 9 files changed, 292 insertions(+), 159 deletions(-)
 create mode 100644 package/libgcrypt/0001-build-Don-t-default-to-underscore-yes-for-cross-buil.patch
 delete mode 100644 package/libgcrypt/0001-reconfigure.patch
 create mode 100644 package/libgcrypt/0002-build-Provide-libgcrypt.pc-generated-by-configure.patch
 create mode 100644 package/libgcrypt/0003-build-Fix-libgcrypt.pc.patch
 delete mode 100644 package/mpd/0001-configure.ac-check-if-libatomic-is-needed.patch

-- 
2.22.0
