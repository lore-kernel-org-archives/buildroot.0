Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9543EC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 07:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4287360EF7;
	Mon,  8 Jan 2024 07:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4287360EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYfyg7BILX77; Mon,  8 Jan 2024 07:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FED760EE4;
	Mon,  8 Jan 2024 07:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FED760EE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7071BF387
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27920400F1
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27920400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tstyVZLxtCM2 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 07:03:15 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2E51400A4
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2E51400A4
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3608e206f27so6457295ab.1
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 23:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704697394; x=1705302194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6yEbrBJo4lRCaKYBao3hqX47pwpjQDN05E0vHKt4xzo=;
 b=h0Gd7LPlzaClQ5PXSqp2mr39YOjmC5UG3T71Yymtdv7C0dept/KC1wcH07i77GKoWR
 BxYcv6ceCIW9Fne5rZ3v1koOkY2dEm1TVKtKww8luf+oedP5qLmdWMAall8ysmdJ9dSd
 Uwb3Beg06woM16SZ0nW6TctxXZULTQ8SKMePZYLdNMB2HHK3pxvlLUWOs8HaeIEHkKt3
 2aR4I47YneeUm8YGN7YWqaB4F/bzFespmjjwGwecqTdwG5sBRr5664HTRqfslYaL6Ddy
 detsCTZk6nXfawg7K17sCRxtXZf3D6tUMJrgC7aJO39q2sNeBf/7wdEViDS6sYNxzT0r
 0ixQ==
X-Gm-Message-State: AOJu0YwRulkou12Y+3fhf7Zi79rWtaX36wVAjlEai3zGZhB7enrc3Sti
 lO9zX02Mk2myAPIeCvIv24+8ynQRS51W3Q==
X-Google-Smtp-Source: AGHT+IHL/NogbkRVaYAp/F5oDZuszAvP6MU9prncJZZtkbOA2VnMxYfyd8XZBui2KxXLojDLYMUDxQ==
X-Received: by 2002:a92:c262:0:b0:360:8a7e:9c8d with SMTP id
 h2-20020a92c262000000b003608a7e9c8dmr3438121ild.59.1704697394367; 
 Sun, 07 Jan 2024 23:03:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 br10-20020a056e0223ca00b0035fea0268bcsm2378990ilb.28.2024.01.07.23.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 23:03:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:03:10 -0700
Message-Id: <20240108070310.3462577-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240108070310.3462577-1-james.hilliard1@gmail.com>
References: <20240108070310.3462577-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704697394; x=1705302194; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yEbrBJo4lRCaKYBao3hqX47pwpjQDN05E0vHKt4xzo=;
 b=NiQWFmha9LOYt4LVFiQ2Q8uJCg2P0DiTxvYLz5tvVae0qGL/HYIoDhbsKCCl7fWalK
 tZgJXPbHNuYvEzacXH/T5nsTTZzI+IqE8ePOdAIqAHioYU087Dijcgsx7G+4+B5MIaPS
 axRZhz68EINY9cX4xLhmQRj1eOiA3b86f1d5qrbX1hlgrBgmtDztRzfRNvkyc3pINhbP
 7ihnjIxth4NQ47j22dNPTPgkCyUU0jcfupEIeW7ndOQB2eojlgCdChWKcP+b0lwaMn8C
 KJ+RzWU8xsvZwSa5Hpkbiqtyat4gesBy4my+ZBIydhmbKCNE94WlhBiTcvPwcaGOpeIw
 TNqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NiQWFmha
Subject: [Buildroot] [PATCH 2/2] package/python-attrs: bump to version 23.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 0e94c7cef4..d8c6d147d5 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  6623fed7ffa22261ba25fccaf4d99539  attrs-23.1.0.tar.gz
-sha256  6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc50e015  attrs-23.1.0.tar.gz
+md5  60588a146fb413a997c7519d77198a5e  attrs-23.2.0.tar.gz
+sha256  935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30  attrs-23.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 0d704ea111..8a1236cc44 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 23.1.0
+PYTHON_ATTRS_VERSION = 23.2.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/97/90/81f95d5f705be17872843536b1868f351805acf6971251ff07c1b8334dbb
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/e3/fc/f800d51204003fa8ae392c4e8278f256206e7a919b708eef054f5f4b650d
 PYTHON_ATTRS_SETUP_TYPE = pep517
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
