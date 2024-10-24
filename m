Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC609D0BB5E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5D780BDD;
	Thu, 24 Oct 2024 05:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JKdNQetp9p2; Thu, 24 Oct 2024 05:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC97380BC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC97380BC0;
	Thu, 24 Oct 2024 05:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A6A42073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57C0F606CF
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHI386N8k9hI for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F95160625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F95160625
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F95160625
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:01:24 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-83aacecc8efso53362039f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729746083; x=1730350883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjEi0aRQWkYPqAh7rvtaszzYIfPUuaVCxx2Nb93a5GQ=;
 b=ttXF8eu3P3eQQpfw/+FPbISI7GAqnn2DDwWWEOI6yivr3Nuq4V2acbW4uBCXmJ1+sV
 CytryqSccPcXSICzuzLt5t/5NsBO/UqIJAtFa/CXGNajVUJ/q1pn/AUn9fIRW4r4pPw0
 wr/R6wPPRLqNfUTda4vZCghXj7o23oKVvNxYb8CyYFqDR36Y5iQ93bCUUMGkbLqkfIjK
 SZcOlwpus01o7XvnnRnkU4m2cN7jknFHtZnKToRm9TO9ge4mtspB2YCLpDrzpwffJhTY
 cIriqM+texD8r2girTopiuQ0zf/i0j47hJETP+88aMGzwAgn2w9A3OkvW4W0xSS52b8M
 Z7ow==
X-Gm-Message-State: AOJu0YyM4/Ew7XMBbsbV1HF3CXK8fTFLhYmEOBdiwklhtI88u1eI0bna
 3aubOF659klI1UhxAU3OYWrJbIapmyK19ZyGv/y3HnZZR+yqWPK17gDNjQ==
X-Google-Smtp-Source: AGHT+IHQe79dxXDfIMX+SiHb1DuBJBt0jSWS5BdeQ6nwxoPwXSORHkgGpa+cthIbws7MrVn9cNmA9w==
X-Received: by 2002:a92:c54c:0:b0:3a0:9c04:8047 with SMTP id
 e9e14a558f8ab-3a4de711ee4mr5852945ab.6.1729746083101; 
 Wed, 23 Oct 2024 22:01:23 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a400b7f421sm28939755ab.81.2024.10.23.22.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:01:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:01:20 -0600
Message-Id: <20241024050120.3384635-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729746083; x=1730350883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EjEi0aRQWkYPqAh7rvtaszzYIfPUuaVCxx2Nb93a5GQ=;
 b=b2rJVLt3s6LT8WT/N4+lS3sg7EJzBFGs4Y2LeGezDTpJx9iCdmQLCXo0+ZVnNNP5e6
 0TVEm65SCJahR1J2vzEaOlGn+5fojIllvbBEo1g4QJIch3iIYZYlzYOKMpMUefGeT9v9
 qQkcVV80l8+AGTbttr9BGXSX6tvaT0SZmMh44Jp5A3pynSxrx9EkmFfbuM1mIZ7E16Mb
 2GBbp6DgXpvvEal2SZJUpUhFfLvm/sVDDPriVAboymO/h4A5uiN6tSm9jdmtrva83mpV
 PAmKonH2J0onTrJjLj9tf4cfP1xvoryKUNSYXEfH6CMbC0s1SaVUGMjKSH9z5bDXaSK3
 Bq3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=b2rJVLt3
Subject: [Buildroot] [PATCH 1/1] package/python-wtforms: use hatch setup type
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wtforms/python-wtforms.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 58cd463095..4f020151cd 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -7,9 +7,9 @@
 PYTHON_WTFORMS_VERSION = 3.1.2
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
 PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/6a/c7/96d10183c3470f1836846f7b9527d6cb0b6c2226ebca40f36fa29f23de60
-PYTHON_WTFORMS_SETUP_TYPE = pep517
+PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
-PYTHON_WTFORMS_DEPENDENCIES = host-python-babel host-python-hatchling
+PYTHON_WTFORMS_DEPENDENCIES = host-python-babel
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
