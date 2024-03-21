Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CBFC6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 18:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D29364033F;
	Thu, 21 Mar 2024 18:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPopLgOUKEHX; Thu, 21 Mar 2024 18:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86E6D4178E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86E6D4178E;
	Thu, 21 Mar 2024 18:21:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D62FF1BF359
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 18:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1BD5415FE
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 18:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JcovwZHSiSQ for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 18:21:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2FFC415E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2FFC415E9
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2FFC415E9
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 18:21:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 99273CE13C4;
 Thu, 21 Mar 2024 18:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F36EC433C7;
 Thu, 21 Mar 2024 18:21:36 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 20:21:25 +0200
Message-ID: <20240321182126.24115-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321182126.24115-1-jarkko@kernel.org>
References: <20240321182126.24115-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711045296;
 bh=YGWiULSaNU10OZ6CDQ7G9cm1NrRHmP/it+bwGBujYIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TlL/Gg2sanxsDBrVcVAMvKnXhmGW4Vfg/1tzobMxzvya5TZx0YNnBoaMyyCA19HUG
 6DTaaOtBPD40NEYK2Wxezclz/84QISwX/pdt/Be2xEgIKM3VLQ65xazg5y008mAkgN
 3RyKV1k2t7kiOzjJi+9TglIYg7njwqRuFSHNh5KPx6qo0iXPpMDEo/QFyz0yFZCuD8
 xPTuiWI+fIzNg/wpGNr7M8FDfNcKnX201yxmc0R9t2UJ47ZDFIiTn6x9yXae4cKm5M
 LZZFBr7790BsJ5FyTUnJQCJQhEhRzZMN/7QD1SzGaT+ed9PH8bdc0axCJcPOCECtFD
 g8Ssq7T+yNcVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=TlL/Gg2s
Subject: [Buildroot] [PATCH RFC 1/2] package/json-glib: add host build
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 package/json-glib/json-glib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index cd53f24cee..c42506993b 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -34,3 +34,4 @@ endif
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
