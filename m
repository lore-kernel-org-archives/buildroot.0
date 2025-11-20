Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA236CFA443
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE52361496;
	Thu, 20 Nov 2025 20:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dy0sE2EPaUci; Thu, 20 Nov 2025 20:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A997A616E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A997A616E6;
	Thu, 20 Nov 2025 20:43:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AFF3117
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CE1240622
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLcBAayeyxsC for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 20:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 69AE24052C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69AE24052C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69AE24052C
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:43:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 18B0F4E417CF
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:43:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D29EF606F6;
 Thu, 20 Nov 2025 20:43:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C008C10371BC1; Thu, 20 Nov 2025 21:43:22 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 20 Nov 2025 21:43:17 +0100
Message-ID: <20251120204318.814701-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1763671403; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=gT92UN3WuACC4n/ty7M3fgW9tm4zydJ+NE0zTDQ+JGM=;
 b=YkMOMgN18dzZtIRlokko3giEQNYahtCtNMUG6JkUwNt60w5tzdY9qBMoDIqd17oKQ+B5Ey
 Gfk5RFmVXhtqTDIqTAmKVQr76ICxBsOemEkRkzmdRDOrhbr+wasEa8e7qHw4sG9evo6NXj
 WpqPCQtfJaGHNsokkbHFH7jZBa3TO4nLlnB51wOQNOIJFl09gvFsh7l+v6Q+CRRtOFtDpP
 /aH11kHPd3kdyMqouasnZ7cPtpgjR3SwPuNcFXp6Ohun6CHSunP24L3apJm5V2u6uSdXFc
 Zl6yhCPcAuP1XnVGhprEAIcILyKUDeXqz4EoU7CN7ucVw3stHhC1Pp7ywp+Muw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=YkMOMgN1
Subject: [Buildroot] [PATCH] package/libcap: fix static builds
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

Since libcap has been updated to version 2.77 in Buildroot commit
42f2b480a5a81c7443f177bf541632b0fe501720, the build fails for
statically-linked configurations when the host system doesn't have a
static version of libc installed:

/usr/bin/ld: cannot find -lc: No such file or directory
/usr/bin/ld: have you installed the static version of the c library ?

This is because the -static flag that is supposed to be used when
building target code also gets passed to the host compiler... which is
obviously incorrect and leads to the build failure.

This issue was introduced by upstream commit
c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50, which was reverted right
after the 2.77 release in commit
542d7d86ecd2129dd5fe7e5b31ba307304f5b319, which we are simply
backporting here.

Fixes:

  https://autobuild.buildroot.net/results/f6d/f6dc61a9d57e282691b87a3a8fadcb5d5ea8fd8b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
This is IMO an improved version of Bernd's proposal at
https://lore.kernel.org/buildroot/20251109080011.481333-1-bernd@kuhls.net/
for two reasons:
- A clearer/more correct explanation (the issue is not Fedora related)
- Backport an upstream commit
---
 ...Add-build-ldflags-to-_makenames-rule.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch

diff --git a/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch b/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
new file mode 100644
index 0000000000..ae9655fd57
--- /dev/null
+++ b/package/libcap/0001-Revert-libcap-Add-build-ldflags-to-_makenames-rule.patch
@@ -0,0 +1,34 @@
+From 542d7d86ecd2129dd5fe7e5b31ba307304f5b319 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Mon, 10 Nov 2025 18:26:34 -0800
+Subject: [PATCH] Revert "libcap: Add build ldflags to _makenames rule"
+
+This reverts commit c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50.
+
+The details of what this broke are here:
+
+  https://bugzilla.kernel.org/show_bug.cgi?id=220691#c2
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+Upstream: 542d7d86ecd2129dd5fe7e5b31ba307304f5b319
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libcap/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcap/Makefile b/libcap/Makefile
+index f0eb87e..e90a950 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -80,7 +80,7 @@ $(PSXTITLE).pc: $(PSXTITLE).pc.in
+ 		$< >$@
+ 
+ _makenames: _makenames.c cap_names.list.h
+-	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@ $(BUILD_LDFLAGS)
++	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@
+ 
+ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
+-- 
+2.51.1
+
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
