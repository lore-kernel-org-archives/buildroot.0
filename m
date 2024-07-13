Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD53C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8655780EA7;
	Sat, 13 Jul 2024 20:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5O1ASUr44MiL; Sat, 13 Jul 2024 20:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E1CA80EC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E1CA80EC9;
	Sat, 13 Jul 2024 20:54:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E5C71BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B4FC404BF
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSjDCz5Btq9v for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DD4E40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DD4E40133
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DD4E40133
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:54:26 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ee817dac89so36028511fa.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720904064; x=1721508864;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h6Re+AEtoTMp4bg6at3DjWIFuCqZvhonhZYz9jdfuhI=;
 b=Ohd7ZpCNKAYO5VjbYxPFz3XQy+Z4HeVLZMsTda+o/QHlUWtPpKaqr3hBezAQeYZM9+
 10+ykq5mBD3jcdadndvIHOC7TsJ2RJcCFPGKi7zRJ44VXj2dvgRNu8YC+IsQiWSw7K+I
 Z2oGOrC4z/BQLiytz1Slo7ABgO3WsSm8bkJyzW94gPqobBIB+1946wu70ZDiCARa9sRH
 BM2cXc1yruKbBzWgjobLoKRlFTtgVE35Zg+KOD7yzdR3Py6ki5pHQTXuYkJoIwMLQRua
 4QkeO26+iCzAMnpCpXmDar4U0UJbBPWVPkpbAe4+3MiUiAp1aoymz4BAwK8py/wa62Ci
 Gw4w==
X-Gm-Message-State: AOJu0YxEEyaOyimwTi9CRtVF8LluTZWUwNtEoFMdO3G5oQuxHlx6yx8Z
 yUTfJbfkmaa7kEzlsEbTNcSRJz6wCmSZAcXHvnRV9r53wqMMRJJgV9Jv+Q==
X-Google-Smtp-Source: AGHT+IF1fPrLpdfbT4iAGtlZ43AC6C+eFkSWuW0jLV8QPJRrKO++ygTDdwMDHHuhrUSP1eJis+YvXg==
X-Received: by 2002:ac2:4c41:0:b0:52e:7478:9d14 with SMTP id
 2adb3069b0e04-52ecb80eb70mr1761106e87.18.1720904063653; 
 Sat, 13 Jul 2024 13:54:23 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24e23ddsm294263e87.58.2024.07.13.13.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 13:54:22 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:54:03 +0200
Message-ID: <20240713205404.3375131-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720904064; x=1721508864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h6Re+AEtoTMp4bg6at3DjWIFuCqZvhonhZYz9jdfuhI=;
 b=fJiYHyuab7Sa+26XuG/xiqcAWS0OVyIs9sx0kCgmN6iqs8ieJfQYpoqxLLs8EtBNZW
 /Ltf88AeeH3cSIv51GG50adIJFsj7jR1ez/ODS6aysMZ8LEeP+y8YU9b5QO8xvag62HW
 oNWD6W/9WkqGyJQM2+YO5Y9f6lmD3/7cKBP9FeIf7hgdAsId0n3JuDi0/SnOPqU8XJUK
 KXkRmk4ZQPVeC/Ujp7qUbDYCofhnnslQi8C5EPRNiumsP9g3gmkgFMyO2Iwe37QpMYYx
 6xffdyU+culxFi7iFsIpEhtMnIXZeSfF6qRgnXmqDaKQRXYA0GPaz6VxE1JwZ3fKSpxU
 eNlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fJiYHyua
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6base: improve qt6 filesystem
 layout
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I here use the same layout as on Arch Linux.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5ab61ba3e0..49c6227428 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -43,6 +43,12 @@ QT6BASE_INSTALL_STAGING = YES
 QT6BASE_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DINSTALL_ARCHDATADIR=lib/qt6 \
+	-DINSTALL_BINDIR=lib/qt6/bin \
+	-DINSTALL_DATADIR=share/qt6 \
+	-DINSTALL_DOCDIR=share/doc/qt6 \
+	-DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
+	-DINSTALL_INCLUDEDIR=include/qt6 \
+	-DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=OFF \
 	-DFEATURE_sql=OFF \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
