Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26659C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 17:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8369760B7C;
	Wed, 27 Dec 2023 17:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8369760B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEvhYyJvcXDV; Wed, 27 Dec 2023 17:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C042B60C0B;
	Wed, 27 Dec 2023 17:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C042B60C0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10B891BF5A8
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDB58813C4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDB58813C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjlQaWbIkWdA for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 17:08:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32921813B0
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 17:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32921813B0
Received: by mail.gandi.net (Postfix) with ESMTPA id E4380240002;
 Wed, 27 Dec 2023 17:08:03 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 27 Dec 2023 18:07:58 +0100
Message-ID: <20231227170759.2902227-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703696884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9yyYBbcFaYix/spNtYFaVO8lakzY7/RhjyVBczgGl/g=;
 b=VReMxNHo1tofh0Khq4fQqk9egPcAfh2AXlKlTL9WcNWXqix7Hg2Wbt0ZU/oCbjEVRA8Aj4
 c1c+Qv78z2RdPojnPk9+yhcsJUZXJy5RtYJMvu1JZKbEAxTHyyZZSywRDbSq+NWdLDUZbp
 En4bJiIN457TMGr9J+3w+Wqyhwh5/rewX8+2M0zpq47Zpp3jisZjjVCe3gshUpi/KQEc0C
 SXmnO5nbrXnnhfqRueQSKqtpzTfCv5tn8Xwea70P+zOu67trTaHmmEZjsV4NkWp2fyjddy
 2skh9lHZd6lPkCh4zyiC5dU7DEJzUO+SjCun+gBRJ3aCog8dRkqxUwbspTZwGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VReMxNHo
Subject: [Buildroot] [PATCH] Config.in: rework
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_DOWNLOAD_FORCE_CHECK_HASHES currently has the following
dependency:

	depends on BR2_GLOBAL_PATCH_DIR != ""

However, strictly speaking checking all hashes does not necessarily
require using BR2_GLOBAL_PATCH_DIR, as long as you don't use custom
versions.

But more importantly:

- Having this dependency means that this options is hidden when people
  don't use BR2_GLOBAL_PATCH_DIR. Instead the option should always be
  made visible, encouraging people to turn it on.

- The Config.in comment was there to mitigate this previous argument,
  but this comment then shows up all the time when you have an empty
  global patch dir.

This seems over-complicated, and it sounds much easier to have the
option unconditionally available, and visible, and clarify in its help
text that in order to this to work fully with custom package versions,
BR2_GLOBAL_PATCH_DIR can be used to provide extra hash files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/Config.in b/Config.in
index 554b4062eb..75f699154d 100644
--- a/Config.in
+++ b/Config.in
@@ -711,20 +711,18 @@ config BR2_FORCE_HOST_BUILD
 
 config BR2_DOWNLOAD_FORCE_CHECK_HASHES
 	bool "Force all downloads to have a valid hash"
-	depends on BR2_GLOBAL_PATCH_DIR != ""
 	help
-	  For packages where a custom version or location can be set,
-	  Buildroot does not carry a hash for those custom versions or
-	  locations, so the integrity of such downloads is not verified.
-
 	  Say 'y' here to enforce downloads to have at least one valid
 	  hash (and of course, that all hashes be valid).
 
-	  Those hashes are looked in files in BR2_GLOBAL_PATCH_DIR,
-	  see above.
+	  By default, Buildroot checks hashes of all packages
+	  downloaded, except those for which a custom version is
+	  used.
 
-comment "Forcing all downloads to have a valid hash needs a global patch and hash directory"
-	depends on BR2_GLOBAL_PATCH_DIR = ""
+	  With this option turned on, Buildroot will check hashes of
+	  all packages, including those have use a custom version. In
+	  order to provide hashes for such packages, additional hash
+	  files can be placed into BR2_GLOBAL_PATCH_DIR directories.
 
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
