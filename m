Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D682C5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 21:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D28405E6;
	Mon, 24 Aug 2026 21:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2tnGHt6h2mN; Mon, 24 Aug 2026 21:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787607291;
	bh=mMKI/0JsLCztss3nspNTTqV4WSLLLFP8cYWTEHPO7v8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZeVk6bFeHmElvb+/whB9CvhBQkx08Bz4Klhf1niJzf8DkC/3tiZqEbc2uMVLx0xvU
	 X98fW6ZyoEKFxQySNeDqJBP0VRxXCgCS+L8fEhr52EUVSFoJh3ZbBkQOBmvKjfCsQK
	 7addKJMztCXLOGyDYIMWNnsxvuGA5TpCkav2Q60C1rGAf73JIqxWaWCwl6kZeUQPSr
	 ne+i0ACBViT+VY8LXSPGLy3GuS6pq43W/RMFiCrgarAHGtHWvwLiIfy7Zq/uYKABnB
	 abbQHMgSZdHOFAUP8oVq4F0Zw9GG4jBdOcvHiP+2MoFZrsOoiKSwmtQz1vkJug2ipV
	 imfDJb9ppo3Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B611405F0;
	Mon, 24 Aug 2026 21:34:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 631634B8
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4958660618
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27clyLNVNaJG for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 21:34:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 623D660614
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:34:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C83D51A1806
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:34:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95EF55FFC1;
 Mon, 24 Aug 2026 21:34:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0355D11C79BE6; 
 Mon, 24 Aug 2026 23:34:39 +0200 (CEST)
To: buildroot@buildroot.org
Cc: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 David Laight <David.Laight@ACULAB.COM>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2026 23:34:34 +0200
Message-ID: <20260824213435.3324692-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2] support/scripts/check-host-libs: add new
 check on host binaries/libs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

One frequent issue in Buildroot is that when building host libraries
or applications, the build system of the package detects some
libraries provided by the system, and happily links to them, without
Buildroot knowing. Sometimes this doesn't cause any problem, but
sometimes this causes issues, and we're regularly eliminating such
mis-detection by forcing those packages to not detect the system
libraries that have not been built by Buildroot.

The new script check-host-libs added in this commit, which is executed
during the host-finalize step at the end of the build is an attempt at
detecting at least some of these situations.

What it does is that at the end of the build, it verifies that all
binaries and libraries in $(HOST_DIR) only have shared library
dependencies on libraries that are in Buildroot $(HOST_DIR), to the
exception of the C library, for which we of course use the system C
library.

For example, if the binary output/host/bin/plop is linked against
libpng, but libpng was not built and installed by Buildroot, the build
will now fail with:

ERROR: in /home/thomas/projets/buildroot/output/host/bin/plop, libpng16.so.16 unknown
make: *** [Makefile:715: host-finalize] Error 1

The script includes an allowlist of libraries provided by the C
library. It is potentially possible that this list might need to be
extended to cover all systems/distributions/C libraries, but only
wider testing of this script will help detect such cases.

It is worth mentioning that for now this script is executed only once
at the end of the build. This means that if a package A gets built,
detects and uses a system library libfoo and uses it, and then by
chance later Buildroot package B builds and installs libfoo into
HOST_DIR/lib, this script will believe that package A is correct, as
it finds libfoo in HOST_DIR/lib, even though while package A was being
built, the libfoo being detected was the system one. Detecting this
would require running check-host-libs at the end of each package
build, but that would imply re-checking over and over again all host
binaries/libraries, which could have a noticeable impact on the build
time. So for now, we simply check at the end of the build, which
should already help to detect a lot of interesting bogus situations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
It would be very useful if a few people could apply this patch to
their local tree, run their usual build, and see how it behaves. This
way, I can get some feedback to address the most obvious issues before
it gets merged and starts causing build failures in the autobuilders.

The v1 of this patch was sent on Sep 20, 2022, almost 4 years ago :-)

Changes since v1:
- Replaced the per-file file --mime-type checks with direct ELF magic
  detection using Bash read -N 4, significantly reducing scan time.
- Switched file traversal to NUL-delimited find -print0 output, safely
  handling paths containing whitespace.
- Suppressed harmless readelf errors for valid ELF object files
  without a dynamic section, such as the Go test fixtures mentioned
  during review.
- Added librt.so*, libutil.so*, and libresolv.so* to the
  system-library allowlist.
- Quoted file and host-directory paths where appropriate.
- Fixed shellcheck issues
---
 Makefile                        |  1 +
 support/scripts/check-host-libs | 37 +++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100755 support/scripts/check-host-libs

diff --git a/Makefile b/Makefile
index 4e59c7b87f..890575f462 100644
--- a/Makefile
+++ b/Makefile
@@ -748,6 +748,7 @@ host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 		PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) \
 		$(TOPDIR)/support/scripts/fix-rpath staging
 	$(call ppd-fixup-paths,$(BASE_DIR))
+	./support/scripts/check-host-libs $(HOST_DIR)
 
 .PHONY: staging-finalize
 staging-finalize: $(STAGING_DIR_SYMLINK)
diff --git a/support/scripts/check-host-libs b/support/scripts/check-host-libs
new file mode 100755
index 0000000000..79f60024c4
--- /dev/null
+++ b/support/scripts/check-host-libs
@@ -0,0 +1,37 @@
+#!/bin/bash
+
+HOST_DIR=$1
+
+if test -z "${HOST_DIR}" ; then
+    echo "usage: check-host-libs HOST_DIR"
+    exit 1
+fi
+
+bailout="no"
+ELF=$'\x7fELF'
+
+while IFS= read -r -d '' f; do
+    read -r -N 4 magic < "${f}"
+    if test "${magic}" != "${ELF}" ; then
+        continue
+    fi
+    for lib in $(LC_ALL=C readelf -d "${f}" 2>/dev/null | \
+        sed -n 's,.*Shared library: \[\(.*\)\].*,\1,p'); do
+        case ${lib} in
+        libc.so*|libm.so*|libstdc++.so*|libpthread.so*|libgcc_s.so*|libdl.so*|ld-*|libgomp.so*|libcrypt.so*|libcrypto.so*|libatomic.so*|librt.so*|libutil.so*|libresolv.so*)
+            continue
+            ;;
+        *)
+            if test -e "${HOST_DIR}/lib/${lib}" ; then
+                continue
+            fi
+            echo "ERROR: in ${f}, ${lib} unknown"
+            bailout="yes"
+            ;;
+        esac
+    done
+done < <(find "${HOST_DIR}"/*bin "${HOST_DIR}"/lib* -type f -print0)
+
+if test "${bailout}" = "yes" ; then
+    exit 1
+fi
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
