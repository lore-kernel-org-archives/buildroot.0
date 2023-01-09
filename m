Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2401C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 07:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73D6160B0C;
	Mon,  9 Jan 2023 07:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D6160B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmz4aMDEmnaN; Mon,  9 Jan 2023 07:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB100608B7;
	Mon,  9 Jan 2023 07:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB100608B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A6701BF487
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 443E4410A1
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 443E4410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54fxbe4Mh65Z for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 07:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4490409FB
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4490409FB
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 07:21:41 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id d10so4484453ilc.12
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 23:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WM5hiXOCurSIOve3nVcFkSIyB8uyOc0895W72HQ6AAI=;
 b=TzzvxgM72cJRaphVrGV6PerNxyx2BC9bFm+wi1DsGB6G/NwxSZcr4vylhvq1ziF+sy
 HBNgdwEvz6JWVHUH8NRdKpw8lUwzvX5c0oWgdJ20UqT3A99z78Quinj8wReIubgNpKty
 JVC9o5oUcyGTWLEJs9VjWUnuOlU4HxSGwK1v4q5XT1CfNjnZEJ/s97C/7qgv6EXLy2rY
 Wj8MjwZKuuuUTBmgfbJQl/ZwBM7V5AYJ+B2KCkKUFU9aeL+qFwqjfdjW3YkunwuwLoP4
 vveIeIkw6y+6oBVgXgqCMeBBPLPNzq1N8urbd/3bbG3p/10RdPkiFHi+Xxu3W4BaFJn8
 l5YQ==
X-Gm-Message-State: AFqh2krR6MSsDUG7c4UDw6F7YDywct/PVgoWLTrpFoUKv0q6+JThE/UE
 HFc0Pf4gpmp+uUyaWY/mKFpoWvcMnE0pspbV
X-Google-Smtp-Source: AMrXdXsS4krbnPSFS63qMhZSfFS09fSP9L49joOFQsbwCmplSSiJdz/+9qEUW5ZK8/5QYEX1f9yWEg==
X-Received: by 2002:a05:6e02:1cad:b0:30d:a023:613b with SMTP id
 x13-20020a056e021cad00b0030da023613bmr5485646ill.5.1673248900656; 
 Sun, 08 Jan 2023 23:21:40 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 v8-20020a927a08000000b0030005ae9241sm2505855ilc.43.2023.01.08.23.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 23:21:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 00:21:38 -0700
Message-Id: <20230109072138.3179665-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WM5hiXOCurSIOve3nVcFkSIyB8uyOc0895W72HQ6AAI=;
 b=dcBx9qVH4cmx90Vn0bjmEcdiQ9aWQ/b10p7WtQr1fzS1s8m7vAVSOllgVkN5r9dZyE
 NWfdrToQ4Q06ufbV6QFfqW9vLHWMCeLnpyVYbPc73sbVkW6f6IszqtcaSMDW6DIBdasY
 GsUh3Cyw7q9pjh/bvFXrA0LJ1+wn3uNYXy4p97beB3yuPKcA3DPBMNabdlZB1w2r8agF
 GlK1kyGyji4ieBhKEfyYriZiFsgE3mF9sDdEyjaYq5iwA+MaTfoZBDw7eAzrAGwnJQ0F
 IluOakrNo9K3fY3c3SenLR+/xpOgLNxL8KfEUBjxA4aDwc/FfHcmMwCo4AUS0aKGs2U6
 77zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dcBx9qVH
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 57.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 4da8ea479a..d6026cf034 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  bab389bdfb25e03d64591c56367fb344  weasyprint-57.1.tar.gz
-sha256  397a9d11298f94485ec3b7b68aeef1c6106fb638350126d9d4a64109b73508a0  weasyprint-57.1.tar.gz
+md5  497030cecafffca06bae2b161846b461  weasyprint-57.2.tar.gz
+sha256  b8e9ef2dcbcfbc82e99215acfd68f947b2b5f1999b5b156db75fabe380ba7e9a  weasyprint-57.2.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index d1e5e7983d..27b07226d9 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 57.1
+PYTHON_WEASYPRINT_VERSION = 57.2
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/32/3f/d305dc714c119e5b11c0ea1ecff9741407b6da90d6b684859d3b3e586692
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/b1/88/335dd6cb71a9d58584c975bf1db0ab9a3a9f15f9bffef1cbfac0fb1ee72e
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
