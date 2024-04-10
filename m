Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CDFCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5859960EC1;
	Wed, 10 Apr 2024 21:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CduRVK822Xpk; Wed, 10 Apr 2024 21:45:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4367D60EBD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4367D60EBD;
	Wed, 10 Apr 2024 21:45:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44C331BF980
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EB51820E3
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTyPWEaVsJxd for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3106820AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3106820AD
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3106820AD
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:45:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-417d08135b6so1709855e9.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 14:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712785498; x=1713390298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdRSYAr/cN+ino2ZryefAe1kxAxEZSU1I6czv+z0ggA=;
 b=M+D/2oq8NIRJWGN5Nj8BmkwrFNg69iUcMYeZzpK6MJSolvLjt7lVbjQuCv8b7URJR7
 BSLOiY9tMmCD3ioaN9ew8o8djPxYf2FY7EwBOUiGtHK0UMdkMnKJsDqyzbDp8+MUAA60
 M4ddht0Qsm9W24YMLb+9eeHpbUtr+mOoQtHWoTPaD4jxeY5pAjnpwbQGpVpKPQWls12J
 MICE9xPwPJOZ6nPMEHYa5dCYVkfmvmOoh58A5BGnzyGbHLdkQkkliSg1W+qxr7KZR4Kj
 CAdKFEQ0KTD+duOEqJcAq7GghT6T010IXDxDdQU6POi+yLrbCg8FHOD4u5TzQ9Jtv9aU
 /OTw==
X-Gm-Message-State: AOJu0YzYcSYuUAX+VoI+0VHEB6cIb/iLcwuiLKLDrgeFl5yLiiA2OItL
 Lz8pmqq76KbggWfM7LL2v3wv9qLvXJpiKL0RGrvcsIaWssrV64vbt41WoLkpUTBy8RFBf/hr5XF
 n
X-Google-Smtp-Source: AGHT+IHFTmNQE8ovKMNZyusgglhLZP88Qeg0EgQsG7HcjiiTUxKmvMYR4HYaLFgNemVaJLN092+fVg==
X-Received: by 2002:a05:600c:1e8d:b0:417:bc48:209f with SMTP id
 be13-20020a05600c1e8d00b00417bc48209fmr1813905wmb.21.1712785498801; 
 Wed, 10 Apr 2024 14:44:58 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a5d6852000000b00343e8968917sm177991wrw.1.2024.04.10.14.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 14:44:58 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:44:54 +0200
Message-ID: <20240410214454.86748-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410214454.86748-1-romain.naour@smile.fr>
References: <20240410214454.86748-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712785498; x=1713390298;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdRSYAr/cN+ino2ZryefAe1kxAxEZSU1I6czv+z0ggA=;
 b=S6EdZO0VvYtjKT9wJ/DRZMrnJNSG2UUm/aNeKbwaTpgSUxV1mLQbVpWJ9ixyhBfob5
 TvwPkd9g0S50dWX1OTkV7TRJtcAHqiEWPla5WakGU3INEgucpQ6mFyJ9roShNPyxkvvV
 YcM/CxkDuTgZaqjm5OqUSGuH7Dj42k3cQShtvtdm/Pov1UGwLt8suWOtTxnEIQwEMsLT
 Bh4ieXep6CQnKai7Lxomgs4y5nA8fkwjon7hO6B8rNZ9qcsWzJFUDqfWDV8k43xsaCiY
 ousS69v2ZuHv0bhmDN+gNiNfg4JW7Xy4KxyBEar0egYe5AfYKDSzcdvGo0HD3ru9KWBZ
 0JNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=S6EdZO0V
Subject: [Buildroot] [PATCH 3/3] board/ti/am6{2,
 4}x: add missing uboot.hash file
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout noticed during the review that uboot.hash was missing from
BR2_GLOBAL_PATCH_DIR.

"The hash for 2024.01 is currently in boot/uboot/uboot.hash, but as soon as we
update the U-Boot version, it will no longer be. So to be future safe, we should
add a local override of the uboot hash file as well (which is simply identical
to uboot.hash)."

This is required since BR2_DOWNLOAD_FORCE_CHECK_HASHES is now enabled.

[1] http://lists.busybox.net/pipermail/buildroot/2024-April/689283.html

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 ++
 board/ti/am64x-sk/patches/uboot/uboot.hash | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 board/ti/am62x-sk/patches/uboot/uboot.hash
 create mode 100644 board/ti/am64x-sk/patches/uboot/uboot.hash

diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..0e171c56f5
--- /dev/null
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/board/ti/am64x-sk/patches/uboot/uboot.hash b/board/ti/am64x-sk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..0e171c56f5
--- /dev/null
+++ b/board/ti/am64x-sk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
