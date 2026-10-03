Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976EACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC9B40723;
	Sat,  3 Oct 2026 23:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Lt6PZ7k_0ku; Sat,  3 Oct 2026 23:32:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 785564084D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791070362;
	b=BV8JGu8iJMOzm75+z/Pa5WPX2qbv8DTurz+Z6H7pSemGjwijm0kzzvKXDKlP7MhWESFF
	 08W1V7Vmevq6CaJzC+RPvXt37V9yaTXS9alnjdogEK6vgaUk6Xn1zDyezFhYxFaSk9sv9
	 cb8mZT1k+u322W3jQ8m18UCVAcMyWgX1hMzD6uA7Fy3lmda3I8W8O6HD3eFcQwwWxRKR9
	 pjnool2kxo5bCyg704TDphNumvi7vSsYoR4F/4xPg8uiE9TmZt3C7JBwOawlE0AxN5qoJ
	 VmW4SfvWvKb7w98JWgIZzJkxRB+n5WIUDsF4hx3TTHDdsv5oltT9oXAMOqOabb58b1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791070362;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=71c7yJhWfO6M49XMpNyC3RWk8i+2/3yaZGNmjDX+qVw=;
	b=TgP5Aa80W5STZI69fn6jTE7LOjcCsPSUQw73yxeVK4C8lptK10Z3VJAj+nKMRDuivGcQ
	 gCIUcbk0AdM9u7sIU5vIVjGoY7dAEY9npTzs4JeFP6N86zaxVcWvZchDlspVmvWXpWIk3
	 MfTwGVmB+XNRNzrgEfp5zqPfaiTSe96Ez7qdnsLvaBtPlKRmYwLK2KH2ao6JpOc1dA7NJ
	 mJ2yiiW8nPCb/EjPl6Fy2oU0guqss28GROtFkkbXBP00UgdONeQV11kHLbxcdAoGSAL8k
	 acGcNRA7pnvpdJYMUgPvZ5SKaWabrW9xBK4lPTEv8acoGT+vn0WPFBmt00fS6F22sRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PxKSMcWr;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791070362;
	bh=71c7yJhWfO6M49XMpNyC3RWk8i+2/3yaZGNmjDX+qVw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IA1WTqjJXo20j6HQwulZ/LwpXeD3zKM1zaOQDKTq83+2DxgDEgy5vH5jY2dVYxK1j
	 3HfryoQhUqvHU3uqOijbm4lxUpAtsjBf+kyiaXkRRh7JUmY8/d12epiyrprSfv7DON
	 pgNFFwwzNeuor7HO74vZz+AOMNwFyLBVTZrTyo7b5f9Os3dS0t+3JcMs0/NiB90QZF
	 YHu6ie8ie/rBbaahat8xjRCB6xAlDJDgZK/X3Xs0H9vki1PscW8pTITHy0ulDbJ5Fr
	 R7n9dh+bJfZBQaoCclfAK5wKJzZFVcH35rVpeXIEkUSZC3yBBam+XxK6yMVL7O8zaA
	 Au3jZ777Caq+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 785564084D;
	Sat,  3 Oct 2026 23:32:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61214435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DEBA40718
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwIrmErp4XDz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:32:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1E655406EE
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791070359;
 b=fOodyylI/o4pVVqi8M1bRJAK+znJ76+AzWqWmY53/x9bnMKkHTwob8YEiXtXxVoFZ7RH
 iht7FzDuezF2xlugmsoEqGSvkPC9aZCf+q7V+cVbm33XX7L8rml0oiJj4rAYJTB43uhuF
 3TNFT9JHuzXOjaMR/6tUGZMTafB97jlSP8rSgHoyTV0GTorVPun5xieQ8f+En5O9wjfhd
 E+gFQ4/G9pWywBcX3a9yQSqu8FgvWA7N2J3mguQd1S4cNDr/CXgfDIIVbu2DTKC5ncszS
 vmJLHFF3BrI9dCJkz+0hcFCm8hmT6Y1V7yG1TFbuYPAF7kmA6m3QDYQw9NGkPpO67xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791070359;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Rxt41sPi5cVrJeZS9IayCQyQXIqZjalnY7r4E45/K2g=;
 b=FnotCFpqpok3V/dwouYUsR1rQgr15Lxg9B8ahjz9YhN7ldCgLRMIsW+UmDRRt1kEDv7W
 tG9slH01qSed8PxwWV2MWXr89NRMnc9YEhCHSKz4eOx3LvVkg4cVjzd/TPmmn9aYS26Ae
 trRLCf/ozMxpw07UkmV53eA9yrl2ygXWkpXHFP0bSACjjIL77/pIPYEKKjdp7WizTfTbe
 n6NBgvB0vAbCIIK/NUIE7q6eTonSAINVTb8UVCFRqDLjLQpBwWEbB4z8EDmFqiklWk/cI
 cmwQ/vwuJsHHehEc26aLlSYIG2n2mDvM/2wPwYfsXXMJtfUcHy13uFta1GUqDujJRQA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PxKSMcWr; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PxKSMcWr
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E655406EE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:32:38 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-82478760557so513309a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791070358; x=1791675158; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Rxt41sPi5cVrJeZS9IayCQyQXIqZjalnY7r4E45/K2g=;
 b=PxKSMcWrEkIHbYhPkn4QJEZGnpE9GGhV6hp1+HuJ1yJxNuPHlR7DzT6PuwYtUAgxCI
 ijh94FY/oUXNdYs7leT4RB77qZ0urlQvXaXs2wNRRRLfGP64YQ6ZSE5uE/eDVLXeo8uo
 LXtYsZq60yD202jwLQVufLblLD7+wN6aErULYBljzk126MMdHqUBAY5XFNsxdDecY4lx
 zcOWvC/B/MlMJcyBCcLJoEjxi0BpuBQfViMccmXLdpIHVjzGhbC7shWkIr94yKg611dh
 ziZZDltmrmYm065UG9WSPb423u6Nnxqv4c6a4pkqXiDuK5www7jVmRk+ZTkL80LyM0LV
 zBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791070358; x=1791675158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Rxt41sPi5cVrJeZS9IayCQyQXIqZjalnY7r4E45/K2g=;
 b=ZKS1WOa5bEYzdxZ9ZLWETsOVNVlH5JI8LLd+0DsXKMMfdmLizNIWvrqf0iG0X0C6zJ
 cPvRSiu5MTIMg5oU89E9Fxy7l+wYe3IHOeDEsdDWeco7RaJIE3VJWGM0G3cvnMojaSgU
 zHqpkOZWdhWvOMebsnsrVBpUn7ALmUz9dJg8ndHZtWNLPYul4SVS967G9CJr+C7ef/EK
 RLxfa4Bwz3Z7xlrhQYtpH9HrZMwRotJ17bZ6UsYLewHrfax9Yo+3RJ7F+DKNF820IF/U
 2ISRlEgBeGySC2j+WSK5DL0pZ19J7pvS5M62pToC7PWS2FCr2CtFVnfelR7kGuHB3Dop
 5apA==
