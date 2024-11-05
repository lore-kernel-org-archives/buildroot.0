Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25FAD31778
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D6E4078C;
	Tue,  5 Nov 2024 18:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecIAOmG-7IVW; Tue,  5 Nov 2024 18:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 275A94078E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 275A94078E;
	Tue,  5 Nov 2024 18:14:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 434A03B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22EBC40A8A
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVfa8iMd_um3 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C2F440A84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C2F440A84
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C2F440A84
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:14:24 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83abdaf8a26so218826039f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730830464; x=1731435264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VcSD7MqqyW19IDtf0tiC84Igi4+vDM6JQNwxs13BzmE=;
 b=GLoR3810snqUpeIi8o9XaQAJ9R9n8jOMQL2G2x9q7++4D7H69lWebXh1RjvOmke5vF
 X0Gl6OPyKTPn/biN8ImELVxHHy+oMl0fAlG+egqPTulgNQfLsmz5M/YmCqkzSyF4zKbn
 dr+eblCo9Ba+RAb4g1ZhCNm02A6sAjw5jbM4pSu3f/pKubCxG2GSlVimlAr7VUgM/6DW
 HfEk0rkS5PGX5r0X7wq/V+2CFrPqHgBZwUbG0CKoU50q7WLJxhXZEUcAG27F9rlTzX5J
 zb6mGKR7etQbhzIkLo9j8G7nDUqT39e6BGLNVbNrIxzfNkyH8lbJF/cNcbjjoiBdiLlJ
 fwzw==
X-Gm-Message-State: AOJu0Ywc3LpLVhH7wyc5Jgh6Hd60iR+iDl+X+2/mBv9Jlwpbo0uyaZgz
 /855teIEyuaj2HwvKZW4HfJxo5pb5DLnfOKpAvuf2OZD77h8lZxiJo5IGg==
X-Google-Smtp-Source: AGHT+IEBq/txY7y8znklyNa1blM53dBleQvfUsEcFijSKfZhmoCGE4xqSfBxL8K5jjVQXqGNYhsZWA==
X-Received: by 2002:a05:6602:1487:b0:835:4d27:edf6 with SMTP id
 ca18e2360f4ac-83b1c40dc70mr3958181439f.7.1730830463733; 
 Tue, 05 Nov 2024 10:14:23 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04977764sm2519588173.90.2024.11.05.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:14:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:14:20 -0700
Message-Id: <20241105181420.1423251-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730830464; x=1731435264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VcSD7MqqyW19IDtf0tiC84Igi4+vDM6JQNwxs13BzmE=;
 b=EMLqOJ2colVsD9CaWl3tUx4i8qKmspEgXEkrd03/FoxWf5puPGS0OCLIOyAdr0tz3b
 hrh9A6e9vfvERmV/NspzMolrphtKqtkfnJYQKsEVDL15bDLChJZzxcQtTPuf8YKoOvEI
 /J3lwJzuDjM2SpJ89NmQJb2MxVUSsfzJBtx485qRxbuce2FmOUYQHIgXQZ1EbaCYuz8u
 yXKHa3kRwNZ+sX+9zr4h1SysRhE/Co+uuHXunvLmF/ZR0uFaxcv3ojosUnidqZFXKj9G
 xcuxou+RuDaigcdTxPLEuk+TC8hQBF/0U+oxrg36kU6eve75Fu+9cFtM2SvwJljifkT3
 TIEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EMLqOJ2c
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp: use poetry setup type
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

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysnmp/python-pysnmp.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index eac01b3169..2703833ffa 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -7,9 +7,8 @@
 PYTHON_PYSNMP_VERSION = 7.1.8
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
 PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/e9/af/f9e379bd9e607fd289b6cef13d633667c4d213f8c1519a86f61eed09731f
-PYTHON_PYSNMP_SETUP_TYPE = pep517
+PYTHON_PYSNMP_SETUP_TYPE = poetry
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
-PYTHON_PYSNMP_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
