Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231FFC021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 21:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F9C9817F2;
	Mon, 24 Feb 2025 21:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8viknk9wUnEU; Mon, 24 Feb 2025 21:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E5E9817F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5E9817F5;
	Mon, 24 Feb 2025 21:22:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93C9D1531
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84A5140BE4
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foyRp2J352kh for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 21:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64A7A40BC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A7A40BC4
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64A7A40BC4
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38f488f3161so2673460f8f.3
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 13:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740432143; x=1741036943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FM4Cti1+YyJT4/EUILExUsdomflGG6IHA7YzsZ6J7xY=;
 b=nyXE7nEAcwSVJ/pHU8pocIhx1V7OHOif7JJilvi+HYArFII/4OayFr+xPTnte4ldea
 qOBkrlBiPr1wTKoTk3seQXIjoIW43AmbKa+O5S4ZeZCg0j1xlN1gOkvqzse6b7109HZy
 UrdKoamZwM3hLIN232CdTOaCLn85IwfswKWJYi8k5raOh4JqkU3Q9oiIjzkI0dv49ZJE
 f9o52zcc07sA+gkzdxoEqoo11XySRdw4TdcUKA3G1pAmD/WbfWVqYJj7HozIwSB8Dw34
 mD1DSRWAE+UeUntdQcDoEXrQyF+0OSh0MYimHbvqWdjJLVMnCqt8g+K1Bq/tcGb13VW4
 7z/Q==
X-Gm-Message-State: AOJu0YwgaoCd+cTNa6XYONuIF00gCv6XnxVVnujg61LFuPYs5diue7Ii
 vPsp9h06QBobHyudqPNZxxhTaDObwpjhFJI/VDh8liXYJNOzTZbwBLwFZA==
X-Gm-Gg: ASbGncs7YbvWseirB15hm3uGjIsnlGTSsMib7hl6sSZLzlJij03L+qN1ZBZSKNYzV3B
 ucJnjhCcj1WkkdhKtjDxLtNCuwtFNHDgvumPB4XFUi0Gtd1OtEvvb6ZMYenSSDfPERbQz2rBD7F
 m1Y4lcma2j8o7jVmovkho98vJc7iAuEGOIlAX3Z+Eyoj5vq0ipvOps8L9Y5bgTfddsGuOkOtkZ9
 L5mgYDZVzvg3hoCr9xa7rsTPMapmH4/CS56ndePIo28wckoc14t/+9QBi4lwJ7xqob3pR9eT/TV
 CL4GckeqtX6Ro0/czb+h+nVOH9CUF/D4sBE+
X-Google-Smtp-Source: AGHT+IEb9hZ3fxwjJEBP0UswyLpBR02Dtgp/0n1Az9wl7Ah+1SM8oqYVP8OANOUHdyxR6jdYbZvr1g==
X-Received: by 2002:a05:6000:1f83:b0:38c:5bfa:a93d with SMTP id
 ffacd0b85a97d-38f70772c98mr13073001f8f.10.1740432143318; 
 Mon, 24 Feb 2025 13:22:23 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b01346d1sm119875635e9.0.2025.02.24.13.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 13:22:23 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Mon, 24 Feb 2025 22:22:15 +0100
Message-ID: <fd7aa5c62d91ca2df3290351b34b4095ccd22886.1740432132.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740432132.git.yann.morin.1998@free.fr>
References: <cover.1740432132.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740432143; x=1741036943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FM4Cti1+YyJT4/EUILExUsdomflGG6IHA7YzsZ6J7xY=;
 b=eLt0i9R7ys7/xHkqt+q+SuivwO2ot9l8BtsOAP+Fum7np+z6s6YJTe37DbNfU4ILV9
 6dt3+/MKjrP7RAcNcxcdMYb19tzVcUy3oGTkT8wvYm8rIOM0fmLMXeigwXRfwvwYPdT/
 Amof9+tXR/p57orfCd7JCZHR/tRgph/0nYkZJvbOlSaeoE7tDYGEafOnzuBL26y57fdZ
 tqlbunbXewttkrc1LU/EmTCS0jXftcQKut5nCT/dPFQkGVUSxSSiK17LuBHsZvPsmPQ1
 h2OB1uvwFEXgOyJsMizvmtdIWbXJ9wCVn1o5SscwgOGaYz+miWWw0mNoxFIHrLAgETwx
 xAFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eLt0i9R7
Subject: [Buildroot] [PATCH 2/8 v2] package/shadow: install to staging for
 subids
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

When the subids feature is enabled, shadow will install a library and a
header:

    $ sort output/build/shadow-4.16.0/.files-list.txt
    [...]
    shadow,./lib/libsubid.la
    shadow,./lib/libsubid.so
    shadow,./lib/libsubid.so.5
    shadow,./lib/libsubid.so.5.0.0
    [...]
    shadow,./usr/include/shadow/subid.h
    [...]

Install to staging in that case.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/shadow/shadow.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index f0a2b57b4d..2937a9601e 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -46,6 +46,7 @@ SHADOW_CONF_OPTS += --disable-account-tools-setuid
 endif
 
 ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
+SHADOW_INSTALL_STAGING = YES
 SHADOW_CONF_OPTS += --enable-subordinate-ids
 define SHADOW_SUBORDINATE_IDS_PERMISSIONS
 	/usr/bin/newuidmap f 4755 0 0 - - - - -
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
