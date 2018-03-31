From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 15:27:28 +0200
Subject: [Buildroot] [PATCH v4 0/8] Introduce a golang-package infrastructure
Message-ID: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This v4 is a new iteration of the work done by Angelo Compagnucci to
introduce a golang package infrastructure. Note that in its v3 of the
series, Angelo had a PATCH 7/7 that was adding 'mender' as a new
package, but this specific patch is not part of this series.

Changes since v3:

 - Removed the "unexport GOBIN" and instead pass an empty GOBIN in
   <foo>_GO_ENV.

 - Renamed <foo>_GOPATH to <foo>_WORKSPACE, because the variable
   didn't contain a path, but just a sub-directory, and this
   sub-directory in the Go terminology is called the "workspace"

 - Rename <foo>_GO_LDFLAGS and <foo>_GO_TAGS to just <foo>_LDFLAGS and
   <foo>_TAGS.

 - Generally speaking the _GO_ component of the variables has been
   removed, to be more consistent with what other infrastructures
   do. It has been kept for <foo>_GO_ENV because it is really what we
   pass in the environment when calling "go".

 - Rename <foo>_GO_SRC_PATH to <foo>_SRC_SUBDIR, because it's actually
   a sub-directory and not a path. Also, the way it's calculated has
   been changed to use the second component of the URL instead of the
   package name, as it matches more often with the value that is
   needed. In addition, to make its definition clearer, some
   intermediate variable were introduced: <foo>_SRC_DOMAIN,
   <foo>_SRC_VENDOR and <foo>_SRC_SOFTWARE.

 - Introduce <foo>_BUILD_TARGETS as a list of targets to be built,
   which allows to support packages that need to build several
   targets.

 - Introduce <foo>_INSTALL_BINS as a list of binaries to be installed,
   which allows to support packages that need to install several
   binaries.

 - All packages and the documentation were adjusted according to the
   changes made to the infrastructure.

 - The docker-proxy package was converted to the golang package
   infrastructure (this package didn't exist back when Angelo sent his
   v3).

 - An initial preparation patch cleaning up some useless step in the
   docker-containerd package was introduced. Details in the commit
   log.

Thanks!

Thomas

Angelo Compagnucci (6):
  package/pkg-golang: new package infrastructure
  docs/manual: add documentation for the golang infrastructure
  package/flannel: convert to golang infrastructure
  package/runc: convert to golang infrastructure
  package/docker-containerd: convert to golang infrastructure
  package/docker-engine: convert to golang infrastructure

Thomas Petazzoni (2):
  docker-containerd: remove symlink to $(RUNC_SRCDIR)
  package/docker-proxy: convert to golang infrastructure

 docs/manual/adding-packages-golang.txt         | 110 ++++++++++++++++++++
 docs/manual/adding-packages.txt                |   2 +
 package/Makefile.in                            |   1 +
 package/docker-containerd/docker-containerd.mk |  35 ++-----
 package/docker-engine/docker-engine.mk         |  67 ++++--------
 package/docker-proxy/docker-proxy.mk           |  31 +-----
 package/flannel/flannel.mk                     |  32 +-----
 package/pkg-golang.mk                          | 136 +++++++++++++++++++++++++
 package/runc/runc.mk                           |  37 +------
 9 files changed, 287 insertions(+), 164 deletions(-)
 create mode 100644 docs/manual/adding-packages-golang.txt
 create mode 100644 package/pkg-golang.mk

-- 
2.14.3
