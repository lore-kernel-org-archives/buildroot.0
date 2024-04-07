Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458CACD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 108F040B98;
	Sun,  7 Apr 2024 19:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKng-xZVyX4v; Sun,  7 Apr 2024 19:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12ABE40BA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12ABE40BA0;
	Sun,  7 Apr 2024 19:56:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B344A1BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FCA8403EA
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTvDu2jx1ChU for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE8DF40B98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE8DF40B98
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE8DF40B98
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:56:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-343f62a762fso609566f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519787; x=1713124587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KAVaxKensKN2CZs/9JjDJ8pHSFztsjrkyOmDZD2hkMI=;
 b=Xq0gJh0ArQM7+0oTpFLL/BefY6cqocNwA2L6bSfECJe+6rnrjabWAmw3hYlI3MnHx/
 03PypT1qu68UlCNXDzE8K8LFCJxLER97Rq+CozJRInFMHS0lt4C+DVtXfBv9jGF7sjXP
 LX/RkzopqmdRC+Wx6XPZ8IfOUxafj8raXW0PWvfU+8MzEuwPjOMSSlyvNWjRiDcKouOl
 wim8CkKKznp4lNygcEtkhxEASpeJ60knkxdXm/kGyCgiYfhLQAMWwcCwyKHELx21ZD3h
 l2RPkhvDE8NE8yhYGES8dJBYJlt6hW8GBtAYl0KE6SvmR6BDVSykFzzGpxSmE2+5//Ni
 Z8pQ==
X-Gm-Message-State: AOJu0Yyv3gxVlg3vOd516EtuVyDXU090JWiWst5jQ5zZEDBPLKmey2d7
 hBv+Z6pqAnHaSHzLng9CNtYqZjmSCKKEggL7IcnqdRQielYl0u5YDrGXK1Zb
X-Google-Smtp-Source: AGHT+IHKxFOA5+FUkqRjcJIdgP/qBHHWA+AFuv+fyGgtFD+vQRkIH/laPdD9smYte4r+zte0Cl1X9Q==
X-Received: by 2002:adf:e4d0:0:b0:343:8097:3e3 with SMTP id
 v16-20020adfe4d0000000b00343809703e3mr4304346wrm.40.1712519786958; 
 Sun, 07 Apr 2024 12:56:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c9-20020adffb09000000b00345c2f84d5asm376047wrr.10.2024.04.07.12.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 12:56:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 21:56:24 +0200
Message-ID: <20240407195624.3362430-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712519787; x=1713124587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KAVaxKensKN2CZs/9JjDJ8pHSFztsjrkyOmDZD2hkMI=;
 b=U0kVNNdcr7MvFujKNPNBMu1iqGeuYX7GBlmr7sS8XHf688T+pNqcSxmNya9K31Wgho
 8tH69Vi30MHvKLTsM/tzLl+NNJdwSdOLLXArDZV7fg2ChpqqHHi70gycobKzoB/8D/yi
 fARLLrR/fCY3gFCgYhpusflONfiiflpF0YnxSbN6anjheErt5WNdyKd57q30wnFsmADu
 +EoKTSoLtFZ3aCPB7wauwtvLr3kh8wnSNwHigVt90VtARl0NX01mA4mJFd9ulAoAPdFh
 CN4/WhZ4IeoaQD/UNQzworYdSoH0NfHGNc4a7TJi3CrJAGqTO3sBq90Zk6iDi4XnxQia
 Teaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=U0kVNNdc
Subject: [Buildroot] [PATCH 1/1] package/opensc: add zlib optional dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zlib is an optional dependency dependency (enabled by default) since the
addition of the package in commit
8aaa7ecbce1d10cbcd880c3da5e429988f96176a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opensc/opensc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index f4dc2206ea..008de9d4c2 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -20,4 +20,11 @@ else
 OPENSC_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+OPENSC_DEPENDENCIES += zlib
+OPENSC_CONF_OPTS += --enable-zlib
+else
+OPENSC_CONF_OPTS += --disable-zlib
+endif
+
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
