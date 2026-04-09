Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51959E9DE6C
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2913441093;
	Thu,  9 Apr 2026 08:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkvFeNfyOe2c; Thu,  9 Apr 2026 08:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D858541025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724227;
	bh=xF2BjR1fIS6wX6c/iU7w+ysCod5znz2IHSPIk2Q/WSs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlaRZVv9kfdkxvonflTZLwSQkezx4akU4H05wJASekXV/X9fLW0afzPB9QrhgqArs
	 3H0rNH5s/g5GD89WRqiUZI4My3rnSnwae1ysNqMz9a9VO1ddQdmiu2m7u+O2XKBxIl
	 u7vcTaJ0tIFwPM5ndxXHUfMHK2I/MKQlnkuI+QE+/NrBP2h3q2HYawQwPjTG+06Fr6
	 e4Soh7wTrfJjgQvSXmcMs8t/m8R5jiKX+KXy/KY/uWTtS8N8qJuPwEtf7rnPAW5qYi
	 3tPPnuFMy+wMrPdQJNxP66enfAsMUc1e9ItXDUd0cVpU+Tohx6dn48JXCE4GvofOC/
	 9faCg/Nih9N7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D858541025;
	Thu,  9 Apr 2026 08:43:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95EBC237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 873FF82950
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdGiaYS6UXZc for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:43:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 788DA8294A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 788DA8294A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 788DA8294A
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:43:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D18CDA4C023F;
 Thu,  9 Apr 2026 10:43:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyh-000000004SH-0Qyh;
 Thu, 09 Apr 2026 08:43:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:42:51 +0200
Message-ID: <20260409084305.3960494-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724197;
 bh=6SnzFwWmnQ20FwfNLFPxE6U8l/SUem1K8nreHo6kRwk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=S1D4V2QC6OS/eEqsaX0y/fLl9FpTVJ7zUisK5sjgKASjy7CsHTzmRBR66C51nBNgl
 OIlFOh5ZkjzIhcKfRe6tl4Of/IDmPuG668055D1g0UQoXL6MCE/9DoRl/mfWIuld8T
 wmMmuA4b8LBsCKnGTTw778ADb70YGRa9eudrENgboGQW8O0Znb+MVJCBvyKrV9uGK9
 KtweZ55o3RbYCdz9osT0Fw0F9094hgE0pWM/2XmkPgdZ5mqjcY0rsdb3mwVV9KcPsN
 FnCawkcjhm5hclIM1kNoresJzXx2qx0IIbkEkd4NFzI3MrobAvSX9LCKa5cw8VBv2h
 HyIFegRIsnLhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=S1D4V2QC
Subject: [Buildroot] [PATCH 07/20] package/haproxy: remove optional support
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
 package/haproxy/haproxy.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 51878e754f..9504ec6b7a 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -59,11 +59,6 @@ HAPROXY_DEPENDENCIES += pcre2
 HAPROXY_MAKE_OPTS += \
 	PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config \
 	USE_PCRE2=1
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-HAPROXY_DEPENDENCIES += pcre
-HAPROXY_MAKE_OPTS += \
-	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config \
-	USE_PCRE=1
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
