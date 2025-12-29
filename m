Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17EDE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CDE74079B;
	Mon, 29 Dec 2025 09:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzV0zXBwQUxR; Mon, 29 Dec 2025 09:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63A2B4079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767001217;
	bh=lB3gec80/1Rjp4AKK7XFrNnLIrp4Y5e4IqbZDEiQxmE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L2ood6yizCIHqtbfFg3XpFd+Avmz0OH279e3XapQ397mIjiSWjkO3rzkrF7MwADwS
	 tMOMdyw8P2eCQtztxwb+t73fe9KF3vnPk3kSUsXRgbqhmMeLRnyqKpXHRCeDjKxdI4
	 PYTnelF8E8my3C50hziyLdtz5GwfSUG+xrxnSmzhcVOH7zI4jL7vPNIgKpF2RieZM1
	 JgX1Hi0V7qIp68L7RhxfgY5fDW2BBb7U0bp9WhgZ/tAtrIQiDIEGJt3oxjY8uCnsLH
	 GZRYiVT8DRXCweoPZ+eBNdlaDB15bW9hH9pViZqZfjqRu3gnC//zQPQb0cjx477Q3m
	 73ehYCXbs0q9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A2B4079D;
	Mon, 29 Dec 2025 09:40:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A205E1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 937E060704
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqVKpp-QzGOH for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.117;
 helo=smtpdh17-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 725A760621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 725A760621
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 725A760621
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:40:14 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id a9jXvdVkhBhI9a9jXv2f4h; Mon, 29 Dec 2025 10:40:11 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 29 Dec 2025 10:40:10 +0100
Message-ID: <20251229094010.2472544-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIIXGhfLvisdkKnhROR/+XYrgwdC/NdckwScZ3OLGWb1FDgxcZqwPylMm4Ui5SlG+ecscvNoJZYtaxT3azP5XQiJMXgg0Alj80F6a8fwBdbODCnXjaZm
 WEQsfANHPDryb/H7Q3v30rso6Pjk+g8geE+obZjG/ih2YKUs8fmSvhjHXq9TBUi/vOxQNa2f1Pt20IvgWRBKwN3/6pvaw8jNkj+85/BLUwvSrhj3V6NHsoRC
 G7rCApJknj3pT7dQs4rIBEKR2AFM8COjOJ2ZaFPlxlI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767001211; bh=Tm/RLGUfJQy7isMNlv6ByElsWo7n9B/8XKOgxconjqg=;
 h=From:To:Subject:Date:MIME-Version;
 b=H6VCDy1vy0maZQJOU8qkpGHtUrTqIZu57ImBH6EhW2stgseLc5Yx/BxUXhhKUoOV9
 f5ugUYduYlaysmGnYR3Mm6lwciFG9KG1Pp0TD70mV62bDgYH1V+kGqjw9h89mB5Ycz
 aJ9KWDhbKyYr0MF9nLwjO3fxRZkfYXbu8lqBwBKE6oMvz0V4TJWJNl0TlV1r09l5KM
 UGbIu5DZPuiK9bcDRgjQ1u+kAs38eNrCM5HA2KzpvTyvT/GTE8KR9zvQLB12/tVkqo
 YtcaF6MBt9+SuCnPcEh6BZOLrX9RBZ/5hQxqau6pSEvJsReKsUe8TJxhDvi0R2YyWB
 OObcKiTYxhRmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=H6VCDy1v
Subject: [Buildroot] [PATCH v3] package/dash: fix build failure due to wchar
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

Since commit [1] package dash requires wchar so let's depend on it to
fix build failure. Doing so makes default non-busybox shell dash to
depend on wchar. This is too restrictive since this way wchar becomes
mandatory, so let's switch default non-busybox shell to bash.

[1]:
https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=c0674f487c7aec2a3bdf6795cea7e60c9530c360

Fixes:
https://autobuild.buildroot.org/results/e9108ebd9fb8c471add1c5a7f581757175fa5f15/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fixed commit log and Config.in comment as suggested by Edgar Bonet
V2->V3:
* fixed missing dependency and default non-busybox shell to Bash
  as suggested by Julien Olivain
---
 package/dash/Config.in | 6 ++++++
 system/Config.in       | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/dash/Config.in b/package/dash/Config.in
index b816ac7837..3573a40aa3 100644
--- a/package/dash/Config.in
+++ b/package/dash/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DASH
 	bool "dash"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_USE_WCHAR
 	help
 	  DASH is a POSIX-compliant implementation of /bin/sh that
 	  aims to be as small as possible. It does this without
@@ -10,3 +11,8 @@ config BR2_PACKAGE_DASH
 	  for most tasks.
 
 	  http://gondor.apana.org.au/~herbert/dash
+
+comment "dash needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_USE_WCHAR
diff --git a/system/Config.in b/system/Config.in
index 0652b94a3b..68e76ccc14 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -399,7 +399,7 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 
 choice
 	bool "/bin/sh"
-	default BR2_SYSTEM_BIN_SH_DASH if !BR2_PACKAGE_BUSYBOX
+	default BR2_SYSTEM_BIN_SH_BASH if !BR2_PACKAGE_BUSYBOX
 	help
 	  Select which shell will provide /bin/sh.
 
@@ -418,6 +418,7 @@ config BR2_SYSTEM_BIN_SH_DASH
 	bool "dash"
 	depends on BR2_USE_MMU # dash
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_USE_WCHAR # dash
 	select BR2_PACKAGE_DASH
 
 config BR2_SYSTEM_BIN_SH_MKSH
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
