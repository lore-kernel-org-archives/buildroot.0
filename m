Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA18E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 11:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF95C60856;
	Fri, 13 Dec 2024 11:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKzmuw4BVXdO; Fri, 13 Dec 2024 11:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F5961184
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04F5961184;
	Fri, 13 Dec 2024 11:58:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6DBCECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4DA581F2E
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXQGDIOA9kPM for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 11:58:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA1FE81F26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA1FE81F26
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA1FE81F26
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:40 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3003e203acaso13570541fa.1
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 03:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734091118; x=1734695918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U7wbePjiUaGZ1thag/m8svTx9Lawl5IPJ3iFq4LgSsM=;
 b=jq9YFn5Wa9Iqv6CvETk24g7zdyqqjUgG74gALWZnd1230M8q/eqQMBrngUzqBhU8N7
 E82Y38j+XFxQZ4WTkKf+S4Vli8IsOwK7A7XzDaFPB+VyfvQAsEIRzYY7e6AxAczBkPe6
 ZhQgBBv9FDZdcVbT6dIbXI1KYuAk1fZ2CJv7J5c8HpLSLlhU/RnV1HXkdoYvpbrkanlR
 WVj1ztyWoo7XfYoD/ZrjO3DEeROvpTMDPJMb+hw99qWECKOEKLnEpfbDxkD82yYWmPZD
 CP6Xgb13ZEPom3mX9Zq6i4Gg2tZo+8hBijwqCDt7EyKUfJrfALz5bHsVbr4o13tO/boL
 4a3Q==
X-Gm-Message-State: AOJu0YwQD2C+c63NgaE84hL2tCvvOHdJrEgZXF2hhoouYwRytdLCL9UL
 FwF82PMEmPGEaYjWaOKeMO3YPq54wFCtp2Lw0p3gHozfg+VLy+zJZvW1JQ==
X-Gm-Gg: ASbGnctdvjqRNNANP17zGz/Q3iTVO/Z9uZLgQrhn2SRUdhDG1po6JKLSSpWA0uzgT2D
 6KrONIpDkl1UjPLHebd5Sw39bZuwnx/rQiiM9FRTuFXCBw3qe9OP0LvJfG1YSFMFclpfRhZAIge
 m9ImI7wXbxFFSdfNn0rlitZGusLOjNR/xu8yu2jvC3f+fr3WF55dIEKP+Kq2VO34Tvfu943brlY
 t71lm7KThKFW6xGwreLi+W3PnvkzpCUBtDz9P/+K1VYfYsLe8LzQ8IVgg1l+G77BJpAvcoAAyQd
 pZQIl91xHd/RisA=
X-Google-Smtp-Source: AGHT+IHCTVkbB6lh50wkGFyXySO9UiIcFV0UhrNgjgAvfH4QNhCPE8o1CHuQSyhHdjACXWg+n0saPQ==
X-Received: by 2002:a05:651c:b0c:b0:300:2ddb:aaa5 with SMTP id
 38308e7fff4ca-302544f93b8mr7456101fa.30.1734091117947; 
 Fri, 13 Dec 2024 03:58:37 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30038ce97b4sm20610651fa.118.2024.12.13.03.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 03:58:37 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 13 Dec 2024 12:58:09 +0100
Message-ID: <20241213115820.655993-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213115820.655993-1-roykollensvendsen@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734091118; x=1734695918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7wbePjiUaGZ1thag/m8svTx9Lawl5IPJ3iFq4LgSsM=;
 b=gJ1LvKGqAnuZhCBh4RRbUH/ghBPvYpwlgcz67EF6rXWmwuUFNkEJoCdyWGXwmFziMV
 NGoCH/33qIREFO7TdR3zknU25U1sdHgJH3sITNurDG+X449PXvdHvqhdjWdh3r0bMf7N
 IZsOwswnqPfLmli0mquwML8jgJfuK2yGpFtcTVPQjjISaDer5LnO/9hcJpFhdujrhWAW
 i4VzPXgwwKCHEDsTFAY/WmXi1uHRoNgfcF819QA9dyqqF7JLlQlZa9LwEmoi7M5gXQVh
 HpJdGG4M+NbNrPXAl4C01cE6V/ofWAg2idSOXcXlUtkLUz+lQ922/k/xyGqMSkGLuH8p
 zEbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gJ1LvKGq
Subject: [Buildroot] [PATCH 2/8] package/qt6: remove unneeded and
 problematic CONF_OPTS
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

In the qt6opcua and qt6declarative packages we don't follow the same
pattern for default CONF_OPTS as the other packages.

For these two packages we specify QT_HOST_PATH, which I don't see any
good reason for. On the contrary, in my experience, it causes build
failures, when bumping Qt6, if you don't rebuild everything. See:

 - https://doc.qt.io/qt-6/cmake-variable-qt-host-path.html

As for the other parameters, BUILD_WITH_PCH, QT_BUILD_EXAMPLES and
QT_BUILD_TESTS, I don't see a good enough reason for breaking the
the existing pattern for only these two packages.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6declarative/qt6declarative.mk | 6 ------
 package/qt6/qt6opcua/qt6opcua.mk             | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
index ecf14d3323..edec67649f 100644
--- a/package/qt6/qt6declarative/qt6declarative.mk
+++ b/package/qt6/qt6declarative/qt6declarative.mk
@@ -35,12 +35,6 @@ QT6DECLARATIVE_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
-HOST_QT6DECLARATIVE_CONF_OPTS = \
-	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DBUILD_WITH_PCH=OFF \
-	-DQT_BUILD_EXAMPLES=OFF \
-	-DQT_BUILD_TESTS=OFF
-
 HOST_QT6DECLARATIVE_DEPENDENCIES = \
 	host-qt6base
 
diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
index 6c8ff7af89..28771ba8a5 100644
--- a/package/qt6/qt6opcua/qt6opcua.mk
+++ b/package/qt6/qt6opcua/qt6opcua.mk
@@ -28,10 +28,6 @@ QT6OPCUA_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF
 
-HOST_QT6OPCUA_CONF_OPTS = \
-	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DBUILD_WITH_PCH=OFF
-
 QT6OPCUA_DEPENDENCIES = \
 	qt6base \
 	host-qt6opcua
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
