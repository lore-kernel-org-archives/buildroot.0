Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED2ECA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 13:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E041F408EC;
	Sat, 16 Aug 2025 13:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uiDzWlFMpdf; Sat, 16 Aug 2025 13:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AB91407DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB91407DC;
	Sat, 16 Aug 2025 13:01:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CF0E959
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72C424012D
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2roGHTsCjaYq for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 13:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F19340182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F19340182
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F19340182
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 13:01:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so15001095e9.1
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 06:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755349267; x=1755954067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UE6Fq9UVGVEvHi1DOWcJCb0E5MhTG1hmtFSqfr83YBE=;
 b=VCdxdgNoeAcYmmY8zYgST8IhOEDSmCdBZFeWd8sVvZHk3hEKCe/guw8hjTPnppxBP3
 F+PvG+UnjZkdOdvChWdN8Xd2yeWF9R1tLauVgxJgcBeGY9HxFqK/wSngXif/w+AHyME4
 9aR3Utx/3NhaGitXCNZJpS9MFrR9FMEikHBgupz0cz28owl5bkofNGS0nLzHBaWABMGd
 iW89upemt4+VSg+297M7w/VEvQ7e6JhAPwaBmH624CrWXo7w8WQIHEHbfm7sH9bpwx4C
 xLJW57xO+pMlDBbDOPU5RFc1jj0ngYIMVjhtGN7oXObrFzWJ0f2f+8jPAbE93BgQaHui
 oBVA==
X-Gm-Message-State: AOJu0Yz2LhcQNL1fCM9WpdRIY+lAKAQEMWPw6ze5NVoeVmXxGZ3r/DWl
 THWmN96anv7odFoAKowPoiYcAVRXy/mfcL70RwxjnV05AhOTi73DWyMlWJXg/qaT6e9vfAs8hLi
 ls3xL7VU=
X-Gm-Gg: ASbGncufXwBQdKeLFJ3CwYji3Bv/LDgWyLtmcnheQcg+dsYFYm2V+WZofhvo5xWb6gV
 fFwLuWn0yIMQucnhNjcoM5wp7S09FzUQyQhFiAklFreuotzlOioNx7nPEPkFq7g1D1199pnCGoo
 ljKq/owqKbseMcqX+5yneNoVQh2MJ+8g4zeiuxn+Y3dtzOPezjdo/62HGzqlkfWTAWZ2ynxQT6s
 ryEn8+VwxOtNrelT+7SCcWYs1MhF1E1zI6ttmWomqdXEMDY7pmRZABhz+Q3nRJe/f0nDfQ8JQoR
 p7X2Il3waf9VGu17CuHDir72pKqodc261c6BBGPxEwUUEY3h7bBOKtQ7EGHcV6B2Ft4ttSS8+Pf
 UTwPQu5WPMKk97+jirljwjlxS
X-Google-Smtp-Source: AGHT+IEEkLLvTrDHZKx7PhKRB8uATxwyNrBnbIFlZRgoLmr3uUfa/TjHJ8vKvRJZjMr+ikypROI76A==
X-Received: by 2002:a05:600c:3502:b0:456:28f4:a576 with SMTP id
 5b1f17b1804b1-45a21868963mr36913835e9.27.1755349266607; 
 Sat, 16 Aug 2025 06:01:06 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a27ec6b71sm16668395e9.10.2025.08.16.06.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 06:01:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 15:01:04 +0200
Message-ID: <20250816130105.3359292-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755349266; x=1755954066; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UE6Fq9UVGVEvHi1DOWcJCb0E5MhTG1hmtFSqfr83YBE=;
 b=asYgW8wEQjkupLBHQ7pgLAX9KSn+QaVZdNwa13YH49d9y2zWEkMV+BteZzdulXu6Y0
 SYOOsw5jUjk6prq1rYMesSdae8eK+GeaLmBZajtmvMr6PiFE0ix37MKzFD4ncPD93m+S
 iWe9vH1IuJ+XhvWMpN6VqwN1FTAv0pCUKQOs6eHX12TRJsO3+i9z1XpFeprkCyJrUara
 fEQcb4cg4RK6kCWkwUXXWpcsdJ2dvqTlmRpWcW4XGjUSBAw5dmIgrSqmqBFoeh2P6lyI
 sdJe2lAnTYPeqO57jyPEIi4OjTChNFDmsLLjLaVcNa+P8w+tul31MtZUl5FyNc3JCJTs
 laUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=asYgW8wE
Subject: [Buildroot] [PATCH 1/2] package/python-yarl: add missing select
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

`python-yarl.mk` depends on the host-python-cython package. This patch
adds a `select BR2_PACKAGE_HOST_PYTHON_CYTHON` to correctly express this
dependency in KConfig.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-yarl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-yarl/Config.in b/package/python-yarl/Config.in
index 48ed07cfde..e14275971e 100644
--- a/package/python-yarl/Config.in
+++ b/package/python-yarl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_YARL
 	bool "python-yarl"
+	select BR2_PACKAGE_HOST_PYTHON_CYTHON
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
 	select BR2_PACKAGE_PYTHON_PROPCACHE # runtime
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
