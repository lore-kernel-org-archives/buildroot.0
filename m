Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D6CC5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 21:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C84381425;
	Thu, 13 Aug 2026 21:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KaG-zHr2FTUn; Thu, 13 Aug 2026 21:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4406D8148C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786656926;
	bh=m3ZFLjkk6N/xWbsFfTUZgEr9rv2glof74gmGIn9W9Ms=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q6IPxNvAkYrRiCYAAYlrN6obbYUZqnERGctCr1bd1h4nOtzSMMi/hKct/2kVpNrlM
	 7/02Fzb4dY9aiB4c97/BizKNdc52ZXYSCgTmFJSqSMzuJS/gHQPXCaEDHKX9ALYVt4
	 OfNRgDYGuaPird5tet9h5gobsu/D9Bc/ByKUjFtOMocCHq/iaeuoDni3Ke/3XMWMGX
	 Zkh2CDCRYvV+HkTmpilm+HFrmFnYAcYX4/N5bGjr2IDNU47z1QFyabVbMMkexL4N/z
	 4jxX4G9hhNAt2G5G+JGNKNKmBXwJWy4Tv0BBByGttgeKuB+JYf5uptKhq/d9U3eAxI
	 wzrV7lQKMD++Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4406D8148C;
	Thu, 13 Aug 2026 21:35:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F9E233B
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 21:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2622F60DED
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 21:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEBxx2-7-i-C for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 21:35:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4E7060DE6
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4E7060DE6
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YkW2Ostb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4E7060DE6
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 21:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786656920;
 bh=+nR3MKvBt9N8kH8ffEvIT7chcAsythgQLRfo48DOqDU=;
 h=From:To:Subject:Date:From;
 b=YkW2OstbRDaxyZmQa2KDDunLlUp/iuo1WMGHgiay+hS+AXR7TDuZ/A/0uIGJDo6Vb
 o4ZpDtJrKdGE7TUPghEmWK450ZAXnRhYuEdYFfLUKLpNdL1uqCr9Eiu0ROKy1EobM0
 bFUVZJVV9bfbWV1opIekxrbmAqQ5jmmFwMZ9apKUfC1RvQCn9FAeu6gDc5qyT7N3St
 owrbCitsUD430BDFuLt4QdVCS4cuyG9xbcDT8Imx6Ac7eunL2hSei1iYnKAfhJ3Q9X
 5ZF/tTYnKKonGFMOBdKzFjhNkcYJLkoe88ik8zzgEV6WS6cLjAGRFSccusmY8s3ngp
 Uv2GB8qoOMn0A==
Received: from fli4l.lan.fli4l (p54a1bf47.dip0.t-ipconnect.de [84.161.191.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3FBF9A4C4B24
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 23:35:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45278)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wud55-000000002sy-2pS9
 for buildroot@buildroot.org; Thu, 13 Aug 2026 21:35:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 23:35:19 +0200
Message-ID: <20260813213519.3653758-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libglew: bump version to 2.3.1
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

https://glew.sourceforge.net/log.html

Switched to sha256 tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/68b1dade7e0b49f2d0093a6b8c6ef51ba14f4d58

when https://patchwork.ozlabs.org/project/buildroot/patch/20260813213348.3653337-1-bernd@kuhls.net/
was added to the tree.

 package/libglew/libglew.hash | 3 ++-
 package/libglew/libglew.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libglew/libglew.hash b/package/libglew/libglew.hash
index 29e63fa308..ded463a609 100644
--- a/package/libglew/libglew.hash
+++ b/package/libglew/libglew.hash
@@ -1,3 +1,4 @@
+# From https://github.com/nigels-com/glew/releases/tag/glew-2.3.1
+sha256  b64790f94b926acd7e8f84c5d6000a86cb43967bd1e688b03089079799c9e889  glew-2.3.1.tgz
 # Locally computed:
-sha256  d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1  glew-2.2.0.tgz
 sha256  8991cd11befec7c6a63662700f03c0cc42e864b6e77c7e70b80297c951a7f0ff  LICENSE.txt
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
index c9c49e6987..6c9e09c718 100644
--- a/package/libglew/libglew.mk
+++ b/package/libglew/libglew.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLEW_VERSION = 2.2.0
+LIBGLEW_VERSION = 2.3.1
 LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
 LIBGLEW_SITE = https://github.com/nigels-com/glew/releases/download/glew-$(LIBGLEW_VERSION)
 LIBGLEW_LICENSE = BSD-3-Clause, MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
