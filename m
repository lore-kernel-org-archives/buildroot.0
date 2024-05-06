Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B673EC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EFB88133E;
	Mon,  6 May 2024 20:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEcBtxrSrL6q; Mon,  6 May 2024 20:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 792D882103
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 792D882103;
	Mon,  6 May 2024 20:02:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8CD1BF3CA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05C3A82103
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylf0gmq27Dx0 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D07108133E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D07108133E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D07108133E
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:02:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f5so16174855e9.2
 for <buildroot@buildroot.org>; Mon, 06 May 2024 13:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715025729; x=1715630529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tLI038Mt7gNKJxFhYCz/ROLV5/lxtOqd6Rb9znXXMsw=;
 b=V0jJ6vJr5wiDq6ETkxaCd+1X47BlKGfFrTxmaVGzIfzmOARpyJaejQIXv4XLNUd15N
 f3oZ2RX9nU+jIgtraXJ3KBqhZe4DvQd1rk/aY12GPsKUrZYjGYqcIbz8hDTRm32H+28A
 OIoh/I5rsXxgl/AmocqK1T3v4XoWB0CEF+3gP2XISs44n3DRRX0NCiPKgX9NkZeCnoBM
 NZDG202YVrlp5cKwe+zJxrbcK2prZ3uWPEp8hqly/OOTCIJuvYxtUeO+a1Ob5pV71/HX
 R5x7GZSxqqDATks1DximDarnWfVNIsXcRxAt+wykcxTE1yuZWGyu4HkPE2jerhnzfLQj
 g1KA==
X-Gm-Message-State: AOJu0YwTv+/FOPMBPeq2qruJ/DJXfGdRWziKyxsDoyaCDvpGOvYxZh9/
 Z70KqO8EnippUQZbDL6OQKuHQI0zAOJjFxSWao49NLiOB13gezNak7K2PA==
X-Google-Smtp-Source: AGHT+IGgm3CwHr+eS6+x4Iir9ARYuzn1+XQDW4lUWa8/P7gABfOASGQ97GKUEbBfiDMgceWOUrNDQg==
X-Received: by 2002:a05:600c:5111:b0:41c:14a4:7b05 with SMTP id
 o17-20020a05600c511100b0041c14a47b05mr8303083wms.8.1715025729075; 
 Mon, 06 May 2024 13:02:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 u21-20020a05600c139500b004190d7126c0sm20964992wmf.38.2024.05.06.13.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 13:02:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 22:02:06 +0200
Message-ID: <20240506200206.111393-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715025729; x=1715630529; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tLI038Mt7gNKJxFhYCz/ROLV5/lxtOqd6Rb9znXXMsw=;
 b=kklycjUfVx4/4kr42iwUnd8qelfP9UTLQHTBfPBHCztpaq0kmoyUOX4uzSLenFNMJe
 tr9/3lm2/iuSOQgojVcnexebt3bShkPDSmp4sx+Y4laZgI54gsZpnxNkXOmKbVt5Jv4n
 o0fhT3RoxPQFx27Fr8i/+K+RGsHSPGBEiwRRpYpMvdWuz51D97NR/VuLkQeQE++h7EN7
 6MD9QBogD9JxarzOdNSJrRTN/Ry5qCPPOm+tjUIAondSyBGtZ8bzb/CO3SDYgvx4026O
 T+UHBiPjwHgUPUTulzJIbRpWlutHMGC4vvZqxzGqVbcZ4uKT/L+9fs+//pbt02iYuMKg
 Mhww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kklycjUf
Subject: [Buildroot] [PATCH 1/1] package/pppd: add linux-pam optional
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

linux-pam is an optional dependency which is enbled by default since
bump to version 2.5.0 in commit 0c15169f5ae57d88a77df34cc896044a37c9597b
and
https://github.com/ppp-project/ppp/commit/2883dd07101bf851e2ea368f0c04c91aea85cff2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pppd/pppd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 616b843e3d..0a1eaf9209 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -17,6 +17,13 @@ PPPD_AUTORECONF = YES
 PPPD_INSTALL_STAGING = YES
 PPPD_CONF_OPTS = --enable-multilink
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+PPPD_CONF_OPTS += --with-pam=$(STAGING_DIR)/usr
+PPPD_DEPENDENCIES += linux-pam
+else
+PPPD_CONF_OPTS += --without-pam
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PPPD_CONF_OPTS += \
 	--enable-eaptls \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
