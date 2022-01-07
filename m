Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAC0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7479A824CB;
	Fri,  7 Jan 2022 17:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1nxUIJUJuWY; Fri,  7 Jan 2022 17:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BA1E824DF;
	Fri,  7 Jan 2022 17:13:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6421BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3B660AC4
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VW68yYT5EcXY for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:13:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68F8460AB7
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:13:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 44000240002;
 Fri,  7 Jan 2022 17:13:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri,  7 Jan 2022 18:13:10 +0100
Message-Id: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/7] Bump of python-cryptography and other Rust
 related fun
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This series bumps the python-cryptography package to a new version. It
is based on earlier work from James Hilliard at:

  https://patchwork.ozlabs.org/project/buildroot/patch/20210318044253.3202355-2-james.hilliard1@gmail.com/

But it did require quite some more work, which is presented in this
patch series.

The unique challenge caused by this version bump is that
python-cryptography now has some Rust code integrated, so suddenly
this package, and all its reverse dependencies need to depend on Rust
being available.

There is also a host variant of python-cryptography, which is used
solely by ca-certificates, which has a significant number of reverse
dependencies. To avoid adding Rust dependencies to these, we broke the
dependency of ca-certificates on host-python-cryptography using a
simple patch, and dropped host-python-cryptography altogether.

This patch series depends on the "Go/Cargo vendoring" patch series
posted recently. Indeed, the Rust code in python-cryptography depends
on other Cargo crates, which we don't want to download during the
build, but really during the download step.

There is however still one problem with the last patch of the series,
see below.

This series is available at:

  https://github.com/tpetazzoni/buildroot/tree/python-cryptography

The patch series goes like this:

 - PATCH 1 modifies ca-certificates to no longer need
   host-python-cryptography

 - PATCH 2 drops host-python-cryptography itselef

 - PATCH 3 and 4 fix some issues in package/rustc/ in the description
   of the ARMv5 and RISC-V 64-bit Rust support. We noticed this
   because Rust binaries were not working on ARMv5 ("Illegal
   instruction"), this was due to the fact that we were using the
   pre-compiled Rust standard library for ARMv6, due to a bogus
   architecture name. This is fixed by PATCH 3. And while reviewing
   this, we spotted a similar issue for RISC-V 64-bit, which is fixed
   in PATCH 4.

 - PATCH 5 slightly improves the Cargo download post-process script to
   make it possible to pass a custom path to the Cargo.toml file,
   instead of assuming it's located at the root of the package source
   tree.

 - PATCH 6 modifies the runtime test cases that involve
   python-cryptography directly or indirectly to use a glibc toolchain
   instead of the default uclibc toolchain. Indeed, Rust is for now
   not available on uClibc platforms. This could have been done in the
   patch doing the version bump, but the version bump patch is already
   quite large, and the update of the runtime tests could be done as a
   separate preparation step.

 - PATCH 7 finally bumps python-cryptography
   itself. python-cryptography itself requires a bit of trickery to
   leverage the Cargo download post-process logic, to vendor
   dependencies during the download step. Then the patch also touches
   the entire reverse dependency tree (sometimes up to 5 levels
   deep!). This patch should NOT be applied for now, due to issues
   (see below).

This series was tested by building the following configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_PYTHON_CHANNELS_REDIS=y
BR2_PACKAGE_PYTHON_CROSSBAR=y
BR2_PACKAGE_PYTHON_KEYRING=y
BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO=y
BR2_PACKAGE_PYTHON_TXDBUS=y
BR2_PACKAGE_DOCKER_COMPOSE=y
# BR2_TARGET_ROOTFS_TAR is not set

that builds all affected packages.

It was also tested by running all Python runtime test cases:

   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/443445436

The one thing that fails is when building python-cryptography on a
target arch that is the same as the host. This can be reproduced by
running the tests.package.test_docker_compose.TestDockerCompose test
case.

We get this:

     Running `/home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build`
error: failed to run custom build command for `proc-macro-hack v0.5.19`

Caused by:
  process didn't exit successfully: `/home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build` (exi
t status: 1)
  --- stderr
  /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: versio
