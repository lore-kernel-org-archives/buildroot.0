Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97B4C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E6060A70;
	Sat, 15 Jul 2023 15:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E6060A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYRRWWlN_Bpx; Sat, 15 Jul 2023 15:06:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D1C60AA6;
	Sat, 15 Jul 2023 15:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87D1C60AA6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 836821BF861
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68F3B60DFF
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68F3B60DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lCL32FUd1i9P for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:06:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D42A260D4D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D42A260D4D
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:06:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7AA0EA4C0FCB;
 Sat, 15 Jul 2023 17:05:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKgq1-0002tE-1J;
 Sat, 15 Jul 2023 17:05:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:05:25 +0200
Message-Id: <20230715150536.2959313-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715150536.2959313-1-bernd@kuhls.net>
References: <20230715150536.2959313-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689433537;
 bh=9H4fHJuFHbo15/prGEwAL+J5V6PRVq2yRshQjeuY8zI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bXeYIH8vw9AKivQftSU5ql7np29kbZRDfm7THPTa1fLttTHqhb4ffGGdt7Gz3krVo
 XBSEBVPS+gZii/kokbfgmYn4IycQEZLhamIlljtCJBg+CLB7QsH+/KHysorNLGhSp2
 B5skeK3DG5Io+0JN8HVKc4tdbh+rLUUMdqvoYx4vHFkMGI9yxlp3O36Fc0lqN9jhBQ
 MPfI7Bn+6Qt0RBlQoD0dac0dw/xbC2VWK6bym/iR7uyHjAZxS4HRurIxrYW38hgSO1
 4y+8PbZNpQD7ffQRehNIr6FSsMvzID9i482SejW21PZYgw0R3kxTO3egcCFE6xsaTt
 ZVF1TYAdSkoQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=bXeYIH8v
Subject: [Buildroot] [PATCH 09/20] package/erlang-p1-pkix: bump version to
 1.0.9
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/processone/pkix/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/erlang-p1-pkix/erlang-p1-pkix.hash | 2 +-
 package/erlang-p1-pkix/erlang-p1-pkix.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.hash b/package/erlang-p1-pkix/erlang-p1-pkix.hash
index c58dc5c2c5..2b9c4cc93f 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.hash
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  257171bec3fe495cd390c3a987131893a0a1a0b22e5973ac3cba9c354cb72324  erlang-p1-pkix-1.0.8.tar.gz
+sha256  a9adf7d16494c1a1b572b46fc9ee1d28996b3d4bcb7a433395dfe120cee0c0ae  erlang-p1-pkix-1.0.9.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.mk b/package/erlang-p1-pkix/erlang-p1-pkix.mk
index a7ecb08ad9..90c4122184 100644
--- a/package/erlang-p1-pkix/erlang-p1-pkix.mk
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_PKIX_VERSION = 1.0.8
+ERLANG_P1_PKIX_VERSION = 1.0.9
 ERLANG_P1_PKIX_SITE = $(call github,processone,pkix,$(ERLANG_P1_PKIX_VERSION))
 ERLANG_P1_PKIX_LICENSE = Apache-2.0
 ERLANG_P1_PKIX_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
