Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB5FC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C623341181;
	Mon,  3 Jun 2024 11:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbbugtO1U2Ao; Mon,  3 Jun 2024 11:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DE6041492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DE6041492;
	Mon,  3 Jun 2024 11:52:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67ECC1BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C086414D5
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MROzjz7DWCJx for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DC7E40B12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC7E40B12
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DC7E40B12
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:32 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52b90038cf7so2569200e87.0
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 04:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717415550; x=1718020350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dytNFdxiC2loqzy4lB5UsCmb6e38tkWKhLjnT/UdFzA=;
 b=qqo7LoF+119zSNgQYVng3ON+DQdXfA9kf8gpslmF2vH5Ir8Jz8WB3UbJuwO8fQQFQq
 oSSP1GLG9VVFCgS8+mNtFW9X7b3gLPQ4hM4d+C6+Y7kJaWsm14WmnDIIXtlBjVZOaEIj
 MRmKOvjuIdC9reoe6xz94e+rRewAWT2gSI0cHsnG0b14Zi8V+jygADJjPfDCc/+xZMcs
 0HilOoclGJ7QpxYngu+4Oy7T2oyWLGz9Sp9tPKoguZ0l9KHrR8at8hKw/BzKTpffgyZ8
 5XPf6a3lqCDWXZlgzKuPC52BWQv8TEXueMxUc1dq4j7UgZYbG//RIg5kVvhi0zpsk0MP
 k3IA==
X-Gm-Message-State: AOJu0Yz0iMHFt6Z0TdNcv36ScFHPL/kgpGe8/DIDQ/uQH3HylU2pB/gb
 hl8UcsOFG2LxmHzESe/c5omtCK2lx/iZZ4xeAoic9hYZ5UYjZ9jm6G/vPU0l
X-Google-Smtp-Source: AGHT+IGvcHMBRkAC67EH0z7O53Ij40ucAKRwJPB1uM0UNLi4OZLbPnMY4e+s/fHRsja9nhkEDSdYHw==
X-Received: by 2002:a05:6512:3599:b0:52b:846e:a144 with SMTP id
 2adb3069b0e04-52b89573d1cmr5997982e87.25.1717415549601; 
 Mon, 03 Jun 2024 04:52:29 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b96035a33sm529058e87.294.2024.06.03.04.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 04:52:29 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 13:51:46 +0200
Message-ID: <20240603115206.3583474-3-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717415550; x=1718020350; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dytNFdxiC2loqzy4lB5UsCmb6e38tkWKhLjnT/UdFzA=;
 b=crGi8NAqk3uQYPHrDNmoLOWvb2D0fKx/xENdT9DF5GpgdpHf0uweor+uy2heei3kkP
 S6BHkgxKJxpuFg/dOU6E2K1tSKG5Da9J0zPbhXu8yBzgMeMcA6YjYWYm4MUn7zbXgQXp
 HcaCJ269IF2zC30KHNan3EYHDQtrt8Jk78q5uW8xdVgJ227L1aN5RtJ7Igqic5+csrOg
 NMS0QS4qkgV+i+gmj29y6w5LiD6UYi9q/LG+LLaSuNA/e+cpzpMXMqrXVk7ZImRo2AEf
 DtgKNElfkQlA9SqLfIZO3yrtpRr3eO1BBbes+mFdnV1bErKSQyi152giyK/GuzpqFQvm
 BCMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=crGi8NAq
Subject: [Buildroot] [PATCH v6 03/14] package/qt6/qt6base: add blind option
 to enable Network support on host
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Network module is explicitly required by qt6tools.

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
Changes v5 -> v6:
  - Add explanation to commit message  (suggested by Yann)
  - Add explanation to qt6base blind host network option

 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 326c06278e..286da0ff03 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -2,3 +2,8 @@
 # Qt Shader Baker(qsb)).
 config BR2_PACKAGE_HOST_QT6BASE_GUI
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Network module
+# (e.g. Qt Tools).
+config BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5b9ddc4d77..6d2d3ef377 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -87,7 +87,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
-	-DFEATURE_network=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -110,6 +109,13 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+# The Network module is explicitly required by qt6tools.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
