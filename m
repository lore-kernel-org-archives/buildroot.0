Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BE0C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 22:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00604411A8;
	Mon,  1 Jan 2024 22:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00604411A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuwuIACS4Rux; Mon,  1 Jan 2024 22:15:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0520B4168A;
	Mon,  1 Jan 2024 22:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0520B4168A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C87E11BF3BE
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A173242154
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A173242154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BkUb99T2yqL for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 22:15:26 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A402642120
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 22:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A402642120
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5f40ce04so43909755e9.2
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 14:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704147324; x=1704752124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z+L2zo43pcEsT55euLyPIN0V2Q4iluxTwh8Uselq+nU=;
 b=ndYRoFg4UWOEwyzaB9obCD0U8PaalFgspqJPv4MmDLRbLalAz3cT69d0oHB76dGp8O
 hP6ix0nnfQChLwYF8TgJxn6lb7miwhvEw3Y6x181HqNEXtmIIsJNCJQB3HiKvzTkuYjt
 +5WydWxQdiF4yJcOV5i0s0h6UYBKx2A16JbGSm56sCAQQwfZoyhZwDxNvrcXNYSr1M6z
 hah44MYI9Xu61fBcWiXmoevUrP4eSAT07G0HdCjT7ojd7XghJV/s7xNovokFeQQPr5li
 BrIJ7gy5WIOq2SFrlW58HJe8/Co2RuEUiMEpxE46UawA5D6GIde8XKqfC2I88iMc9x0M
 YchA==
X-Gm-Message-State: AOJu0YzWfp5rBtIOdf7tJmwMtskPt6lchfAMJmof97/j+TZS6amEmzde
 XqLJiqO+gG8U0YGNhFdtUE6nhQkq2oM=
X-Google-Smtp-Source: AGHT+IEQT+w3XbS/uVtFM7sejf9SmHBho66F+a61PKec9+XsRSDScjQUBLIFFB5f/zQ7MIW8wZ+/ng==
X-Received: by 2002:a05:600c:524d:b0:40d:5d89:1c7 with SMTP id
 fc13-20020a05600c524d00b0040d5d8901c7mr4349980wmb.40.1704147323945; 
 Mon, 01 Jan 2024 14:15:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b0040d5118e42esm32953881wmq.22.2024.01.01.14.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 14:15:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:15:21 +0100
Message-ID: <20240101221521.42578-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704147324; x=1704752124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z+L2zo43pcEsT55euLyPIN0V2Q4iluxTwh8Uselq+nU=;
 b=Zul7c/qE468+YpiGIUQUkVwTxqB1/JNyAoZPJjJc9TXGTWKrWSoLf77f/SN8/OTpzC
 jS59eoSstOTlBzcoGpuFXodCpQdLqu+NuV23Z5N6hjdQc9GN25A6zXF1aDlmjrukKNdI
 fNXanIybfiZqkxlpF/ylkK+25wCyD2EzbQPLdfL2j2IhsoZpwrx4cl2sxxr+OB2et4yN
 6lnQNPCgnY1q7zQM34IybzckEO4SFrkhMkPonknprVbZnIUMiwj7LIA34VZX6rCSvEn4
 PbKieUIgaV/bmgtwZjVHE3HdvnwR5Ots/kZEVZSgxCn00YTQ0iPT3+WdxUD2V0M8XC90
 EkgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zul7c/qE
Subject: [Buildroot] [PATCH 1/1] package/python-asyncssh: security bump to
 version 2.14.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Implemented "strict kex" support and other countermeasures to protect
against the Terrapin Attack described in CVE-2023-48795

https://github.com/advisories/GHSA-hfmc-7525-mj55
https://github.com/ronf/asyncssh/blob/v2.14.2/docs/changes.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index d72b5329c5..f74cbe9c83 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  4194feb9e0d17a0750f107f3445ff9f7  asyncssh-2.14.1.tar.gz
-sha256  1ac31c333a0d83c88831523245500caa814503423741b0e465339ef6da5b5e29  asyncssh-2.14.1.tar.gz
+md5  3b22a39fa9d638b277c9441187b73c5c  asyncssh-2.14.2.tar.gz
+sha256  e956bf8988d07a06ba3305f6604e261f4ca014c4a232f0873f1c7692fbe3cfc2  asyncssh-2.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 51e2e1973c..1f6b9d79a2 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.14.1
+PYTHON_ASYNCSSH_VERSION = 2.14.2
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/5f/86/59278fefc49ddcc10567e52a8e0e1553fc936584e241d516b5682d55ea17
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/6c/f9/849f158fe50cdb0b1bf75009861865c9a30c3b5a0d62ad43bb5e00b10feb
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
