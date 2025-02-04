Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC33C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C6FD41784;
	Fri, 28 Feb 2025 17:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iE8-xRfsVIJa; Fri, 28 Feb 2025 17:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77E2C415A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77E2C415A3;
	Fri, 28 Feb 2025 17:11:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B7068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A914141992
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-7L47uc7Obs for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A15442F70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A15442F70
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D9D485FAE; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:00:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ddc348d46f6f990a1feb5e806d9bd71d8fb99d35
X-Git-Newrev: 67c6d1b12c430313c492dc66b2280d447917feb5
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.2D9D485FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mender: bump version
 to 3.5.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67c6d1b12c430313c492dc66b2280d447917feb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Updating directly to 4.x is too difficult and complex, as mender 4.x is
a complete rewrite in C++, with several new dependencies and changes.

As such, update to the last version that was written in Go, which is
3.5.3. The following changes are necessary:

The artifact_info file is no longer supported. Instead, mender now expects a
bootstrap.mender artifact created by mender-artifact /var/lib/mender.
See the following for more information:
https://northerntech.atlassian.net/browse/MEN-2585
https://northerntech.atlassian.net/browse/MEN-2583
https://docs.mender.io/release-information/release-notes-changelog/mender-client#mender-3-5-0-1
https://github.com/mendersoftware/mender/blob/3.5.3/Documentation/automatic-bootstrap-artifact.md

  - Remove all instances of creating or copying an artifact_info file
    from board examples and package/mender.

  - Add a generate_mender_bootstrap_artifact method to
    board/mender/x86_64/post-image-efi.sh which creates a proper
    bootstrap.mender file and places it in the data partition.

  - Add a post-build.sh script to support/testing/tests/package/test_mender
    with the same generate_mender_bootstrap_artifact method with one change:
    As the rootfs.ext4 file is not yet created; we omit the optional
    --provides "rootfs-image.checksum:${img_checksum}" argument when
    generating the bootstrap.mender file.

Mender expects the device_type file to exist in /var/lib/mender/device_type.
  This is further supported by the following line in tests/Dockerfile.daemon:
  `echo device_type=docker-client > /var/lib/mender/device_type`

Add a migration section in docs/manual/migrating.adoc

Update the package/mender/readme.txt to include a quick mention of the
bootstrap.mender artifact change.

License changes:

New:
vendor/github.com/klauspost/compress/internal/snapref/LICENSE (BSD-3-Clause)
vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt (MIT)

Removed:
vendor/github.com/klauspost/compress/internal/snapref/LICENSE
vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt

