From: Christian Stewart <christian@paral.in>
Date: Wed, 20 Sep 2017 04:02:01 +0100
Subject: [Buildroot] [PATCH 0/9] Upgrading Go to 1.9 and Docker to v2017.07
Message-ID: <20170920030210.19446-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series upgrades Go to 1.9, and Docker to v2017.07.

Unfortunately the Go upgrade is a dependency of the new Docker version, as is
the various other patches for Docker included in this series.

I had previously submitted these changes as separate series, but as they were
never merged, I must include them in this series. They are dependencies of
Docker v2017.07 (having an init process, for example).

This series (including the container tiny init processes) has been tested
extensively against Buildroot 2017.02.3 and 2017.05 on the following platforms:

 - Raspberry Pi 3
 - Odroid XU4, HC1, U2, C2
 - Buildroot-in-docker (x86)

A build test has been completed against master, and we will be completing
runtime tests tomorrow.

Note that this series incorporates the change in repository and project
structure of the Docker project as it transitions from Docker Engine to
the "Moby" project. This means that:

 - Docker engine is split into the daemon and CLI
 - These two components are once again merged in docker/docker-ce
 - Docker-engine in Buildroot now targets docker/docker-ce, cli and daemon
 - Ce in this context stands for "community edition" or the open source Docker
 - The Moby repository and the docker/docker repo are no longer touched by BR.

Cheers!
Christian Stewart

--

Christian Stewart (9):
  dumb-init: new package
  tini: new package
  docker-engine: add support for init processes
  docker-engine: select static for tini and dumb-init
  docker-proxy: new package
  docker-engine: add dependency on docker-proxy
  runc: bump to v1.0.0-rc4
  docker-containerd: bump to 3addd84
  docker-engine: bump to v17.07.0-ce

 package/Config.in                                |  3 ++
 package/docker-containerd/docker-containerd.hash |  3 +-
 package/docker-containerd/docker-containerd.mk   | 13 +++---
 package/docker-engine/Config.in                  | 29 ++++++++++++++
 package/docker-engine/docker-engine.hash         |  3 +-
 package/docker-engine/docker-engine.mk           | 50 +++++++++++++++++-------
 package/docker-proxy/Config.in                   | 18 +++++++++
 package/docker-proxy/docker-proxy.hash           |  2 +
 package/docker-proxy/docker-proxy.mk             | 46 ++++++++++++++++++++++
 package/dumb-init/Config.in                      | 16 ++++++++
 package/dumb-init/dumb-init.hash                 |  2 +
 package/dumb-init/dumb-init.mk                   | 27 +++++++++++++
 package/runc/runc.hash                           |  2 +-
 package/runc/runc.mk                             |  5 ++-
 package/tini/Config.in                           | 21 ++++++++++
 package/tini/tini.hash                           |  2 +
 package/tini/tini.mk                             | 41 +++++++++++++++++++
 17 files changed, 257 insertions(+), 26 deletions(-)
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
2.13.5