X-Gm-Message-State: AFuF++n2l2ZMgcB3om1PN8CsWd97BfvF+JvxA+ax8xcj1zcwhZRlmWFE
 iMzTOpjn+ubeXPGktUxkPwwsraG3HdS6JSppRBb8/zG92+QDcZCQ4PcHIqAfGg==
X-Gm-Gg: AYBFou23OPYtTOyzSB2eK5+TUh3u6AWZVytZBM7XsIfnQjwEOt8j1XyB4ZWbush/Btr
 Fvn/lMJiPtnyRNmlzMnl8fm0rztdvWoycPHPyGhBkM7LeXbcidmaqH2/XLH4a7qcKj0cFoRaKbf
 NjyAsfKMGCngXC44Y1cIMG/zA1LCjqdxA5TRJ0FuzIAtR32qU6sarJeIBX+7C1cyfIvGOAtZmpn
 ymJp+J4POVfj1K3EBYuD0ly+BFtscziuK+Jyv8DRcFZpXY2PO/qowOM8T1c+066AhkdGqsMBjds
 aWoKtmN8znWaj1a66oEZ4g6tkrSRlvfzNtkjjbYHKqIWrUgx3KKlAkjP+SDtK3CMTMq6zAU1lUu
 j8ZvQOMaouHxhwOislGffDSQ8styUf/tNO7qZYa2UH0lQAHM130EJ6PruAzGzlE/UOcTlDTGEKo
 d3ICsvtslJIV/c8F47nHF4KA+uMZzYVEfwtzSWXmra0VNYPDTXjZxMOtTOLkhUwmQWGzzcv7NO0
 SJucZ2Savpxq6prhXXxSjRZ7RZdMfS9I9+19BO10L+LrenSBRGZPvVKaMh6jLTEf2GXyCoiyfCs
 BXJTUfR6EroXzlKjILpp0RWkHb3rvn1ZJ81ECuftcSEAYpokCOIKDDhN6E5d9kK3THfoBTjdNWZ
 d3DEKmUp+beCSG93KCrcGpS785F5Yxew5PHIInjGh2g==
