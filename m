Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E435EDA698
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 16:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D180C41B19;
	Tue,  3 Mar 2026 16:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYmhcDRGbMst; Tue,  3 Mar 2026 16:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF86241B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772555305;
	bh=l7W9f91T+wEjrpnMpWeLQcRpFMLRAhAMTWjhQZKRJ1c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ltJCkySfOB8sMnBGvw1MxfAOLtgpoCQXBf6VTPLNCWuSofJFJGhSx12gUTLy/LGaU
	 TrVx89ccRxDKLK1Z5mxGK1aCg93djZa2d9zSs/n98d9JjCxAKHwVVE2nVZ7l3uhX39
	 dJh2tIw3u16DRpbq8l4d6xMNzU2hTPxdcgWIyCwN0QRejGBiWUScaZmoYtWzxD9/Y4
	 haV7B2qGY6QFch6aYKUsg7CnCA7o5nxS5tWekUuCBe8xZPkhOIwxO3KjrL7sghZ65m
	 sBg8etSYlltnGZ9uBCDMl+2wTdv9sX6sRcmOWBQvsSD3QWCBML+zzY2uhBjMLOqBAH
	 rgLK6u+A9vdZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF86241B23;
	Tue,  3 Mar 2026 16:28:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 902D4231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 16:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75C3882CF9
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 16:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkLtqk23acGe for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 16:28:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF34382C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF34382C21
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF34382C21
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 16:28:22 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-8249fc726e9so3241286b3a.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 08:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772555302; x=1773160102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkWF1Lr1VTahGFClYcRPgxWvRUsyy5rDJiKay2l0hj8=;
 b=DZ1hPzP6kZPU8Ta0flomoijQgcmBy2VEMOQEGgyBoRhiZjat5wBEwbxQD53Gq1sDbF
 nlHWkVadhswL8PX+JQpEXIEdCOOXn+PeSO3vdcbd0dSw0Uts5fSyPwjSAAQYaHu2tFjl
 w1/L92UQX5MKeIhs/vz8SYae62NywzjdMsRktX4JHxMNNiilbhsdfVIS2Gds5UU0UY6u
 r9gSbGLivCbGY7NNy0NZm/9wP5FXUMck/NAsA1RKmyrpmftH5unZug7PeCiEqm+wIIc7
 pvOk1oKQ8/oX7eunY/X9RbFffnIDERkYbFyqy+UZgvKGtdQwyOP/JBGaFXFVEFIJ/1uU
 8IIQ==
X-Gm-Message-State: AOJu0YyNEc9MW8u20N1rR8PAIVI8o+gqoD2PX6K4bvv0faUkU/cigxAa
 f3zlxk9L6ZiIHYmtCoZxtA9ApSe4wAByiMiG435gZ92GZtVs3T8T88nEhdAG/Agz
X-Gm-Gg: ATEYQzzenbAUztRoAC6xwyleZwWkmivpkiNByVKJ++3OgBzSldNyZASCCwUP8xeCg0w
 kXGLsnOFHMMy93BGxFgD/Fux2V7dKibgCCSrYBS+FsQwToDDAKSFZ0J7r1WJyNwh+Aymgtd9DOt
 xB+ShElsctx2ddJq0mIMAzZUhKqVa5hyZYHIEh1ttQvl3iDRabt+3E466h4nKspQeZUc2ehiF9+
 x0D6O/ZRk4Qukuto3SRVSXYNNnrZh1lnuOvMnvGFx/UvG0hIlfO+4os6iOvcwrz2dNWgW4VRsAa
 5E8LFAvygK8piWvZlQ/a3CH+ZAKsIcwOaun9mqVMIgcuUG8pzRHLQcFjkL0FTpY8sshAmqjePhU
 8OckFLumK/z0LZFXPe2T6bYBNZlosfpuKCqfPnq79UE/ERS6PxiSqosHG6o5KQh/WbWV0wB45bF
 ABFrQHZ7tA+OwsD/LTQQ1fN8LjoNj+jgsY
X-Received: by 2002:a17:90b:1ccd:b0:356:268e:ff97 with SMTP id
 98e67ed59e1d1-35965c926c4mr11855925a91.20.1772555301405; 
 Tue, 03 Mar 2026 08:28:21 -0800 (PST)
Received: from fedora ([47.31.83.111]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739ff37f1sm16419043b3a.40.2026.03.03.08.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 08:28:20 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Maxime Hadjinlian <maxime.hadjinlian@devialet.com>,
 Romain Naour <romain.naour@openwide.fr>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Tue,  3 Mar 2026 21:58:07 +0530
Message-ID: <20260303162807.1006890-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772555302; x=1773160102; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XkWF1Lr1VTahGFClYcRPgxWvRUsyy5rDJiKay2l0hj8=;
 b=R6NxI8R+HREwJ/N0W9gCfxF4UPwsYOpiaFQR1s2gEdJISLquCV8HcAZcA25UZIamH7
 Ye2B1WL8KCyYPM+NAShYKrHnHgByPK3/btOnTJmhb+MYbMSOF2u3rv6bWVKsllPMvEdz
 WGmoeXaWkNq5Q6cj6qnmPB22tDOdKbS7JByONdcBkhJqxdeZK8jCAw9eG0uU79xgl2DP
 VtTHIbEooX0NXbv/DZVYZlfu3t/00AIFa7DdbOstWh8syE08pgpS9+ghqT1OnRYsai7Q
 0TOsf6c7aLgjjvZcNXq0+pAiij45AruCfMNUEeH5Laj07CvV3GCQgQN3uHEX58gTiO+M
 O1Eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R6NxI8R+
Subject: [Buildroot] [PATCH] package/icu: fix static linking with icu-uc for
 musl static toolchains
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

During static linking with a C application and libicuuc.a,
-lstdc++ is required. The previous patch (0003) only addressed the
shared library case (Libs.private). This patch adds -lstdc++
to the main Libs line for the static case to fix undefined
reference errors when linking programs like xmlcatalog (libxml2)
with musl static toolchains.

Upstream: Inactive-Upstream [Buildroot specific]
Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...atic-linking-with-icu-uc-static-musl.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch

diff --git a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
new file mode 100644
index 0000000000..40d3aa21a2
--- /dev/null
+++ b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
@@ -0,0 +1,30 @@
+From 2107f9dfb39eeb6559fb4271c7af8b39aef521ca Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 3 Mar 2026 10:00:00 +0000
+Subject: [PATCH] fix static linking with icu-uc (static case)
+
+During static linking with a C application and libicuuc.a,
+-lstdc++ is required. The previous patch (0003) only addressed the
+shared library case (Libs.private). This patch adds -lstdc++ to the
+main Libs line for the static case to fix undefined reference
+errors when linking programs like xmlcatalog (libxml2) with
+musl toolchains.
+
+Upstream: Inactive-Upstream [Buildroot specific]
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ source/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
+--- icu.orig/source/Makefile.in
++++ icu/source/Makefile.in
+@@ -278,7 +278,7 @@ config/icu-uc.pc: config/icu.pc Makefile icudefs.mk
+ 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
+ 	@echo "Name: $(PACKAGE)-uc" >> $@
+ ifeq ($(ENABLE_SHARED),)
+-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
+ else
+ 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
+ 	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
