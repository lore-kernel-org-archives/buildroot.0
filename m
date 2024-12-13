Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04876E7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 11:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C342860839;
	Fri, 13 Dec 2024 11:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bma5H3h_PCxd; Fri, 13 Dec 2024 11:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC5660E00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC5660E00;
	Fri, 13 Dec 2024 11:59:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B08AECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59BB240146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnPsP0oselcL for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 11:59:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64A4E40003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A4E40003
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64A4E40003
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:59:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-3022484d4e4so17826061fa.1
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 03:59:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734091138; x=1734695938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+nwfe9zrM5w9knJE+MQ/jsy60bOI3z9Qm+0UoGW17GE=;
 b=IyVwBSUqokUzvgdgPXWjo/Y3y6Z3GyBd/e7Klxr+oNT0ku8Dxd/nCSQDkNRxiTPIWV
 qeQs8WELaOcgqYh7Kxb0aIXBWOmzGjXcHZSKb9r3a1WcaqoTrXJbzzozOT9TXLU5njIx
 Gb2yi6v0Sh0vTa/ynmMsy/fNaBS1Nwv71Dk2OO5I6H4Ij/ae7BhCA0OZdITRZMzhfU3L
 NOZ5AmQUH4PcV6FEpMDZVcMceNwP9irATcF7KPRkovndfrXoGoRpqmjNDIUfStUiav0L
 a96F4/FvULRxW3ASVm2FmuSnkmo0KM5jlyXNvkrBQH2NC6fiuf/jYT4OEQouW7sOF2s6
 fl8w==
X-Gm-Message-State: AOJu0Ywvfo+zEXUMs/CpoBT/PGOVFdUCEz/Lj5ahJ0IGuzbKKOsRoonj
 dILuP6BI8tf8OriaqpRteFUOv8cxf9IBUIjb5RbKrD8D1fDM/6iTPdNAqw==
X-Gm-Gg: ASbGncvLd/XMyw+qoP+s3vFBmG+TXdnGNSF3GIOa1mLKGK/1dlXSNupUiuFbvXOV6P+
 wXIH3hEKglNKnDvrZM7BOSJqxhUi8Y+RNECI6mWUEVNb9ZUgwF/yetM9u5RMGbU0dsbWkRIWNpw
 B9vOGYP0iMgTTdv5rC+O5ORBFUTgyzYyOylorABefaeyKXqwo9PZdZEeO93ZF+rPI+5Vr7BJdd9
 eySrB0OO3MVq4M/Qq2KkYg54ZDKSeT9+MLGwsJqW4Mye45MJBe7GRdycw95Kj9E3lPu9V0+eT+A
 vW+nipPGIQLcHho=
X-Google-Smtp-Source: AGHT+IGY4H0W4eqZ7dsTDw9ATdaDXfY/4f7zsqUlXUD2hP9uz8bQ/flDsUAGjSj6YL0NByze+yDyFg==
X-Received: by 2002:a2e:bb94:0:b0:300:377d:2c36 with SMTP id
 38308e7fff4ca-302544c9099mr5727481fa.40.1734091138045; 
 Fri, 13 Dec 2024 03:58:58 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30038ce97b4sm20610651fa.118.2024.12.13.03.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 03:58:56 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 13 Dec 2024 12:58:15 +0100
Message-ID: <20241213115820.655993-8-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213115820.655993-1-roykollensvendsen@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734091138; x=1734695938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+nwfe9zrM5w9knJE+MQ/jsy60bOI3z9Qm+0UoGW17GE=;
 b=HF2CnP67g+b+tpuQ4vd9mkNju5uW4KBPKCGDmWeo42GhvcnI6TTSfGuKy5tUwQewog
 GqyZo+0MMBxyyecWR5SM96GbgAhZHxFUwityvscEU4FFC8kMJPZeySFOOXoTIpFBO9dZ
 lwPg7XJUSy+yunE6zTiCBn9vMOk3r0ORa8VYsHLig4h5t8nfZDHE3tGp92ZXd94cNtvM
 92PbLlamTcEDP03iYrNqUC/RcvLm9G4SBDag++QZrCghsk1ddl2qUdwbRHTjtIDjR01Y
 3QNf0PrTmTsCX4LXwJBFUi2hwE6WfL7s0RFf5FwJsu3Dwpsw/jHmcjbKfj6Bww9PmGGi
 0KdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HF2CnP67
Subject: [Buildroot] [PATCH 8/8] package/qt6/qt6opcua: fix 'qt6opcua' typo
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6opcua/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6opcua/Config.in b/package/qt6/qt6opcua/Config.in
index 68b73f7c50..9b5359dd4c 100644
--- a/package/qt6/qt6opcua/Config.in
+++ b/package/qt6/qt6opcua/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QT6OPCUA
 	bool "qt6opcua"
 	select BR2_PACKAGE_QT6BASE_NETWORK
-	# qt6opcuda needs host-qt6opcua, and host-qt6opcua needs
+	# qt6opcua needs host-qt6opcua, and host-qt6opcua needs
 	# network support in qt6base.
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
