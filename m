Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE661CA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 16:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F8E4085D;
	Tue,  9 Sep 2025 16:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13sLOKrZKVxG; Tue,  9 Sep 2025 16:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F4341314
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F4341314;
	Tue,  9 Sep 2025 16:13:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF20A186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 959AF608B8
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL1sRH1Hwap6 for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 16:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFE3660ADA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE3660ADA
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFE3660ADA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 16:12:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b0449b1b56eso857181366b.1
 for <buildroot@buildroot.org>; Tue, 09 Sep 2025 09:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757434377; x=1758039177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TumorNRNMshIbmEMleLM0mbYyTpHMebNyYx0HfAhtYg=;
 b=wYMirzS9UyvFohQ8hPvCfM5uSeP7v82wgb9MZTfVF0q5JYNBlghuroH0WjqlL8bcI7
 EUD/m4wA9BBeTZ7R4USdLObkL2RESyPak9E8GyNQvq66zY5SEyrXyQlJc78xR07zBUat
 RXoVxEGA9AvDo2KT6QZLpTmUPBxRmolBd2yMnI5ojPl5Jj5/MoYqiDYwtoJjxd5PB0Fi
 ++Esctch4JkSUi4GXKm28WuOCwWE7diKPnlX9yBdOH5CNNzRlNNtLPWC38jV8hgIyRJt
 9PbeFlN4gDbpILzK7MYjDD8il+JGkUQy8qtPbJhbbwVFOuqeNPUffNGX8pZCVwvMCuGS
 DKgQ==
X-Gm-Message-State: AOJu0Yw96BpaSkB618ZP5y245GE9SjVwJ556K5xRvnCPgcEfhYkULtjf
 CcBpDjJUu/fZocbBj0kRXFT3Mzr8QL/Xors6zIRkejDPyZipovzpw61fP+wJLs7I
X-Gm-Gg: ASbGncu/v94/8cOP4TntBmgy61T05KSxkzyibkO/oSW+AFkuwfylU33dTafm6jUgtPX
 7/uW1eR1ie5WVu9DDWQp2bCVCC0gPUWdYhfeKyMnavhsuOdvauOg5YzRA9o8k6xkf9BzuyDHnsp
 R3xQilo8k+Tenwutv6zQqblUUslzXszpAe+Ro2krPYo+9BH2yjZWzKLglXOmZgCOxUOdkan1Hdq
 nsDVsIkIAmuMpL7sS7by4PhZJpM4gw4Zhawt2TTEdFuuKNwFhHgDZzsSom2CWKSMwxnfOxuFUje
 kg7dU5cQjj3EjtvQ4QRpK8MrhA91y+4EJRFYIihV2eWcZS/hhOx9QVOD8dldu1EEnggWAMMC8Bz
 X7LiLqW31ybkCN/6nzWA7n9PbmMXwzePK1/6XVIhPscVqLwP0gyGR0rtY
X-Google-Smtp-Source: AGHT+IEM9jTFj6bzg5D5zIu2KjgutjJ39MNgzlW5qrPic7l5MBYNEgmCKaLyegLX/XJovRIdRi6MKA==
X-Received: by 2002:a17:907:6d12:b0:b04:21c9:ad83 with SMTP id
 a640c23a62f3a-b04b174b143mr1203473866b.52.1757434377084; 
 Tue, 09 Sep 2025 09:12:57 -0700 (PDT)
Received: from localhost.localdomain ([185.254.39.93])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07830ac12asm14209466b.38.2025.09.09.09.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 09:12:56 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  9 Sep 2025 18:12:58 +0200
Message-Id: <20250909161259.34807-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757434377; x=1758039177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TumorNRNMshIbmEMleLM0mbYyTpHMebNyYx0HfAhtYg=;
 b=TR0uO4je7lxC3A3GmAyO92quKdT5LwDy2Fsyt81BR/jjML4oF/4h47248IJMld5yOg
 meSl5LroinzEAETotFF86EygAkl43AmiQ+cI8Dovh0RwO1lnJfx1+d7Lrau/FbWDUY62
 M67q4snir1TSlStqPXAd03NRG60BEid4h/ZvjFUxF5tmlfAw4sqtNaMFcNOcKS3fZDLe
 Z+L6lE84NPJcN96p5ckJKWY6+i4AzySKTJITVoJzeDEdK56CfjWu3jlauidRndaFNeZ+
 8XAgGF963cwxGRrKeGxmgGXhixSFNH48xCOdq+3Zkq9Hdxs53mxdLCeqm/PZZxMBURgl
 NqWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TR0uO4je
Subject: [Buildroot] [PATCH 1/2] package/htpdate: bump to version 2.0.1
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
https://github.com/twekkel/htpdate/releases/tag/v2.0.1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/htpdate/htpdate.hash | 2 +-
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index efccaf0097..44d73fbe2f 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  52f25811f00dfe714e0bcf122358ee0ad74e25db3ad230d5a4196e7a62633f27  htpdate-2.0.0.tar.gz
+sha256  4c771fe3fc5c4ab5f9393dd501bdc51e4c067297cf304ad1e74e1965ac1c066f  htpdate-2.0.1.tar.gz
 sha256  74096c67e102bb6545b84487b5e7f18edd038fd5fc0199c8a0b25efb3c522f06  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 7040500a3c..8d4b1e073c 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 2.0.0
+HTPDATE_VERSION = 2.0.1
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
