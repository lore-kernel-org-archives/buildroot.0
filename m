Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E38BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 14:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1A7260E50;
	Sat,  2 Apr 2022 14:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QuDWyjIXERCV; Sat,  2 Apr 2022 14:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9BAB60BF0;
	Sat,  2 Apr 2022 14:16:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91AE81BF96B
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 802174184E
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svZuAwPIgQTf for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 14:15:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31B1A4184C
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 14:15:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C179C60003;
 Sat,  2 Apr 2022 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648908938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NMl8OITbofrH9thy4BY9OzAR+lGdcRPSo6xuhZ3zCg=;
 b=A80OA9mAx1476dtZIZKp6Mq0CuIhwcye/uBP+EreTARfZSHMVKHq4KMJD0N4sACK6cDESz
 sqT/3Pd38uvqQG35U3b5YP8eK+gF+6nkEjQM5UjUjnDJJM+3Nu2t4wunxy3eNM6sk9sPoz
 Zx17ghG6HpngP81Sxt7BUsf2x/C/hKbxOVde1gDEIJU4C/d/R5NJ+k6CmB8VgzMghuzPl5
 x4mOUS3kOmQUqKE6l2zTR8gQxFE/uUITQ+M/5pyLoJNFoKBFUBZ6tZOYGhf4iMjNlbuMo1
 BpmYjhNdf6/uJks66/wnOyh9feSy1KOIMy8qIFgxUqt0F/9uku1bfgUg1WEJ/Q==
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 16:15:28 +0200
Message-Id: <20220402141531.1320584-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
References: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] support/scripts/pkg-stats: allow disabling
 package warnings retrieval
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

This is useful when debugging/developing the pkg-stats script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ef9482ed95..329b30a5ee 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1125,7 +1125,7 @@ def parse_args():
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
     parser.add_argument('--disable', type=list_str,
-                        help='Features to disable, comma-separated (cve, upstream, url, cpe)',
+                        help='Features to disable, comma-separated (cve, upstream, url, cpe, warning)',
                         default=[])
     args = parser.parse_args()
     if not args.html and not args.json:
@@ -1167,7 +1167,8 @@ def __main__():
         pkg.set_license()
         pkg.set_hash_info()
         pkg.set_patch_count()
-        pkg.set_check_package_warnings()
+        if "warnings" not in args.disable:
+            pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_cpeid()
         pkg.set_url()
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
