Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18397C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 11:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B86C5408A2;
	Tue, 26 Dec 2023 11:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B86C5408A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1szlGKShFod; Tue, 26 Dec 2023 11:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DE7340898;
	Tue, 26 Dec 2023 11:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE7340898
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3B4C1BF309
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C74A40898
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C74A40898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fT5beMtspGx1 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 11:29:25 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C8EF40895
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 11:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C8EF40895
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5336986cso25598155e9.1
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 03:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703590163; x=1704194963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGoY7rHeGj3iTaHzuwGG2iGl4pMnz79iyFzQpjuxLZE=;
 b=IBEgveVAqNwx23gglCvm+KE+1JLGow5/TysvwcBXkSojI9Ly7pqFEc5U+wpi5aUvh0
 jq9jLxVjbKG43/lYt1OJ1ikLUr6fqkfjAWqwfBQIhO5+864DVGuOE8keFFNpG2c2EWUK
 d53kQ4PC4pH00iD0hHqQXfAe0qI1cLWrP1tF6gHgOvOgpx4PrT9wEGeQ2a6SbBVhycPz
 XFU6Mz8fIi+v/PZD6MXl2XVhXWTIp5fOpitrKA07mln0s7N2sR9VZudbe6d7afWF2+Ja
 ekmSnhO3yAOzMVzVZ9RhgJP3/58KyLpX8YI007sweZ92Xk8N81yrzSLt7RHJu8obwQh6
 eCyQ==
X-Gm-Message-State: AOJu0YywuU9JkLFlog6cZEeqw4DGnT2zYLdswhV1v9a5+xyWrnUS15aT
 187zV/3SQtMDbVYHc6ygJ+ffUMjyV94=
X-Google-Smtp-Source: AGHT+IENIBOa4cGZnJt8fbWSPVJ9L8aqFrk7lDK61SphOyFCtIfpZM0opp6hvivlcn6mZVXFtTgiZw==
X-Received: by 2002:a7b:ce87:0:b0:40d:5c47:9080 with SMTP id
 q7-20020a7bce87000000b0040d5c479080mr40969wmj.204.1703590163233; 
 Tue, 26 Dec 2023 03:29:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p17-20020a5d48d1000000b00336e15fbc85sm1343977wrs.82.2023.12.26.03.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 03:29:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 12:29:19 +0100
Message-ID: <20231226112919.13545-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703590163; x=1704194963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MGoY7rHeGj3iTaHzuwGG2iGl4pMnz79iyFzQpjuxLZE=;
 b=VWSzVfITNggWt14MLmN5dphlFnXEPFePYf2EfY9wR33tZ0ZsccD1214xCTJrqYAxNH
 su1K50H/m56ItwH85ouvPWTfi+xyxcf3ZKVSs2o8y7wSqnNQFWYBrPhqxlTf1Wf+lieY
 wM/qTXro5Q87qCmdPp0dnP52AqXIdY1jBFNMpy0i+g1T3eF++VD/CWTRWbK+VbGcldZF
 c//+QHzul9dPa1csvV4WT5wjFdk0uPGfENcwTT6pmQmc1HXcsJW8nwEdG8XLpN76iKLj
 NSN1wzTQBT6Ah8X7jojzVPpz5RFMgD4lePhVHZUZc+jr6qOw1bVWLcyQgIbIH3Exj/YS
 gM1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VWSzVfIT
Subject: [Buildroot] [PATCH 1/1] package/python-httpx: add CPE variables
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

cpe:2.3:a:encode:httpx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/0B9D7A81-3934-40D1-A7E4-FD8132304152

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-httpx/python-httpx.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
index 4227acec59..88166ad242 100644
--- a/package/python-httpx/python-httpx.mk
+++ b/package/python-httpx/python-httpx.mk
@@ -10,6 +10,8 @@ PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/8c/23/911d93a022979d
 PYTHON_HTTPX_SETUP_TYPE = pep517
 PYTHON_HTTPX_LICENSE = BSD-3-Clause
 PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPX_CPE_ID_VENDOR = encode
+PYTHON_HTTPX_CPE_ID_PRODUCT = httpx
 PYTHON_HTTPX_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
