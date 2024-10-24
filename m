Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9B7D0BB5E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F7740523;
	Thu, 24 Oct 2024 05:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZusXTp3qv-4; Thu, 24 Oct 2024 05:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9B0C40538
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9B0C40538;
	Thu, 24 Oct 2024 05:19:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A8827ED
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FE8F6066B
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zax70rE7Yzt for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:19:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CAE160664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CAE160664
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CAE160664
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:19:18 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83ab6cbd8b1so22822939f.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729747157; x=1730351957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2wvH6sJg+9XxFCAPj8RLmsDq5lFAbQKIVLCNZldwhDE=;
 b=W81WC0xSsfNRUQ+q+M3Q3fTPmOI8qKrVNsQKAN48ABLMDwrgr7WW0WB5ONMjOh9gyb
 2xOkcdL2VWXl4/7pHgjRMb6QuHEeqUmp4dkfzeCwUQ6HTwRkoIalMVq4HYN/Y7r0ul6L
 iYdN2CSRWxRU925SqzwkjcSmcuMu/jaJYqARbdwemRhBHdBpZMPpHTeZfzQYDjQU9fYa
 kSXaDFmy2R6HhGZOggd4qaZ5d3NgYxD3PQ6+agV+tw9PxvJmPJWgjxwJGxivJSXd3aXw
 a/Dx0N3a8fPa0Yifxybx3LZYd/xFy1JU6ZKiZom39PWMPnF+wxRhhI5IsE3Q08oulk8m
 r0/A==
X-Gm-Message-State: AOJu0Yy7YmaSI00GyIl066XRLz/ifAJZyioZfaB/xIJMaQliljGgQ89h
 Of39cOQw7o+eq6daPbGK5WKrgZq6Zn8btWzBga1/yCrjLzFmSVbDzwfsGg==
X-Google-Smtp-Source: AGHT+IEXUCpAmMhK9WRUmgwJYx9kdJsVpu2RU1IIbqQLe6S1dPZCJkSdAJsK5haVUMZDgz/PqcNpBw==
X-Received: by 2002:a05:6602:14c9:b0:83a:a9cc:69ff with SMTP id
 ca18e2360f4ac-83af63f7aa4mr560739439f.13.1729747156926; 
 Wed, 23 Oct 2024 22:19:16 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a65f71dsm2485610173.165.2024.10.23.22.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:19:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:19:14 -0600
Message-Id: <20241024051914.3395024-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729747157; x=1730351957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2wvH6sJg+9XxFCAPj8RLmsDq5lFAbQKIVLCNZldwhDE=;
 b=BYnUqJ8Y2vtDWBJrmQX8HA6jNXu+tkXs0SBNvQZfbHPdzXm2lNY2hiPjTR79HmZF0+
 KdnwRKlxSERNdK7nhaeB1cY39+9EoYqPGPYKVMcyRhLaRxhzVJss7bAJ+P4I/pOB0t4g
 2pT7bdeoSgdgbYlqrLxcvPDdw062d2jgrlussoS/e6nVM/Putc4faEyCnxBsyRyZQQdk
 u9PDCvfeTX23fQre3MGDceO96KVf0XDjE3m6M42hEfASKV131TGqzcrsoueF7mIM1vAb
 mwvAhhZ+p4Tzd1LHNUG9KtyOgKWqJajN2/TZ86UjjgzspWe4NpgpRjkGty6yfPuVFTxj
 iu5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BYnUqJ8Y
Subject: [Buildroot] [PATCH 1/1] package/python-colorama: use hatch setup
 type
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-colorama/python-colorama.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-colorama/python-colorama.mk b/package/python-colorama/python-colorama.mk
index d633e00602..e87c60afb9 100644
--- a/package/python-colorama/python-colorama.mk
+++ b/package/python-colorama/python-colorama.mk
@@ -7,9 +7,8 @@
 PYTHON_COLORAMA_VERSION = 0.4.6
 PYTHON_COLORAMA_SOURCE = colorama-$(PYTHON_COLORAMA_VERSION).tar.gz
 PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4
-PYTHON_COLORAMA_SETUP_TYPE = pep517
+PYTHON_COLORAMA_SETUP_TYPE = hatch
 PYTHON_COLORAMA_LICENSE = BSD-3-Clause
 PYTHON_COLORAMA_LICENSE_FILES = LICENSE.txt
-PYTHON_COLORAMA_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
