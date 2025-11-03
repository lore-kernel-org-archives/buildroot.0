Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2241BCCF9F8
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE83381100;
	Mon,  3 Nov 2025 21:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqBjlYAYhVm8; Mon,  3 Nov 2025 21:11:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DED481101
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DED481101;
	Mon,  3 Nov 2025 21:11:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00A6C942
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB50C60A68
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sciEJ3xyJdmb for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BAB860A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BAB860A64
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BAB860A64
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:11:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so43542755e9.0
 for <buildroot@buildroot.org>; Mon, 03 Nov 2025 13:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762204308; x=1762809108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S43MnYrkA5T4PR2WcfoVqDRaMYkrbzDluffpsFPhpfg=;
 b=aU4K7l6Ew8EudwkjeCMU1EJmagSdwm/pqnIo3v9/Q2tkmvqdSs5Osh8UOgoocQXyO1
 KK4UhvBFQFgSZxj4M8XPoRGvUSXqYoa5NI54iZhdZFMRCu66TK5smTiRVuCMUYT1EINw
 5fzUUMVUwHutWSwksRXA5a3wT03OVINfWbz1loeDayxjbJTKtIKn+X30RwRlv4p12AEq
 z0aRmeQvFslb1dipmjLtjHrzS7/yrQyzw0pH3Tq0Sp5lz3wdWD/i+NBML5/Ztnd4NhYC
 6HUSGhnPt8j78ZJxf4HxT+18AmXaS5t4wieKYYXrQngOTa3fON316pTC5jYNOoFjZ5pl
 fnng==
X-Gm-Message-State: AOJu0YzFdmGG27hH0F80abG7A+W2Xn3msEvCEwpTzSk/eLf74YrZ5Mhj
 owsKgUvcCG0W99ONGT1S1vEL99kkBqy3my5CtT0vxvxhyxJawV1fTJhrvBfc0FLrEwskb1QjKzR
 UvhC9
X-Gm-Gg: ASbGncsZeYuaIYpEMnLZzfcODnUI+qPsHc2yoRxkIKtpMMZoqfwEullD+7Mo7YrSQOP
 TX4UH2LzbVSGBKUqUrcLu/4BfW+eKSmknLOPpb4Svsw92iw0ALKvCMp7LGfmBtYlUw2RJMNDH0D
 zdGpPlYzmfESbp/mbYZPYOuvN9WdB6w/FUlQZEh1ACrkw8ENtU4ygWoBPylTJn0Kuy9aepyfcde
 RlXvp3r5SDMP7pK7heUk0cS5P81gT518lNgOaAnEROj/Z5m6veQ4qPzeXC0HcU8ac76KghUxL12
 ELUe+GMdp8lQzmM1saBp9IPqJtF9yPgOTbNuYKjiUZabfOzu7te88g4a8ws43ydHvkOEOWelR56
 f0Ue/VcRdx3dURRsMTtYU1WPsiLf6/QHkN+UB/sc/bcIQCM+n7ztsIdSQrI/IKry1Kja5YUdSTq
 YXUJElI84RHIXnQ7N4H+nBLvDYbLFtUyaT9S6S
X-Google-Smtp-Source: AGHT+IGgpOdpz/I6loeb43/3M5j+n6y3ZwxqOGyWm8OwmDCRV4gS4Ww5qRgz7/S4IiBWQwyVa8HeGg==
X-Received: by 2002:a05:600d:8314:b0:477:4345:7c5c with SMTP id
 5b1f17b1804b1-477434584femr54119675e9.38.1762204307719; 
 Mon, 03 Nov 2025 13:11:47 -0800 (PST)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383b45sm179630745e9.9.2025.11.03.13.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 13:11:47 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>, Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Nov 2025 22:11:41 +0100
Message-ID: <20251103211146.57344-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103211146.57344-1-thomas.perale@mind.be>
References: <20251103211146.57344-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762204308; x=1762809108; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S43MnYrkA5T4PR2WcfoVqDRaMYkrbzDluffpsFPhpfg=;
 b=RLzVWnRI0JJIsY6yGTt7AnhabEmcY65F45j6P5DYggw+eXYMFuElaiK0aHB4F2EDAu
 vTGzjX6NGQufmyiGfIp1tEjAOBMdZMw0NMW8o9a1GxP2QlJTlj2Mu0h9U8bRFlgK0q6f
 yivVAvaKHnxnklHs3wuawi3tLLXyVeziWzi+884MC+uePLSG1L5Z/NunOjHzJs4YMYj2
 ieqhLcacFO17gOrLWSlZvspZgSAC4vWnJxBLuFAoNXbwyEL2e3f/CWEIFfr2QqcIhw9g
 hQAugyAQrhO4veQW3jAe78KqzAtJTaaClo+q5BMYZX45WwN9c3xuOaGycY3/Ix/PXmXd
 7pEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RLzVWnRI
Subject: [Buildroot] [PATCH 1/6] support/scripts/cve.py: remove print from
 cve.py library
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

The `support/script/cve.py` file is used as a library. Depending on how
you use this library you might not want to write content to stdout when
calling its function.

This patch move the 'updating' log to the 'pkg-stats' script and write
the alert when LooseVersion doesn't have a version to stderr.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve.py    | 3 +--
 support/scripts/pkg-stats | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index ba41762fa0..5ff67585e2 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -69,7 +69,6 @@ class CVE:
 
     @staticmethod
     def download_nvd(nvd_git_dir):
-        print(f"Updating from {NVD_BASE_URL}")
         if os.path.exists(nvd_git_dir):
             subprocess.check_call(
                 ["git", "pull"],
@@ -192,7 +191,7 @@ class CVE:
 
         pkg_version = distutils.version.LooseVersion(version)
         if not hasattr(pkg_version, "version"):
-            print("Cannot parse package '%s' version '%s'" % (name, version))
+            print("Cannot parse package '%s' version '%s'" % (name, version), file=sys.stderr)
             pkg_version = None
 
         # if we don't have a cpeid, build one based on name and version
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a0a46aa8cb..8710dda795 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -675,6 +675,7 @@ def check_package_cves(nvd_path, packages):
         else:
             cpe_product_pkgs[pkg.name].append(pkg)
 
+    print(f"Updating NVD database in '{nvd_path}'")
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         check_package_cve_affects(cve, cpe_product_pkgs)
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
