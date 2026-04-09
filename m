Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0FBE9DE6C
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D78F410A3;
	Thu,  9 Apr 2026 08:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9LPncaLXkJZ; Thu,  9 Apr 2026 08:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 333494103A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724275;
	bh=FZKZGD+P7O/ec1alFGicqHL8YSeRzhCBQze1zqOZB+E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LhC1VpJfobMN3PjerdiPK3eevPxZEuZGHtjLujtJuSJULcVUTLefmRMYPw2bA8f53
	 jOt1IvYfDeHXYkfr8HCuIBvrACdCfdYJ01EsDP+BHj9bR0auDNX8L12jhHZv8rhlxb
	 rwE/b16J3tMJ/YylXlAxnA704EojVNNnAkNfoYUFO/qE+sfVmVuJmDMesKPnR1I7Jz
	 lgcicXVSW6opU7oJCMlAMLGvxMLS44YieBrnb1FYzKZJXgjYq10KH90+hvPcUQbjGF
	 XpjkI2SBZsRGmPddBym/LhdbtDvN52qkizLFj3gI1ktfLLxpyqYKr1iOR4QiFL29yQ
	 ynRRJUpDakbzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 333494103A;
	Thu,  9 Apr 2026 08:44:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2CD0237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A489682950
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sVJ8nWmr1lZ for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:44:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C4B78294A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C4B78294A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C4B78294A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:44:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C57DA4C08E6;
 Thu,  9 Apr 2026 10:43:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyh-000000004SH-0hfg;
 Thu, 09 Apr 2026 08:43:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:42:52 +0200
Message-ID: <20260409084305.3960494-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724198;
 bh=YW4exaXJBD8t/ge7nm/B4n2cMKrWA6SGYP/tWQJZFhY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PgpdhmtaMsvYz4VRahIDe3NzYhCJpYzFQ7FeR+qc8WcE0NVjqFX4mFZOM6nNnvV/D
 B04dBoujwpCc9Nqk3fNQd2T54vdAvAdjAzz+fcglxQ3q8UjoXtD0wjAxCOmO9Pz5WE
 a6QmuBAExGzk8eJtl08EEhOi9PCS4qj3hjITrHVlV1/1HXWhLXGF2MXxJKS58xENux
 2SzfSwb4E9vT8h0A5GAFBi8JrziTAckX0brF/2AqMjbhAzes7mAQMOZrQoV/lqu/fx
 6snPTi4reZQy3BSjZztWxew23glVeaOp8teKSBLfD3u9FFyew3Uz62AZwqlTkIPVeD
 /7cWlTzugomRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Pgpdhmta
Subject: [Buildroot] [PATCH 08/20] package/kismet: remove optional support
 for pcre, keep pcre2
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kismet/kismet.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index f182fbe328..a65a4a4510 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -74,9 +74,6 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 KISMET_DEPENDENCIES += pcre2
 KISMET_CONF_OPTS += --enable-pcre --enable-require-pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-KISMET_DEPENDENCIES += pcre
-KISMET_CONF_OPTS += --enable-pcre --disable-require-pcre2
 else
 KISMET_CONF_OPTS += --disable-pcre
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
