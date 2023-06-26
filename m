Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A158EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 16:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F19AB41A49;
	Mon, 26 Jun 2023 16:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F19AB41A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiei17Np1SAF; Mon, 26 Jun 2023 16:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8DC741BAB;
	Mon, 26 Jun 2023 16:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DC741BAB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 341AA1BF3D0
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D58561324
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 16:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D58561324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyXqGl75t_WX for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 16:01:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE64612EC
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DE64612EC
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 16:01:09 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1b80ddce748so4818965ad.3
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 09:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795268; x=1690387268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0S72dXnITYBsPnwiGYjJNi/BQ7XsYkDqj9kY4xr+bz4=;
 b=Ob+osEiNo1jWCg5GWEAj/sKVCLSqA+7m/+ZcFK9r1gXFN54P++8t/I5Wt46WLdZU98
 dcxJ9qUGrIRMyZD66r0IeNAQeKLZyiJdWPJq3hIGCP1fcIxbO082fjdyMmjOIjzg5rjB
 63xPkhvPoNMS5gpYgKMS8OYcx4tc6MpAJ7jzeeiWumqlrv51R7cRHJwYNsur1oY9CfVl
 MnHScEZn9JBGyhxmAgVFi1VtKrv9Pc+rwHfd64mUzHbqLZkGhurW30Fi+fwN2Nt+phAP
 HHO8P3u+aeDyO2rVfwTiikfqM7AsPXFrvFBW6K8ZoskzCUlI0CXiO9t+UK/BaPZsd/QI
 J5Og==
X-Gm-Message-State: AC+VfDzAErGD1T3wAgCtDrWYGaZtj2/XWspyoQDRno3GePnqB3OyLSBY
 PDTYQMun9Ssa0NWBbjYbYqplnoVAwBAX7g==
X-Google-Smtp-Source: ACHHUZ5YNIBH3LqUnGEjPwl6RTWAqKIwsPkkYh6u1mH2DpQa7xIzdfYvyksQgO/1z73rsTaCLD3K+A==
X-Received: by 2002:a17:902:eccf:b0:1b3:e6ba:1573 with SMTP id
 a15-20020a170902eccf00b001b3e6ba1573mr3748053plh.6.1687795268128; 
 Mon, 26 Jun 2023 09:01:08 -0700 (PDT)
Received: from ubuntu.. ([149.28.154.72]) by smtp.gmail.com with ESMTPSA id
 x3-20020a1709027c0300b001ab1b7bae5asm4352343pll.184.2023.06.26.09.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 09:01:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 00:00:28 +0800
Message-Id: <20230626160030.93063-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626160030.93063-1-bmeng.cn@gmail.com>
References: <20230626160030.93063-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687795268; x=1690387268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0S72dXnITYBsPnwiGYjJNi/BQ7XsYkDqj9kY4xr+bz4=;
 b=aZqiJxafSH5O7Zf6zFn4+QcuX4cW/MtU2zhehO9LcY0WjN9rXAydVzON29E7EJTSUi
 CfGxEvZDiUSqoxvEYvIgV+UGgQJv88EiJ+fLLEm5C15Gy52GbVCYNQsfRueg/Q1jBsi6
 Rqf6MvuweC6bgQwJCo3xoggjhJMIdB+vcCsBH+fFmRJI7dAqJsAVlYprS+ov2/cf4/2f
 gDjWUNj0q6HxQlF3pcApdgvB8t+s0Z3roBVG88KsxVWeVPM3VN1aVXSTgvVQ2YUsCYVV
 eRZbWOVzrkzhAM7Xjt48P0oJBJnlAGCgrj7dDkNFTCQE7VEEH1CZqSkbldol+rEzWP2w
 lgrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aZqiJxaf
Subject: [Buildroot] [PATCH 08/10] boot/opensbi: Bump to version 1.3
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bin Meng <bmeng@tinylab.org>

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 boot/opensbi/Config.in    | 4 ++--
 boot/opensbi/opensbi.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 99c4989479..de2f0aae20 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "1.2"
+	bool "1.3"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "1.2" if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.3" if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index dbc77e856f..980fb141dc 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
+sha256  2c0501eb3475f463b15f5b8531996f64604ea49e0e3ed040ecbd1fc27ecd8c5c  opensbi-1.3.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