Modified:
LICENSE: Update year from 2022 to 2024
LIC_FILES_CHKSUM.sha256: Sum of all Licenses changed
vendor/github.com/mendersoftware/mender-artifact/LICENSE
  - Update year from 2022 to 2023

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Arnout:
  - fix LIC_FILES_CHKSUM.sha256 hash
  - Better URL for bootstrap artifact doc
  - Migrate to 2025.02 instead of 2024.11
  - Improve migrating text (editorial changes)
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/mender/x86_64/post-build.sh                  |  7 +++---
 board/mender/x86_64/post-image-efi.sh              | 23 ++++++++++++++++++++
 docs/manual/migrating.adoc                         | 11 ++++++++++
 package/mender/artifact_info                       |  1 -
 package/mender/mender.conf                         |  1 +
 package/mender/mender.hash                         | 10 +++++----
 package/mender/mender.mk                           |  7 +++---
 package/mender/readme.txt                          |  4 ++++
 support/testing/tests/package/test_mender.py       |  3 +++
 .../tests/package/test_mender/post-build.sh        | 25 ++++++++++++++++++++++
 10 files changed, 79 insertions(+), 13 deletions(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 0c52eb7be5..5e6967ebd1 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -1,7 +1,6 @@
 #!/usr/bin/env bash
 set -e
 DEVICE_TYPE="buildroot-x86_64"
-ARTIFACT_NAME="1.0"
 
 parse_args() {
     local o O opts
@@ -19,7 +18,8 @@ parse_args() {
             DEVICE_TYPE="${2}"; shift 2
             ;;
         (-a|--artifact-name)
-            ARTIFACT_NAME="${2}"; shift 2
+            # Ignored to have same options as other scripts
+            shift 2
             ;;
         (--)
             shift; break
@@ -42,8 +42,7 @@ mender_fixup() {
 main() {
     parse_args "${@}"
     mender_fixup
-    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
-    echo "artifact_name=${ARTIFACT_NAME}" > "${TARGET_DIR}/etc/mender/artifact_info"
+    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/var/lib/mender/device_type"
 }
 
 main "${@}"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 9ed597d3e4..3d4ef1176a 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -1,6 +1,7 @@
 #!/usr/bin/env bash
 set -e
 BOARD_DIR="$(realpath "$(dirname "$0")")"
+DATA_PART="${BINARIES_DIR}"/data-part
 DATA_PART_SIZE="32M"
 DEVICE_TYPE="buildroot-x86_64"
 ARTIFACT_NAME="1.0"
@@ -33,6 +34,7 @@ parse_args() {
 # Create the data partition
 make_data_partition() {
     "${HOST_DIR}/sbin/mkfs.ext4" \
+        -d "${DATA_PART}" \
         -F \
         -r 1 \
         -N 0 \
@@ -41,6 +43,26 @@ make_data_partition() {
         "${BINARIES_DIR}/data-part.ext4" "${DATA_PART_SIZE}"
 }
 
+# Generate a mender bootstrap artifact.
+# See https://github.com/mendersoftware/mender/blob/3.5.3/Documentation/automatic-bootstrap-artifact.md
+generate_mender_bootstrap_artifact() {
+
+  rm -rf "${DATA_PART}"
+  mkdir -p "${DATA_PART}"
+  img_checksum=$(sha256sum "${BINARIES_DIR}"/rootfs.ext4 |awk '{print $1}')
+
+  "${HOST_DIR}"/bin/mender-artifact \
+    write bootstrap-artifact \
+    --compression lzma \
+    --artifact-name "${ARTIFACT_NAME}" \
+    --device-type "${DEVICE_TYPE}" \
+    --provides "rootfs-image.version:${ARTIFACT_NAME}" \
+    --provides "rootfs-image.checksum:${img_checksum}" \
+    --clears-provides "rootfs-image.*" \
+    --output-path "${DATA_PART}"/bootstrap.mender \
+    --version 3
+}
+
 # Create a mender image.
 generate_mender_image() {
     echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
@@ -60,6 +82,7 @@ generate_image() {
 # Main function.
 main() {
     parse_args "${@}"
+    generate_mender_bootstrap_artifact
     make_data_partition
     generate_image
     generate_mender_image
diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 69bf0dc221..5e8c3ea2c6 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -184,3 +184,14 @@ sed -r -i -e 's/(\.tar\.gz)$/-cargo2\1/' $(
 
 Note that the hash _will_ have changed, so that needs to be updated
 (manually) as well.
+
+[[migrating-mender]]
+=== Migrating to 2025.02
+
+Mender now requires a special bootstrap artifact to be placed in
++/var/lib/mender+. This replaces the +artifact_info+ file. Just like a
+normal artifact, the bootstrap artifact is generated with
+host-mender-artifact. See +board/mender/x86_64/post-image-efi.sh+ for an
+example of how to generate the bootstrap.mender file. See 
+https://docs.mender.io/release-information/release-notes-changelog/mender-client#mender-3-5-0-1[the
+release notes], under features, for more information.
diff --git a/package/mender/artifact_info b/package/mender/artifact_info
deleted file mode 100644
index 1c84b088d0..0000000000
--- a/package/mender/artifact_info
+++ /dev/null
@@ -1 +0,0 @@
-artifact_name=BUILDROOT_ARTIFACT
diff --git a/package/mender/mender.conf b/package/mender/mender.conf
index f89118ac1b..2393948f8e 100644
--- a/package/mender/mender.conf
+++ b/package/mender/mender.conf
@@ -4,6 +4,7 @@
   "RetryPollIntervalSeconds": 300,
   "RootfsPartA": "/dev/mmcblk0p2",
   "RootfsPartB": "/dev/mmcblk0p3",
+  "DeviceTypeFile": "/var/lib/mender/device_type",
   "ServerCertificate": "/etc/mender/server.crt",
   "ServerURL": "https://docker.mender.io",
   "TenantToken": "dummy"
diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 118cce9d02..17fe08c827 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,12 +1,12 @@
 # Locally computed:
-sha256  8a149b11b990beb7620b372023eec28df63cee6a1aa4132e88ecef554f080f72  mender-3.4.0-go2.tar.gz
+sha256  35e369759b8d4f012153e538b5daf1e0cebe842205811e708332c5a092270ac5  mender-3.5.3-go2.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  vendor/github.com/mendersoftware/mender-artifact/LICENSE
+sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a  vendor/github.com/mendersoftware/mender-artifact/LICENSE
 sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/mendersoftware/openssl/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
@@ -29,6 +29,8 @@ sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor
 #
 # MIT license.
 sha256  6d2de1cde19c4d2bd8bcd9aaa1d581f4cfa3db9cf71896140330eaa2f2687685  vendor/github.com/klauspost/pgzip/LICENSE
+sha256  f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/github.com/klauspost/compress/internal/snapref/LICENSE
+sha256  f566a9f97bacdaf00d9f21dd991e81dc11201c4e016c86b470799429a1c9a79c  vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt
 sha256  5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212  vendor/github.com/klauspost/cpuid/v2/LICENSE
 sha256  51a0c9ec7f8b7634181b8d4c03e5b5d204ac21d6e72f46c313973424664b2e6b  vendor/github.com/sirupsen/logrus/LICENSE
 sha256  f8e536c1c7b695810427095dc85f5f80d44ff7c10535e8a9486cf393e2599189  vendor/github.com/stretchr/testify/LICENSE
@@ -42,4 +44,4 @@ sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 # sha256 of all the vendor licenses combined
-sha256  93d9db9b43097b174e362ac8f398aa9a37fcdde2974d0567b62bd6d1e0d22037  LIC_FILES_CHKSUM.sha256
+sha256  86407bd98d5ea7fb0f09ab771c3333e975d06565b809a2dd95f864dc1e3a09b3  LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index e6a2740e80..146e6b2b73 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 3.4.0
+MENDER_VERSION = 3.5.3
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 MENDER_CPE_ID_VENDOR = northern.tech
@@ -29,6 +29,8 @@ MENDER_LICENSE_FILES = \
 	vendor/golang.org/x/term/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/klauspost/pgzip/LICENSE \
+	vendor/github.com/klauspost/compress/internal/snapref/LICENSE \
+	vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt \
 	vendor/github.com/klauspost/cpuid/v2/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
@@ -66,9 +68,6 @@ define MENDER_INSTALL_CONFIG_FILES
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
 
-	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/artifact_info \
-			$(TARGET_DIR)/etc/mender/artifact_info
-
 	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
 			$(TARGET_DIR)/etc/mender/device_type
 
diff --git a/package/mender/readme.txt b/package/mender/readme.txt
index d78623aec9..56d6204583 100644
--- a/package/mender/readme.txt
+++ b/package/mender/readme.txt
@@ -118,6 +118,10 @@ then you would typically create the Mender Artifact in a post image
 script (BR2_ROOTFS_POST_IMAGE_SCRIPT). See the generate_mender_image
 method in board/mender/x86_64/post-image-efi.sh for a working example.
 
+Additionally, mender requires a bootstrap.mender file which is also
+generated using the host-mender-artifact package. See the
+generate_mender_bootstrap_artifact method in
+board/mender/x86_64/post-image-efi.sh for an example
 
 Configuring Mender with certificates
 ------------------------------------
diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
index 976d03b172..0c83c5644e 100644
--- a/support/testing/tests/package/test_mender.py
+++ b/support/testing/tests/package/test_mender.py
@@ -7,9 +7,12 @@ class TestMenderInfra(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
              """
              BR2_PACKAGE_MENDER=y
+             BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
              BR2_TARGET_ROOTFS_CPIO=y
+             BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
              BR2_ROOTFS_OVERLAY="{}"
              """.format(
+                 infra.filepath("tests/package/test_mender/post-build.sh"),
                  # overlay to add a fake 'fw_printenv', used by Mender
                  infra.filepath("tests/package/test_mender/rootfs-overlay"))
 
diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
new file mode 100755
index 0000000000..1afa231082
--- /dev/null
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -0,0 +1,25 @@
+#!/usr/bin/env bash
+set -e
+DEVICE_TYPE="buildroot-arm"
+ARTIFACT_NAME="RUNTIME_TEST_ARTIFACT_NAME"
+
+generate_mender_bootstrap_artifact() {
+  "${HOST_DIR}"/bin/mender-artifact \
+    write bootstrap-artifact \
+    --artifact-name "${ARTIFACT_NAME}" \
+    --device-type "${DEVICE_TYPE}" \
+    --provides "rootfs-image.version:${ARTIFACT_NAME}" \
+    --clears-provides "rootfs-image.*" \
+    --output-path "${TARGET_DIR}"/var/lib/mender/bootstrap.mender \
+    --version 3
+}
+
+function mender_fixup() {
+  rm -rf "${TARGET_DIR}"/var/lib/mender
+  mkdir -p "${TARGET_DIR}"/var/lib/mender
+  echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
+
+}
+
+mender_fixup
+generate_mender_bootstrap_artifact
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
