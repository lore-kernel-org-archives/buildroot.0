Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61303C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 17:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8D93405A2;
	Sat, 14 Jan 2023 17:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8D93405A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8lm6oblL4aJ5; Sat, 14 Jan 2023 17:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F9AA4015A;
	Sat, 14 Jan 2023 17:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F9AA4015A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4F71BF380
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06BD1415EF
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06BD1415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCTSZ_0mPY9X for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 17:01:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 502F5415DF
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 502F5415DF
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 17:01:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r2so23724019wrv.7
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 09:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjV9J7tepFXugB3xPt1oo7JvSjIIRg8XxiyonArRRBo=;
 b=dyEQE2CV+oKLDo8cf8SHR4uC4eZerYINbBa4kmuzm43v6ip3yhxV/OSG6D+Ph3N8q4
 cxxusW0Bc3XIYBWAyfAEapoKfrQ9+A1EiiIEog+neK9gQLqmafIM3Q8az4XbeWqYGGeH
 9XLSI28lEMpL2njoVMm63hP/UfxkhAb+izhKHifaEA3utbr68zD7GIS9SkvgVr0RVk+i
 jBauOMnT5fXXd1cO5A9s1X6F2JGJYGCNbklYLDDlV3lO6fx6cBOX6EDmu5Y+hcSBDUyj
 vxEaAnN+PDy1yKVf1f+so6+6rEbRlPIZxU14LXKWeYJbQN0br3pA7qa2tQ4VdufgiIX5
 QHwQ==
X-Gm-Message-State: AFqh2kr47SboMA56+zVsuK+Of0Txs6g+C3vYTaLrWLvcLvbRLG2YqrQH
 w9FwuIFiwnYP2hvUrcpwEaP1BmNp/Ww=
X-Google-Smtp-Source: AMrXdXuyXKYxx7WKc/3Eq8tBujcEC6ZtH1OIA3cwlZHSRmPcE39F3sxTBaNVtgdONi+QIx4bx3b6rQ==
X-Received: by 2002:a5d:5226:0:b0:2bd:e873:e20c with SMTP id
 i6-20020a5d5226000000b002bde873e20cmr3109135wra.70.1673715691749; 
 Sat, 14 Jan 2023 09:01:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bq14-20020a5d5a0e000000b002bdf2739cabsm1725691wrb.1.2023.01.14.09.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 09:01:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 18:01:25 +0100
Message-Id: <20230114170126.1085188-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EjV9J7tepFXugB3xPt1oo7JvSjIIRg8XxiyonArRRBo=;
 b=inqlK2EVTsrNEuyFrAxdlfeMzr04W/6Ly+do9vDMgbcevBmdbUykOgiJbbridIaHwR
 9Kx4WvQ/6FZj6jTxvYR0/qgVPERnwyb8pTTBVClFc409fDznbd/jJra8rZYH7BNmIoVf
 wq0PQzK98fyeC6p8sLFXm+v5eJEIATtztWEjWNnITefjhIvEIjVx/H7eG0/nLImPAHXb
 JQxR4dYjdAynnf5IXEFOQ7Efgk6bCsXy8INpmsiRtOtnCvD/OkN7GGebAFMluA1d8p7n
 RBLabBvGMBUZb6g53Hic3y/4frtDWuaVw8lVUSfjFCXDb8aMPRO0NL+2nMdO2FvqvPIK
 FW6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=inqlK2EV
Subject: [Buildroot] [PATCH 1/2] package/janus-gateway: add libcurl optional
 dependency
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcurl is an optional dependency which is enabled by default since at
least version 0.0.9 and
https://github.com/meetecho/janus-gateway/commit/ca9c0a86f975f88fbdd791af3cb4f8986883c1c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/janus-gateway/janus-gateway.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 0d906f1b62..dd898563e5 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -128,6 +128,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+JANUS_GATEWAY_DEPENDENCIES += libcurl
+JANUS_GATEWAY_CONF_OPTS += --enable-turn-rest-api
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-turn-rest-api
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 JANUS_GATEWAY_DEPENDENCIES += systemd
 JANUS_GATEWAY_CONF_OPTS += --enable-systemd-sockets
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
