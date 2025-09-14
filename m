Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC528CAC582
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 09:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C776F47D;
	Sun, 14 Sep 2025 09:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHSOJsF-3xsa; Sun, 14 Sep 2025 09:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C472A61CD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C472A61CD3;
	Sun, 14 Sep 2025 09:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76891255
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 09:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CF5383F56
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 09:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vb-LtZOx_vb4 for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 09:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87A01840CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87A01840CE
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87A01840CE
 for <buildroot@busybox.net>; Sun, 14 Sep 2025 09:47:11 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso576181466b.3
 for <buildroot@busybox.net>; Sun, 14 Sep 2025 02:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757843229; x=1758448029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x4dK66+vJvKqVrQ7QbvmeQv+sU7t8vr8y+BVlijubKk=;
 b=L9JAeQi5Wi8p/VKPROoVXyXBLOZQVxEwFmiXBxEr3pEz+dVRzZ5dmdEMNtXZoQKuED
 XRpPHZcGjiOKntIIEgjuDA6Psxf28R9hvau+nv//IW6n5UsGVnBlfPyyQQxPki8WQqTH
 jmj5/OvvGuFhlGZQKqeXPqPqhrbSCEmJtcnKXqDP38V+C9cLICJUM2l2ujlVTmBFHUS3
 fNcHbcoUvz3pkHg5RdlOxcvYnPlYb/ZE3kaqHjO7ImkYGzxTBcWQq0/Hol+z2meRWOez
 bUP8TyZYdAtV7aaZpfRAXF0mmV69rOOPm4W90idKK1cVL4SUVuAk8iAug5pNuRAU9zp2
 fv/Q==
X-Gm-Message-State: AOJu0Yy/xj7nwkr5w6ut4mWZL9F/Hz4krHO7Hq/HRzgZbMOUsX8/GbC3
 r+uxY8+fLGhnABXC0WgGi1J91JXE5lU8S1alkylf7hrnEM1j3gNuzrF8TfLDbXtpNvvrmGpWgXs
 EBtrJqQ==
X-Gm-Gg: ASbGncuWktpcHvxpBaRBjItFYo7p0pWtcHx5vAEAkoZcPB+6B0siAjCwz3iedZIn/Hp
 mF8TZPF2z+QUwEhQOZDNozNQ1QgsWB1gour/f/iXHEShKe51+TrAN9iOsggGLbCuVv3hIUGMpL6
 Am1XuDWU86qCmabQmqwdsbKOzZXTiNEHcedvWXyJLrqwXvHrzjhAF7kOH+67LykX1n55HfVLhiX
 3ui8BN30Fh6rZZapc7EPWyUh5dOqTb6/Lw3B1LfBRlrltpw413ecWl/xrHYoz5mT1DpYZsq4XYx
 /Hm/uwCQ/IEG5Y8vvs3eGL9CTkMYmkm5i3qpbze5NvAp9dPhWXPzunhAb0gKwEaUT5mvVisMAjV
 5DkBTUi1dbC3svl6XewxKJLGZqGwE7ILlONPZCoq0iz5n60/CGvj40mBN
X-Google-Smtp-Source: AGHT+IGaClorcCGExwFvWOzF/vtk1Tequ9UqvyerJJ6jjMqIa/rfKMkTM8WQ/8AS9mRcfcxnwbxPxg==
X-Received: by 2002:a17:907:960f:b0:aff:c306:de51 with SMTP id
 a640c23a62f3a-b07c35475camr922092366b.4.1757843229013; 
 Sun, 14 Sep 2025 02:47:09 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da41csm730695566b.4.2025.09.14.02.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 02:47:08 -0700 (PDT)
To: buildroot@busybox.net
Date: Sun, 14 Sep 2025 11:47:03 +0200
Message-ID: <20250914094703.708033-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1757843229; x=1758448029; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x4dK66+vJvKqVrQ7QbvmeQv+sU7t8vr8y+BVlijubKk=;
 b=h3yM9Poo/DL3//Q0nRyEhLsQrUnwNCJnuXtqS7SCgzrHejJ8Jyrt031jINvk6DIjND
 3xTNkRGFftsiDJ2Ac9bugAXfTYmdyg8x0SDU/pbyuDt0mgZiySwdlt33AMJDXbbkrxX6
 ohsYICn3au/cY1vnrPVreLabjnxNCHuK1KOIacHpqQTEIn/Sd2QhAhpQyIbuAVtDyRbJ
 aIKF3dGVc4bGTnrPbOLtRPisnZ/6TuUUNyXH+vGZfZnAOuLcswNFLM3ka2s2JJefpOMF
 AOcs+Ppnwiytm4PTyqEgN9FvqZkcZy7OYgXAsVaTkSzmWf3pjgOvtrIPO4RPoExw9jPr
 lyCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=h3yM9Poo
Subject: [Buildroot] [PATCH] package/luajit: bump to version
 871db2c84ecefd70a850e03a6c340214a81739f0
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index e14bcc906..e147845e4 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b4120332a4191db9c9da2d81f9f11f0d4504fc4cff2dea0f642d3d8f1fcebd0e  luajit-a4f56a459a588ae768801074b46ba0adcfb49eb1.tar.gz
+sha256  ab3f16d82df6946543565cfb0d2810d387d79a3a43e0431695b03466188e2680  luajit-871db2c84ecefd70a850e03a6c340214a81739f0.tar.gz
 
 # Locally calculated
 sha256  5b79fb4754728487cf43d55b213bb68369912484f2dd7ab68380435e994bce39  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index f4836df91..ed44e165c 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = a4f56a459a588ae768801074b46ba0adcfb49eb1
+LUAJIT_VERSION = 871db2c84ecefd70a850e03a6c340214a81739f0
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
