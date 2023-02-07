Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C03DC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DB4040A83;
	Tue,  7 Feb 2023 17:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DB4040A83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvltFAlG3cLe; Tue,  7 Feb 2023 17:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B85C40A71;
	Tue,  7 Feb 2023 17:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B85C40A71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 389F21BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF94E418A0
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF94E418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wmRcVre8Z_T for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD860418A3
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD860418A3
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:17:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a2so14000289wrd.6
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 09:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBiXdMXAjvQU7QBtSEtF9hveQETM9+1iMpe8ltpTc2U=;
 b=WOhNi5p2l1qMTBKABw4vFDGSEsbJj7HfeddqUb+jOKWuFnA61C6skwg0D932OXx28D
 WfzQV9kG/fktzxe8LQKArPdxHCrCcezAnD9Dl0Odwe+dcuCBzvgrGJWA4tuvrZ/f4OtG
 LtZgsegCmvr7eJW9EPPJJe8qGtLjxOuybloc97BLJPSASlnuXbdz6AoMd2UukZgZi7iV
 cMdB/1wChG5SKhn+4sVsnQuyENmiOI4fUjvkXF/HCeu+GKZaIGXJg/lr0qzvw6vtBvaq
 8gkMTQSGH7+l+ONVKOVky8fTgQF/aS99eXvfOWtvA9gOwphnhSm+n6U8F6sSfZZ4JK/U
 DtdA==
X-Gm-Message-State: AO0yUKW+Znz8H7+uhKzF97wrdyg/wYd5rA6Vfe1ttK0DOk+hb87rfV8c
 0x2Xhm/RuMJcBn2Mb0IJH5SzuEhDrkrFftbmD+KuaA==
X-Google-Smtp-Source: AK7set8vG5nGtJNxfS6ZCwD1mPuIPhJelYhpU/PTSf3fzkpcXmm/zc7wdmfTogF/8OE53TVADue3Iw==
X-Received: by 2002:a5d:4605:0:b0:2c3:ea68:9107 with SMTP id
 t5-20020a5d4605000000b002c3ea689107mr3169626wrq.64.1675790259998; 
 Tue, 07 Feb 2023 09:17:39 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bff574a250sm11708801wrr.2.2023.02.07.09.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 09:17:39 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:17:18 +0100
Message-Id: <20230207171721.2973997-11-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207171721.2973997-1-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBiXdMXAjvQU7QBtSEtF9hveQETM9+1iMpe8ltpTc2U=;
 b=Uqs/RuvuOnfhybDznIdoNAyl8rN8C5e8nmQw9Su3fnbz0khXpanMjqtkUUShh6weWu
 C5DxMA/Hzz5XfKeIIBjJ0kfjWO4XtuNjoH8peBRWT74nZlc6ZSr6DRxFCsESL/C6z/tQ
 zd2ASycgm1XjwzXku1lr2eDROlS6IPACf0wkA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Uqs/Ruvu
Subject: [Buildroot] [PATCH v6 10/13] package/qt6/qt6base: add support for
 kms
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index fb452b0b7d..4a64886a3f 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -206,6 +206,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
+QT6BASE_DEPENDENCIES += libdrm
+else
+QT6BASE_CONF_OPTS += -DFEATURE_kms=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
 QT6BASE_DEPENDENCIES += fontconfig
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
