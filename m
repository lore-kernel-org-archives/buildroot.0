Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007A0CCA470
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 16:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C2D613A0;
	Mon,  6 Oct 2025 16:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFbjwxa8S9UY; Mon,  6 Oct 2025 16:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F412461398
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F412461398;
	Mon,  6 Oct 2025 16:51:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1600A909
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0F7A84102
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvuSa6LpwXHx for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 16:51:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B344E84100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B344E84100
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B344E84100
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:51:05 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b07e3a77b72so1031174866b.0
 for <buildroot@buildroot.org>; Mon, 06 Oct 2025 09:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759769464; x=1760374264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/8ROcO3Y1EJeh/thEAGfBP1UceewNJDY15rPprGNLEE=;
 b=W+/BWHtwQfrcqO6tOe9IiaACc0O7bL21m5Mtpnio/vN6jvWL8dmONLD3EAbRIVgbcq
 F5VG0DPJowphMOHufzSO2+6q5HC5enGZkH/vsE6M2N4bPDhrg3rHrBsmDUOf4Jlgu1Wn
 2tTRhGW6KnfCNt+d5GNiinB32MAlob+jjic5yj/BwHX2H56KTtbkGQOb/Z4d0GCy0rID
 1LUyQbHu9P/6BRzZqdBK0/Wb39o5kUpAfVN0ke+rgOH2SdtEotXjl9tu7J+zcG5qL6Dy
 JLDD1bZ0yg+Jy1j5rUzdIx5mVF52lK+cp4eh4XU08UcHtsx76+nvbnczT18mZL9iwHko
 NeIw==
X-Gm-Message-State: AOJu0Yz1OiRH4+m1NcJqjc7ShSNFF5b0zlp5nbKMq0g/atrcA4MENUjp
 yHbvC1Wua5EYd41rhixSoH+xfF6KEmNYOpOxdDXgkA8Lurg404dlQhcOzdazc9k/N4Xl/HuaafB
 /mL4b3q8=
X-Gm-Gg: ASbGncvN5a1/ITyXzx5mLrNMh3osToAarcVOM9zQwkBkCzYc3cnXLv0VuIM82yvjgUg
 VlPuvGXCdEeFk3/ulqP2ZBFiy3g/ZO63qhMrj+610GtsgXmYWPlOQeXNt0coKZEtVZ/yuPfAFCM
 1LLaBk3cQktOdWUppZDBn7tkyk/GVEumf1GhuR2jVaYLh2GqaG6TKtxXGQM2mihd5l0FV7kBMD7
 PYMku6+XUjQ+NNOPK/A1nohKNI0pPiBMXeDBqK0HcbskGWsq7SQC352M0WyxpMG2kl7IC2ro1XY
 HEqDudadrixiaYmatxDVftcpk+15/DQpAtDKWsgV98TWhOE0UgJk2XItugsCrCziG1NDyoCIjOP
 AwQjIYbZzBx6Jtsd7j+L6NVJ4Mib1e8bDWuOHbMdgjKig0U+Saxra6P1WccL3UJIbFqrLd5nHUY
 3F8s/0IWDb8vbiC0KHky34oGOg+eOIkoUTXWxJgbWcK/qFB5twvRHyGiSdk81VhVPn326FtMbBO
 tTz4QqoBT+9104=
X-Google-Smtp-Source: AGHT+IG3mCPirMYX6VpS9KUSCu5LWajoDuYbN/h5App5EhzeWZUi3klptoBKhu3gsYkCW+6Jj4Gm0Q==
X-Received: by 2002:a17:907:8e07:b0:b3e:c99b:c77f with SMTP id
 a640c23a62f3a-b4f4310366cmr37205266b.24.1759769463668; 
 Mon, 06 Oct 2025 09:51:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3ab4b0sm10555497a12.5.2025.10.06.09.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 09:51:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  6 Oct 2025 18:51:00 +0200
Message-ID: <20251006165100.1888278-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759769464; x=1760374264;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/8ROcO3Y1EJeh/thEAGfBP1UceewNJDY15rPprGNLEE=;
 b=pNbvim9BTF2ntqqr/4eq15tBbtWVB3D21CkjWEL52VL2J2wZ3t7RpyMFHu6fHA2MNo
 Vn+CdNOIJl8EKxDBHcCaRFL5UWonvSJvYZ0xc5H/HQIzxjFNEh4aXKME7ybc029VKo6h
 QtzKGRlZkd9GCVttb9G3Kdzc0L2rQy/4AQLOg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pNbvim9B
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: bump to version
 3.2.8
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
https://www.freeradius.org/release_notes/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/freeradius-server/freeradius-server.hash | 4 ++--
 package/freeradius-server/freeradius-server.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
index 2c0991a39913..b90aa4b65772 100644
--- a/package/freeradius-server/freeradius-server.hash
+++ b/package/freeradius-server/freeradius-server.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking
-# https://freeradius.org/ftp/pub/freeradius/freeradius-server-3.2.6.tar.bz2.sig
-sha256  18bbb2318448f13918897ae7a38b36afd3db7dd5c66f78ad24d2e0051269d9b2  freeradius-server-3.2.6.tar.bz2
+# https://freeradius.org/ftp/pub/freeradius/freeradius-server-3.2.8.tar.bz2.sig
+sha256  2c6483baeba65f939734473fafa31c4f727e8e139dd884563121412b6aba681b  freeradius-server-3.2.8.tar.bz2
 sha256  0a0e46014fc2efd5144a30359c0e6e1ea9fa3dd407d3318204150efd7b4caf6a  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 9bb5c3606ad3..946750f1a5d1 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERADIUS_SERVER_VERSION = 3.2.6
+FREERADIUS_SERVER_VERSION = 3.2.8
 FREERADIUS_SERVER_SOURCE = \
 	freeradius-server-$(FREERADIUS_SERVER_VERSION).tar.bz2
 FREERADIUS_SERVER_SITE = https://freeradius.org/ftp/pub/freeradius
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
