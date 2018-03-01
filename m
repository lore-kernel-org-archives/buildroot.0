From: Christian Stewart <christian@paral.in>
Date: Thu,  1 Mar 2018 02:20:03 -0500
Subject: [Buildroot] [PATCH v2 0/9] upgrade docker-engine and associated
 components
Message-ID: <20180301072012.25884-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series upgrades Docker and associated components:

 - runc to 9f9c96235cc97674e935002fc3d78361b696a69e
 - docker-containerd to v1.0.2
 - docker-engine to v2018.03.0-ce-rc1

Fixes:

 - Btrfs is disabled in containerd if not included in the target system and selected.

Suggested naming changes:

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

An old version of this series adding docker-init exists.

 - https://patchwork.ozlabs.org/patch/827886/

Changes v1 -> v2:

 - Make static default for tini and dumb-init
 - Bump package versions (as described above)
 - Added fix to not link against libsystemd without systemd
 - Removed unnecessary stack protector flags from tini
 - Fixed confusing commit messages
 - Upgraded to 18.03.0-rc1, skipping 18.02, to address critical bugs in 2018.02.
 - Tested on Raspberry Pi 3, Odroid XU4, Odroid HC2, and Raspberry Pi 0.

Best,
Christian Stewart

---

Christian Stewart (9):
  tini: new package
  dumb-init: new package
  docker-engine: add support for init processes
  docker-engine: select static for tini and dumb-init
  docker-proxy: new package
  docker-engine: add dependency on docker-proxy
  runc: bump to 9f9c96235cc
  docker-containerd: bump to v1.0.2
  docker-engine: bump to v18.03.0-ce-rc1

 package/Config.in                                |  3 ++
 package/docker-containerd/Config.in              | 12 +++++
 package/docker-containerd/docker-containerd.hash |  2 +-
 package/docker-containerd/docker-containerd.mk   | 38 +++++++++++----
 package/docker-engine/Config.in                  | 29 ++++++++++++
 package/docker-engine/docker-engine.hash         |  2 +-
 package/docker-engine/docker-engine.mk           | 59 ++++++++++++++++--------
 package/docker-proxy/Config.in                   | 18 ++++++++
 package/docker-proxy/docker-proxy.hash           |  2 +
 package/docker-proxy/docker-proxy.mk             | 46 ++++++++++++++++++
 package/dumb-init/Config.in                      |  7 +++
 package/dumb-init/dumb-init.hash                 |  2 +
 package/dumb-init/dumb-init.mk                   | 24 ++++++++++
 package/runc/runc.hash                           |  2 +-
 package/runc/runc.mk                             | 17 ++++---
 package/tini/Config.in                           | 16 +++++++
 package/tini/tini.hash                           |  2 +
 package/tini/tini.mk                             | 35 ++++++++++++++
 18 files changed, 278 insertions(+), 38 deletions(-)
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
