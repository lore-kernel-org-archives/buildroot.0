Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4DFE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 437406169D;
	Thu, 19 Dec 2024 02:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IMLU231esfn; Thu, 19 Dec 2024 02:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4826F61731
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4826F61731;
	Thu, 19 Dec 2024 02:23:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7146EE9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51EC0406FB
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1naJOwV5HAz5 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:23:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F36A40704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F36A40704
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F36A40704
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:23:55 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a7d690479eso2223615ab.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734575034; x=1735179834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pjtecv7a0ZgcWqK6Et9IUIxKILaU2UOJeB413R9v0GQ=;
 b=UIpSxZzJ4wx5lNxK1lhuyIWcaQw+uCOA6Vq8kGtoNdiORMulPXs8Rb7McQob9BDvb+
 4nGyWgd6ZS1ELj/sswt3LUMqes4JPbSziG2h7VsTBZNSeF6il9X1pAhp3nHeCTqn/Syy
 fGmlODPp682OdFij+A5xcSmw+eiMfPNfNqd6Mcz4bdpXxLREky4jTvJ288JQk3H7oJ+V
 sAD+pDgWGS4pM07UWikp8mLLitpTqlaCW/92N9QXKNY+cGzzb30k9G6nu8zbnxJIi5IH
 OKUm4Jtg2ieQ+OAvrR+aDl3tBZrSmJJ6m6kbKQ65KJ171r2pw5PzLGsphU8QpVdUpU1g
 uimw==
X-Gm-Message-State: AOJu0YzRWp0yaXzcW586Xdt8IPtlwnFJ/SGqK1sHya7AjM4bvcG1/gxk
 LpNnzD0unH4o70Xsq0Qgx6kT+uWY2bspoRfvf6Pr6jbfi6R1maEaWDvIHWtH8xk=
X-Gm-Gg: ASbGncvyZMPkxGuAHegUleLeM90U/bvS5b4sSKpePcWXsSVv1Rp1bT0yXx/V9EhFRM2
 VAQZbcPa0cMqleRmAtUpuVrlvZ8S8YUERFbbhukTBXxkFbOjUyyEx8PsBnOPcoeliQ7vkoMh0CL
 XJYIXVj4KysiQpcTOlMtUNEI8EkkdkyKX6/YLQJTEUOY1M1+EdXB/eW09eoTyOqlAyACstjEzSz
 0fGT6JPIeII4l/jymfZ4lLTzJOVS1DjyB7rGlfy7P6KM5z9vHFqDr9Oqvb26WllTQUuCGyb2h1t
 y2lYwqTrChQFv4FZ+W8p4Qdjo6AizhHpRA==
X-Google-Smtp-Source: AGHT+IFSO/apkkx1nhj6LENeXlcaLru4cQ0E558xDPdrp5GeAlqyumeV1D/c6ZYOvqkosiG/UZ/r9w==
X-Received: by 2002:a05:6e02:330a:b0:3a7:e701:bd0f with SMTP id
 e9e14a558f8ab-3bdc4f18033mr53573885ab.21.1734575033969; 
 Wed, 18 Dec 2024 18:23:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf67e8fsm57677173.58.2024.12.18.18.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:23:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:23:51 -0700
Message-Id: <20241219022351.282995-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734575034; x=1735179834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pjtecv7a0ZgcWqK6Et9IUIxKILaU2UOJeB413R9v0GQ=;
 b=iDLN5EPAreGrplVZgzm8GfnMR9pJeguZ7YJP3uzQ3s3EebkqrmO0a3sLeCmVSi9WB0
 I2UKODE7a+lrRWD5hPvZsWz+01BlCs4GaC1nbtJmIm/d/jKwSm4xfkT4k0Jr4M4LQZqp
 o/XtKph/9c0FLzqPEnXmM5boIrgeBjrFWfe79mPNVDWOTY3Mop6YZiHPkmvAd/tL2jr8
 ZFeQrbF5Wt3FZ5IHUM7kKtinf+vjvnxQdxAr4Z+ymKXZrS4aNlvvHJ+/2BY+eZhq4vKi
 rleZ9rGnNg3d1XizVYn74RmT7drwKwix1H+Pi7D30B4dJzp1nk8ZqFNDCQUvXsBkHbfc
 gDSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iDLN5EPA
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-settings: bump to
 version 2.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index c1acb00dc2..365158a1ec 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  eb50e2f88dfb5229d7319be57dcc4ed0  pydantic_settings-2.6.1.tar.gz
-sha256  e0f92546d8a9923cb8941689abf85d6601a8c19a23e97a34b2964a2e3f813ca0  pydantic_settings-2.6.1.tar.gz
+md5  d00fcf00e6a5095033031398d96702a3  pydantic_settings-2.7.0.tar.gz
+sha256  ac4bfd4a36831a48dbf8b2d9325425b549a0a6f18cea118436d728eb4f1c4d66  pydantic_settings-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 90e982b3ff..fa14f97cef 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.6.1
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.7.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/b5/d4/9dfbe238f45ad8b168f5c96ee49a3df0598ce18a0795a983b419949ce65b
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/86/41/19b62b99e7530cfa1d6ccd16199afd9289a12929bef1a03aa4382b22e683
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
