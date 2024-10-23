Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75644D0BB46
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C928407B8;
	Wed, 23 Oct 2024 22:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPDFbbfg35wB; Wed, 23 Oct 2024 22:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1106B407B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1106B407B4;
	Wed, 23 Oct 2024 22:39:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4F36972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85273608CC
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3_WVNcDVNVE for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:39:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7C84608C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C84608C8
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7C84608C8
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:39:39 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-83aa3ced341so12514839f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729723178; x=1730327978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aJgjIAwqkUhK6cHARkq1L85VYLkp6dyGmiv2D8y10Po=;
 b=MjRryrl1wNh26we+j8OdJqn9bVe2QjPgdVODuIScaTNOnNqTvxUmjrMfFXrPWCE7xh
 eBsyqTdEooDrWq7PwWZyiVqjCSfSonrs7+Zqzs70Qs7pTVj9Madlzs7jDfSpyaUzuOQK
 XG1hhVxxXVa6omKcTRzqS2jKCXJAxAYfl/FdJnyze0abVKF1OSbo07mOxhIbxSx86FSE
 S9iK25Xlmg0UV3IoK5JbTVisyz98hs9hjJ6Xu714tmb/V0K6/nUTe1yhi++jjB+R40YV
 qzP1AbORl7bbQnT8CJEgdHRrTfYlQrXGQMnKVzxcU/o2Wy8NnQlsddhIPlUm7LIaXNt0
 0jWg==
X-Gm-Message-State: AOJu0YysiuwrWg1QwcQTvJn5OIQnNB/waoYUK9RGdpbT9QOl0pZWRVm0
 viSre6Vk/G+O3K0fnDzYwgrsahQbGm4sv4DJRzWvn0TsZNzeY04381Gp8A==
X-Google-Smtp-Source: AGHT+IHh6W8sU4QIWXbFEn+8VsIfbsDeFsv+4ufnxxXc21PtVzDhyOYlk7EdikaaG9UmMjxWBusRnw==
X-Received: by 2002:a05:6602:640f:b0:83a:b901:3150 with SMTP id
 ca18e2360f4ac-83af6199c33mr484738639f.8.1729723178384; 
 Wed, 23 Oct 2024 15:39:38 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83ad1c3361dsm255041639f.9.2024.10.23.15.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:39:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 16:39:36 -0600
Message-Id: <20241023223936.3349573-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729723178; x=1730327978; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aJgjIAwqkUhK6cHARkq1L85VYLkp6dyGmiv2D8y10Po=;
 b=UX9FW5//LeVgZp9GoCEwnirnqYJPIx1qxbMiHexdx1WMrxo8kc/Ld199oYlFw0pgvB
 G2DcmwgidA5STmGxRanADYnxRXQmAHiAMKLymvKCDpMqZEA+JJVT8bOGwnEliH1YgwNH
 BTjoNMGrhTTElv10LdglF/oVTEskwht9NTU8p/nFUMcryxGq/Ihn+/jm1QMGkY8DtXSL
 2GVQ+P23rHiz8yT10d3jaVsrjUpyUJ1KmZ8aQdY/iSlCDHn2p7AUIOhcPDgPzh689hdK
 4+Zm+gFM6CQ8UtPvk65GFpCGDBynXvWwDGzJTJfv2W+epQoAbm/E+TH7WY0Kc7IJbC/1
 0bMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UX9FW5//
Subject: [Buildroot] [PATCH 1/1] package/python-multipart: use hatch setup
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
 package/python-multipart/python-multipart.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 925a72ebac..195724bfd3 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -7,9 +7,8 @@
 PYTHON_MULTIPART_VERSION = 0.0.10
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
 PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f9/29/0e5c896ec896b4e501bafa80ab555bbf3bcb0d720e9e33f908179aeb1a61
-PYTHON_MULTIPART_SETUP_TYPE = pep517
+PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
-PYTHON_MULTIPART_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
