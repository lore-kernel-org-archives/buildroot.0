Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DEDE95363
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F6BC605B0;
	Wed,  4 Feb 2026 09:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1q5IBY78NrR; Wed,  4 Feb 2026 09:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E1E60A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770198338;
	bh=+kI6zh9mfwsuS7f2JyPtbOOov1t/2sgxmDvdoBBPPu0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mu1mlCmzoxbcgLRxskO+YaXA3jibk+Mfp/weBkLJ203m07lT+fhO+qS//oQb+5dtH
	 0Y4+637G3xEGvp+dR5WfpWvbvGHXZ/mrsze2KM8ZcdV/lRrUvpLbxV5T8tUK0oOgrA
	 eYF6/hAtBBrtkgY+jzcfociDbvSdfPffxeI6qmqg12kKp6Mx3lB9lvw6Jsgk3PoCH3
	 gt37IfoILCsr+LwUwDMcdBxz5qfbghmzNTjUpByTumG8lMoPRFp0U4E7eS/l7La/oJ
	 9FVjsWBI4a/HbaaLSL9pVcAXdd+vbdf+cBdmTIDlQpcZ7+Vuci2vftuTNqQIaKaG91
	 e6wgfv0PGb9pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E1E60A7C;
	Wed,  4 Feb 2026 09:45:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D471DF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C16BC605B0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KVxBWxE2D79 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB0AB60AA6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB0AB60AA6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:45:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD5FC86814; Wed,  4 Feb 2026 09:45:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 10:44:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32c6fffd414df733b2b35b2baac886e6dcbfd271
X-Git-Newrev: 63877f9e86e2b79218b3f08c1ec4613cfe354744
X-Patchwork-Hint: ignore
Message-Id: <20260204094535.DD5FC86814@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/relocate-sdk.sh:
 pre-calculate files in need of relocation
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63877f9e86e2b79218b3f08c1ec4613cfe354744
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile                     | 10 ++++++++++
 support/misc/relocate-sdk.sh | 11 +++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 004039d847..4cf8750bfb 100644
--- a/Makefile
+++ b/Makefile
@@ -602,6 +602,16 @@ prepare-sdk: world
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
