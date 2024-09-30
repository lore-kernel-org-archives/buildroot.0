Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A36CDD1A9
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 19:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A51402D8;
	Mon, 30 Sep 2024 19:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYDQ31v4T5J2; Mon, 30 Sep 2024 19:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2D80402BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2D80402BA;
	Mon, 30 Sep 2024 19:36:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6E841BF4E5
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 19:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B26C3402BA
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 19:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhcsAxwQgGww for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 19:36:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB8574029C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB8574029C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB8574029C
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 19:36:43 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 969A5B0053D;
 Mon, 30 Sep 2024 21:36:38 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Sep 2024 21:36:27 +0200
Message-ID: <20240930193627.50229-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727725000;
 bh=eXY07Z7B305LE5xg8WvgNxAOSIF1GtqgVvk1ugZhTgs=;
 h=From:To:Cc:Subject:Date:From;
 b=KLd7ANcFPEk37eWpnh8nmNNMTQkOsiwU8fUuZ72KT2FWR+kB7NvdcoxGK3KMdDueI
 bzD8L+xgim1u329TyllkKr8k3Ohen6yBYD65MuVohs047RE6dHSraPKQTlV+WXxXiL
 8l7IdorvQlu8J4DTmjva4XYls5ygvWEWXIEhjUXRlaHLxmkAPxVWzBzuP9rAAttpVZ
 mW+xK8IkvD/hjR56tVbkoeZ6rzWE37w9UShNSNLwK8kiNXFd9HNedvGONeuduNNTp6
 xr2htjdEbwfo8LflHFXKpst+gRKL0ARi6IsJktW4CNfEHCcqLzCEqBHPk30gYUBvXE
 CJ6KrShDEN2dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KLd7ANcF
Subject: [Buildroot] [PATCH 1/1] package/liblinear: fix _SITE url
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package _SITE url only contains the latest version at a given point
in time. When a new version is published, it is replacing the old one.

This issue was not detected because the archive was downloaded from the
sources.buildroot.org backup mirror, when the primary source became
unavailable.

Since commit 559bb33ae "support/testing: do not use s.b.o" [1], the
runtime test infrastructure is disabling this backup mirror. This
makes the nmap runtime test failing [2], which is using liblinear as
a dependency.

The liblinear package author confirmed in a private email that all the
releases, including the latest version, are all kept in the "oldfiles"
directory.

This commit fixes this download issue by updating the _SITE url to that
location. While at it, this commit also change the url to use https
(since the http equivalent redirects to https).

Fixes:
- [2]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/559bb33ae71dd2358ca2314ccb24b56cc3809fc1
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008007

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/7957597476
---
 package/liblinear/liblinear.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 014f9e2de4..134673a230 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBLINEAR_VERSION = 2.45
-LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
+LIBLINEAR_SITE = https://www.csie.ntu.edu.tw/~cjlin/liblinear/oldfiles
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
 LIBLINEAR_INSTALL_STAGING = YES
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