n `GLIBC_2.33' not found (required by /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build)
  /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: versio
n `GLIBC_2.32' not found (required by /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build)
  /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: versio
n `GLIBC_2.34' not found (required by /home/thomas/buildroot/buildroot/output/build/python-cryptography-36.0.1/src/rust/target/release/build/proc-macro-hack-f35f1313688107b0/build-script-build)
warning: build failed, waiting for other jobs to finish...
error: build failed

Which looks terribly similar to the issue on ripgrep which was fixed
by commit 4b2be770b8a853a7dd97b5788d837f0d84923fa1. So I tried doing
the same, i.e passing:

	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
	CARGO_TARGET_APPLIES_TO_HOST="false"

in the environment, and -Z target-applies-to-host to cargo (by passing
it to the args argument of the RustExtension class in
python-cryptography's setup.py). But cargo doesn't like that, the
build log goes like this:

>>> python-cryptography 36.0.1 BuildingESC[27m
... calling setup.py ...
cargo rustc --lib --manifest-path src/rust/Cargo.toml --features pyo3/abi3-py36 pyo3/extension-module --target x86_64-unknown-linux-gnu -Z target-applies-to-host --release --verbose -- --crate-type cdylib
...
error: unknown `-Z` flag specified:  target-applies-to-host

The difference that I see with the cargo infrastructure is that this
is not using "cargo build" but "cargo rustc". I would really
appreciate some help on solving this (last?) issue.

Best regards,

Thomas Petazzoni


Thomas Petazzoni (7):
  package/ca-certificates: remove dependency on host-python-cryptography
  package/python-cryptography: drop host variant
  package/rustc: fix BR2_PACKAGE_HOST_RUSTC_ARCH for ARMv5
  package/rustc: fix the riscv64gc architecture handling
  support/download/cargo-post-process: make manifest path configurable
  support/testing/tests: switch python-cryptography related tests to
    glibc
  DO-NOT-APPLY package/python-cryptography: bump version to 36.0.1

 ...2pem.py-make-cryptography-module-opt.patch | 59 +++++++++++++++++++
 package/ca-certificates/ca-certificates.mk    |  2 +-
 package/docker-compose/Config.in              |  8 ++-
 package/python-autobahn/Config.in             |  6 +-
 package/python-channels-redis/Config.in       |  7 +--
 package/python-channels/Config.in             |  7 +--
 package/python-crossbar/Config.in             |  6 +-
 package/python-cryptography/Config.in         | 14 +----
 .../python-cryptography.hash                  |  5 +-
 .../python-cryptography.mk                    | 20 ++++---
 package/python-daphne/Config.in               |  7 +--
 package/python-keyring/Config.in              |  7 +--
 package/python-opcua-asyncio/Config.in        |  1 +
 package/python-paramiko/Config.in             |  8 +--
 package/python-pyopenssl/Config.in            |  8 +--
 package/python-secretstorage/Config.in        |  6 +-
 package/python-service-identity/Config.in     | 10 ++--
 package/python-treq/Config.in                 | 10 ++--
 package/python-twisted/Config.in              |  6 +-
 package/python-txdbus/Config.in               |  5 +-
 package/python-txtorcon/Config.in             |  7 +--
 package/rustc/Config.in.host                  |  4 +-
 support/download/cargo-post-process           |  2 +-
 .../tests/package/test_python_autobahn.py     | 10 +++-
 .../tests/package/test_python_crossbar.py     | 10 +++-
 .../tests/package/test_python_cryptography.py | 10 +++-
 .../package/test_python_service_identity.py   | 10 +++-
 .../testing/tests/package/test_python_treq.py | 10 +++-
 .../tests/package/test_python_txtorcon.py     | 10 +++-
 29 files changed, 170 insertions(+), 105 deletions(-)
 create mode 100644 package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch

-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
