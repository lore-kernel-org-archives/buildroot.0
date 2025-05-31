Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574F8C5AD49
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 00:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFE2D405F6;
	Sat, 31 May 2025 00:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxH8Wayq51Bo; Sat, 31 May 2025 00:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE1A340715
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE1A340715;
	Sat, 31 May 2025 00:06:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A462236
 for <buildroot@buildroot.org>; Sat, 31 May 2025 00:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 208EA61044
 for <buildroot@buildroot.org>; Sat, 31 May 2025 00:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcTRP-J_vmyd for <buildroot@buildroot.org>;
 Sat, 31 May 2025 00:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5523560820
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5523560820
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5523560820
 for <buildroot@buildroot.org>; Sat, 31 May 2025 00:05:59 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 2760DE0012F;
 Sat, 31 May 2025 02:05:56 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Sat, 31 May 2025 02:05:41 +0200
Message-ID: <20250531000554.28543-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748649956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=J2m9xhI5RtLCqCEdgmnrDZj2W4krtF+m8VDXVR4578w=;
 b=RFNgi5McVFEYLoJMg8qZ2VhHAobFjJNoAqzcQtwGSYmohCFovPENgZ7A8UblgIUg57yRne
 EnFLckYRs3SjdkrbR41j6KXuN0d7V3QAsXxVC0NZCHWGUdk4GFKQAbqBTooH5QQOX4M8PG
 bfxW/Xy+z8TJHt/tqWs7iSUBY4LqU9I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=RFNgi5Mc
Subject: [Buildroot] [PATCH 1/1] core/sdk: pre-calculate files in need of
 relocation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the relocate-sdk.sh script scans the whole extracted SDK tree
to find instances of paths it needs to replace, which can take a
significant amount of time when the SDK is large, particularly relative
to the number of files that actually need to change.

However, the resulting list only depends on the SDK tarball itself, so
we can calculate it at build time and ship it with the tarball so
relocate-sdk.sh can use it directly.

Testing this on my machine with somewhat IOPS-limited rotating media,
the time goes down from:

$ time ./relocate-sdk.sh
Relocating the buildroot SDK from [...] to [...] ...
./relocate-sdk.sh  5.19s user 26.21s system 9% cpu 5:34.40 total

To:

$ time ./relocate-sdk.sh
Relocating the buildroot SDK from [...] to [...] ...
./relocate-sdk.sh  0.49s user 0.29s system 103% cpu 0.749 total

Signed-off-by: Florian Larysch <fl@n621.de>
---
 Makefile                     | 10 ++++++++++
 support/misc/relocate-sdk.sh | 11 +++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index c14023fd98..95f207150b 100644
--- a/Makefile
+++ b/Makefile
@@ -600,6 +600,16 @@ prepare-sdk: world
 	@$(call MESSAGE,"Preparing the SDK")
 	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
 	mkdir -p $(HOST_DIR)/share/buildroot
+	(\
+		export LC_ALL=C; \
+		grep -lr '$(HOST_DIR)' '$(HOST_DIR)' | while read -r FILE; do \
+			if file -b --mime-type "$$FILE" | grep -q '^text/' && \
+			   [ "$$FILE" != '$(HOST_DIR)/share/buildroot/sdk-location' ] && \
+			   [ "$$FILE" != '$(HOST_DIR)/share/buildroot/sdk-relocs' ]; then \
+				echo "$$FILE"; \
+			fi; \
+		done \
+	) | sed -e 's|^$(HOST_DIR)|.|g' > $(HOST_DIR)/share/buildroot/sdk-relocs
 	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
 
 BR2_SDK_PREFIX ?= $(GNU_TARGET_NAME)_sdk-buildroot
diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
index 981d272425..d25bc55279 100755
--- a/support/misc/relocate-sdk.sh
+++ b/support/misc/relocate-sdk.sh
@@ -37,15 +37,10 @@ fi
 
 echo "Relocating the buildroot SDK from ${OLDPATH} to ${NEWPATH} ..."
 
-# Make sure file uses the right language
-export LC_ALL=C
 # Replace the old path with the new one in all text files
-grep -lr "${OLDPATH}" . | while read -r FILE ; do
-    if file -b --mime-type "${FILE}" | grep -q '^text/' && [ "${FILE}" != "${LOCFILE}" ]
-    then
-        sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
-    fi
-done
+while read -r FILE ; do
+    sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
+done < share/buildroot/sdk-relocs
 
 # At the very end, we update the location file to not break the
 # SDK if this script gets interruted.
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
