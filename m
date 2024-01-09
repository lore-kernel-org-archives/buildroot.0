Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB22C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE1E41726;
	Tue,  9 Jan 2024 07:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE1E41726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6L2uMQnHbfe; Tue,  9 Jan 2024 07:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FE2B4099F;
	Tue,  9 Jan 2024 07:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FE2B4099F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E94F41BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C658D81256
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C658D81256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilazCAjG8Ft2 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:13:47 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C893281208
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C893281208
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3608402ab93so11849065ab.0
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704784426; x=1705389226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=42QnlZUPAhlkpp6B4elRFhjtIBW2PftofpsHVyZxQtc=;
 b=lgKn3vkzhJgsU8PuB7IxtBtWtinVmp2MB5wPQuDU6nKu+ZUzy8+lptPDdjPLLsrwF4
 3GWPW4DOe+41co55wQitQuDnV3Yqca6vLbIb5a7+qzL1opyi81oGQMw2F8dq/FHstz8C
 Ft7sKWn0SuReaNt4ek1HToDk2pEnQa7TjT11dgsz6V7DhPgpczJ+pRruXiVp9dsU6s8G
 mdtGLDU3YyC0YtSfsmtMu+Th6R0+jC7y1PPMUDD3sUMwzgwxUQeXoYaAjslmL8hGhwbA
 LOHJXlottmmwvpPgslfAQHmwWLamdoVlHHn9nyJGqdXNDshOt/BzLUJRMUw7I4oHvEmz
 Jm0g==
X-Gm-Message-State: AOJu0Yw9gHQLkIYM4KiTkACS6KMoGcN2wY3hc5y8VrFZ5x7YTWFBh3oX
 9+UTdzJOS5k04fpXTNYkV4jtI/4ol1qXlA==
X-Google-Smtp-Source: AGHT+IHEAMh1xwxK9PDrvqgBMB1E1Ilb6+S4XkoClOTzbHXpGzba0gcIE8+N931fwG174GnTjL4BrA==
X-Received: by 2002:a05:6e02:3184:b0:360:65ba:17f3 with SMTP id
 cb4-20020a056e02318400b0036065ba17f3mr6153220ilb.36.1704784426404; 
 Mon, 08 Jan 2024 23:13:46 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cv10-20020a056638498a00b00469328386c8sm477968jab.162.2024.01.08.23.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:13:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:13:43 -0700
Message-Id: <20240109071343.4025060-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704784426; x=1705389226; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=42QnlZUPAhlkpp6B4elRFhjtIBW2PftofpsHVyZxQtc=;
 b=bbPZ9VqQ7S+l1nXPHbrObQWaz+9hJoo/GUT+mHYs1CnCqJ8AsUd7SI8+2wYc9aPycI
 pcNRcspfiW0U6zwfKJIoZV6PLHskJfreCN7FjMf3+Fqs0BX0TwCC0buxoPnHp602jbzW
 OqGr6fxDfNjDAPJ9XJTUXQ/FBtH1azbFbedsIcKoTbMVnF1KKxaqTcM8e+VAY6fTw2dS
 gjv4Gnfl+c10JdKBeaBR1m4Zc+emQVPkkJT88eLFLYrdF8wNqhYsj3i/282UXSGwNPeI
 /0XSvdQ3BfUgEK95BlDVJ4UpONz4uq/KmeCzRR22Dh+l/NOVZlYLKc7MCav7Jdqsf+No
 mKjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bbPZ9VqQ
Subject: [Buildroot] [PATCH 1/1] package/python-dtschema: bump to version
 2023.11
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
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index a391e4ab21..3e1dd22133 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  bb0ecd8b8680b76f7cb55da002f58d62  dtschema-2023.9.tar.gz
-sha256  52c6d271065155ca134d8a0bcf7e0ebed67b3991acbbd7a98b74eb8642f67d87  dtschema-2023.9.tar.gz
+md5  cc4be8cfc01804cc31a123b56f68aeb1  dtschema-2023.11.tar.gz
+sha256  cf9a449ea743c0a955cf6034ef246668fa5ea177684977c61fef7604af5f273b  dtschema-2023.11.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index 0fc13073f8..e1dd5009fd 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2023.9
+PYTHON_DTSCHEMA_VERSION = 2023.11
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/24/97/daa9109a854727cd4e1a715e4123198e5abd47db10c131de5bc0cef0acc3
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/5a/94/7890ef663fba1cca84cf0ab64c7f68685343c921ab883f0356cd9978b605
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
