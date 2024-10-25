Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCCCD149CD
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA80B40768;
	Fri, 25 Oct 2024 17:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mp2ksCMEXffy; Fri, 25 Oct 2024 17:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EF214077A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EF214077A;
	Fri, 25 Oct 2024 17:35:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA5E2316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BBB340BEB
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsicNMhdg7An for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:35:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 464C240128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 464C240128
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 464C240128
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:35:02 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a4e5e574b6so2928685ab.0
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729877702; x=1730482502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0lGpsSzVmoMrpn6jMuPPreUKrDOX2zDxKMqDf+C8ueE=;
 b=P/rIWPa32vqn8/E3AyRr56dhXTGdV9bkFb5zkr43a2woNbPdnWgTVyr8svF9bb4d7q
 98I/2keNz196a9F4tKwg+GUfJYpJDV3JE2MO4bh9JRTPIArAd8H7iBPCHPc9jBx/hDK2
 emup9VLCFO9TjZOd2nefv6d1BTf/2p6k8IG90FIjnyuLKojU+lcD0wA7MU0OmmiSApAN
 B60CdVbdseiJU+TA1Enl6tS8yRgpuj9K4YynQPXR2et6dIcWAIWnsfqWz+q8pj+Waea8
 7PZujHBl1ardVzW/30Rko9PltDY2uU8phb/uwSXvGZTW6Xg2vL289IcLIUung3IgRPV5
 U+SA==
X-Gm-Message-State: AOJu0YxIzhUvM32PGKAyLHCYrW1cF278oGF9P9AeZZiis35aTUV41eYm
 SUdD0zm+BzTQEm2ziUcalFduoTS5lc6+MoGmmLLcAvE14ZYY0gzsZvAaVA==
X-Google-Smtp-Source: AGHT+IGxn19X4w8w3C3KtZiQjrCmwIEYT73o4y6a+h/o43g31lSLiYBGPZcp+QbxSFKp9pOj6hR5dQ==
X-Received: by 2002:a05:6e02:1aa2:b0:3a4:e6e9:2589 with SMTP id
 e9e14a558f8ab-3a4ecd8f59amr2827145ab.7.1729877701980; 
 Fri, 25 Oct 2024 10:35:01 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e568b0sm3635745ab.69.2024.10.25.10.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:35:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:34:58 -0600
Message-Id: <20241025173458.3580955-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025173458.3580955-1-james.hilliard1@gmail.com>
References: <20241025173458.3580955-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729877702; x=1730482502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lGpsSzVmoMrpn6jMuPPreUKrDOX2zDxKMqDf+C8ueE=;
 b=NlXLWXDq2Pqx1g4SnYeLqEvlddIzqfuJPrkRyU9qOkTXoaDoL3tHXjSJgzVMjJqQe7
 AUeNIls6MBctjcnw5KQL1dKpNdMoSTvcRfQOAvD0I+7u2iNiwn4zDy9XChBuEAfqC3NB
 lz0tP2uF9n+4rs9g22fyxDAqBYE+yw1eLUJEAQgpjZqO2jkO0yiHtr6c4FmXDQSPxHK0
 3z3CaiP+ueX/TSmuhkoklqSLFWpGrJ2IT20qSq66X9cwu5DqFyo9akYFGyoZGbnHhQXp
 w3F3y9ZtH7Ak1hoBfiA/jwnAbybeBEtte6mGRwOwVamfhI76t77EDLm6vmtk4+6VddV9
 qZNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NlXLWXDq
Subject: [Buildroot] [PATCH 2/2] package/python-fastapi: bump to version
 0.115.3
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
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index a45c78e180..a9e705c09a 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  cb1bde7504e7943d869a5d93d999f5bd  fastapi-0.115.2.tar.gz
-sha256  3995739e0b09fa12f984bce8fa9ae197b35d433750d3d312422d846e283697ee  fastapi-0.115.2.tar.gz
+md5  69eba948ff7e07753f4d797a3f938ac6  fastapi-0.115.3.tar.gz
+sha256  c091c6a35599c036d676fa24bd4a6e19fa30058d93d950216cdc672881f6f7db  fastapi-0.115.3.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index a15db2bdff..eb493c7a36 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.115.2
+PYTHON_FASTAPI_VERSION = 0.115.3
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/22/fa/19e3c7c9b31ac291987c82e959f36f88840bea183fa3dc3bb654669f19c1
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a9/ce/b64ce344d7b13c0768dc5b131a69d52f57202eb85839408a7637ca0dd7e2
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
