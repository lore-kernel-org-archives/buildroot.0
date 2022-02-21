Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF92C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 17:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A98A8138C;
	Mon, 21 Feb 2022 17:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ER6mw-lLb3m; Mon, 21 Feb 2022 17:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ED9581371;
	Mon, 21 Feb 2022 17:29:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16D051BF339
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 17:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C9360692
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 17:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owGx2LSiW4BI for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 17:29:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0ADF0605C9
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 17:29:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d27so28367496wrb.5
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 09:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ME73w3PntSUT2AYsAmqP1uTPsEM9psvn1SiscE9FanQ=;
 b=DqaB9RkrNsaHGcOjIEzuQv/CVaWLPX9NL9H8uguPy9n5Xc/9mfHamUwkGm4lg8w+58
 zHBn0BiiEU+FTfr28lxdOnVtnqMq3Us71C9NZbWXUhtMHUyKPLMMiS94NnLerq9U+Juz
 o/t6FmAG/nhAcc9rqcFlpOPdRUsXOVxQnkwKATs345KujX8p46/S7M2QjtOpIsVfNJdo
 XBfTh2Hgr5dQP8/nb5w/pMjrfm71fFESR2eChzgVbzBdzbb8DJ5Ure7VW79UMwO5/XwM
 XuNYwZSil2CqV9BawNbp4enL7jzxCREfSf0PJ4idqw3CgDERAstTVdqe7I3s6y9w8JzX
 0fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ME73w3PntSUT2AYsAmqP1uTPsEM9psvn1SiscE9FanQ=;
 b=xwRHxII6WIY+z+wPpzcZMGxjp6E5VhaR+lxN9kmfAV9FNRfF9ZaZYvMel59vcUEDtQ
 FLfw7kUqEaJLKOn6aCBJZTfwVmX0BKqUDp1B8Qr5A5HX7/oNLMmSP6iiCNKwmnPyyd5y
 YfJzMVfisulBkHCV+dpPOKWAKKH+mMTfveicA+2g/+y0MjRgjvjGwqbAYOBP1Rfqsoqk
 lAFYJaC+gKxFR9rtF822irUwvIGG6dXL6YqkxFXl0VdmvacysVExHwslZb07hq6t9yUw
 GeeX7KM6kOli0p64B0EKuPfN6iGIVr/Q0Tm7I9X2H/rLjriN5dN1JGH2ckSVrefbbZ7b
 avNg==
X-Gm-Message-State: AOAM532LKnoQadOb7edaP2z6ZbHE400vn9xMSY/g7pun6BmN7lfI9Hdm
 bxZlOoLRdw9R/MhHLXRsvMoI+DaSZU0=
X-Google-Smtp-Source: ABdhPJzmWFs3QHBjYJ3KLUXnoiYbFqY8MsnPg8fjA19Nun+tgf9ADU4TWHvbCJDJqg0+vj4aK8Zpig==
X-Received: by 2002:a05:6000:1c5:b0:1e4:a915:9e5d with SMTP id
 t5-20020a05600001c500b001e4a9159e5dmr16375997wrx.106.1645464538985; 
 Mon, 21 Feb 2022 09:28:58 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u12sm35982620wrw.32.2022.02.21.09.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 09:28:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 18:29:00 +0100
Message-Id: <20220221172900.1937856-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/re2: fix build with gcc <= 5
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

Fix the following build failure with gcc <= 5 raised since bump to
version 2022-02-01 in commit d2cf91e0c6a082261cc7ebb06dfdbd7bc2c2956f
and
https://github.com/google/re2/commit/a022cc0c55b0519629d64d775e7a5195af34a477

./re2/sparse_array.h:266:37: warning: defaulted and deleted functions only available with -std=c++11 or -std=gnu++11
 SparseArray<Value>::SparseArray() = default;
                                     ^
./re2/sparse_array.h: In copy constructor 're2::SparseArray<Value>::SparseArray(const re2::SparseArray<Value>&)':
./re2/sparse_array.h:273:3: error: 'copy_n' is not a member of 'std'
   std::copy_n(src.sparse_.data(), src.max_size(), sparse_.data());
   ^

Fixes:
 - http://autobuild.buildroot.org/results/8ebbac67f32fe24416a1f72aad0afd42b567b403

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/re2/re2.mk | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 41392cb179..cc5fed71fa 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -10,20 +10,25 @@ RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
 
+RE2_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
+	prefix=/usr
+
 define RE2_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
 		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
 endef
 
 define RE2_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" -C $(@D) \
 		$(if $(BR2_STATIC_LIBS),static-install,install)
 endef
 
 define RE2_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" -C $(@D) \
 		$(if $(BR2_STATIC_LIBS),static-install,install)
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
