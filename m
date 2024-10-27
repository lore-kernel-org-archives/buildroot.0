Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4F6D13571
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 22:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE6C8405BA;
	Sun, 27 Oct 2024 22:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0e499YcW54v; Sun, 27 Oct 2024 22:45:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ABB5405D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABB5405D3;
	Sun, 27 Oct 2024 22:45:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 417FDAEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 227E1607FC
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBqnBtlspB8W for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 22:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BCD16076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BCD16076C
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BCD16076C
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:45:42 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a394418442so11941545ab.0
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 15:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730069141; x=1730673941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+DQYjLUoeTkkdEcnCI7/jzw09obOmrGbbEqf3SYZa1M=;
 b=X+7uAtJi/rN2BfzQE4jclb0Yti8o4v0CHdjLPSNY1eBWWGHdFLf1JE3Pmazbvi7g8r
 S9t4DAGbU89lr39q42TdxBGut6wP7KUq5obkzOVqZOf7ekVhkPsyrdaOtGWlKuReCoCj
 zgVbBM2VA7pY3zCQx3ZKSl94ouBg8wOzkDAstRXoRgy+W4rHU1cC3o/n4zck+L6x2L/F
 D1asJkS/gLmXi4MnsIudMGH8KxcAxEoDdZ4BP3OoEAnadsfRKHvHVBdJLD2kuB13qLMp
 ihlu9vaObFrNeT39M7Ospui0ds4bFegUlZ7lgLoEx5bFdhbGLNIUk5dfXaz4Nb1VZoan
 84jg==
X-Gm-Message-State: AOJu0YxI8r+JuEYNK/97fGdFPK1oBmSAISO0rjD0aIuNQ7jpqAcj1h+n
 vtZAOQBI6HGum8NZw6WuvEwp7EXuNZlDwvLJq68bn089TcVddEcGfRDw7A==
X-Google-Smtp-Source: AGHT+IFxqE7P4TwJ4vNEge6Q/hgWhzzgHg8ShYskOSt4V92BfIFBLF0B1H4bhN6KWZLdAImNaEaceQ==
X-Received: by 2002:a92:c26e:0:b0:3a0:9c99:32d6 with SMTP id
 e9e14a558f8ab-3a4ed30cffcmr43494345ab.24.1730069140891; 
 Sun, 27 Oct 2024 15:45:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc727ae566sm1335407173.159.2024.10.27.15.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 15:45:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 16:45:39 -0600
Message-Id: <20241027224539.3864948-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730069141; x=1730673941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+DQYjLUoeTkkdEcnCI7/jzw09obOmrGbbEqf3SYZa1M=;
 b=EPsk2ukqwYkJN2uA4ivvB0rU9tB4rv/G0srCmpGtW3oycu9lYwXV7yoc37ou0xHsUC
 LzwcxPjwv1LeXD62zBww71G8ZXTUaQ/drHuXcMe8bIpmkEmOq+iygz4OAFSUY1ik0DEs
 xgkk6Kw1cU9IbNNceq5zRLwGoU3teRw9THehObuooNgrjBgJtXLxp/X9B6gzHPt1yCA9
 DK0DsrA96//aadrIVu9EpS67wTzUHa0uRgM2i5THZ86xe7G/Rsj6DFqGTW4GmKjTdDEY
 sxG1pPVrPK0ZItY1P51ycQ8hQiwk3TDJo+swwcYuyePNEyJiGVWGn43BhZ91POLqQwkw
 aA4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EPsk2ukq
Subject: [Buildroot] [PATCH 1/1] package/python-cached-property: bump to
 version 2.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cached-property/python-cached-property.hash | 4 ++--
 package/python-cached-property/python-cached-property.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cached-property/python-cached-property.hash b/package/python-cached-property/python-cached-property.hash
index 835e9e0200..edd01e25dd 100644
--- a/package/python-cached-property/python-cached-property.hash
+++ b/package/python-cached-property/python-cached-property.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cached-property/json
-md5  3451c63f8733ea0756ca1dd2b0c04bb8  cached-property-1.5.2.tar.gz
-sha256  9fa5755838eecbb2d234c3aa390bd80fbd3ac6b6869109bfc1b499f7bd89a130  cached-property-1.5.2.tar.gz
+md5  a97302dfc447d087676996a84e22cab6  cached_property-2.0.1.tar.gz
+sha256  484d617105e3ee0e4f1f58725e72a8ef9e93deee462222dbd51cd91230897641  cached_property-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ba4756c8039b25b66e3c456cc5bf635aa528cf459b97ee1499d06684ccd89b9a  LICENSE
diff --git a/package/python-cached-property/python-cached-property.mk b/package/python-cached-property/python-cached-property.mk
index 9e1b3f8aff..eb5c68b173 100644
--- a/package/python-cached-property/python-cached-property.mk
+++ b/package/python-cached-property/python-cached-property.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHED_PROPERTY_VERSION = 1.5.2
-PYTHON_CACHED_PROPERTY_SOURCE = cached-property-$(PYTHON_CACHED_PROPERTY_VERSION).tar.gz
-PYTHON_CACHED_PROPERTY_SITE = https://files.pythonhosted.org/packages/61/2c/d21c1c23c2895c091fa7a91a54b6872098fea913526932d21902088a7c41
+PYTHON_CACHED_PROPERTY_VERSION = 2.0.1
+PYTHON_CACHED_PROPERTY_SOURCE = cached_property-$(PYTHON_CACHED_PROPERTY_VERSION).tar.gz
+PYTHON_CACHED_PROPERTY_SITE = https://files.pythonhosted.org/packages/76/4b/3d870836119dbe9a5e3c9a61af8cc1a8b69d75aea564572e385882d5aefb
 PYTHON_CACHED_PROPERTY_SETUP_TYPE = setuptools
 PYTHON_CACHED_PROPERTY_LICENSE = BSD-3-Clause
 PYTHON_CACHED_PROPERTY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
