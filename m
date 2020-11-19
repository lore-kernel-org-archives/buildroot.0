From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:45 +0100
Subject: [Buildroot] [PATCH next 00/12] Support for Cargo and Go vendoring
Message-ID: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a patch series that implements support for vendoring of Cargo
and Go packages.

As you're aware, many Cargo and Go packages describe their
dependencies in a very language-specific way, and expect such
dependencies to be downloaded by their language-specific tools.

This series builds on top of the work from Patrick Havelange
<patrick.havelange@essensium.com> who worked on the Cargo integration,
but extends it to also cover the case of Go, showing that we have a
solution solving both of these language-specific package managers. For
the Go vendoring, I've also used the indication provided by Christian
Stewart <christian@paral.in>.

Overall, the solution consists in a concept of "download post-process
helper" is introduced in the download infrastructure. These are shell
scripts that can be invoked right after the download is done, but
before the tarball is hash-checked and stored in DL_DIR. The idea is
that such "download post-process helpers" can run the
language-specific vendoring logic to fetch the package
dependencies. Thanks to this, the tarball in DL_DIR for a given
package not only contains the package source code itself, but also the
source code of its Cargo or Go dependencies. The tarball hash covers
the entire source code, the complete tarball is cached in DL_DIR, in
the primary site and backup site, and the build can fully be done
offline.

Such "download post-process helpers" are registered by means of the
<pkg>_DOWNLOAD_POST_PROCESS variable by the appropriate package
infrastructure.

This series is also available at:

  https://github.com/tpetazzoni/buildroot/commits/pkg-mgr

More specifically, the series goes like this:

 - PATCH 1: add the concept of download post-processing in the
   download helper support/download/dl-wrapper

 - PATCH 2: add the <pkg>_DOWNLOAD_POST_PROCESS variable to the
   package infrastructure, which gets passed down to
   support/download/dl-wrapper

 - PATCH 3: add the <pkg>_DL_ENV variable to the package
   infrastructure, which allows to pass extra variables in the
   download wrapper environment. This will be used to pass extra
   variables specific to Cargo/Go vendoring.

 - PATCH 4: add a set of two helper shell functions that will be used
   by the post processing scripts

 - PATCH 5: implements the Go vendoring itself

 - PATCH 6: adds package/tinifier, which is one package that requires
   Go vendoring. I don't particularly need this package, it was just
   added because the other Go packages we have in Buildroot today
   don't need vendoring.

 - PATCH 7: introduces a cargo-package infrastructure, for both target
   and host packages

 - PATCH 8: documents the added cargo-package infrastructure

 - PATCH 9 and 10: converts ripgrep and sentry-cli to the
   cargo-package and host-cargo-package infrastructures respecitively

 - PATCH 11: implements the Cargo vendoring itself. Note that we need
   to bump the ripgrep and sentry-cli package at the same time, as
   with the vendoring their tarball contents change and therefore
   their hash changes

 - PATCH 12: rewrite the cargo-package documentation about dependency
   management

Best regards,

Thomas

Patrick Havelange (3):
  package/pkg-cargo.mk: introduce the cargo package infrastructure
  docs/manual/cargo: document the cargo-package infrastructure
  package/ripgrep: convert to cargo infrastructure

Thomas Petazzoni (9):
  support/download/dl-wrapper: add concept of download post-processing
  package/pkg-download.mk: add <pkg>_DOWNLOAD_POST_PROCESS variable
  package/pkg-download.mk: add <pkg>_DL_ENV variable
  support/download/post-process-helpers: add helper function for post
    process scripts
  support/download/go-post-process: implement Go vendoring support
  package/tinifier: new package
  package/sentry-cli: convert to host-cargo-package infrastructure
  support/download/cargo-post-process, package/pkg-cargo.mk: enable
    vendoring for Cargo packages
  docs/manual/adding-packages-cargo.txt: rewrite explanation about
    dependency management

 DEVELOPERS                            |   1 +
 docs/manual/adding-packages-cargo.txt | 106 ++++++++++------------
 package/Config.in                     |   1 +
 package/Makefile.in                   |   1 +
 package/pkg-cargo.mk                  | 126 ++++++++++++++++++++++++++
 package/pkg-download.mk               |   5 +-
 package/pkg-golang.mk                 |   7 +-
 package/ripgrep/ripgrep.hash          |   2 +-
 package/ripgrep/ripgrep.mk            |  30 +-----
 package/sentry-cli/sentry-cli.hash    |   2 +-
 package/sentry-cli/sentry-cli.mk      |  24 +----
 package/tinifier/Config.in            |  10 ++
 package/tinifier/tinifier.hash        |   3 +
 package/tinifier/tinifier.mk          |  13 +++
 support/download/cargo-post-process   |  38 ++++++++
 support/download/dl-wrapper           |   9 +-
 support/download/go-post-process      |  29 ++++++
 support/download/post-process-helpers |  30 ++++++
 18 files changed, 324 insertions(+), 113 deletions(-)
 create mode 100644 package/pkg-cargo.mk
 create mode 100644 package/tinifier/Config.in
 create mode 100644 package/tinifier/tinifier.hash
 create mode 100644 package/tinifier/tinifier.mk
 create mode 100755 support/download/cargo-post-process
 create mode 100755 support/download/go-post-process
 create mode 100644 support/download/post-process-helpers

-- 
2.28.0
