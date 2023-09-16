Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5A8CD37B7
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 10:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0E89403F8;
	Sat, 16 Sep 2023 10:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E89403F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tI8BZCsstyW; Sat, 16 Sep 2023 10:14:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13DFC403C7;
	Sat, 16 Sep 2023 10:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13DFC403C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF6391BF370
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 10:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5E5360F22
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 10:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5E5360F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMjVhoiCQ6Jm for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 10:14:18 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DC7360E7B
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 10:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DC7360E7B
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32003aae100so112748f8f.0
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 03:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694859256; x=1695464056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nnkhC7PIfdA3+YaW9CeGugu5BA3uJdno+V0aTzArJ10=;
 b=pVpKO+IZQ+79CRdd9O+WCcrU/ZB+XPV9BZm1UJbCqMSMFFcUOSgxT0sz9Gwi9wThtM
 ATdrtWx+HizVClUBBGu4jwl+lDYC39VpBGLJMp8ij4ccSI1ZBukKQYn1+hJH4Eh2Tuqh
 0FmAKa3lIc9mWPfvbBLI0RXniqgWZ4HpOpG8TIRmGpWpYjMRJXMvzj966ao6BDdzwblv
 teqxZjVj+iXG6bH8OFsEOjWeFi74t4hQve+AeEJzyRqSPmNG5xiIkVo7vQVLYpSLAwkM
 EqqcyN5WM8dnclDZN9OmD0Z5TUuWfm9qxjY76E1+hodUIK+29sXxz/Z/Y2+xIZhKAO5M
 O0bA==
X-Gm-Message-State: AOJu0YxbCFSzBcWQnkJUKlZb78t4G1zDXwrY9j9voxeWBhTyldYSA+er
 BDePpcsvcJXWrExnLMQlrNyvUcIKGbM=
X-Google-Smtp-Source: AGHT+IE42AlHUFsvc95O7kU8CGL/Ek7CyTZ0B1EP77RgejOOwFrIMOBJqrTfFaue5Ny56BepRPpPEA==
X-Received: by 2002:a5d:4705:0:b0:319:735f:92c5 with SMTP id
 y5-20020a5d4705000000b00319735f92c5mr2874685wrq.32.1694859256052; 
 Sat, 16 Sep 2023 03:14:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d6-20020adfef86000000b0031f82743e25sm6795194wro.67.2023.09.16.03.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 03:14:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 12:14:13 +0200
Message-Id: <20230916101413.16588-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694859256; x=1695464056; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nnkhC7PIfdA3+YaW9CeGugu5BA3uJdno+V0aTzArJ10=;
 b=FJcgBbqeWCzgnjZ4/mKXPcSircp9jBISKHU92NYXGo6ALgkR1cp8a9CBuXYmURwxCm
 w6ySaVBtvRDpWo0yocivi5XYXaLprftFakFw2nv9TxR//fBhsPrVoRexGUHuSP7tQrdL
 ZHCwSHdxrznp+/rabV46mdeY6CTbVb8Af4z+9fRoIIGZxXcTEVU4jU9MfnjoKV9Ch6JW
 7Aw6+ooZhKczEFQ5s7PFuZ7j86e//ELGlKFozeqmljc1giFOmq9roTydkVIYWmP+IrsK
 8zglSUf1yPbm33VhdhHmG/zHARvhbcz+dSgbfhZ1x0YWlL7XhtfFlpzA30ns7u+cJBZY
 mxNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FJcgBbqe
Subject: [Buildroot] [PATCH 1/1] package/openssh: bump to version 9.4p1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.openssh.com/txt/release-9.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index df472e087d..4060b95e9b 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.3p2
-sha256  200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f456878e7ccac676e8  openssh-9.3p2.tar.gz
+# From https://www.openssh.com/txt/release-9.4p1
+sha256  3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85  openssh-9.4p1.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index a2c3f16129..358ef42b6e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.3
-OPENSSH_VERSION_MINOR = p2
+OPENSSH_VERSION_MAJOR = 9.4
+OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
