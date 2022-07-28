Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C436AC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 08:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA9382796;
	Thu, 28 Jul 2022 08:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA9382796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsD68jIVETp1; Thu, 28 Jul 2022 08:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 722EB8261C;
	Thu, 28 Jul 2022 08:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 722EB8261C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11E161BF2BC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E03F940AC5
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 08:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E03F940AC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hnT3YejeT-Su for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 08:14:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8FF34012E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8FF34012E
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 08:14:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso637390wms.2
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 01:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0k429Y+hxSquQPxp75jrZqMfC9t2hDKK/eO/pIuxCs=;
 b=6/mL3ErTOfsBg8SGYwMBV2ItEprARVf4dzdpJ8LyYnIEY++w6qcSjfrSCF9tB4Amzq
 L+ZwGYgQ3flWmre/cvJ5PT2gC0MlEGWRyC1F5HqXFdi8DERDtJAcpdDRAdx7ejLaN7Ba
 6G77ZgpLnVlaffLlB+RcxD93SKFQWkYQk+nOhxZ81BdXlWuKiungGvk+mp6YxZzp/sfJ
 bUFdtgkVG7QQXhGAAX9mrAVvfV6GKsgAIyjsxf/LcXrULTh3iiqZCX0xanKSU/M0f40E
 J04XmOjKw2CxbQorn6zUKNarHpKT/4MsThI9jGSvK0lJrgmiWmaWnFliU1l9rSHzvnaV
 PgzA==
X-Gm-Message-State: AJIora83axqhFqSw0WNbjM+YwbXJ18ml4YNQ7MboYapv9c9atxzAscJt
 0bSc7IeKAchcWUPLe0HYj4iB0FBlI3A=
X-Google-Smtp-Source: AGRyM1s7suuslq3N41HJ09meBdH3ECRvHwWIJ8CZl2h7wqh0548Bm6IESlqtc9uWN0+vyLgRP5yBcw==
X-Received: by 2002:a05:600c:3510:b0:3a3:34e7:cff5 with SMTP id
 h16-20020a05600c351000b003a334e7cff5mr5715504wmq.191.1658996060660; 
 Thu, 28 Jul 2022 01:14:20 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c191100b003a342933727sm5996335wmq.3.2022.07.28.01.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 01:14:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 10:14:18 +0200
Message-Id: <20220728081418.1697171-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0k429Y+hxSquQPxp75jrZqMfC9t2hDKK/eO/pIuxCs=;
 b=eujT7sCrGwdnpD5L98ysGk5zcJDv3Ivml9oIE1moAyk/Y0wLtNmnb2B9mOZn9stRQk
 di3QRP9MhKiY2ewAfRAA2WL0fkCHKKQVVyLo8SXdTc1oKBxenyb/2HmWZDa/XCeuLr4L
 PBdAVFO5mU1WgFkLN2/f56F97elyTzo1/FlM5pBUp8H64oxaSvZXEV4ajwcASsTnnaKy
 47yHYyH8+OLVToYwyYcvBtESuS5TKVs23sJdhgHgnoCMUesRDU5zR3iSYyKFYK9JBWZn
 xEcLKNLRPrHOUDSjZykIiGk8GrC/O4sqi8o+OxtUnZEqhAo/God7PPE+aiMOJSUuezLe
 zOfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eujT7sCr
Subject: [Buildroot] [PATCH 1/1] package/earlyoom: fix build with kernel <
 4.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PR_CAP_AMBIENT is only available since kernel 4.3 and
https://github.com/torvalds/linux/commit/58319057b7847667f0c9585b9de0e8932b0fdb08
resulting in the following build failure since bump to version 1.7 in
commit 07b7f88668b1e51e3d17e14bd8795ef042df144e and
https://github.com/rfjakob/earlyoom/commit/9edc5cfc9ad794ed59baec5e6ee8d1060456a315:

main.c: In function 'main':
main.c:119:11: error: 'PR_CAP_AMBIENT' undeclared (first use in this function)
     prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0);
           ^

Fixes:
 - http://autobuild.buildroot.org/results/5a0ad7e1f6de3c37e40c37d8f583fc699a457753

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-main.c-fix-build-with-kernel-4.3.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch

diff --git a/package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch b/package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch
new file mode 100644
index 0000000000..8233800cd6
--- /dev/null
+++ b/package/earlyoom/0001-main.c-fix-build-with-kernel-4.3.patch
@@ -0,0 +1,45 @@
+From 499e81bfcdd9379bf4619a7c3ad85ed7f2b1dca5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 28 Jul 2022 10:05:18 +0200
+Subject: [PATCH] main.c: fix build with kernel < 4.3
+
+PR_CAP_AMBIENT is only available since kernel 4.3 and
+https://github.com/torvalds/linux/commit/58319057b7847667f0c9585b9de0e8932b0fdb08
+resulting in the following build failure since version 1.7 and
+https://github.com/rfjakob/earlyoom/commit/9edc5cfc9ad794ed59baec5e6ee8d1060456a315:
+
+main.c: In function 'main':
+main.c:119:11: error: 'PR_CAP_AMBIENT' undeclared (first use in this function)
+     prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0);
+           ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5a0ad7e1f6de3c37e40c37d8f583fc699a457753
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rfjakob/earlyoom/pull/276]
+---
+ main.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/main.c b/main.c
+index c068c7c..99ca9e2 100644
+--- a/main.c
++++ b/main.c
+@@ -115,11 +115,13 @@ int main(int argc, char* argv[])
+         fatal(4, "Could not cd to /proc: %s", strerror(errno));
+     }
+ 
++#ifdef PR_CAP_AMBIENT
+     // When systemd starts a daemon with capabilities, it uses ambient
+     // capabilities to do so. If not dropped, the capabilities can spread
+     // to any child process. This is usually not necessary and its a good
+     // idea to drop them if not needed.
+     prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0);
++#endif
+ 
+     meminfo_t m = parse_meminfo();
+ 
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
