Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01B7C0219E
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8598606B1;
	Mon, 17 Feb 2025 11:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHrF7bh13gSf; Mon, 17 Feb 2025 11:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CD460BD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CD460BD7;
	Mon, 17 Feb 2025 11:30:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F01A6DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC97F40116
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRJ6EcnvzZyH for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BE3C400A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BE3C400A8
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BE3C400A8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:30:44 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-85517db52a2so79566939f.3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 03:30:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739791843; x=1740396643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74yeHsNcmevqPc28Tk9rC9Teu7DgZ8m+0023NX3u6GM=;
 b=kYZgZhZ6q2+O/PK5j52779p9JpSkYm5+DsWahTptGZfQcbhiWdfkvK0gYkT19R2Xl/
 jYxaackQ3dhwQdQJ4FzMsp0kN6k/PGxnJurmrsyK/l8hEUe15odRMBaD73lpQrjYyBSV
 OPO7RHA7okQC0U1z3v7Rx46psuDUvDfualrWbJGeQ+n/BBZKsb3psOATLUYh7teVxcAP
 isNsl792bH2+h+izrwJ6wv3C5n0caxftTect83TzOccVgumkM+F27lB6/vvigtPgWjiv
 DAOJDPcIveb05g8EtFuhJzu7NFRWcKDgju941RTrR2BEBBl+oIGXQrhUmm9w9RkPs90I
 2yYw==
X-Gm-Message-State: AOJu0YzY+ZBhEwaDrTAj2bIv+AVxn32b+2iW/GYtZARpYTQ/R5Bi59CQ
 N8zLJMgpG22fffBXfd6ajJlQFj+1m2NAP7Mfh4h6w3LMqHrYeYnaFfCdXQ==
X-Gm-Gg: ASbGnct7T1S59CS4FKFQjg7AmFjIjyKbOlQakecztohkP3CdimEjVi9AZJKfdunc6hM
 hcbaoN5E4PclNV9JjCo+GtIlbgZX+FqJp4x8ZCvu9qLoW/unVnZxHVVHUim+f06X862Ov+oOH/8
 3QWZ38+Stc9DdoHPrSSqAZxJjMWF7oKrdQMiiQcWNmRCEm3WYUQXYd/mUDi15rAjF9rhoBa3Q1G
 B8+lTPno0+TQVKk2BaCK99NIslQ3U3cdAm1ctjifo9a4pQ5JHKNcMWOcVRLoD9/K8gykA1YPc3j
 2IBFNW/OIq6gnSFIvWiAilsEO5Kr2beFTJBuvL+3BFYeF0YOmpNp5PHSNM0gVbtNjg==
X-Google-Smtp-Source: AGHT+IHnh3jqZ2P/3WMVXgomQluxYr+HPqIl+aQvJEnND9fMtOlpJJkfDcwW0X1N7yPf22DiyRawhg==
X-Received: by 2002:a05:6602:14cf:b0:855:4c0f:d523 with SMTP id
 ca18e2360f4ac-8557a1581admr799814539f.9.1739791842211; 
 Mon, 17 Feb 2025 03:30:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4eea881ecbesm23016173.11.2025.02.17.03.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:30:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 04:30:40 -0700
Message-Id: <20250217113040.1870301-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739791843; x=1740396643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=74yeHsNcmevqPc28Tk9rC9Teu7DgZ8m+0023NX3u6GM=;
 b=YEr2r14iz2zFK7uyItjBETSNlbhuv+p871XY2Onsu8l00wgW4Hf+7K/tws8A1l8syr
 VX2xVYa1l3cL+DJcsdFJJP9/QYYpwMXnQjAbMD4hKA3VMg5FNxONsuvrYK5Ytd+Q0q6x
 3s1H7GqYY+5taXasdp+wclgKOH3+If/5KPCYt5tSwAo091TmD3jeWbm819hG85+inGXt
 j74Dg9CLA1Ryy9oYK2I1yJxIqSYrru526l+kws2QDt0+MPNtsxhhCUooBhekmS7pnubz
 HAgRO6icKW7HogTtAyF/YEWSIbqIgxaJ7x/LQh5Ad99jrCuRA+Ih56nT1Zq1fDU03nwF
 ggOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YEr2r14i
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.29.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index d908d5cddc..d310e8ae02 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  d7e62e6331eb4e712b83dad434926440c7c94989e20d693cfae119b8777ce777  python-pydantic-core-2.27.2-cargo2.tar.gz
+sha256  94ebefcb84127e3a950129dc2485e046ece91d3a7f0959c6de124eca5573389d  python-pydantic-core-2.29.0-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 6a18421eee..c27967689d 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.27.2
+PYTHON_PYDANTIC_CORE_VERSION = 2.29.0
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/fc/01/f3e5ac5e7c25833db5eb555f7b7ab24cd6f8c322d3a3ad2d67a952dc0abc
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/79/f6/904edea98c98c09b8d618d619749af19a50ea5a71b9199ee2131a5a03dfb
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
