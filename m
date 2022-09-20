Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2D8ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 06:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B1D5409A2;
	Tue, 20 Sep 2022 06:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B1D5409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMnz7kv2vpoj; Tue, 20 Sep 2022 06:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA18A4098C;
	Tue, 20 Sep 2022 06:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA18A4098C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0401E1BF33A
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFEFD81B69
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFEFD81B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moyszcLBDP53 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 06:45:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5B681A0D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C5B681A0D
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 06:45:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 4B07DC0005;
 Tue, 20 Sep 2022 06:45:55 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 08:45:50 +0200
Message-Id: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663656355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=O05XI8VpuNk6BFx7kslGQcydUMBDwBOzJlXKvudqK88=;
 b=Dk4jFYMEhMy0kunQIaHgJ6FUf1gd32dWnvEZRq+X+a3rPEnWzh39P/NGLZAd8F45c9j6m9
 QOh8xPE5lN7z8H6TKqIzIUV0OP3GmfgQMTxmTvDvhJ5ayi58VOLhdl3KhKlgnURavJfo1x
 fvfK6XNy+D+RP6TZAApmJZ+7XcAkQN21Fktf3tGnFQDVEsIVRDXsOpF1K0qvJ5jEuNBgIw
 UQ96CLAuEj2xI/jf4+6KlOaFmI5NWfAbhUac4ySb2nGHW1m8lkPdvoE/faRZ4v/fItwjn6
 LG3/Fim4g2wlzkUtkKXGX2M4vJPhrNCK2HLz7KuheHeuRL0aA4ZqbUMEYThhiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dk4jFYME
Subject: [Buildroot] [PATCH] support/scripts/check-host-libs: add new check
 on host binaries/libs
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
---
 Makefile                        |  1 +
 support/scripts/check-host-libs | 36 +++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100755 support/scripts/check-host-libs

diff --git a/Makefile b/Makefile
index ec7c034ac1..7ba8ccd535 100644
--- a/Makefile
+++ b/Makefile
@@ -712,6 +712,7 @@ STAGING_DIR_FILES_LISTS = $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.t
 host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
 	@$(call MESSAGE,"Finalizing host directory")
 	$(call per-package-rsync,$(sort $(PACKAGES)),host,$(HOST_DIR))
+	./support/scripts/check-host-libs $(HOST_DIR)
 
 .PHONY: staging-finalize
 staging-finalize: $(STAGING_DIR_SYMLINK)
diff --git a/support/scripts/check-host-libs b/support/scripts/check-host-libs
new file mode 100755
index 0000000000..ef307bb6dd
--- /dev/null
+++ b/support/scripts/check-host-libs
@@ -0,0 +1,36 @@
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
+
+for f in $(find ${HOST_DIR}/*bin ${HOST_DIR}/lib* -type f); do
+    mime=$(file -b --mime-type ${f})
+    if test "${mime}" != "application/x-sharedlib" -a \
+	    "${mime}" != "application/x-executable" ; then
+        continue
+    fi
+    for lib in $(LC_ALL=C readelf -d ${f} | grep NEEDED | sed 's,.*Shared library: \[\(.*\)\].*,\1,'); do
+        case ${lib} in
+        libc.so*|libm.so*|libstdc++.so*|libpthread.so*|libgcc_s.so*|libdl.so*|ld-*|libgomp.so*|libcrypt.so*|libcrypto.so*|libatomic.so*)
+            continue
+            ;;
+        *)
+            if test -e ${HOST_DIR}/lib/${lib} ; then
+                continue
+            fi
+            echo "ERROR: in ${f}, ${lib} unknown"
+            bailout="yes"
+            ;;
+        esac
+    done
+done
+
+if test "${bailout}" = "yes" ; then
+    exit 1
+fi
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
