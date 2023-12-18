Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA764C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 21:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88046408B4;
	Mon, 18 Dec 2023 21:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88046408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Df1LSoOI3xXd; Mon, 18 Dec 2023 21:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25AF8408DD;
	Mon, 18 Dec 2023 21:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25AF8408DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 934621BF344
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72FD66105E
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72FD66105E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3azivJux96aU for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 21:26:25 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB06D611F8
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 21:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB06D611F8
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d3cb1ccccbso1231057b3a.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 13:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702934783; x=1703539583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0n7YjaWAfM1ISTCNqdv3aJ5+ox+N6bIF38A7S6hZI84=;
 b=H/suWdEQ08XQ8RnCZyxkwsk8J2FLtR3E64c+e2QIDbMeDe/A0yUNTg9ilXdThUtCvH
 hwkpQcEdzCnzQhg9hYaGoq4fQabbIYamummKrNfCdKW/IusJwUTpJUgsFZVwDITz4toB
 F+NQIQCNHhtSFx3BgX5i0a+TBhvGs+dVJD2UtveuxmMV0zidkyiZsNDidYQ8sHJWltwc
 FI/IT0DmjOQF7LtkcRLwLj3+tUmCViC46qfHLNL+mGSGZVc7cPT+5iOsAuuDWlWWZnHY
 QC0DvS9+/1SEhJY/CfDHp0LmoUG9271CmvTOe+GyjEdNS6USH3ooNZ866z4gvrMoEMqH
 DQIQ==
X-Gm-Message-State: AOJu0YwCmMJVtbfVBRd9wn3BMZWAyBP1RuMi4cckJIWzDtjrOkfMRZ7P
 qrH4uduv+7R4CvB1EmVC9eR/LbnZ4A+lbPj3A/4=
X-Google-Smtp-Source: AGHT+IHHH4w6vF5vuTL6ZCwhV1cl54Kr2L+1y+eNkdNRFUcN0Yk4a28n3t7Z5Ivcj44rISUMss8+0Q==
X-Received: by 2002:a05:6a00:1951:b0:6ce:450e:4e66 with SMTP id
 s17-20020a056a00195100b006ce450e4e66mr9628534pfk.10.1702934783314; 
 Mon, 18 Dec 2023 13:26:23 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a63e452000000b005cd7dd8708dsm4364264pgk.52.2023.12.18.13.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 13:26:22 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 14:26:13 -0700
Message-ID: <20231218212613.1201821-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
References: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702934783; x=1703539583;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0n7YjaWAfM1ISTCNqdv3aJ5+ox+N6bIF38A7S6hZI84=;
 b=DdwxaDYgD8xolfgHcBjYoKja8eSfSR7r74VeDCJDkdKadwf59KsGUhotsDT4hZcHRC
 OEmscnXg4XnY4ZxgaPcdhGOjbl4dmMVVqA1No1ZMDuNJkeCYvrA9KySU3rQo/fZx0uSe
 il0rJCODSxrOFRKXXOCtNtLqb4lc99hgOQfWM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DdwxaDYg
Subject: [Buildroot] [PATCH v2 6/6] package/mender: bump version to 3.5.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The artifact_info file is no longer supported. Instead, mender now expects a
bootstrap.mender artifact created by mender-artifact in either /data/ or
/var/lib/mender. See the following for more information:
https://northerntech.atlassian.net/browse/MEN-2585
https://northerntech.atlassian.net/browse/MEN-2583

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

  - With the new bootstrap.mender requirements, one other problem needs to be
    addressed. Currently, due to the possibility of a user creating a
    read-only filesystem in mender.mk we link /var/run/mender to
    /var/lib/mender. In S42mender the following happens:

    """
    # If /var/lib/mender is a symlink to /var/run/mender, and
    #   - the filesystem is RO (i.e., we can not rm the symlink),
    #     create the directory pointed to by the symlink.
    #   - the filesystem is RW (i.e., we can rm the symlink),
    #     replace the symlink with an actual directory
    """

However, with the new requirement of a bootstrap.mender file, it is likely that
a user will generate and place the boostrap.mender file in
$(TARGET_DIR)/var/lib/mender in a post-build script, causing subsequent rebuilds
to fail. As such, add one new line: rm -rf $(TARGET_DIR)/var/lib/mender to
ensure we can re-create the symlink without rebuild errors.

License changes:

New:
vendor/github.com/klauspost/compress/internal/snapref/LICENSE
vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt

Removed:
vendor/github.com/klauspost/compress/internal/snapref/LICENSE
vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt

