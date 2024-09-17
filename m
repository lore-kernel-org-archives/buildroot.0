Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B54CAC596
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43146607A5;
	Tue, 17 Sep 2024 18:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w77m7kgOv30i; Tue, 17 Sep 2024 18:47:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4557D60A48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4557D60A48;
	Tue, 17 Sep 2024 18:47:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 084D11BF295
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB6116070F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZDlKEei2R52 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:47:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0ED71600CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED71600CB
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ED71600CB
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:47:32 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-39f54079599so127225ab.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726598852; x=1727203652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mqsZFVjmiR5+iHzvnuCeDP6XDU8FEneOKtGPcbtGL5M=;
 b=FMBpz2Q+e7V6aziw4lsf11SG2fDzWb7+HjI7Ennk6F2/4JDlpCRWx1wkCJkol08G+8
 dVVuLKINMA0SXBOJPgG8nLOuDz3+sWyKIZLgh+KaBJ16JFdUhmWdNl9zIye+Y/obQZ09
 y9tGUlf+K8jr2Ile307UgA92XYndBr2eRB6VOa0wWOdtkvm2b6KBwwIYcoNh/ohBKnsU
 sbI7swwrwML+6qhsya96+lLcj34J4cHPqlbocpYowx6IwJK+3paAUCZWavgHlDlD3GGe
 wP8pItHWmIz8Kg6Ap/Llst8hsVjD2lyRJeDrACr89HZLAXfqlms/REEncrZjnfHsxqRH
 mvEA==
X-Gm-Message-State: AOJu0Ywq6PEmorEgyg0Qt+83qdgb/qw6OXKqySkvaaaZgvd6LgIiVs/Q
 PKcVHuxc1i1lYACOlPuIDrakWnBorM2/us/HDVtmG/oEL4Myp1npUVW9XQ==
X-Google-Smtp-Source: AGHT+IGEF1398WtaOnP/YanOD2P3oCN6AP7cNY04dOu4UL5k+kdezprEjIG8xxRK3DJNpAPb90zLCQ==
X-Received: by 2002:a05:6e02:12c5:b0:39f:325f:78e6 with SMTP id
 e9e14a558f8ab-3a0845a0d55mr163569345ab.0.1726598851873; 
 Tue, 17 Sep 2024 11:47:31 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfdd77sm23537085ab.11.2024.09.17.11.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:47:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:47:30 -0600
Message-Id: <20240917184730.3894828-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726598852; x=1727203652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mqsZFVjmiR5+iHzvnuCeDP6XDU8FEneOKtGPcbtGL5M=;
 b=g5Ih3oPjCBdSItgDYQgCtPCfwq7eW1W5xsUP7syCU4KwdC/JD6N+Fq5LierbgmlOn5
 nokrlD2DOyHmYXmg+2q8r/x6/y5L/W4Z4Ip/jjD9pLoUB1KkYOs1F9dfvenCIjpyCRxC
 rVtAo8sH/wUyHW5tLkwfSDRj4euz1nC4DndV30ksevjsS6GUzWGbGT+zeFFKlj9TE6GI
 yjpE924+Jwki4koja2C4CCRabEqv2zFy+T5tP/9rGdXVnd/o8bvtjFAg29Vz11Y++7Na
 FExWh3r0fPNGid12LpyxGtXRY/0Yn38V+4I75KbZ20HqeUeVIMlKsSzIQQ1IJ8tJrs71
 92hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g5Ih3oPj
Subject: [Buildroot] [PATCH 1/1] package/python-pluggy: bump to version 1.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pluggy/python-pluggy.hash | 4 ++--
 package/python-pluggy/python-pluggy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
index 338b08d0b1..522c1e3b6c 100644
--- a/package/python-pluggy/python-pluggy.hash
+++ b/package/python-pluggy/python-pluggy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pluggy/json
-md5  ffb69741271eaeefab3f2ef2435e2d5f  pluggy-1.4.0.tar.gz
-sha256  8c85c2876142a764e5b7548e7d9a0e0ddb46f5185161049a79b7e974454223be  pluggy-1.4.0.tar.gz
+md5  ac0870be78ba0ee227a5c3955efeba59  pluggy-1.5.0.tar.gz
+sha256  2cffa88e94fdc978c4c574f15f9e59b7f4201d439195c3715ca9e2486f1d0cf1  pluggy-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index a703a93b9c..f8a0b729b5 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLUGGY_VERSION = 1.4.0
+PYTHON_PLUGGY_VERSION = 1.5.0
 PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
-PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/54/c6/43f9d44d92aed815e781ca25ba8c174257e27253a94630d21be8725a2b59
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/96/2d/02d4312c973c6050a18b314a5ad0b3210edb65a906f868e31c111dede4a6
 PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
