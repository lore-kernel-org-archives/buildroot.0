Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDF8ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7F5081375;
	Fri, 26 Aug 2022 13:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7F5081375
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_4L5UeeUx2q; Fri, 26 Aug 2022 13:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C7DF81337;
	Fri, 26 Aug 2022 13:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C7DF81337
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F78A1BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B31D83EF9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B31D83EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-ng8ccYsi8w for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62EC082FA9
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62EC082FA9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bj12so3263501ejb.13
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5mp7siQU6xBaEgCuAA1Rl+aUp0A4xmaaXdCX6UXjqlI=;
 b=q3Dn0tEVt7FlywAQMIlswX9XbYdPTRJAS4qwlgHRAyK1YkPXPFbx0Rtq9qwT4m1vC/
 srDC96k0B5+pYw2OxYTVnjJdB8o2TXZiJOavyv7o/pZjPnGseKZhKqtqjAA1xCAQahjb
 VHqxSAt7GW6QmtIIeMm0TLIUoBU0eJbAjfiQxz3oWy8c95oi/bONSC2/cBnptf3jaR7d
 0v0z+DztQxL0GnISNuZlB0nlOODB/VyFckJpEv31gnd6H1O1PDf4gca/9MeLEXUZ/ArW
 A3+/5v8JRvPMrj9VnW4rPlBuNTSj/v7CSXvX1wZkXpnhoi2VKq7FEUVoTRfvulGY2T8Z
 pJzA==
X-Gm-Message-State: ACgBeo0yFyW4Zkkfd+5Z5zfzRL4Oxt2cYgab0e51cegJv+pqUaymtcSD
 e7d4NZdLuT0weiOcp5SivnoaPYTPEZ30pM0E
X-Google-Smtp-Source: AA6agR5iuEqquQoD7U6TrY0S2ACixZPAKuRvcP6VoRdYJ3ezBPkykYj+pveTxoDEw4JIGiqFEW+XMg==
X-Received: by 2002:a17:907:86aa:b0:73d:670d:3f8f with SMTP id
 qa42-20020a17090786aa00b0073d670d3f8fmr5503802ejc.723.1661522122252; 
 Fri, 26 Aug 2022 06:55:22 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:21 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:50 +0200
Message-Id: <20220826135503.20612-17-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5mp7siQU6xBaEgCuAA1Rl+aUp0A4xmaaXdCX6UXjqlI=;
 b=TxpZ0xzXe/x/OTNJf60crAjYQflDW62Q2IrI0rNJ+L6eFm4jv6TjXC3Pyj4DVMGNT0
 b24xiR6vWOJEinKxNPfciGUPvB3m4qlnaQ3H1W7Ynv3nHHbJ4sGnLWfZBrYny1CwZByz
 TVQlqnWzcKvjtQOUvby4oBixGLfvShMkW4jta3Seiu4jh/4SSaA3Rn7vAaa5+WrwNFwC
 R7u0pxZgGF3TDIpFZsKkdhnZsHyXXAyJXP+o6vGQEOQiQE8rLG6JxIY7drJhIng9KmYc
 S/IJvRQoLBpBz+4JexDQBPPIBPRn8ek+oK6xwRvD+6g40gjk1CF8ruucwRVKn1BDGNgN
 8uOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TxpZ0xzX
Subject: [Buildroot] [PATCH v4 16/29] package/qt6/qt6base: add qt libglib2
 support
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 3e94eaacb3..87ebc59cd6 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -121,6 +121,13 @@ QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+QT6BASE_CONF_OPTS += -DFEATURE_glib=ON
+QT6BASE_DEPENDENCIES += libglib2
+else
+QT6BASE_CONF_OPTS += -DFEATURE_glib=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_ICU),y)
 QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
 QT6BASE_DEPENDENCIES += icu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
