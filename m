Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C79ED6AAF7
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 18:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D151280C8F;
	Thu,  2 Apr 2026 18:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGokYjmnPW0s; Thu,  2 Apr 2026 18:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F11180C69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775153139;
	bh=qK2SkrphKGo+GY9n0Er/sOq6fD9vj7dOWJsqmRNxPoY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CzJsXKeof8ksLs+6Vk5VUCUxgAZQJK0GW2Wqqw/S5TnEoHZicGaBOhvdod3khtEEw
	 d5SVJQ6bqbu0DCzA5fSI6kIyh12Ux66j4GIydhN+kTiEwtiXwozYm07if0XQ/9pXsn
	 9+vL9vOuLFmI0nzHbhLF3W2Jefd3lnsobaOlRA+MUMDWfFMZvBaZQv9+1zJ6okM3RO
	 c9dj4PHriNaWpSjdfmQSsyQKT7NUkaqxDnRq1YLeEQN/y9Eop7U0E3WFhtiCFoy5vm
	 P+GJwol0jR5lZjrzQLJQ4FbQY7Bh5wElixbuleSU4yxeMX0wBxUEYqDTWBQ9IYjup2
	 YAa5XkR6USyeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F11180C69;
	Thu,  2 Apr 2026 18:05:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB1B82CC
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8E8A40FC2
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnai7bu5DFjX for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 18:05:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D22B040E8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D22B040E8F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D22B040E8F
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:05:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12537A4C3596
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:05:35 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MQA-000000000Lm-2D7T
 for buildroot@buildroot.org; Thu, 02 Apr 2026 18:05:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  2 Apr 2026 20:05:34 +0200
Message-ID: <20260402180534.2780167-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775153135;
 bh=0rX3Vg2F56FQXFgRrXG1gihTdCktcCqJZXiIEwLpWNc=;
 h=From:To:Subject:Date:From;
 b=Qj02Gy7RxY5ChM+9BqJac+JbLoBVrUyuVmsq9pFXHSGA784cBAUsHXu/hV97B8ttH
 qfA/JKdHJdf1b03BSSUY47M0dYqDnJxn9dxD1n/A33tRo3iF9RfCpft5w/6CXy6kP6
 bsCBuE4d8TaTiWoweiUT7VbYxbTXD/vtcQ+rCG5Q4zRYrstbA6F+t19YjhvoSWr+gb
 H0xIo84VCjOVk12lUQcii0tyW0A/oXeRiG3FOqsyoUP2SoP2FBIH40AdUyfSse0ZaI
 KCrigdtCvtlJBgnR7kma1jVdvAwnVvfECHs5/60ZBQ1/u2fcELoZQfnxUbqwG+IW/8
 JdyF5SzdDLmQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Qj02Gy7R
Subject: [Buildroot] [PATCH 1/1] package/xz: security bump version to 5.8.3
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

https://github.com/tukaani-project/xz/releases/tag/v5.8.3

Fixes CVE-2026-34743.

Switched to sha256 tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xz/xz.hash | 6 ++----
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 99daa5e9df..488a3d55dc 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,7 +1,5 @@
-# Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.bz2.sig
-# using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  60345d7c0b9c8d7ffa469e96898c300def3669f5047fc76219b819340839f3d8  xz-5.8.2.tar.bz2
+# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
+sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
 
 # Hash for license files
 sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 8aa0716b18..91eedd7a83 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.8.2
+XZ_VERSION = 5.8.3
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
