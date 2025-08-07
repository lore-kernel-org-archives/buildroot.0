Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07DBC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 15:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1D5C60821;
	Thu,  7 Aug 2025 15:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5wsobMAkWFQ; Thu,  7 Aug 2025 15:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40B9608A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C40B9608A9;
	Thu,  7 Aug 2025 15:29:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D21F031
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 15:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD7CB83D4B
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 15:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZoK8Z-4FEY5 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 15:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB0A683F32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB0A683F32
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB0A683F32
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 15:29:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-459eb4ae596so10505955e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 08:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754580559; x=1755185359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6Z6eDZ8ovVwuts9P79fYgNcGA+N4gLL72Yj4tKl8ew=;
 b=o0nfo6gN0bC50wOPmm7ckDRhfH57johI00ibUY6rHJUoDQ0yUXijfeGUGI+rm/OUK3
 3jZiCe3RDnax8BGMFP/N3pkKKd21IFbVd/4ppPgTw3z2Cb9kfqwoFFRN/+3nC5U9/zdO
 acaeI0eG2yDJ3X1qkziNW6IkTPh+Ihq7FLc6+KQENvVH4roAyeEtdfcGGVNLvMv+ZOs1
 zKumRhiWdqQbxfW7koLKyOz3ogZf5ECpRZVa0W6DgyzmLrk/uElzn00g0kXob76k+Xa0
 QWsMVx3LI7DJmjHgl5N30c21c/JiOX47JOwRtYabyfOjpIaJmGNd8xVJr9s+mLyWeHvp
 XyiQ==
X-Gm-Message-State: AOJu0YwgyZyiUSpTQhR9EqCsY4uLQ2ZesypHaOfvnx96CDU824boZWR3
 jivbBcqk282RXguHIe1iEqlmHz8hvw5On8O+no51CMaM3DGoD39xHx8xuUxnt6AJ8+Kk3NLmDpK
 smGDE
X-Gm-Gg: ASbGncuAzRImlEBWbyYkHAh8VUwPy4VK0cO8yYtzLfb5jioT2hItvJ8CJ62X0QeD2y7
 fSCw19BWmIBA1WNhkvSOyxrpLkMZminu3Npe+CXt2MEE2HZcopBFU5Q7ehLnyf64kAUpVH51Q85
 ysW1flQo5ohx7jRmZROkzDCZ+vTNoQJykcL2widSJWqWMuoGmZYB7IZU1te7dWTVmTjYtzyWTnQ
 uV3oMizA5X3GdnHy8ebqGTUsxUs3MPWshx8itr4OOtVrGS5la0ra2d2tFIn+hPJlUHUw4Z+0hCq
 aM5TZLa/5TCUz6YgoPTIo1mt7lZvETYp0uMdZJn0LflyHn0uabdD1XNis94+Dnk93K2Hz/F5kP6
 qfFU9wekzFAO5zoOdN4S1Gl087AEvIMuRwW8Gb2nBNSQ0
X-Google-Smtp-Source: AGHT+IEs9J3h9DAHgdErDM21UCgFTe7p+M1r8hWf/TPh/nMUYRN4t1BXsdDXkjBeZCWDRE6057PJgw==
X-Received: by 2002:a05:600c:4510:b0:456:a1b:e906 with SMTP id
 5b1f17b1804b1-459e7479df9mr62399995e9.33.1754580558600; 
 Thu, 07 Aug 2025 08:29:18 -0700 (PDT)
Received: from sah2lpt241.be.softathome.com ([149.6.134.59])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459ded356b9sm166618595e9.12.2025.08.07.08.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 08:29:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 17:29:07 +0200
Message-Id: <20250807152907.3225581-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250807152907.3225581-1-thomas.perale@mind.be>
References: <20250807152907.3225581-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754580559; x=1755185359; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6Z6eDZ8ovVwuts9P79fYgNcGA+N4gLL72Yj4tKl8ew=;
 b=hgaqzvVRDKxb/qjN5eS4ZOnpIm41BZO3JkAj0yl3HBe3x5sw/RDz2lJY5TnPZMmTl4
 2JU/KR4Ekoi2qeqS6ul09TQJUfimjfMdhvEPUUInhuBksNNPtvRa66JIfbmEiNEkdUSd
 hq9pUjlgwoewOB0KR2W1bi+7YpwtPAKxysF457jdMaz50AgbnYytqGDUwKEm0IoN04/g
 6n0DrUdfsonpeXC2frD1pmEVMEhVekF1iwN/bzU1eWxz2QYnRwjUhL/tNM5hYfJQDygy
 stAbQZE3WbYYLBT9Fb4WDuii30EsiFpPmD8dHGbo2kR8OkUE20MteLHwR5jWsl5QlO6P
 WQkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hgaqzvVR
Subject: [Buildroot] [PATCH 2/2] package/luajit: ignore multiple CVEs
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

This patch ignores the following CVEs that are already fixed in the
current version.

- CVE-2020-15890

For more informations, see:
- https://nvd.nist.gov/vuln/detail/CVE-2020-15890
- https://github.com/LuaJIT/LuaJIT/commit/53f82e6e2e858a0a62fd1a2ff47e9866693382e6

- CVE-2020-24372

For more informations, see:
- https://nvd.nist.gov/vuln/detail/CVE-2020-24372
- https://github.com/LuaJIT/LuaJIT/commit/e296f56b825c688c3530a981dc6b495d972f3d01

- CVE-2024-25176

For more informations, see:
- https://nvd.nist.gov/vuln/detail/CVE-2024-25176
- https://github.com/LuaJIT/LuaJIT/commit/343ce0edaf3906a62022936175b2f5410024cbfc

- CVE-2024-25177

For more informations, see:
- https://nvd.nist.gov/vuln/detail/CVE-2024-25177
- https://github.com/LuaJIT/LuaJIT/commit/85b4fed0b0353dd78c8c875c2f562d522a2b310f

- CVE-2024-25178

For more informations, see:
- https://nvd.nist.gov/vuln/detail/CVE-2024-25178
- https://github.com/LuaJIT/LuaJIT/commit/defe61a56751a0db5f00ff3ab7b8f45436ba74c8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/luajit/luajit.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index ebec4d87ac..f4836df91d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -12,6 +12,21 @@ LUAJIT_CPE_ID_VENDOR = luajit
 LUAJIT_CPE_ID_VERSION = 2.1.0
 LUAJIT_CPE_ID_UPDATE = beta3
 
+# Fixed in 53f82e6e2e858a0a62fd1a2ff47e9866693382e6
+LUAJIT_IGNORE_CVES += CVE-2020-15890
+
+# Fixed in e296f56b825c688c3530a981dc6b495d972f3d01
+LUAJIT_IGNORE_CVES += CVE-2020-24372
+
+# Fixed in 343ce0edaf3906a62022936175b2f5410024cbfc
+LUAJIT_IGNORE_CVES += CVE-2024-25176
+
+# Fixed in 85b4fed0b0353dd78c8c875c2f562d522a2b310f
+LUAJIT_IGNORE_CVES += CVE-2024-25177
+
+# Fixed in defe61a56751a0db5f00ff3ab7b8f45436ba74c8
+LUAJIT_IGNORE_CVES += CVE-2024-25178
+
 LUAJIT_INSTALL_STAGING = YES
 
 LUAJIT_PROVIDES = luainterpreter
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
