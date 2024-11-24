Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F164E668A4
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 10:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43222610BB;
	Sun, 24 Nov 2024 10:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXUNAhFf5V0A; Sun, 24 Nov 2024 10:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4058461523
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4058461523;
	Sun, 24 Nov 2024 10:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E22E31
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 612D5400B5
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1JogEhFW1FQ for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 10:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36F0C40A50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F0C40A50
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36F0C40A50
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-432d866f70fso32157795e9.2
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 02:50:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732445410; x=1733050210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5krqzaVd1LwgTujpaKnaPm+jgHgrq7Ogt/Shb1CAzQ8=;
 b=NnO9pLtKeFfk9cW29ni92S1fGuQ4OYIt428eiUi1Mn/SnImKJPFFSSwLfbfjNIxglk
 1LNtbBrLRhL5FPeB46cGDhcb7okbR5QioRwWUK2YguyXB/7h1cPNheBVJm5/9l5XksRH
 t5i8Ish2Xo+0tGjmfc8Fk3RAsjhEHepmnl2DbzvOiLH4OtVyw0XlQkVa+TKDREaO3Ww4
 9lxIGontfI0eXYFS0FtisVUXnvX8aUupnAQ0Gwau4fo4bYuxhXX4AkKFwQmVr+EzIw8l
 QC6ZbddOvCviqlWSq49TkNpMMyMWb1AqF662ach7Lo/uHKd27AGLG+KWmGc6Y1XfP+yi
 Ny5w==
X-Gm-Message-State: AOJu0YyIgEqvzwI6+ilbcqqWPUrRMr1nUN3G06WLbWz6TPe1+nlCTzFx
 +NXiKGYspCi1qiM7xRWY81hEeFYjVkQk6Z/tOsPFRbKDymrLbKKxCLwrbvBY
X-Gm-Gg: ASbGncucI/QmAbX2SFiuRfr+OPnRDBcGfit2DiBw+eA5WjRf4fO9MUkQchObSMLz8XO
 sTHe+IlV7c7TY0Vece82xBLGtbgtoZqMo/JiHOjLLKPtJnz7iHHXeoo3ISofM1ep2L6F3VFUbFr
 sFYHCbCUUgk7EgANxQKNAATLVv87OMwZV8eyj+GoqmNAbcrzcI832d9UwbG4sSbxIn22gNZUnvf
 A+pS5ZTHf0bH7gjcwvBavzKYR6BoxO5q8JYHGulcAihwhG5/NZFvTgm
X-Google-Smtp-Source: AGHT+IGj0FH5c2KWWKCvWZhaQRH1nqnXMLy7Cd28A7dhKtYtV5Y7GMsL292MZ/8TDJqNDvT/C4Dm5g==
X-Received: by 2002:a05:600c:4f87:b0:42e:d4a2:ce67 with SMTP id
 5b1f17b1804b1-433ce4289d7mr83646185e9.17.1732445409856; 
 Sun, 24 Nov 2024 02:50:09 -0800 (PST)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::478])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde110cfsm88665515e9.11.2024.11.24.02.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 02:50:08 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Nov 2024 11:49:06 +0000
Message-ID: <20241124114907.16924-4-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
References: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732445410; x=1733050210; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5krqzaVd1LwgTujpaKnaPm+jgHgrq7Ogt/Shb1CAzQ8=;
 b=EK6rTccJNaZzviKAduOoe3PG5NI4RYkRyn2KUafJHFUTXe+t1TIbzQnacStKlMJbhp
 Hi2k+O0I4IaaSUNmS0otg6uxmWoMyLq1Fimhgs45PlJG6a0ZfNfaQ840EiETO4EqxMyT
 o24SSsBNI/qbUs+5Kyv9lzvMLI9v3PmKhyKreDzS3ch64z0YZVr78O2nCtSsZikKsnRR
 1wKEh0PSIrAqd8QSXsqau+Whymf4+oReH8MxBWhip6mh312Bvo7PQJWDsCEYoGfdX66x
 PCN2JXd/NBPZKtn1VxR6LKNCdXt1b/jKjEuzVbpKUwYx1Hs0MUyGrTaIAbhNpXLFScvC
 K84A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EK6rTccJ
Subject: [Buildroot] [PATCH 3/4] package/cage: bump to version 0.2.0
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

Changelog:
https://github.com/cage-kiosk/cage/releases/tag/v0.2.0
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/cage/cage.hash | 6 ++++--
 package/cage/cage.mk   | 8 +-------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index d5517bd918..e7c971ea26 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,7 @@
-# Generated locally after checking GPG signature from https://github.com/cage-kiosk/cage/releases/download/v0.1.5/cage-0.1.5.tar.gz.sig
-sha256  ece0312e559289df0238289ea6c60e9fed32d27fe3ae8a8f83eeff26ddc239e1  cage-0.1.5.tar.gz
+# Locally calculated after checking pgp signature
+# https://github.com/cage-kiosk/cage/releases/download/v0.2.0/cage-0.2.0.tar.gz.sig
+# with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
+sha256  557c194d18af7202a9ec2e8be6dd7129f6c16d0f4528f4079ba26ccd57b6ef88  cage-0.2.0.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 119950bc00..79c8c50276 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,17 +4,11 @@
 #
 ################################################################################
 
-CAGE_VERSION = 0.1.5
+CAGE_VERSION = 0.2.0
 CAGE_SITE = https://github.com/Hjdskes/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
 CAGE_CONF_OPTS = -Dman-pages=disabled
 
-ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
-CAGE_CONF_OPTS += -Dxwayland=true
-else
-CAGE_CONF_OPTS += -Dxwayland=false
-endif
-
 $(eval $(meson-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
