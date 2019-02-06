From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  6 Feb 2019 14:23:56 +0100
Subject: [Buildroot] [PATCH v3 0/3] Adding mender-artifact
Message-ID: <1549459439-2260-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch tries to resurrect an effort of Mizra from August to porting
the mender-artifact tool to buildroot
(https://patchwork.ozlabs.org/cover/962487/).

Mender artifact is a tool to generate artifacts for the mender software,
it is therefore an host tool and it's the last piece to add to have
mender
available on buildroot.
To have it compiled as an host tool, we need to enable support for host
packages in go.
So the intent of this patch is:
* Enabling host golang packages
* Refactoring dependencies to distinguish between host packages and
  target packages
* Adding mender-artifact

The initial patch for mender-artifact was from Mizra but I completely
rewrote it, so I removed the signoff.

Changelog:
[v2 -> v3]
Suggestions from Thomas Petazzoni
  - renaming BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS to
    BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS

 - adding a BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS

 - Comment above both options in the Config.in.host
   file to explain which option should be used for what.

 - BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS should be removed.


Angelo Compagnucci (2):
  package/go: refactor host/target dependencies
  package/mender-artifact: new package

Mirza Krak (1):
  package/pkg-golang: add support for building host packages

 DEVELOPERS                                   |  1 +
 docs/manual/adding-packages-golang.txt       | 15 +++++++----
 package/Config.in.host                       |  1 +
 package/docker-cli/Config.in                 |  8 +++---
 package/docker-containerd/Config.in          |  8 +++---
 package/docker-engine/Config.in              |  8 +++---
 package/docker-proxy/Config.in               |  8 +++---
 package/flannel/Config.in                    |  8 +++---
 package/go/Config.in.host                    | 13 +++++++---
 package/mender-artifact/Config.in.host       | 18 ++++++++++++++
 package/mender-artifact/mender-artifact.hash | 28 +++++++++++++++++++++
 package/mender-artifact/mender-artifact.mk   | 32 ++++++++++++++++++++++++
 package/mender/Config.in                     |  8 +++---
 package/pkg-golang.mk                        | 37 +++++++++++++++++++++++++---
 package/runc/Config.in                       |  8 +++---
 15 files changed, 162 insertions(+), 39 deletions(-)
 create mode 100644 package/mender-artifact/Config.in.host
 create mode 100644 package/mender-artifact/mender-artifact.hash
 create mode 100644 package/mender-artifact/mender-artifact.mk

-- 
2.7.4
