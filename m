Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832DCC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E21485138;
	Sun,  4 Feb 2024 10:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E21485138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAFdiD_Sbds8; Sun,  4 Feb 2024 10:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6957385135;
	Sun,  4 Feb 2024 10:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6957385135
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7F81BF57F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C54042D9D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C54042D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8XGuPuJvUC4 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:32:17 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AB1942D25
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AB1942D25
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso2772050f8f.0
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 02:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707042735; x=1707647535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJzFoACSDn2NNscCLuyBXSQHrFvvGe65IucDBTk4q88=;
 b=KHgB2GEalFyI0TocMtwxt5q/+xT24/BA6YrEEvU6FtnQte7UorB2cM5kbzayAqPyL2
 D0QxLF5zQIHrRkGT1DWUqYBG/907Onrg87L7pvzcLo6W2FNq9LXoDCBPCGQX71N31bw4
 f/r6xxZXQREx7YK6KJKRBhwOF5gHomUT/u/rB/GDsWo7mN7F4KAHj/f84FH5xbF30oKC
 kt9elHJ52gPaKXfETraBbh0rp19bJPsi6TAZ08Tp0NSVix5tyWgNY6/RcpEZH298UrDp
 vXXSDI/6lqpEq106DN5Y4bipBCbyFNrBSbMPbUBHxI22uISaHKXBHO+ryfrnAGjS8xbI
 YWJQ==
X-Gm-Message-State: AOJu0Yx6ttLslEQb67wCUgYoOg2/C8oSZ2kMWRNNLgJRKWTwU88DxxSE
 E3jp7ypBttu73R0Z00WC9qcgrPs2NWhCyGmGc5nj3Q1ZjJ1RgroRie1ZsPNoc9E=
X-Google-Smtp-Source: AGHT+IEtWdDNGmggc58fUqCOzObLUIPSTs0AUcEHcBa7ghu+Tjl5SiDK44/sRebpd1+axrIr3uy6Pg==
X-Received: by 2002:a5d:6da3:0:b0:33b:37f9:add0 with SMTP id
 u3-20020a5d6da3000000b0033b37f9add0mr968992wrs.30.1707042734537; 
 Sun, 04 Feb 2024 02:32:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j9-20020adfb309000000b0033b26beb10csm4366339wrd.1.2024.02.04.02.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 02:32:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 11:32:04 +0100
Message-ID: <20240204103204.1415592-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707042735; x=1707647535; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tJzFoACSDn2NNscCLuyBXSQHrFvvGe65IucDBTk4q88=;
 b=jABXkebnyHTjecfEhvQYVfGy6ewUmki580r/5ScFbA26Ad9Qsz+YeVFr/kxSdTROrm
 wTuq4pjdByER/pXIM/BmcCUvalE8lGcgjI+rAxQUKevYUZywHbvUAwclmTQDXH2jbIh8
 Bnw/zXKtPRxaLW5PAlJQ/0djmjlEEoIIzJTfoQr42RigKSgdArCm979QwdSHTF3ZdYne
 gNx+EnKr8etSRMaphe+9NyJCHXdM6Zs6aF+a9nZ3bQ9296CT+SrWJ4Q81YKTVL1094QX
 zah0ylOxl4hzyNdmspYNuDfoDSbTwCCPhzxqVDgBZ2O/glEAz4yqMOXWJIcnkyHtmSo7
 jhTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jABXkebn
Subject: [Buildroot] [PATCH 1/1] package/dbus: drop DBUS_CPE_ID_PRODUCT
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

Commit 363b4ebf1aaf4821c0c49713eba71937bd5639ca set DBUS_CPE_ID_PRODUCT
to dbus but this is not needed as DBUS_CPE_ID_PRODUCT will be set to the
package name (i.e. dbus) by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dbus/dbus.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index d610846ddb..097b89205e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -12,7 +12,6 @@ DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
 DBUS_CPE_ID_VENDOR = freedesktop
-DBUS_CPE_ID_PRODUCT = dbus
 DBUS_INSTALL_STAGING = YES
 
 define DBUS_PERMISSIONS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
