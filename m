Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8496C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39D056FBC9;
	Thu,  6 Jan 2022 21:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OOd-ItTUUwph; Thu,  6 Jan 2022 21:00:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B23A160E07;
	Thu,  6 Jan 2022 21:00:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 701A61BF340
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C2B1831C1
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhjruTgcTIMD for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:00:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED0E682ACD
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:00:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1947BFF80B;
 Thu,  6 Jan 2022 21:00:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu,  6 Jan 2022 21:59:48 +0100
Message-Id: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 00/11] Support for Cargo and Go vendoring
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Patrick Havelange <patrick.havelange@essensium.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Believe it or not, but here is a new version of my patch series adding
support for Go vendoring, as well as a Cargo package infrastructure
that also supports vendoring.

This series builds on top of the work from Patrick Havelange
<patrick.havelange@essensium.com> who worked on the Cargo integration,
but extends it to also cover the case of Go, showing that we have a
solution solving both of these language-specific package managers. For
the Go vendoring, I've also used the indication provided by Christian
Stewart <christian@paral.in>. I've also integrated some changes that
Christian did in his series at:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=266310

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

This new series is available at:

  https://github.com/tpetazzoni/buildroot/tree/pkg-vendoring

A useful defconfig to test this series is:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_DELVE=y
BR2_PACKAGE_RIPGREP=y
BR2_PACKAGE_GOCRYPTFS=y
BR2_PACKAGE_TINIFIER=y
BR2_PACKAGE_FLANNEL=y
BR2_PACKAGE_BALENA_ENGINE=y
BR2_PACKAGE_DOCKER_CLI=y
BR2_PACKAGE_DOCKER_ENGINE=y
BR2_PACKAGE_EMBIGGEN_DISK=y
BR2_PACKAGE_MENDER=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
BR2_PACKAGE_HOST_SENTRY_CLI=y

It is useful because it builds:

 - All currently existing packages that use the golang-package or
   host-golang-package infrastructures. Those existing packages did
   not need vendoring support.

 - Builds the new tinifier, embiggen-disk and gocryptfs Go packages,
   which need vendoring.

 - Builds ripgrep, which is a target Cargo package.

 - Builds host-entry-cli, which is a host Cargo package.

Here are the main changes compared to v2 (posted December 2020):

 - Use of the mk_tar_gz shell function to re-create the tarball after
   vendoring. This allows to benefit from the reproducible magic
   implemented by mk_tar_gz.

 - post-process download helpers moved to support/download/helpers
   instead of having their own files.

 - Usage of a proper timestamp for the re-created tarballs instead of
   a fixed hardcoded timestamp.

 - Keep the creation of go.mod in golang-package, as it is needed for
   Go packages that are already vendored in their upstream
   tarball. The creation of go.mod in the Go post-process download
   script, used for vendoring, now uses the same method to create a
   minimal go.mod file.

 - The Cargo infra is now added in one patch, with vendoring support,
   instead of adding it without vendoring support and add it after the
   fact.

 - For the same reason, the Cargo infrastructure documentation now
   comes through a single patch.

 - The ripgrep changes are modified to account for the ripgrep version
   bump.

 - The tinifier package (a Go package that needs vendoring) was
   version bumped.

 - The packages embiggen-disk and gocryptfs, which were submitted by
   Christian, are now part of this series.

 - host-sentry-cli, which had been removed previously due to the lack
   of Cargo vendoring support, is now re-added by this series.

 - Small formatting and coding style improvements.

Best regards,

Thomas Petazzoni


Christian Stewart via buildroot (2):
  package/embiggen-disk: new package
  package/gocryptfs: new package

Patrick Havelange (3):
  package/pkg-cargo.mk: introduce the cargo package infrastructure
  docs/manual/cargo: document the cargo-package infrastructure
  package/ripgrep: convert to cargo infrastructure

Thomas Petazzoni (6):
  support/download/dl-wrapper: add concept of download post-processing
  package/pkg-download.mk: add <pkg>_DOWNLOAD_POST_PROCESS variable
  support/download/post-process-helpers: add helper function for post
    process scripts
  package/pkg-golang.mk: implement Go vendoring support
  package/sentry-cli: re-add package
  package/tinifier: new package

 DEVELOPERS                                    |   4 +
 docs/manual/adding-packages-cargo.txt         | 106 ++++++------
 package/Config.in                             |   3 +
 package/Config.in.host                        |   1 +
 package/Makefile.in                           |   1 +
 ...-Fix-resizing-of-dev-mmcblk0pN-paths.patch |  45 ++++++
 package/embiggen-disk/Config.in               |  19 +++
 package/embiggen-disk/embiggen-disk.hash      |   3 +
 package/embiggen-disk/embiggen-disk.mk        |  12 ++
 package/gocryptfs/Config.in                   |  12 ++
 package/gocryptfs/gocryptfs.hash              |   3 +
 package/gocryptfs/gocryptfs.mk                |  19 +++
 package/pkg-cargo.mk                          | 153 ++++++++++++++++++
 package/pkg-download.mk                       |   1 +
 package/pkg-golang.mk                         |  13 +-
 package/ripgrep/ripgrep.hash                  |   2 +-
 package/ripgrep/ripgrep.mk                    |  37 +----
 package/sentry-cli/Config.in.host             |  10 ++
 package/sentry-cli/sentry-cli.hash            |   3 +
 package/sentry-cli/sentry-cli.mk              |  14 ++
 package/tinifier/Config.in                    |  10 ++
 package/tinifier/tinifier.hash                |   3 +
 package/tinifier/tinifier.mk                  |  13 ++
 support/download/cargo-post-process           |  38 +++++
 support/download/dl-wrapper                   |   9 +-
 support/download/go-post-process              |  35 ++++
 support/download/helpers                      |  22 +++
 27 files changed, 498 insertions(+), 93 deletions(-)
 create mode 100644 package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
 create mode 100644 package/embiggen-disk/Config.in
 create mode 100644 package/embiggen-disk/embiggen-disk.hash
 create mode 100644 package/embiggen-disk/embiggen-disk.mk
 create mode 100644 package/gocryptfs/Config.in
 create mode 100644 package/gocryptfs/gocryptfs.hash
 create mode 100644 package/gocryptfs/gocryptfs.mk
 create mode 100644 package/pkg-cargo.mk
 create mode 100644 package/sentry-cli/Config.in.host
 create mode 100644 package/sentry-cli/sentry-cli.hash
 create mode 100644 package/sentry-cli/sentry-cli.mk
 create mode 100644 package/tinifier/Config.in
 create mode 100644 package/tinifier/tinifier.hash
 create mode 100644 package/tinifier/tinifier.mk
 create mode 100755 support/download/cargo-post-process
 create mode 100755 support/download/go-post-process

-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
