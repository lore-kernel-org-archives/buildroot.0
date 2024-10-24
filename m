Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50771D0BB5E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 038F2811FE;
	Thu, 24 Oct 2024 05:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUp0EDADzraX; Thu, 24 Oct 2024 05:22:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07D028125A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07D028125A;
	Thu, 24 Oct 2024 05:22:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CC2927ED
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BC998117E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efcOrZeI3pAC for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:22:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7630581177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7630581177
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7630581177
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:22:04 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83ab94452a7so21630439f.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729747323; x=1730352123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kroMZgpP+IQ8aeEy2VSCt/sOkgUNxg5QEEwN6hNNl3E=;
 b=o7zkjLKzA/oWCd6BM23izfvZ/DwAxUwVXLHZd2VcZ0aSbghrSg7PSEhixwmF2zHkm/
 tYzuZiogQqsN52ONVG6DGHu3sLTOZdhOLYYit881ikAxSyvu4skmNcJIah98S2IZ93yu
 pKFzgwI+QW35NjWCTsbGov5iN3727WhWpssWHTdcKLxpqrwBdabdJo4pieJKPEL2SyjY
 boyDsxZHvuNS80ypoHXQfSDYjTvbMdklNicVYAM2kyoyZrK2zg95+mRqvOT5zkhFAjOH
 FQgEHM1DnJ6/wNLjRyQYuUSdfKELIx9/dO+JDKOJ44qYF3yA8DlzGvGnQfm2MnDzuPQG
 hdFg==
X-Gm-Message-State: AOJu0YzZdKFp4MpO/uWmWDdd59svDFS7KEOnt7tzxiG1axiIOxvTncXc
 kgneI4DzItBWE1KIOkfSQL+r4PjrGgMPnMUKkn+BTZS8olfjvYRN9Vogvw==
X-Google-Smtp-Source: AGHT+IGUCfYQxNDRzprT6Y/XZbUEzWWAfJ/1rummTWKozdn30pD0skRwRoYzexHwL3ldKZTIytH9DA==
X-Received: by 2002:a05:6602:14c9:b0:82c:ddfc:c57b with SMTP id
 ca18e2360f4ac-83af616e51fmr659759739f.5.1729747323241; 
 Wed, 23 Oct 2024 22:22:03 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a530890sm2521296173.28.2024.10.23.22.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:22:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:22:00 -0600
Message-Id: <20241024052200.3396294-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729747323; x=1730352123; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kroMZgpP+IQ8aeEy2VSCt/sOkgUNxg5QEEwN6hNNl3E=;
 b=hUJvBydx3N03WUBqAZAmvHirPYln3H01O5uuFSunAzXrJ8Zvcp1MFrz0TKkXzWAIco
 0vh+XQk4aZfVx5p0OlVyAFyUYtguL5AtTTrwmy3vbws6UqNP9NZxUxTghV+vPlu9rXQK
 Lzx8c7tn96Zzg+5J28+yu4t3jhZYHVngorzTmpImrlwR+FgCdBM8ETSSDGL+ZETRj6J8
 um7cNnHSLPR28+freodeODSOcOYr3SE4poxFBgMFcK6F89fmd8BUzGhOEMD3i8l9Vq56
 3167cjmsVQXDpmue5U6CKYdThH9hGB8MWwzLf2URjXbAcuv6QDcK1+5XCPTu6Tuxuju0
 CAtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hUJvBydx
Subject: [Buildroot] [PATCH 1/1] package/python-soupsieve: use hatch setup
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
 package/python-soupsieve/python-soupsieve.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index 9546a6b8c4..b37d552fe1 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -7,9 +7,8 @@
 PYTHON_SOUPSIEVE_VERSION = 2.6
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
 PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/d7/ce/fbaeed4f9fb8b2daa961f90591662df6a86c1abf25c548329a86920aedfb
-PYTHON_SOUPSIEVE_SETUP_TYPE = pep517
+PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-PYTHON_SOUPSIEVE_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
