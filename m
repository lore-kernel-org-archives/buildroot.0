Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105D3CF58FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 21:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4E4080654;
	Wed, 19 Nov 2025 21:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqkln_Wd-ctW; Wed, 19 Nov 2025 21:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6784380643
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6784380643;
	Wed, 19 Nov 2025 21:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D3A12A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13F2C611B5
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpXNu4Lh4fk7 for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 21:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F321761108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F321761108
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F321761108
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:24 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so1400125e9.2
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 13:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763588063; x=1764192863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hnRSz8Xdlsj1JLn3W7tb2vFh2dzeHkvrQ03TJYs+S2A=;
 b=BFlnx/kLGMx4I7HSbMDIzNsoNuxNAFbjFyJsPrDY2XDrPa8Gnt2tAqzVuB0XEx/mzm
 jik9x+dR2a/N1OMXF7K/tqKuZT5uSTZIcc0kHFMRp+58TxS88JPPTopjhUk8LlBulBCg
 c68FRq9GaCJabtTmhXXqFBoRosO6TEYv31G0e8tzgMVJp9Gi0nRBKmvbBV/DVQxBuVKo
 4MlL8bh2RCRnl1ZY/RXQ09eSkXyW09a757uRsYJMYoCbVOpQW+jiGeK1vMw+aKt3k3Rz
 x0dWJEfWf6my8nEETSDeDnjKhIDfLwjKPGutHcR2wAMJ7dLPToBsXJHrBqu2FtAwTkAt
 Jing==
X-Gm-Message-State: AOJu0YxzVjcHV8lsMlrgy2bIwMKklkK+HcESDgy11sxvmHIw8wZ7t26I
 qmUP7sZ2rCXU5uCFpmpTHcPBrGVBMMgQpfvPSyqT8O+zDC8KZ5Gpa2uUgqtDzhyPDl2uQIFhrp2
 hWe/QkRQ=
X-Gm-Gg: ASbGncvOBEy0tqpWuiNPzt2o/uklQZqpQdjRoPBfwSqTSykvBshf/CA0zHxccmw4LKN
 7moZ++QAgYucXeroqTerEXRGdVxyS4iae1pQ22JXuVb85ILLTLqz6+rG52c+AMIGYW527gzYx26
 6QCDmm6t/5Mta/ByvF7BQqYs2NgcE25ERg7J+mP1Z6JuZgBn/ZgY4ipQ32oWSo6ku9cWjZE4caD
 4ynxwFfIXKF36TTfHKQxNjScqi+YoXHT8/FyTZGSHy3n9UoG+loTBbXfrXRdwtHaXaXfODOjHSH
 hJLVx49ijFEwSgm62zlBO99II3dQow4JGDtao9sXbpiXptcN5XSCHPJAbHzIwDGnspcemSW0J2f
 FqBOt5jPvKX2ILn4dslMc/ipmJ4DearbqCBhqPFiMaM1d3tqKZGQfSdYaFJQcyxuMl2mk15YYdX
 fs8sO1s5Q28LZGZ/37bt763B2+a2y7UT/Ih3Ut8tJzcjLJCD6aBXaTFpU6gQ==
X-Google-Smtp-Source: AGHT+IFQI8N9eqkG5PXF1lkkdkQHA1gpBp6ISh7tE88YhH4bUpgbKqjyLBGh5simUX03A+rBPLyesQ==
X-Received: by 2002:a05:600c:c492:b0:477:9e10:3e63 with SMTP id
 5b1f17b1804b1-477b8d8f05bmr6456425e9.35.1763588062721; 
 Wed, 19 Nov 2025 13:34:22 -0800 (PST)
Received: from arch (77.109.92.201.static.edpnet.net. [77.109.92.201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b106a9b0sm71362905e9.11.2025.11.19.13.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 13:34:22 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Thomas Perale <thomas.perale@mind.be>
Date: Wed, 19 Nov 2025 22:34:17 +0100
Message-ID: <20251119213420.7480-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119213420.7480-1-thomas.perale@mind.be>
References: <20251119213420.7480-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1763588063; x=1764192863; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hnRSz8Xdlsj1JLn3W7tb2vFh2dzeHkvrQ03TJYs+S2A=;
 b=AOrHIAWVKl3sZtrrwew6efXJJNI6rry3qm8DyxStpJyKnRRJd43/5kzUP2hEmtroHC
 R7O1k3FRDmAk0VvE7mEmitDBS9sFsVvaS2gxvbH50OtftaouO2JBW/M8c2Vofer1JV39
 8L4nY7MUQ34AzFaDChY7V07z4Sh5ZJkGz/eUMINeGjwjb3yFjiO5QEsVf75B4LtdhsBb
 UhVGlOdaTs8777vKiiKCSuOMuXuon5sHxZgYRyvQvLPe+G7dObK2nTpHFNlSrtvXUD3v
 iN0lzK6TlGockZapo8RTO5a0vV1wFV5+pGB4Musuuw58DULb3o3MTQ+rj1nVc7whLR3m
 5QoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=AOrHIAWV
Subject: [Buildroot] [PATCH v2 1/4] support/scripts/cve.py: don't call
 download_nvd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch move the 'download_nvd' call to the 'pkg-stats' script
instead of automatically calling 'read_nvd_dir'.

Since the cve.py file can be used as a library it's up to the caller to
decide wether or not to update the NVD database.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve.py    | 6 ++++--
 support/scripts/pkg-stats | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 25481a6367..27a5f2f362 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -144,7 +144,9 @@ class CVE:
         self.nvd_cve = nvd_cve
 
     @staticmethod
-    def download_nvd(nvd_git_dir):
+    def download_nvd(nvd_dir):
+        nvd_git_dir = os.path.join(nvd_dir, "git")
+
         if os.path.exists(nvd_git_dir):
             subprocess.check_call(
                 ["git", "pull"],
@@ -177,7 +179,7 @@ class CVE:
         nvd_dir, a fresh copy will be downloaded, and kept in .json.gz
         """
         nvd_git_dir = os.path.join(nvd_dir, "git")
-        CVE.download_nvd(nvd_git_dir)
+
         for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
             for dirpath, _, filenames in os.walk(os.path.join(nvd_git_dir, f"CVE-{year}")):
                 for filename in filenames:
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ec46d373d5..cfea179458 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -676,6 +676,8 @@ def check_package_cves(nvd_path, packages):
             cpe_product_pkgs[pkg.name].append(pkg)
 
     print(f"Updating NVD database in '{nvd_path}'")
+    cvecheck.CVE.download_nvd(nvd_path)
+
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         check_package_cve_affects(cve, cpe_product_pkgs)
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
