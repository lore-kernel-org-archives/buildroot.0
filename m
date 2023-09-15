Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCCBEE021D
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 05:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 839DB40A4D;
	Fri, 15 Sep 2023 05:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 839DB40A4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNv8ruI6_k-i; Fri, 15 Sep 2023 05:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB86F40253;
	Fri, 15 Sep 2023 05:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB86F40253
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14C2E1BF4E3
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 05:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9032416C4
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 05:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9032416C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DnMUkEok5hP for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 05:58:26 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8393D41600
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 05:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8393D41600
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b962535808so28379141fa.0
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 22:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694757504; x=1695362304;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EaOqxtX+mQZh4LDRzktW1AE2UGFQ6AdLy9V/fZhh/vE=;
 b=hJ3LUNXSb+tmqo0Aqvlj4mduFsQ3X/u55+d226Ae4HCsD5O0Zg9cqpE9Aq8iamqLmj
 EtIlDMFFgHAvoN0T0douBIEOmO839pEhC7oh0PkNCSnK/N3rYvyYBRRMJiuramia0X+M
 4BZtL4tLd/ZINzdHyX+g+5mBuA7Afk3m7aHylTplHkpgji8djbUuOelWW671/ItFVHIK
 n9M48BnQZv0Ji5cE8Ak7UCIqRv8W6Q8BvLJoEfhYa+naFgFL5BviMa3n+x5PC3g2cV2P
 jHcxur+E6Zh7hXSdVbvd7itMtYqlzLhETIAdIUAFHEy+V1806GDct0nOJAA7xwJA/2c2
 wSNQ==
X-Gm-Message-State: AOJu0Yzrb5CL4kWJOEZMW1podPQWjqfBjD47dSFl8WeFvBTE/SyNVNH0
 81i+OHd65VHSvRHNUR/60Qq/t3/kFck=
X-Google-Smtp-Source: AGHT+IH0QRVhsc9/aq2rm9DQNUuIMx2u7MvVX4Rez9Fl5xNy1e1mcV2ykyGsF15roDNcRW3+3cv1pg==
X-Received: by 2002:a2e:9014:0:b0:2bf:a0d1:b122 with SMTP id
 h20-20020a2e9014000000b002bfa0d1b122mr659150ljg.5.1694757503737; 
 Thu, 14 Sep 2023 22:58:23 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a2e9097000000b002bcb504cf0dsm574599ljg.17.2023.09.14.22.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 22:58:23 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 07:58:17 +0200
Message-Id: <20230915055817.3079333-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694757504; x=1695362304; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EaOqxtX+mQZh4LDRzktW1AE2UGFQ6AdLy9V/fZhh/vE=;
 b=nA9Q7UuBH/4xS3maCwBIqIngXXbp7/pC3SWGQr9dGYsJCyzlyIbwPOlQnVYNIDm8FF
 JQL/dCqH+6pL77vDCK3INeTF7KyWcUEggeJL8o09mTniLCmY9PMdblNOw3jpRX1ohrn+
 g2CfjXW1mpEvy1NagC4pQIqUF/gIC86/KTLhUGyi7lmjRoocIO8N2WeEABH2AKh9y+kM
 dwRfHZYaXOLV/jHM0QB8Dw8ycBhy/acWaoSrNO/zJC3ljyvKd64wMIyVJIEynyQ+xHet
 RhM97IsHZrdn9vs1a6qBvp8FiTlbtR/wPwkKgOkjYUsnJOrhrrNchWEtDrP5A19uvdhh
 dPuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nA9Q7UuB
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.5.2
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Improved accuracy of MARK timer, optional, default: 20 minutes.
 - Fix sub-second faking of kernel timestamps
 - Fix reading kernel logs from /proc/kmsg, regression in v2.4.0.
   Only relevant to really old kernels (pre 4.4?) or systems with
   static device nodes and no auto-devtmpfs mounting in kernel

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 30ce6d9c0b..7e00990174 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  e1d635944e5a6062c8ea18b9506668ebdaefacea1965147f60cf3fb3a25770e8  sysklogd-2.5.0.tar.gz
+sha256  9da4444285772ce2bfc9c687be8f978b7a9fe7d3937347cd4938eda0c4545e05  sysklogd-2.5.2.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index ebc9f89cf7..7a46d759d3 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.5.0
+SYSKLOGD_VERSION = 2.5.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
