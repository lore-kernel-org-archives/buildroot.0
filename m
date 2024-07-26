Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B04C3DA64
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 02:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F17CA403B9;
	Fri, 26 Jul 2024 02:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POLjLQ2XCBWp; Fri, 26 Jul 2024 02:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B03844044B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B03844044B;
	Fri, 26 Jul 2024 02:56:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 314071BF390
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 02:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E79560ACF
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 02:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ld0-71nd6XAS for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 02:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=danomimanchego123@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C748E60667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C748E60667
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C748E60667
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 02:56:06 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-44febbc323fso1233381cf.1
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 19:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721962565; x=1722567365;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tooYVy3RVyxUkW4fTSZsUCu32EVt8wb+G6jZWT+1Cso=;
 b=A50q8VGlEOkxkjEfjZWuwCN5BemYUVazlWy5deilTIguZX6H7sPZ7CJlQ5OCHZzMBY
 n0SXMPv3BYSJM+8MqowINus9YZ9NgnC6xb58pT3+KhWZYTPb2/9PyxrkJYBWGJr+1GAS
 OU/nky9DZA7Q97VvU4PYj7jsafbIEMtT4+uIENUHzJTwoFRkZGYT+bs1d4ddDsUrpKl8
 phXHsLOP05woF4FxtyU9IUVnprweLWCfTI+RnEv2EvewJ8IyN/Y1LKDtMvKTohkVbOpo
 sxCvWZ1yt0y+jZSUy9mOv3nIiMbMrgb65QFG83awNrwS2LHEYLHWusVzLTMP3hyF+6IJ
 dYLA==
X-Gm-Message-State: AOJu0YzL/rvqkaedEq4QsL4gZkEXHcepeWHiyzw9/1p5gLv2Dfm5wBmG
 VETU9k6bd7QqB6/fnYR1dW++0d/c/TlmsMfggFscWvDntRf3KbWpg9ZCVg==
X-Google-Smtp-Source: AGHT+IEV9YreveYXxt10ia4s+Y8Q/rT9ApgihlkeaA/fdb8g7lC85vOit8bwQfrz7soKIT/3cU7uhQ==
X-Received: by 2002:a05:622a:130c:b0:44f:e5fd:4643 with SMTP id
 d75a77b69052e-44fe5fd4a55mr57851471cf.24.1721962565243; 
 Thu, 25 Jul 2024 19:56:05 -0700 (PDT)
Received: from dmocelo-Aspire-E5-575G.hsd1.nj.comcast.net
 ([2601:87:c480:28d0:428:4aa1:87e6:b59b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8126779sm10793321cf.3.2024.07.25.19.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 19:56:04 -0700 (PDT)
From: Danomi Manchego <danomimanchego123@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 22:55:39 -0400
Message-Id: <20240726025539.30665-1-danomimanchego123@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721962565; x=1722567365; darn=buildroot.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tooYVy3RVyxUkW4fTSZsUCu32EVt8wb+G6jZWT+1Cso=;
 b=KF7GypCOHMUIYkHAjKqx5NMdsCWSdVk8YHkl9EOP4zDFsDNNgT8tydQ969qX/C3t7y
 ZdwiGUQsfwP3e/xQtaYSBk858mpafVwBTO8VnxnY/PBKkTds0mhE0RMeQF8p5D3lrgZ6
 MOtYm8G0qSLftRD1DWPyDnfgDNZhVpQUwY0WVfGpACmf7+YRQfHHq3b6o5Z5Yjz4hXLQ
 d3iTKhEbna681rqix+Ww2z09EHBNK8lJqlQ2IKh3GSIqBAB8oXqJ30S0J34PH4MwvdqK
 Q7aFqhoaup9j+TesX27KbOb21C37cZBBZGTT85ynbpeRW2r9BoKDGZXdiHffYueRLmSq
 zioQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KF7GypCO
Subject: [Buildroot] [PATCH 1/1] libpwquality: fix PAM module path
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
Cc: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libpwquality package provides the pam_pwquality PAM module - the
replacement for pam_cracklib that was dropped from linux-pam back in
version 1.5.0.  However, it currently installs it to the wrong place,
so passwd and friends fail to find it.  This commit sets the security
directory path to /lib/security to match the corresponding setting in
linux-pam.mk.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libpwquality/libpwquality.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index f12e583b2d..ba62cdfb09 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -23,7 +23,7 @@ LIBPWQUALITY_CONF_OPTS += --disable-python-bindings
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-LIBPWQUALITY_CONF_OPTS += --enable-pam
+LIBPWQUALITY_CONF_OPTS += --enable-pam --with-securedir=/lib/security
 LIBPWQUALITY_DEPENDENCIES += linux-pam
 else
 LIBPWQUALITY_CONF_OPTS += --disable-pam
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
