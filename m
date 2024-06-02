Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E077C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF3CE83B07;
	Sun,  2 Jun 2024 20:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6WWiHm-3EAh; Sun,  2 Jun 2024 20:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9158583B49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9158583B49;
	Sun,  2 Jun 2024 20:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0DD01BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5EC64039D
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cyt2ePksncf0 for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2403B400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2403B400AC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2403B400AC
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42133f8432aso10512435e9.3
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360797; x=1717965597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OOpxcpkq8kArxU13cB4h5chWXn6VzJCAngZf3mWpaNg=;
 b=Pa4Et3qYDM7G+Zf6EySLKQ4dKSGldmmaq0YrgWBimt9T4mBwx9E7NibBX64VeheAvz
 lFqrnUVCU7nTYYWPYs/SX65l2MXydDaZhJ8/QQpXQnz1cIBYqBzdfdjmW/062T5bgNEf
 0UkBYyWPF/kBo9vtODhXu6c3MTTVDFG4Vo4DFqBi7vyFSCM0vsCMYJp6JIdtUI+RLPGO
 y7Rq9vI18t4gf1k7WKawD20IXvTa72iy/2TCj502wuBKO84Qrc2+rPc3V01zR0ho0KjU
 G5q+rlmeVn6leXHqXJfuivwFxootiZvSKRluCsrfBrulxM5e6NwblswgeH/zTUURz0wW
 CUUg==
X-Gm-Message-State: AOJu0YySPcf/lLVi24waIuGrWqRnD3NoQ/LVFzK7+XASFgIuw5QffLn8
 CrI8kCwEdaxV2LIbBkKTEP0mgv8QlOt7glpQERQGdt45HYgdZ2KIxTQ+Gw==
X-Google-Smtp-Source: AGHT+IEKRZwEunZhgN6sZTl81qJ1HFp64XaEfnbGcfTOtJvtMZwUR86h/RgATFTwj0tibHS81cJCJQ==
X-Received: by 2002:a05:600c:4eca:b0:415:6daf:c626 with SMTP id
 5b1f17b1804b1-4212e061ecbmr55705395e9.21.1717360797075; 
 Sun, 02 Jun 2024 13:39:57 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:56 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:46 +0200
Message-ID: <991b8b4d52c20f72ac13d2b14031c0b13512f335.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360797; x=1717965597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOpxcpkq8kArxU13cB4h5chWXn6VzJCAngZf3mWpaNg=;
 b=fRxYtS+3NieDS8AgUXELmM7FNT5K+Hv5gNilClcB1metKAzVZmyk4qeLSdWG5d+Rw2
 IWGZMeNWVhTyBLymzOnE0y2G2EI8C/54OmRYBAyIfE8ehSXqeC0lvaIz5kh6v1Lyi/VO
 9OzZK4NfXAjnwaY9XCYSLY/jC4UCEQj0PXBJsIyAa5tM4ftWamUP55+5iHJcxMTX63aR
 5nvlnghdsapYp1KGj1a/iyMlHHWit6q6XUhl0At5gEOJQTOwMkDHVVenOV26BtXbr8nb
 WK7aa6WYuoUJoHDJkSMDUwuWUOPWhM9jvMLMclp5L1mO1EljXH1gS+Uta5sV6TKOj8Pi
 9tTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fRxYtS+3
Subject: [Buildroot] [PATCH 10/16] package/pkg-python: use post-process opts
 to pass Cargo manifest path
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-python.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 88fadecd54..2c1641d170 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -275,14 +275,14 @@ $(2)_DL_ENV = $$(HOST_PKG_CARGO_ENV)
 endif
 ifndef $(2)_CARGO_MANIFEST_PATH
 ifdef $(3)_CARGO_MANIFEST_PATH
-$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(3)_CARGO_MANIFEST_PATH)
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(3)_CARGO_MANIFEST_PATH)
 else
 ifneq ($$($(2)_SUBDIR),)
-$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_SUBDIR)/Cargo.toml
 endif
 endif
 else
-$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_CARGO_MANIFEST_PATH)
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_CARGO_MANIFEST_PATH)
 endif
 endif
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