Modified:
LICENSE: Update year from 2022 to 2023
LIC_FILES_CHKSUM.sha256: Sum of all Licenses changed
vendor/github.com/mendersoftware/mender-artifact/LICENSE
  - Update year from 2022 to 2023

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: remove references to ARTIFACT_NAME in board/mender/x86_64/post-build.sh

 board/mender/x86_64/post-build.sh             |  5 ++-
 board/mender/x86_64/post-image-efi.sh         | 20 +++++++++++
 package/mender/artifact_info                  |  1 -
 package/mender/mender.conf                    |  1 +
 package/mender/mender.hash                    | 10 +++---
 package/mender/mender.mk                      | 36 +++++++++----------
 support/testing/tests/package/test_mender.py  |  3 ++
 .../tests/package/test_mender/post-build.sh   | 24 +++++++++++++
 8 files changed, 74 insertions(+), 26 deletions(-)
 delete mode 100644 package/mender/artifact_info
 create mode 100755 support/testing/tests/package/test_mender/post-build.sh

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 23d1120d45..6ee16ad242 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -1,7 +1,6 @@
 #!/usr/bin/env bash
 set -e
 DEVICE_TYPE="buildroot-x86_64"
-ARTIFACT_NAME="1.0"
 
 function parse_args {
     local o O opts
@@ -19,7 +18,8 @@ function parse_args {
             DEVICE_TYPE="${2}"; shift 2
             ;;
         (-a|--artifact-name)
-            ARTIFACT_NAME="${2}"; shift 2
+            # Ignored to have same options as other scripts
+            shift 2
             ;;
         (--)
             shift; break
@@ -48,7 +48,6 @@ function main {
     parse_args "${@}"
     mender_fixup
     echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
-    echo "artifact_name=${ARTIFACT_NAME}" > "${TARGET_DIR}/etc/mender/artifact_info"
 }
 
 main "${@}"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 97b9e06d21..d184378696 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -31,9 +31,28 @@ function parse_args {
     done
 }
 
+# Generate a mender bootstrap artifact.
+# See https://northerntech.atlassian.net/browse/MEN-2585
+generate_mender_bootstrap_artifact() {
+  rm -rf "${BINARIES_DIR}"/data-part
+  mkdir -p "${BINARIES_DIR}"/data-part
+  img_checksum=$(sha256sum "${BINARIES_DIR}"/rootfs.ext4 |awk '{print $1}')
+
+  "${HOST_DIR}"/bin/mender-artifact \
+    write bootstrap-artifact \
+    --artifact-name "${ARTIFACT_NAME}" \
+    --device-type "${DEVICE_TYPE}" \
+    --provides "rootfs-image.version:${ARTIFACT_NAME}" \
+    --provides "rootfs-image.checksum:${img_checksum}" \
+    --clears-provides "rootfs-image.*" \
+    --output-path "${BINARIES_DIR}"/data-part/bootstrap.mender \
+    --version 3
+}
+
 # Create the data partition
 function make_data_partition {
     "${HOST_DIR}/sbin/mkfs.ext4" \
+        -d "${BINARIES_DIR}"/data-part \
         -F \
         -r 1 \
         -N 0 \
@@ -63,6 +82,7 @@ function generate_image {
 # Main function.
 function main {
     parse_args "${@}"
+    generate_mender_bootstrap_artifact
     make_data_partition
     generate_image
     generate_mender_image
diff --git a/package/mender/artifact_info b/package/mender/artifact_info
deleted file mode 100644
index 1c84b088d0..0000000000
--- a/package/mender/artifact_info
+++ /dev/null
@@ -1 +0,0 @@
-artifact_name=BUILDROOT_ARTIFACT
diff --git a/package/mender/mender.conf b/package/mender/mender.conf
index f89118ac1b..65b2781366 100644
--- a/package/mender/mender.conf
+++ b/package/mender/mender.conf
@@ -4,6 +4,7 @@
   "RetryPollIntervalSeconds": 300,
   "RootfsPartA": "/dev/mmcblk0p2",
   "RootfsPartB": "/dev/mmcblk0p3",
+  "DeviceTypeFile": "/etc/mender/device_type",
   "ServerCertificate": "/etc/mender/server.crt",
   "ServerURL": "https://docker.mender.io",
   "TenantToken": "dummy"
diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index d563dc534b..0e2a13f8e2 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,12 +1,12 @@
 # Locally computed:
-sha256  8a149b11b990beb7620b372023eec28df63cee6a1aa4132e88ecef554f080f72  mender-3.4.0.tar.gz
+sha256  12f26337407adf6bd1b4f54d2be4e5c1e3a5c8d977ad4d18fbe9ac4398da1e2d  mender-3.5.1.tar.gz
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache-2.0 license.
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  vendor/github.com/mendersoftware/mender-artifact/LICENSE
+sha256  52b2497ce07650b825015e80ca7a5d40c360c04c530234ca6d950b0f98bca23a  LICENSE
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
+sha256  f6450978cef1c67078918fdebe21bbedf13a18a32537a071c755e2f2def3af16  LIC_FILES_CHKSUM.sha256
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ee1398244b..dc1f545f40 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_VERSION = 3.4.0
+MENDER_VERSION = 3.5.1
 MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 MENDER_CPE_ID_VENDOR = northern.tech
@@ -14,30 +14,32 @@ MENDER_CPE_ID_VENDOR = northern.tech
 MENDER_LICENSE_FILES = \
 	LICENSE \
 	LIC_FILES_CHKSUM.sha256 \
+	vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
+	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md \
+	vendor/github.com/davecgh/go-spew/LICENSE \
+	vendor/github.com/godbus/dbus/LICENSE \
+	vendor/github.com/gorilla/websocket/LICENSE \
+	vendor/github.com/klauspost/compress/internal/snapref/LICENSE \
+	vendor/github.com/klauspost/compress/LICENSE \
+	vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt \
+	vendor/github.com/klauspost/cpuid/v2/LICENSE \
+	vendor/github.com/klauspost/pgzip/LICENSE \
+	vendor/github.com/mattn/go-isatty/LICENSE \
 	vendor/github.com/mendersoftware/mender-artifact/LICENSE \
 	vendor/github.com/mendersoftware/openssl/LICENSE \
-	vendor/github.com/minio/sha256-simd/LICENSE \
 	vendor/github.com/mendersoftware/progressbar/LICENSE \
+	vendor/github.com/minio/sha256-simd/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
-	vendor/github.com/godbus/dbus/LICENSE \
-	vendor/github.com/gorilla/websocket/LICENSE \
-	vendor/github.com/klauspost/compress/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
-	vendor/golang.org/x/sys/LICENSE \
-	vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
 	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
-	vendor/golang.org/x/term/LICENSE \
-	vendor/github.com/davecgh/go-spew/LICENSE \
-	vendor/github.com/klauspost/pgzip/LICENSE \
-	vendor/github.com/klauspost/cpuid/v2/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE \
+	vendor/github.com/stretchr/objx/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/ungerik/go-sysfs/LICENSE \
 	vendor/github.com/urfave/cli/v2/LICENSE \
-	vendor/github.com/stretchr/objx/LICENSE \
-	vendor/gopkg.in/yaml.v3/LICENSE \
-	vendor/github.com/mattn/go-isatty/LICENSE \
-	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
+	vendor/golang.org/x/sys/LICENSE \
+	vendor/golang.org/x/term/LICENSE \
+	vendor/gopkg.in/yaml.v3/LICENSE
 
 MENDER_DEPENDENCIES = host-pkgconf openssl
 
@@ -66,13 +68,11 @@ define MENDER_INSTALL_CONFIG_FILES
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
 
-	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/artifact_info \
-			$(TARGET_DIR)/etc/mender/artifact_info
-
 	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
 			$(TARGET_DIR)/etc/mender/device_type
 
 	mkdir -p $(TARGET_DIR)/var/lib
+	rm -rf $(TARGET_DIR)/var/lib/mender
 	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
 	$(foreach f,$(MENDER_UPDATE_MODULES_FILES), \
 		$(INSTALL) -D -m 0755 $(@D)/support/modules/$(notdir $(f)) \
diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
index fdf55ed616..203a3da863 100644
--- a/support/testing/tests/package/test_mender.py
+++ b/support/testing/tests/package/test_mender.py
@@ -8,8 +8,11 @@ class TestMender(infra.basetest.BRTest):
         """
         BR2_PACKAGE_MENDER=y
         BR2_TARGET_ROOTFS_CPIO=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
         BR2_ROOTFS_OVERLAY="{}"
+        BR2_PACKAGE_HOST_MENDER_ARTIFACT=y
         """.format(
+           infra.filepath("tests/package/test_mender/post-build.sh"),
            # overlay to add a fake 'fw_printenv', used by Mender
            infra.filepath("tests/package/test_mender/rootfs-overlay"))
 
diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
new file mode 100755
index 0000000000..afc647ea74
--- /dev/null
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -0,0 +1,24 @@
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
+}
+
+echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}"/etc/mender/device_type
+mender_fixup
+generate_mender_bootstrap_artifact
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