X-Received: by 2002:a05:6830:83b7:b0:81d:c548:292f with SMTP id
 46e09a7af769-823fce1dfb4mr4131487a34.12.1791070357696; 
 Sat, 03 Oct 2026 16:32:37 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82279b7dbd9sm7045147a34.12.2026.10.03.16.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:32:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:32:31 -0600
Message-ID: <20261003233231.753958-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003233231.753958-1-james.hilliard1@gmail.com>
References: <20261003233231.753958-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/python-jaraco-text: bump to version
 4.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the host-python-coherent-licensed build dependency.

Update license hash due to generated license text:
https://github.com/jaraco/jaraco.text/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c

Add the python-typer-slim runtime dependency.

Drop the no longer required python-autocommand dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-text/Config.in               | 2 +-
 package/python-jaraco-text/python-jaraco-text.hash | 6 +++---
 package/python-jaraco-text/python-jaraco-text.mk   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-jaraco-text/Config.in b/package/python-jaraco-text/Config.in
index 44000ccb18..9d987063df 100644
--- a/package/python-jaraco-text/Config.in
+++ b/package/python-jaraco-text/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PYTHON_JARACO_TEXT
 	bool "python-jaraco-text"
-	select BR2_PACKAGE_PYTHON_AUTOCOMMAND # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_CONTEXT # runtime
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_TYPER_SLIM # runtime
 	help
 	  Module for text manipulation.
 
diff --git a/package/python-jaraco-text/python-jaraco-text.hash b/package/python-jaraco-text/python-jaraco-text.hash
index 8de574393e..e4c69141ae 100644
--- a/package/python-jaraco-text/python-jaraco-text.hash
+++ b/package/python-jaraco-text/python-jaraco-text.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco-text/json
-md5  3c519c7a49d6448e6dc2073d466afd39  jaraco_text-4.0.0.tar.gz
-sha256  5b71fecea69ab6f939d4c906c04fee1eda76500d1641117df6ec45b865f10db0  jaraco_text-4.0.0.tar.gz
+md5  23d91c6899e89f3bb1bb6f9148302b92  jaraco_text-4.3.0.tar.gz
+sha256  ddd5eb6259d0701e08cb642c8d6b63bcc73947d03df9239ea67bbef911b3e4e1  jaraco_text-4.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  9755a18519666e5f0f4cae3daad3d7012bcae48a600b31237d75e9fe134e6683  LICENSE
diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
index 2d612196a6..e0868bc575 100644
--- a/package/python-jaraco-text/python-jaraco-text.mk
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_JARACO_TEXT_VERSION = 4.0.0
+PYTHON_JARACO_TEXT_VERSION = 4.3.0
 PYTHON_JARACO_TEXT_SOURCE = jaraco_text-$(PYTHON_JARACO_TEXT_VERSION).tar.gz
-PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/4f/00/1b4dbbc5c6dcb87a4278cc229b2b560484bf231bba7922686c5139e5f934
+PYTHON_JARACO_TEXT_SITE = https://files.pythonhosted.org/packages/be/8c/c74f1107719400477289d99cd2c0b5b7809a45f60acecfb5ef961c3533c8
 PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_TEXT_LICENSE = MIT
 PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
-PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-coherent-licensed host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
