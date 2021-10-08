Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E53C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 15:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E69D960F9C
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 15:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E69D960F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F06E409D4;
	Fri,  8 Oct 2021 15:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6lCrfulhgwu; Fri,  8 Oct 2021 15:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D2D4409AE;
	Fri,  8 Oct 2021 15:25:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 865601BF4E4
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 15:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 824CF83A92
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 15:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDBESNG7q5Go for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 15:25:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 810C983A58
 for <buildroot@busybox.net>; Fri,  8 Oct 2021 15:25:33 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t8so31136853wri.1
 for <buildroot@busybox.net>; Fri, 08 Oct 2021 08:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=73kkdfTreyaagG4DkybUpE5s0DLtYmfk6qhftIvsCMY=;
 b=JDZ5UXSzVXAxu5zsY2iWbQQovfGI9o+IJXxMvwkHSaF09In0HJaX7peuy9lfO4er5r
 i0JQC06O+08EZ0AXTk6R8XkueMSGyY5mYfesejX2qyj+mKrWcesRFJ2DBGuEq5Ze2Rqm
 OxpFkqM599svOWYTNK6PTfOzyfifj+/jXVUgcGdLCdYlOH7Vt9hyxgreV4JORdBn19Vk
 mW67F5IfRaiZjCcnZrSk8aSKLnN7LAxnFMq2dWlgSzTTFmltGUiNC5vgi7QiT8Udi7dg
 h7bF33j2z+0nkiiT6vxtWrU4DlNqgpoNeTTdHbdthuCtQHRVftzYi8zatkpPkTtDioIw
 8X0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=73kkdfTreyaagG4DkybUpE5s0DLtYmfk6qhftIvsCMY=;
 b=RYzzpMD2NX0tvHqQdS7PFadaj5lrNBbZ3EDTLLHrpkp/b9gRtTVBtTdNf9KAWYA5Kl
 u+3wjHQkhahsnxDvWKLzMwzYps0AbA+ug6StcwwxliKtYU/lkSyAf4R3mid0gcwWZSOM
 i9Vo50Rn46IhUFl5rBlA9/ZAgQlCtqcq0BPFfWCVUASYDwcawTkSqoSVR/CSWuIySvnC
 /w2i+detb892x81je9cAs8Tok4L+IFczQzOgSeSYjdfEcPs54uxuwoTf/CVd58/tzj9q
 GqvMtbWZ8Y/e6tGX8EfvoJV8jKtENYbb5MppfuDF4Wq1dPCk314Hcfoc3QutFLkFl6rC
 2ACQ==
X-Gm-Message-State: AOAM531u9y/JUFbG42EcYsaZKmtqdf3YIzu0XMBInca9K5Gr8RdvIo6D
 NhRYvCJlTmg7kXNv5jqVUWW7Crw+7hI=
X-Google-Smtp-Source: ABdhPJxnRrQkaSqMYRLWkz7/jFAfwMVs9lZJgx5WMpRTVaC2hDSYDNxrJiH9YvFauM+5isIkWkSKPw==
X-Received: by 2002:a1c:14b:: with SMTP id 72mr3990485wmb.158.1633706731766;
 Fri, 08 Oct 2021 08:25:31 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id l2sm2513689wrw.42.2021.10.08.08.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:25:31 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  8 Oct 2021 17:25:21 +0200
Message-Id: <20211008152522.1390875-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luajit: back to mainline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

now, the moonjit fork is abandonned
and Mike Pall resumed its activity on LuaJIT

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/Config.in   | 2 +-
 package/luajit/luajit.hash | 4 ++--
 package/luajit/luajit.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index eb3eb0199..e4e124924 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -27,7 +27,7 @@ config BR2_PACKAGE_LUAJIT
 	  ABI-compatible to the standard Lua interpreter and can be
 	  deployed as a drop-in replacement.
 
-	  https://github.com/moonjit/moonjit
+	  https://luajit.org/luajit.html
 
 if BR2_PACKAGE_LUAJIT
 
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 532ec0b29..1497ee9df 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 c3de8e29aa617fc594c043f57636ab9ad71af2b4a3a513932b05f5cdaa4320b2  luajit-2.1.2.tar.gz
+sha256  b1b19f92451a661ba1167ee0b259299616cb3a1cdaf5ab05d7ccffaffeb4a0fb  luajit-05f1984e1a862e4b3d3c3b370c773492e2edf84a.tar.gz
 
 # Locally calculated
-sha256 aa64a7706ded773011b933f4230d7b35ba662598197f82ac2c7bca62abdaa4d7  COPYRIGHT
+sha256  43fc251179d900f9948e51dd3cc93733d1219f2db060faaa0c8100ad054f54d8  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index defa21dd3..fbbd8ebc7 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 2.1.2
-LUAJIT_SITE = $(call github,moonjit,moonjit,$(LUAJIT_VERSION))
+LUAJIT_VERSION = 05f1984e1a862e4b3d3c3b370c773492e2edf84a
+LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
