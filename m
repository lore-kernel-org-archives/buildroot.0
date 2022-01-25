Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D1BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D9DC40875;
	Tue, 25 Jan 2022 21:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmKICZ-KrIBQ; Tue, 25 Jan 2022 21:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53FB9410B1;
	Tue, 25 Jan 2022 21:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66D051BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14AFD40475
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWceJ7v54RWZ for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:34:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB741401C8
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:34:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso2535872wma.1
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 13:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sdw4TRtHOA4zYuy6ayNADN/h8KxTI3UcI4OfYttH6+M=;
 b=FAu3wxbQm6ZY2Fo+ZEWAkK0kHbUBpYCywyEuZ9HJPYlTvO02LSys+Rb8JXtKIZ16oN
 +trqKDTMGbYthQiSrXxY9PGuDFbVyamI5ye0qMoKpMsclIv4w6ueIdr0nWsupyIa6WLx
 mWJiX2q5M9+VRKTZ1AxdE67XLB0YKmu9WMd/SOxFfIwsa9RMdyyeH5xbEu9uSDmiPD8g
 ZyRau4XB2iN1AZtg0UE3VhEvqgzZ9tcnFHf+eYneM7gLxApWaT6yDx7dUrz0qOuebf4z
 O4i5ul7o/Ug+XViT6zsUmaYh4+GzaKl1JXu78bYVAgi0GbZG6VfnVOaxmQX7r6ng449J
 PQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sdw4TRtHOA4zYuy6ayNADN/h8KxTI3UcI4OfYttH6+M=;
 b=ZL+sak2zmtmhcpBNCy29+GEJclw7MJKfXIx2XvwzghG6wbT2KjccHz1InEe+jS8DKV
 YBLIgb9dmbIosjI8vJ/EKaWQv4FFG0eZjje6xSZhmZcp88FNJkqVQviRa8yxXei9Dgvz
 L+77bWnkSPrLvcEc0YihkKYxidOMZT1spcnA/ymcp45rnHeszb5uCDW40ca6b51X+ZUw
 fITm9NbGnXUnseB9BqnlNH43NAkxCaowHY2UpIk4u7eRjpqReriNmAwQx9xOfoaaEc0m
 L6W5ugMNritFtV91BxCQr21vibCy48RLdvTZXMM314VhganjogdydmR6I5YLr4kCJxTi
 HT0Q==
X-Gm-Message-State: AOAM532iFHbTHuvI1Wx2rR8QkquaSwcNkUrkwUYfEPJ1wFj2ja3ZaHpv
 OABKLIx/DLGXo7LorWAjCnvZ77JtBXE=
X-Google-Smtp-Source: ABdhPJxW4ZZb3GmoDklHzOmJVmN5PnAgXVDZpz71mTqBlj0ZKLVaw1YbVLDYv1/4eXAjzMgSev31fg==
X-Received: by 2002:a1c:1d48:: with SMTP id d69mr4581661wmd.167.1643146467944; 
 Tue, 25 Jan 2022 13:34:27 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id k37sm4083505wms.0.2022.01.25.13.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 13:34:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 22:32:42 +0100
Message-Id: <20220125213242.301404-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125213242.301404-1-fontaine.fabrice@gmail.com>
References: <20220125213242.301404-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-sqliteschema: bump to
 version 1.2.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/thombashi/sqliteschema/releases/tag/v1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-sqliteschema/python-sqliteschema.hash | 4 ++--
 package/python-sqliteschema/python-sqliteschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqliteschema/python-sqliteschema.hash b/package/python-sqliteschema/python-sqliteschema.hash
index 310e56ab32..e60bd64325 100644
--- a/package/python-sqliteschema/python-sqliteschema.hash
+++ b/package/python-sqliteschema/python-sqliteschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqliteschema/json
-md5  ca70006e289f1d506124de779ed73d64  sqliteschema-1.2.0.tar.gz
-sha256  4c18f141239c58b6dbdc69130be41ed9740d8209a7ab6d529ba982a8b79c071a  sqliteschema-1.2.0.tar.gz
+md5  4fb0130e7cc60d92be468091fbfc3d51  sqliteschema-1.2.1.tar.gz
+sha256  dde195bd7bc70d5841bc01dff20ec23bd43be87d760d2dfc7c7f2e5fd3808ef3  sqliteschema-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index e4fd0de2fb..5c52e35111 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLITESCHEMA_VERSION = 1.2.0
+PYTHON_SQLITESCHEMA_VERSION = 1.2.1
 PYTHON_SQLITESCHEMA_SOURCE = sqliteschema-$(PYTHON_SQLITESCHEMA_VERSION).tar.gz
-PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/5c/d3/0c2e4c989a8d45f9443e431d7cbf89af4aba719fb0647b5f722716ef3990
+PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/85/f8/be54d4bebf551cb533d1dea11c3bf165a1a408c2a1cceb1f9724aadd9967
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
