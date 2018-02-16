From: Christian Stewart <christian@paral.in>
Date: Fri, 16 Feb 2018 03:26:07 -0500
Subject: [Buildroot] [PATCH 00/10] Upgrade Docker to 2018.02, fixing deps
Message-ID: <20180216082617.12039-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

# Package Upgrades

This series upgrades Docker and associated components:

 - runc to 9f9c96235cc97674e935002fc3d78361b696a69e
 - docker-containerd to v1.0.1 (recommend rename to containerd)
 - docker-ce (recommend rename from docker-engine) to v2018.02.0-ce

Additionally, seccomp is now correctly supported in containerd.

Btrfs is disabled in containerd if not included in the target system and selected.

# Package Rename RFC

 - docker-containerd -> containerd

This project has been split off from Docker, and is now hosted at:

  https://github.com/containerd/containerd

It is not specifically a docker project.

 - docker-engine -> docker-ce

Docker "Community Edition" is the name for the daemon and CLI bundled
together by the "moby" bundler/project duo.

It's still named the "Engine" but with the CLI as well, it makes more
sense to name it "Docker Community Edition" which also avoids a
collision with the "docker" package.

# Remarks: previous revision

An old version of this series adding docker-init exists.

 - https://patchwork.ozlabs.org/patch/827886/

Changes:

 - Make static default for tini and dumb-init
 - Bump package versions (as described above)
 - Added fix to not link against libsystemd without systemd
 - Removed unnecessary stack protector flags from tini
 - Fixed confusing commit messages

Best,
Christian Stewart

--

Christian Stewart (10):
  dumb-init: new package
  tini: new package
  docker-engine: add support for init processes
  docker-engine: select static for tini and dumb-init
  docker-proxy: new package
  docker-engine: add dependency on docker-proxy
  runc: bump to 9f9c96235cc
  docker-containerd: bump to v1.0.1
  docker-engine: bump to v2018.02-ce
  docker-engine: don't link against libsystemd without systemd

 package/Config.in                                  |  3 ++
 package/docker-containerd/Config.in                | 12 +++++
 package/docker-containerd/docker-containerd.hash   |  2 +-
 package/docker-containerd/docker-containerd.mk     | 38 +++++++++----
 ...king-against-libsystemd-with-absence-of-s.patch | 54 +++++++++++++++++++
 package/docker-engine/Config.in                    | 28 ++++++++++
 package/docker-engine/docker-engine.hash           |  2 +-
 package/docker-engine/docker-engine.mk             | 63 ++++++++++++++--------
 package/docker-proxy/Config.in                     | 18 +++++++
 package/docker-proxy/docker-proxy.hash             |  3 ++
 package/docker-proxy/docker-proxy.mk               | 46 ++++++++++++++++
 package/dumb-init/Config.in                        |  7 +++
 package/dumb-init/dumb-init.hash                   |  2 +
 package/dumb-init/dumb-init.mk                     | 24 +++++++++
 package/runc/runc.hash                             |  2 +-
 package/runc/runc.mk                               | 17 +++---
 package/tini/Config.in                             | 16 ++++++
 package/tini/tini.hash                             |  2 +
 package/tini/tini.mk                               | 35 ++++++++++++
 19 files changed, 333 insertions(+), 41 deletions(-)
 create mode 100644 package/docker-engine/0001-disable-linking-against-libsystemd-with-absence-of-s.patch
 create mode 100644 package/docker-proxy/Config.in
 create mode 100644 package/docker-proxy/docker-proxy.hash
 create mode 100644 package/docker-proxy/docker-proxy.mk
 create mode 100644 package/dumb-init/Config.in
 create mode 100644 package/dumb-init/dumb-init.hash
 create mode 100644 package/dumb-init/dumb-init.mk
 create mode 100644 package/tini/Config.in
 create mode 100644 package/tini/tini.hash
 create mode 100644 package/tini/tini.mk

-- 
2.13.6
