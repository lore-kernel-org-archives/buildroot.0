Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938F7D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 21:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 361C14082C;
	Sun,  7 Dec 2025 21:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJp6aZ0t7tiY; Sun,  7 Dec 2025 21:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83CF3406A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765144157;
	bh=ASZJXB8h7L0N2e9ciruErOAddzCG+oanxg/CdJfX+Fg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VziH6MsS5A3mi41Zha6S0Fr8fH5Rtav8S2NZrGYSbo6A/dnj+UWesM6M2+rxFNpsM
	 uB4u4NDOqh9jF1z4wXtRTtxcf4NZU4T3x+nhlZQA+vFWVJZeGDjXqYvITtUZdsdr/1
	 nbphK4Fjpqhj8wEZ30nDyacXA3gpIe1dpsfaiEJEi0cdwKiKhw3rwU8etLcwazOQho
	 4zxe/davWFKqSg89U7Fze433xcxac4uwE+rP5XHflWTr2KQNPVQFsMXeGB9KaBPvuw
	 YN6jzCMzF18+rCmZZEhuE433FRwHmmJPxSPwm0UfkjQAU+lU7/zCfO7J0IzXWXsdMz
	 38cWkTNK/An3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83CF3406A9;
	Sun,  7 Dec 2025 21:49:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32BA5E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F4AB81CEF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKF3kEHpvzk8 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 21:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E25C81D19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E25C81D19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E25C81D19
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 21:49:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.102.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O6e-1vU13R2XuA-009Row; Sun, 07
 Dec 2025 22:49:11 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun,  7 Dec 2025 22:48:48 +0100
Message-ID: <20251207214849.757334-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251207214849.757334-1-fiona.klute@gmx.de>
References: <20251207214849.757334-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:r9hc/MRqPMU13y8mh+SchjZd6R1U2s+/yADbH7AMulhUow12zK3
 pfjomKHIG5rMjfr7xFsAfoAtpMuQHWf657X3+2i10udD8XsUqTzBlLIkDbUzV3HL9f094u2
 k0+Iytwh0AfEV1BXNS34M36JSeu5WWfJWxTAhK1QmphKNumqBncdXw5z1bEDQ577iWUpztx
 OnCLnlAej9eM8BWCBBq2A==
UI-OutboundReport: notjunk:1;M01:P0:12s+3c4cgRQ=;H/cLwUDz9P1x52tQuytEw5NERLn
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1765144151; x=1765748951; i=fiona.klute@gmx.de;
 bh=pzP96W/P1SOFSeysydFmaL1YfLKAtaTzGdTBNqffy4M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ShWvm01SIDSh7r32WZm2z5mqIkg5Wn/vAcNfJ+vChsClphMjWBSXKDQrV7BnAh0B
 XH2izu6eL2ga79zvkOBxPiZZk4Mxwm6A+2VSIEULaLiuqbgeP3OIZ2laRiYGKwwoY
 Be//kSAVQShJWtkhUHr552NgZnhV2GUgv0wjzjyNRRTmJBShYXLjG/u+r7aqoxN7C
 OPfLMFpnKX0S2OtHcvJx4qZBLGUPvkbI4TgKFYpZDxv0dZ+q+Ef8eG1cNMYhmMFZk
 RPz8khNQUo79yFG9j8rYLpKA78Pe8EgmhcUgaa0RWP0BnapuJWHZv0Mci8rLL31i+
 LmTEzmQaV3w+qUW//A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ShWvm01S
Subject: [Buildroot] [PATCH 2/2] package/apache: fix checkpackage warnings
 in init script
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .checkpackageignore      |  1 -
 package/apache/S50apache | 22 +++++++++++-----------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9ef65e8724..09d29f8194 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -201,7 +201,6 @@ package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
 package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch lib_patch.Upstream
 package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch lib_patch.Upstream
 package/apache/0001-cross-compile.patch lib_patch.Upstream
-package/apache/S50apache Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/apr-util/0001-remove-checkapr.patch lib_patch.Upstream
 package/apr/0001-sys-param-h.patch lib_patch.Upstream
 package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch lib_patch.Upstream
diff --git a/package/apache/S50apache b/package/apache/S50apache
index b687419055..71e8837bae 100644
--- a/package/apache/S50apache
+++ b/package/apache/S50apache
@@ -1,15 +1,15 @@
 #!/bin/sh
+# shellcheck disable=SC2034 # checkpackage-required variable
+DAEMON="apache"
 
 case "$1" in
-  start|restart|graceful|graceful-stop|stop)
-	apachectl -k $1
-	;;
-  reload)
-	apachectl -k restart
-	;;
-  *)
-	echo "Usage: $0 {start|restart|reload|graceful|graceful-stop|stop}"
-	exit 1
+	start|restart|graceful|graceful-stop|stop)
+		apachectl -k "$1"
+		;;
+	reload)
+		apachectl -k restart
+		;;
+	*)
+		echo "Usage: $0 {start|restart|reload|graceful|graceful-stop|stop}"
+		exit 1
 esac
-
-exit $?
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
