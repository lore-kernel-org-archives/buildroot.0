Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5C5D3177E
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E061606E3;
	Tue,  5 Nov 2024 18:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlPQg760yiVb; Tue,  5 Nov 2024 18:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 605DD60787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 605DD60787;
	Tue,  5 Nov 2024 18:32:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C729E3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5F36409F1
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OnjXEfIYVy3 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB5FC409EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB5FC409EE
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB5FC409EE
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:32:05 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a4e5e57678so259365ab.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:32:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730831524; x=1731436324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hBj6LvAL8tbJ/QStDet4XeNcOblJBfyIKWsQLcxHPP0=;
 b=u15jVK06xfXMgJ1Thp49Wbd7QKaN5KINySdd6myqSHFym+cK/ow2+qDRlf58Bu0Seh
 GJ4d2wXe5VwABe6pN9iDLcy+luxI5SY3hjcQKidos8RIvQUIfYTayRcGM78E6asTvW0q
 x1cZ9VR9CTGquuD0jnfY9wo1k5QdObeACKflQJhCv09wWJQfnLugLcEVqw0hpNK3GNwE
 52sckA3HNoBwvR6a0IOK3ReZo/EAVUhjqmm0N2F78TJMNU1pTwpR1WIpWK7MEKg53KNZ
 Rxxem8KJeDsKW15qvqdPoFxdvu599MoKu7cHS6X2Ui+usZ8cSlqlAqHoKxz8UrrH3v3r
 rIIg==
X-Gm-Message-State: AOJu0Yx1DiFu9ZqIsEoseSRIzU+g9dLPrbDEHMQIkT1tl2+hDqh/mdym
 qFi9y6KfdODxA5CDPRDF3mCFtLneUi8Lvrn9x7NUa6/AZztrkrqmmdQExQ==
X-Google-Smtp-Source: AGHT+IF0PsqvXt61Ium2SyJM6LA8aGRaoPPRwtJ9ySaPPlWHAoWHcG7QFtzU9V8fw4e82ntDRp82zA==
X-Received: by 2002:a6b:6f12:0:b0:835:39a8:e201 with SMTP id
 ca18e2360f4ac-83b71029776mr1285822039f.0.1730831524458; 
 Tue, 05 Nov 2024 10:32:04 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b67b2a511sm279009739f.14.2024.11.05.10.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:32:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:32:02 -0700
Message-Id: <20241105183202.1431500-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730831524; x=1731436324; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hBj6LvAL8tbJ/QStDet4XeNcOblJBfyIKWsQLcxHPP0=;
 b=Oev6QfJ/hNVQoUU9CXilNEUvlmdwP2KvllTS1eF4ean1i/lOFGv1DA8Fe4B6wsOer1
 hAPxYGGjsarUZ4TwJEgtKaQmMzN84FiHOv2+Mt/uQNnGBS1NmkJXH3Ef1+AJZxd1+KRh
 pFEbrNVa7x5jsXYiNg3cGHKHHhET/7L8Rct+ixTsBgRs6KBRPawcIBx2/9EMFj+oYNnc
 T9nzWQKTmwZfuUxs+GO0UTgL1KpWswsVNFEUmwAvwRPH4QFx7I/HcAtPu+a9ofGPwGPk
 CpA+xIZzUfMh4x0M4/nmLlAPXScJFDvfb8SgyQc5Nz7PlSCHYWchIaOAMBQ3NrJB1cod
 P87A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Oev6QfJ/
Subject: [Buildroot] [PATCH 1/1] package/python-apispec: bump to version
 6.7.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index 2955b4eed8..ee6c422433 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  94849d46f8b789a813c2f5911bd6eef8  apispec-6.7.0.tar.gz
-sha256  fa2cf1063bb227ed6f7f66b019f320d7dc0a7cb02acdf166a160e2381f4b2c39  apispec-6.7.0.tar.gz
+md5  0ace01922cd42fc19da5e597df73b631  apispec-6.7.1.tar.gz
+sha256  c01b8b6ff40ffedf55b79a67f9dd920e9b2fc3909aae116facf6c8372a08b933  apispec-6.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index b464891aa0..168d3890ce 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.7.0
+PYTHON_APISPEC_VERSION = 6.7.1
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/7c/09/2d5b33f12feb18375c11c6ca518be49a8355e4be3a3581b27a7faf83983b
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/96/26/ef0e72400707469058a7536f64d4e00e1a1c07a179acd00fb7e424dc9330
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
