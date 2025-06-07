Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A58C5AD49
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 02:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1014B41806;
	Sat,  7 Jun 2025 02:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NM2OBr4JA6OH; Sat,  7 Jun 2025 02:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 294AD406FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 294AD406FA;
	Sat,  7 Jun 2025 02:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D02C1A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 02:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FD2060D94
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 02:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FWA5-nSH3Ur for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 02:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7232760B93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7232760B93
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7232760B93
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 02:24:26 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-234b9dfb842so25851015ad.1
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 19:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749263065; x=1749867865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w+B3hJ6RlmG7esMjsRhiHUnm6c/EL0SDHq8LA92i8hQ=;
 b=l5j/gN1eRxBhj0WjgOXSqQaW8/k92xk1Dh9OMidRh93lBuoOYHLxnwmex7/cF3fdih
 2RsrLORolMkDEz3G/NguXZ8VVmi/jBWPHcJFmmkvSVjkD7OE66QUrjEKEqw9eQ8XqGAI
 d0xbSCSxMrFpoauDuITJ3H/u5QfZUP29uJQjK3SYjwypmd3MpjHulP6ehlUfsOzzT4ZO
 Rte9fJpG1wy8j9TSSCCVUUp4UAZrfOljHUsPTeUFRXUsE6EVmpNadDaogsTQ+QmTLFhU
 jxWvjaypSmw3mTdhrKo9XTHNsYnS3PsJoUKOOrBOHqpQfR2XovzohH0EzZBswV7gB+as
 O6qQ==
X-Gm-Message-State: AOJu0Yx2cPjrN9hRQ6O1n1q0oh/Va2RK178iBdl1FPbGzmw1zRqVQ1Bi
 kfKtkQoklrbBDyegydgSyyDih5XUM0TfRkQtnbwMEjWX8Yot8/Ljfe/mdRIhn1zz
X-Gm-Gg: ASbGnculHP9+UrVHQB9GKFD2FAgS/U51/YpLcQGK3mkHFvBSTMjxn29b4Zat4RQgpTu
 pzX3Om4+ynS3yAl8DP9B4KsR1Ji1QEqi0E/Nu4gOMLH4m455WLzTrU+Ss4sfgIzNrlDzgGmpJbW
 521gOwVd8859HJOUqQc9CliA2VyXmQ1i5bQZSjg3GvnPXDb5tjBGzsa1cy6JQNcVjGNLaJFVQO9
 ceg+o8qUoiiSwnY58lC7S44hQmUyiZoWZD0fWStCRgidoreChALnaddVF0q1IBdkIECkXx/Nq7r
 li0RORcE9VvlzEu4qs9B+P6Lgm69EjAkRaq1bupn+vpOr2+p54WgzdgFjKZ9GfYuV7einxFkDLN
 LawSuUYJqFouMp/3udIsBQRu32nJz53uOagYWS+VHFKNKk2W6
X-Google-Smtp-Source: AGHT+IEwbQw+g6rY17aA51iSPgxVwa3YIurk5fu13g0EBqc9OnYNGEXVy2BdjZaultz5I2wri77mHg==
X-Received: by 2002:a17:902:cf0f:b0:234:b735:dca8 with SMTP id
 d9443c01a7336-23601cf0cccmr55063675ad.6.1749263065058; 
 Fri, 06 Jun 2025 19:24:25 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603d14206sm18440485ad.34.2025.06.06.19.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 19:24:24 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Rodrigo Rebello <rprebello@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri,  6 Jun 2025 19:24:21 -0700
Message-Id: <20250607022421.43753-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749263065; x=1749867865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w+B3hJ6RlmG7esMjsRhiHUnm6c/EL0SDHq8LA92i8hQ=;
 b=fokD/55bJW24NrST7HJH+/E/npEvLDmZX1wzq5kyxXGQkGYmnTNPdCQbvU3Xl3TUO6
 k84XSSHSu2xboLdcpjFQsjiw2WeC3zEU58yHNgqne9gnANh/yA5Hc8T25eBv/QCC2ScD
 /M7dr92gTIf9MSlu2oKO0NvWE97jyguYTPPnJthYkO6bADFHl4RlhiF9UY5i01OnSruX
 zxGFo+PvMIYBKjcJ5LJsYy3T+zwciwglHxJIaSMSnao3ZsjjDhctFt4G6oyp3jdNkcI0
 ZyeHeleQkB1yc/xKRsC1yCZUJie9m8hzEzAamnwL3Xxctb/+hkW8NdtNW1v+ZHhP5Iu+
 ElFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fokD/55b
Subject: [Buildroot] [PATCH 1/1] package/vnstat: bump version to 2.13
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

Release notes:
https://github.com/vergoh/vnstat/releases/tag/v2.13
https://github.com/vergoh/vnstat/releases/tag/v2.12

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/vnstat/vnstat.hash | 2 +-
 package/vnstat/vnstat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index 87d2a6d687..dcd4920619 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  babc3f1583cc40e4e8ffb2f53296d93d308cb5a5043e85054f6eaf7b4ae57856  vnstat-2.11.tar.gz
+sha256  c9fe19312d1ec3ddfbc4672aa951cf9e61ca98dc14cad3d3565f7d9803a6b187  vnstat-2.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index 665c0feaf3..b8666c05a5 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 2.11
+VNSTAT_VERSION = 2.13
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
