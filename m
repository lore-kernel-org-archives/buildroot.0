Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D7CEEB572
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 23:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9445940699;
	Wed, 31 Dec 2025 23:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8Y9OqkTLKvK; Wed, 31 Dec 2025 23:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B64940695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767223217;
	bh=hqBUDtBZWEJBJBRpY1xmzqdl+tlF0+oKmbeOpjIvppw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=p92m0d5br27M1cS0lICKlGGAOp9BFvrkz3j02F2SCeA519PY8TSt2BHDG+DCjDGfs
	 89dfte4DUSKQihKOZG8wodF2K2+OwtnmUNvxbkl9v+PljEMcSsbymtKurUbJfCbKSu
	 jetnXEBpIZU6gQJsCB+nSxwaNHVLlL57YgjLExAN37kR1+BzYfSd0YJM5NI7/zGE2B
	 v752IUDWoUyEFAzh8PTfAjkSLp0dMuvI+LKacArvpkHHOGnh7BgUuYww908i5J+Dw0
	 Ftwjsu/WDLGjnO16LT8EEkWSPAP05Oe0Czz3yRizOgaBsvO9RqBg2UAFSQFCicUx0C
	 FYXRheo/Lqasg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B64940695;
	Wed, 31 Dec 2025 23:20:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 548F2150
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45A9940695
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvCVOJd8QSPC for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 23:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6027D40691
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6027D40691
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6027D40691
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 23:20:15 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-7c78d30649aso7570670a34.2
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 15:20:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767223214; x=1767828014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zs6G4k0hZK0t3GiDc5Bcfln1e/PVnwlzNzuE48eagv0=;
 b=Uv5kspBB7/WJApzdCnG63LlE6rZri30OStTNWAEaf0wBysxTMDEJgnEGZw+/KqA6li
 o80o6UW6ka7QhAhqAQsYNas9W1A9+x0oZgyGl6OiEWUH2N5VBjUUb1Yn31mgd8AxIWw3
 2LqRqccrrwZgvZ3POQ7ufnfpnC4Z6LhUJo9krCdwePmxKPzqdnSc13iHR/xVPsY9Fjz+
 v95I4A0XhhYVFyBRwF+qkCXwgE+ew03zlh7wpXl7GGVZqbqcXhEV/nsL27e0mjHAEhs7
 Kjh3zPcaIsQ9UxkDepCIkvj7LGZvaK2hC3AruNFmHv3x9dThS2mfN7xmDoWRvAqlu7NU
 e81g==
X-Gm-Message-State: AOJu0YyrrB9swzJnSQGMWAXftX52hMAVf42Bym+kDF8ldSeIVJOKi9Te
 EUzoU224cb5d0ZPTTDXI1KVbH8kQ8tftMsFnnC+YbF5tjViJI6C+tYMeOSm8H5fq/Gg=
X-Gm-Gg: AY/fxX5M066HjU22vjxToVEeYr6P6yAiQwy2v9Urapjw4nZfq3T7p8N3HBtpoxHALFa
 Fn1kxdPmh0IDyHsrJDXB7UfdeJqZolMqeyM4tbhd26pimooUkpBqEzMEmoPh9zm3yGV8AlOrV+S
 MatXc4Mg73qPZxkWoy5OTUUlRm/HBhZwS6qLi6e7z5lSKLrVtXcHMloi+m7KXbyLfzhfJDb02Pz
 Rd+9Q0Yspm3hvnU+JmswF39llPiuo09oqwLUz2DtcaYzyJ5G96ji5Hs/k7iAtJ6o7eJjg45PcqK
 6g6USop3sggv/1RZx//4/BIaCW0Ojd4YqWnkrCFmvan36fpPUvn7yXGG69vqejtOOXR8zf+k+iP
 JQvYq/e6hBn6w7+x1QWJ/b3TY7O+RsAHrWaNE4bHjhVPt+4R0SnxILrvcMzXNP8ZmETJOycHyH/
 HE16rQ/KjztMnY/LGLzdHJ9BcBEswbIIx6y8+YqtV78DDKySQ+y6rYUwycz86U5a0vEfnNBLxgQ
 GH9qWQ2OF9j7p2H7VGgZObtrCS5W4+xrFjmsZ2YSAhXYmgLBrLJqAU=
X-Google-Smtp-Source: AGHT+IEzDMRpE4WHcoWE+L/QwASfmrB38fzPpjx0fLlwFlADFB7pG4lgN29bTmJuNTBkVPx56R1+/w==
X-Received: by 2002:a05:6830:448d:b0:7c6:ca62:e258 with SMTP id
 46e09a7af769-7cc66a024eamr17078720a34.21.1767223213995; 
 Wed, 31 Dec 2025 15:20:13 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cdf600885asm8653534a34.21.2025.12.31.15.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 15:20:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 16:20:10 -0700
Message-ID: <20251231232010.748783-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767223214; x=1767828014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zs6G4k0hZK0t3GiDc5Bcfln1e/PVnwlzNzuE48eagv0=;
 b=RTAtDUEIrDnAts6LPVYbPk/b2BKO8TFp9PBp2U342ikK5d6ebtQniyOrNEsZ/ZKAvY
 tr+F7Kgl9R+CX36MjI4nRdyxAByjhDDNBNVBxC2ROybutXFqSstrUkOL8LQ2QaiDwp5h
 jD2HYKIZuQx8MyxrhQ4Ay8QGFlwSADUI/oEh6lY2/ThmU0+5nrxJEjmSKdntRBNYyJ6v
 SjHFORLSUWvyMMuFMqfySH1exOGJxuD+DsacN++abnQnFXreJvI2vSqm/Zs4z/EgjgcP
 DidA/s53diIjfF1ZPUvb6sjlc9e3yQ0lIBOEMs7WLT2CgH9H4PS1Q3nygQC9ectW5rMU
 /CBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RTAtDUEI
Subject: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to version
 2.2.1
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
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 888f220e96..9defacc37f 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  dd09886c53c482680536e8ce8ffd483e  poetry_core-2.2.0.tar.gz
-sha256  b4033b71b99717a942030e074fec7e3082e5fde7a8ed10f02cd2413bdf940b1f  poetry_core-2.2.0.tar.gz
+md5  a025abe2dd8d096480a87941f30d95ec  poetry_core-2.2.1.tar.gz
+sha256  97e50d8593c8729d3f49364b428583e044087ee3def1e010c6496db76bd65ac5  poetry_core-2.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index eac7f75a9f..d3f39706dc 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 2.2.0
+PYTHON_POETRY_CORE_VERSION = 2.2.1
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/6c/73/8cc4cdc3992d9e03a749dd0ef7438093042a1ed197df8fcfc9dc9502ef0b
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/54/ef/a16c11de95b638341961765e072dfdd4c9a0be51d6b22d594c5f3255e4bb
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
