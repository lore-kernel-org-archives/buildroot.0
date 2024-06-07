Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE434C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 904D842821;
	Fri,  7 Jun 2024 17:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2NK6jF57pwi; Fri,  7 Jun 2024 17:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E324277D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E324277D;
	Fri,  7 Jun 2024 17:06:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26A1F1BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C30761562
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cG7dqPzUQRoV for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D13866152F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D13866152F
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D13866152F
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52bc1261f45so781551e87.0
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779968; x=1718384768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OOpxcpkq8kArxU13cB4h5chWXn6VzJCAngZf3mWpaNg=;
 b=n2zewFlE1eY4o+Xem6092YSqogN9bwisqmZ7ewjBElFwypH2bH8ZOPMOZbQJ1b6iqJ
 xM8SSpzvFQ+CxSh6ezzKb3BzHfmwKFIJGubHtjf1m/eApISjIdZ17/am+QClKoKrarzD
 XLxgM4VKIrM3wKVEOCgJqFz2GS9tN/9Wn21z/uvGy2rgLXOSDN+YRh9gjXL688sBKIui
 5woZLPNclkXYy0bXaVjgxJ58/TPymFAktiQDZx/u9B8uAsd6hKkdKCZyBlVAunxIVUqo
 C95e1vKlKkr21c/i5U5cAbwEpup8w8wvPeSiT49LSxMjDMNLkugvtNxAFYMbgLdKSBex
 SViA==
X-Gm-Message-State: AOJu0YzqPHAyRMOZOrJkY9mhzxivXy4Zek+Qs751DeYXsvWLLbbirI7T
 lstnqhwoc4ZBl78XNdGDfseWNMxaIdVY59ifX9CYdMhSjA+JYjok9DECcA==
X-Google-Smtp-Source: AGHT+IF9VE93AAJx+lAcAn9WOCOLFOzmEhH7mKZ1HmbBS7DG8QOOdYxjbp7HYMMXojgiDd2qRlrjhw==
X-Received: by 2002:a05:6512:e93:b0:52b:95c4:4641 with SMTP id
 2adb3069b0e04-52bb9f9287cmr2606364e87.32.1717779967404; 
 Fri, 07 Jun 2024 10:06:07 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:07 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:52 +0200
Message-ID: <f65b4564c0339e0a273755399987907a33fe9abe.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779968; x=1718384768; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOpxcpkq8kArxU13cB4h5chWXn6VzJCAngZf3mWpaNg=;
 b=V14wOUMOx5P00Arq9gyABX3/kmkU62Jewvmur1QNErY/6kt/I572GMVvj7O2oCbhYE
 A8DvslVCYM+K/1kNsVWUcPCS7h1NCKUyNQHxrwgg+N23CcZdLGrjCMpkgpEH9LNitSwv
 g11oQtfRpjj/3l+9v5u+HO/LXWYy6OBKvefEGoCVYvsYCJkO9xqLYK7v/vYUxnsnW4bX
 QULxa8NiLpSbI8Kxq0i+M61y5v/bB8zMI6bEJRtpxhrrl/JDVz/UKpD/ajYbxjiz4NOv
 4pHTeijQeS2Y9Rj61a77o9FjU32WMAYgiwcKUk7Y49YdskPemjEEc+6Q9quAxcXFZQJn
 8CLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V14wOUMO
Subject: [Buildroot] [PATCH 11/20 v2] package/pkg-python: use post-process
 opts to pass Cargo manifest path
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
