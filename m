From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Fri, 11 Oct 2019 14:40:38 +0200
Subject: [Buildroot] [PATCH v3 0/9] Add netopeer2 package (and dependencies)
Message-ID: <20191011124131.28246-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

This patchset contains the netopeer2 package and the required
dependencies. Netopeer2 is a set of tools implementing network
configuration tools based on the NETCONF Protocol.

This includes the packages for libavl, libyang, libnetconf2, sysrepo,
netopeer2-server, netopeer2-cli, netopeer2-keystored.

Also add the host target support for libev and libssh. This is needed
for the install steps of sysrepo and netopeer2-server and
netopeer2-keystored.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>

---
Changes v1 -> v2:
  - replace libredblack with libavl because this is also supported by
    debian.
  - changes all over the place to integrate review comments.

Changes v2 -> v3:
  - download the netopeer2 sources only once for the packages
    netopeer2-cli, netopeer2-keystored and netopeer2-server.
    Use the same value in <pkg>_DL_SUBDIR and <pkg>_SOURCE for
	all 3 packages.
  - add sysv init scripts for netopeer-server, sysrepod and
    syrepo-plugind.
  - changes all over the place to integrate review comments.

Heiko Thiery (8):
  package/libev: use host-autotools-package macro
  package/libssh: use host-autotools-package macro
  package/libyang: add package
  package/libnetconf2: add package
  package/sysrepo: add package
  package/netopeer2-keystored: add package
  package/netopeer2-server: add package
  package/netopeer2-cli: add package

Michael Walle (1):
  package/libavl: add package

 DEVELOPERS                                    | 11 +++
 package/Config.in                             |  7 ++
 package/libavl/0001-fix-makefile.patch        | 49 ++++++++++
 package/libavl/Config.in                      | 13 +++
 package/libavl/libavl.hash                    |  5 ++
 package/libavl/libavl.mk                      | 43 +++++++++
 package/libev/libev.mk                        |  1 +
 .../0001-Add-support-for-musl-libc.patch      | 65 ++++++++++++++
 package/libnetconf2/Config.in                 | 15 ++++
 package/libnetconf2/libnetconf2.hash          |  2 +
 package/libnetconf2/libnetconf2.mk            | 40 +++++++++
 package/libssh/libssh.mk                      |  1 +
 package/libyang/Config.in                     | 13 +++
 package/libyang/libyang.hash                  |  2 +
 package/libyang/libyang.mk                    | 25 ++++++
 package/netopeer2-cli/Config.in               | 21 +++++
 package/netopeer2-cli/netopeer2-cli.hash      |  1 +
 package/netopeer2-cli/netopeer2-cli.mk        | 17 ++++
 package/netopeer2-keystored/Config.in         | 17 ++++
 .../netopeer2-keystored.hash                  |  2 +
 .../netopeer2-keystored.mk                    | 32 +++++++
 package/netopeer2-server/Config.in            | 54 +++++++++++
 package/netopeer2-server/S52netopeer2-server  | 90 +++++++++++++++++++
 .../netopeer2-server/netopeer2-server.hash    |  1 +
 package/netopeer2-server/netopeer2-server.mk  | 33 +++++++
 ...espect-CMAKE_INSTALL_PREFIX-and-DEST.patch | 33 +++++++
 ...t-make-systemd-unit-dir-configurable.patch | 40 +++++++++
 package/sysrepo/Config.in                     | 26 ++++++
 package/sysrepo/S50sysrepod                   | 44 +++++++++
 package/sysrepo/S51sysrepo-plugind            | 49 ++++++++++
 package/sysrepo/sysrepo.hash                  |  2 +
 package/sysrepo/sysrepo.mk                    | 51 +++++++++++
 32 files changed, 805 insertions(+)
 create mode 100644 package/libavl/0001-fix-makefile.patch
 create mode 100644 package/libavl/Config.in
 create mode 100644 package/libavl/libavl.hash
 create mode 100644 package/libavl/libavl.mk
 create mode 100644 package/libnetconf2/0001-Add-support-for-musl-libc.patch
 create mode 100644 package/libnetconf2/Config.in
 create mode 100644 package/libnetconf2/libnetconf2.hash
 create mode 100644 package/libnetconf2/libnetconf2.mk
 create mode 100644 package/libyang/Config.in
 create mode 100644 package/libyang/libyang.hash
 create mode 100644 package/libyang/libyang.mk
 create mode 100644 package/netopeer2-cli/Config.in
 create mode 120000 package/netopeer2-cli/netopeer2-cli.hash
 create mode 100644 package/netopeer2-cli/netopeer2-cli.mk
 create mode 100644 package/netopeer2-keystored/Config.in
 create mode 100644 package/netopeer2-keystored/netopeer2-keystored.hash
 create mode 100644 package/netopeer2-keystored/netopeer2-keystored.mk
 create mode 100644 package/netopeer2-server/Config.in
 create mode 100644 package/netopeer2-server/S52netopeer2-server
 create mode 120000 package/netopeer2-server/netopeer2-server.hash
 create mode 100644 package/netopeer2-server/netopeer2-server.mk
 create mode 100644 package/sysrepo/0001-CMakeLists.txt-respect-CMAKE_INSTALL_PREFIX-and-DEST.patch
 create mode 100644 package/sysrepo/0002-CMakeLists.txt-make-systemd-unit-dir-configurable.patch
 create mode 100644 package/sysrepo/Config.in
 create mode 100644 package/sysrepo/S50sysrepod
 create mode 100644 package/sysrepo/S51sysrepo-plugind
 create mode 100644 package/sysrepo/sysrepo.hash
 create mode 100644 package/sysrepo/sysrepo.mk

-- 
2.20.1
