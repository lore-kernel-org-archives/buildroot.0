Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92047C83F3E
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 18:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28336418BE;
	Tue,  5 Sep 2023 18:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28336418BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYEZ2bSVqipB; Tue,  5 Sep 2023 18:07:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06BE1418DE;
	Tue,  5 Sep 2023 18:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06BE1418DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B46F1BF318
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61DAC60BEC
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61DAC60BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mVyKfWQIu6QN for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 18:06:25 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 787B760BDD
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 18:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 787B760BDD
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c328b53aeaso21708725ad.2
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 11:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693937184; x=1694541984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVU0UxHEDvGB9vEActR1w0/pcPk7EjsjiLgJq6rZ5rs=;
 b=bjfXczkMpvSLoB+28DacTFb+IXkBEZNszwYbn7dGKXn9cQLNsVAHW8f5yv0TMfsTHj
 o9IQ/iR9y5jJiWqyAm5OPiODfvQgOetW2vhSSKGga6GNTpcstWW1CJ6vhFlGbVEwE7Kb
 IU0WrsWp8zv5wYyPC0IEpDJe63MAbEm3ocEq9vcmAHwkQnKwu3n5P1v3kQwlrK//yljt
 aTAhFhV1Fnh8dJeEUE3/WTS8SBQSIDg1UmeKN47vP+GU/w9XCvwGICXuo8RWHVJ+3K4E
 Grq+q4dFbxdETNgIJLeC1TM0Kld8YqlGqiTzOjEESjn4DDbaHRUtHyGrNHHdtcC2t3iQ
 9agg==
X-Gm-Message-State: AOJu0YyXzGjGnM2ztIQkqHSYuRY0NYJV2Slemwzv/N16cEw37uNj47et
 8I4HSillMyFkXOkhxpWfPexRpFnWfQs=
X-Google-Smtp-Source: AGHT+IGYP1xzTP5sk8WqOJ/5GoFFDXJG5AZxeimoT1ziJglrcBELBxIT/EazHiItvFTb0Jmpd5Acxg==
X-Received: by 2002:a17:902:e887:b0:1bd:d911:2a85 with SMTP id
 w7-20020a170902e88700b001bdd9112a85mr17032053plg.12.1693937184429; 
 Tue, 05 Sep 2023 11:06:24 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bba7aab826sm9658143plb.163.2023.09.05.11.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 11:06:23 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 12:06:06 -0600
Message-Id: <20230905180610.1610778-6-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905180610.1610778-1-aduskett@gmail.com>
References: <20230905180610.1610778-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693937184; x=1694541984; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVU0UxHEDvGB9vEActR1w0/pcPk7EjsjiLgJq6rZ5rs=;
 b=QUScHmrmSk3HJbmQSSwuVjabzEdsCcoumI85zL5VA7GJxejWiNJ53aDqMjr2NsXsCj
 uMNtFOi6du7V3ghC0eQtzApN2MJ6DnwYw3zvAM+bopV+SubCaoJqIKqTc1lAH1NixrC0
 /rbL77BY+2XJXF20yqxzvbs50B+Alwqi+eazJKcTezpYnGHmzcPwBmXi9LwFN0mgDxzK
 6wkgJO7c9efkzQM/17aNytHkDYyzVWrZqVuefYll5xPn9JKaJcgqj//ZCeaKbILUrx9Y
 O2LS5mYbl63cCwXTlGS1gWsm+Z2s5h9MoZswVGVwDfTCf/oLeL7PJtEAGa6BY+msela3
 dByA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=QUScHmrm
Subject: [Buildroot] [PATCH 06/10] package/php-pam: bump version to 2.2.4
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Adam Duskett <aduskett@gmail.comm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.comm>

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
---
 package/php-pam/php-pam.hash | 2 +-
 package/php-pam/php-pam.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-pam/php-pam.hash b/package/php-pam/php-pam.hash
index c3eb49fbe7..be15237f7d 100644
--- a/package/php-pam/php-pam.hash
+++ b/package/php-pam/php-pam.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  fda3b5f719d51cb278351eedd3d7a96db75661324d81fdcf8072a4309121bc92  pam-2.2.3.tgz
+sha256  d5c818c73c9cde4d2118bb08322dec0b532f3be48c3ef7d3f23a05af5080eb24  pam-2.2.4.tgz
 sha256  0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7  LICENSE
diff --git a/package/php-pam/php-pam.mk b/package/php-pam/php-pam.mk
index c35ad4f5d0..a348fb9d44 100644
--- a/package/php-pam/php-pam.mk
+++ b/package/php-pam/php-pam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_PAM_VERSION = 2.2.3
+PHP_PAM_VERSION = 2.2.4
 PHP_PAM_SITE = http://pecl.php.net/get
 PHP_PAM_SOURCE = pam-$(PHP_PAM_VERSION).tgz
 PHP_PAM_LICENSE = PHP-3.01
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
