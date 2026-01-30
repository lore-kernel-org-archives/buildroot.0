Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE279E6BF11
	for <buildroot@archiver.kernel.org>; Fri, 30 Jan 2026 14:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5C58404A;
	Fri, 30 Jan 2026 14:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gvi5m0cDUwpo; Fri, 30 Jan 2026 14:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D62B8403E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769782152;
	bh=VGNfYwtZ5RJpFSbYv/4ZmMADV/TNbg+k+NkwyvuVruI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JHxrRRDiTUihO6xSwljZbEHgBGYF8472kEzqxsznBFAbzL3N/X/ZtsgMpIA6W9BJH
	 lFk5XPWnz9dVVPU6Z57k/Zc1Rxc5+h7K3HUa2A+Ifx4bRdXPNQcCcQaJpRtYvx5RRj
	 TyshdzNf5tyP9kroydSuYm4jEjXdIvsgnu3nmwVaiHKDjIggZ4qnk1NgdlshxivbBU
	 /uiDO46b6ws9UfD5cJiiJAI0f4fVHlKs07zUFOZhR6V2xjbRzeLP5m+LWV/McyL/t/
	 l3TDoPXKObWalBmjxsSJZ5EJ/ua+cEbsDkzH1ZZMye/w1DWSD/7GXmftHcX92Zgqr6
	 FlLYrGLmJgbgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D62B8403E;
	Fri, 30 Jan 2026 14:09:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1487069
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 14:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3D2960AD9
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 14:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id py_cDMboNBuB for <buildroot@buildroot.org>;
 Fri, 30 Jan 2026 14:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3FA06084A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3FA06084A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3FA06084A
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 14:09:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so2116418f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 06:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769782144; x=1770386944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B59Yh3xgR0rNmhHfhuUF/T2DmWogxdvGILIfpfV0bsE=;
 b=CEOF/YQGiJakuCVgTLG7kVwvHo3lKui5c3rP9GGGVmoVgGjQ5nPUy+Ji7RGu22P+TZ
 OS6re8RStLLffGE712ieWNgqhXLXAuWlEf5MHbpGA+J2HaPSGlHwNzz+t86Kx2kygCCB
 kdi4qkhQqO9LOq6nWpUavRj/cjEykGrqNg9dcYWb0HxUnmb9ygPb3ZOZkY/MyT2VQ0IA
 BNTNnLaVZYRBCZvorI/7p5P+cDtc4o3epzGwPWotNcx3aTaMcfpB6IjPMy8ahBPVpm+7
 NZuYuEJX4fJYo1O1mVLOIffCrMDCgnKiVj4TgZHNCk17g8UIKIMeJ2QamSy6QzR9Zwl0
 8SzQ==
X-Gm-Message-State: AOJu0YzW8wXWRp3v3TiHnP0WL3fROtNYgKpAhPLfgEXi2WhyP8M1d7LP
 8Q8kwNBtMaCJBW1WP3nZUsENaAT9vOHt7QkkzzLWE4xhPmAlwZ4l4wyGckpd2MqbY9QJbSJ+axm
 i2Ety
X-Gm-Gg: AZuq6aLhEO0WpbHDFfYsZmi8wq+rN+NCNPKRNk3XzmJU3oU0AzthkgD6ubtfOx4Qvjt
 brIyD8+Dfnpam6mMqCzmW1YnlPru5ry9NcxV9jfb8YkyEFydDWJsAZRDmf/083hZGvYg/hIHBkn
 XbuunmYyKhWJsPXXOum9EEHFNW6i8pvbd7Vc233CIj8YMucA/fGv38jpSLSNHqiBYDBTK7+jXuB
 WkKyt2JyhOfZV91vFnmUnCBi0hiTdprveP24sH4Qz6ma1x0avsD5P8YKx5JBITe63DQjx2/Y7cj
 5X1VvBKnUa+L4uonXnejLq5PHx8ECbzJFzKyj6Rf8DtiQRz+gu0B7VsMCL7BbmA6I3glUUQLRwr
 ju7Wjlvrclo8hXn1jkxD1XzdVzrPDN833m64Ii0LxGYP/4bk8IRurZeDVMfl9rP+EsqDoZ3xtZI
 pVZIQ=
X-Received: by 2002:a5d:5d01:0:b0:432:c0e6:cfda with SMTP id
 ffacd0b85a97d-435f3a62ed9mr4139179f8f.7.1769782142343; 
 Fri, 30 Jan 2026 06:09:02 -0800 (PST)
Received: from arch ([85.234.220.95]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee562sm22916236f8f.18.2026.01.30.06.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 06:09:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 30 Jan 2026 15:09:00 +0100
Message-ID: <20260130140900.296916-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1769782144; x=1770386944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B59Yh3xgR0rNmhHfhuUF/T2DmWogxdvGILIfpfV0bsE=;
 b=Pel14dPsEU52o7NDaYDM8SLd5fDdo2Wix06wrbnu/yZqm5o6VTHKlq/miJcpeJ2Y+7
 i0enU3rRs5hrUE9y3PAfnfyx0Q4KdmR1YK91pkhkYAyajmIw1kziYH6rKxHQCaJCYllb
 uBeWbsh/CqAGIh1qn5CTt/cZcX6MjyjJVa9KL1+rYSBXLoEHX7ZPBRQA/zcB8hZyTZYt
 5qkIaOwGGXQU0tFqg1WshYkStHDwCKUEe3/lrBAjoDJmuny72rW5BJJZcYU3oeCfUYFH
 JHz3FO12JaVOOu6PtKYOyIRocDVAy3oUCwdOxXtpvE25dSwAKlVFsq4YEG1Zs+AlfG0I
 eXRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Pel14dPs
Subject: [Buildroot] [PATCH v3] docs/website: add a dedicated LTS page
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

Move the content refering to the LTS information from the 'support' page
into a dedicated page.

Also add LTS specific information about the sponsoring and the benefits.

This page also contains clarification on the release cycle of the LTS.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
v1 -> v2: Adding the appropriate custom fonts
v2 -> v3: Fixed custom fonts css import

 docs/website/contribute.html               |   2 +-
 docs/website/css/lts.css                   | 405 +++++++++++++++++++++
 docs/website/fonts/compagnon-light.woff    | Bin 0 -> 44788 bytes
 docs/website/fonts/terminal-grotesque.woff | Bin 0 -> 35360 bytes
 docs/website/header.html                   |   2 +
 docs/website/lts.html                      | 354 ++++++++++++++++++
 docs/website/news.html                     |   2 +-
 docs/website/sponsors.html                 |   2 +-
 docs/website/support.html                  |  23 --
 9 files changed, 764 insertions(+), 26 deletions(-)
 create mode 100644 docs/website/css/lts.css
 create mode 100644 docs/website/fonts/compagnon-light.woff
 create mode 100644 docs/website/fonts/terminal-grotesque.woff
 create mode 100644 docs/website/lts.html

diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index 115b1fd8b8..c05bdda62d 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -51,7 +51,7 @@
 	  to organise those.</li>
 	<li>Practical help: providing a meeting room for developer meetings,
 	  providing autobuilder instances, etc.</li>
-	<li><a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring</a>,
+	<li><a href="/lts.html">Buildroot LTS Sponsoring</a>,
 	  a specific effort to finance the maintenance of the Long Term Support
 	  branch of Buildroot.</li>
       </ul>
diff --git a/docs/website/css/lts.css b/docs/website/css/lts.css
new file mode 100644
index 0000000000..c195630a53
--- /dev/null
+++ b/docs/website/css/lts.css
@@ -0,0 +1,405 @@
+@font-face {
+  font-family: "Compagnon Light";
+  src: url("/fonts/compagnon-light.woff") format("woff");
+  font-weight: 300;
+  font-style: normal;
+  font-display: swap;
+}
+
+@font-face {
+  font-family: "Terminal Grotesque";
+  src: url("/fonts/terminal-grotesque.woff") format("woff");
+  font-weight: normal;
+  font-style: normal;
+  font-display: swap;
+}
+
+:root {
+    --br-blue: #2b7de0;
+    --br-grid: #dceeff;
+    --br-yellow: #dcb045;
+    --font-pixel: "Terminal Grotesque", sans-serif;
+    --font-serif: "Compagnon Light", serif;
+    --br-grid-size: 40px;
+}
+
+@keyframes slideDownFade {
+    0% {
+        opacity: 0;
+        transform: translateY(-30px);
+    }
+    100% {
+        opacity: 1;
+        transform: translateY(0);
+    }
+}
+
+@keyframes growBar {
+    from { transform: scaleX(0); opacity: 0.5; }
+    to { transform: scaleX(1); opacity: 1; }
+}
+
+/**
+ * Header with the grid patter background used by the Buildroot LTS
+ *   graphical chart
+ */
+.br-lts-header {
+    margin-top: 50px;
+    position: relative;
+    width: 100%;
+    min-height: 400px;
+    background-color: #ffffff;
+    overflow: hidden;
+    border-bottom: 4px solid var(--br-blue);
+    display: flex;
+    justify-content: center;
+    padding: 40px 20px;
+}
+
+.br-lts-header-bg {
+    position: absolute;
+    top: 0;
+    left: 0;
+    width: 100%;
+    height: 100%;
+    background-image:
+        linear-gradient(var(--br-grid) 2px, transparent 2px),
+        linear-gradient(90deg, var(--br-grid) 2px, transparent 2px);
+    background-size: 120px 120px;
+    z-index: 1;
+    pointer-events: none;
+}
+
+.br-lts-header-content {
+    position: relative;
+    z-index: 10;
+    max-width: 1200px;
+    display: flex;
+    flex-direction: column;
+}
+
+.br-lts-header-title {
+    color: var(--br-blue);
+    font-family: var(--font-pixel);
+    font-size: 8rem;
+    display: inline-block;
+    background: white;
+    padding: 10px;
+    margin: 10px;
+    border: 2px solid var(--br-blue);
+    box-shadow: 6px 6px 0 var(--br-blue);
+
+    transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
+    opacity: 0;
+    animation: slideDownFade 0.8s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
+}
+
+.br-lts-header-title:nth-of-type(2) {
+    font-size: 6rem;
+    line-height: 6rem;
+    animation-delay: 0.2s;
+}
+
+.br-lts-header-title:hover {
+    background-color: var(--br-blue);
+    color: #ffffff;
+    box-shadow: 8px 8px 0 var(--br-grid);
+    transform: translateY(-2px) translateX(-2px);
+}
+
+/**
+ * <main> wrapper.
+ */
+.br-lts-main {
+    max-width: 1200px;
+    margin: 40px auto;
+    padding: 0 20px;
+}
+
+/**
+ * Custom dotted separator using the BR-LTS theme.
+ */
+.br-lts-separator {
+    width: 100%;
+    max-width: 900px;
+    height: 10px;
+    border-bottom: 2px dotted var(--br-blue);
+    margin: 10px 0;
+}
+
+/**
+ * Intersection subtitle <div> with grid background
+ */
+.br-lts-section-header {
+    position: relative;
+    width: 40%;
+    height: calc(var(--br-grid-size) * 3);
+    background-color: #fff;
+    display: flex;
+    align-items: center;
+    padding-left: var(--br-grid-size);
+    margin: var(--br-grid-size) 0;
+    border: 2px solid var(--br-grid);
+
+    text-decoration: none;
+    cursor: pointer;
+    scroll-margin-top: 20px; /* Offset for jump to anchor */
+}
+
+.br-lts-section-header:hover {
+    border: 2px solid var(--br-blue);
+    box-shadow: 6px 6px 0 var(--br-blue);
+    transition: border-color 0.3s ease, box-shadow 0.3s ease;
+}
+
+.br-lts-section-header .br-lts-bg-grid {
+    position: absolute;
+    top: 0;
+    left: 0;
+    width: 100%;
+    height: 100%;
+    background-image:
+        linear-gradient(var(--br-grid) 2px, transparent 2px),
+        linear-gradient(90deg, var(--br-grid) 2px, transparent 2px);
+    background-size: var(--br-grid-size) var(--br-grid-size);
+    background-position: -1px -1px;
+    z-index: 1;
+    pointer-events: none;
+}
+
+.br-lts-section-header .br-lts-title-box {
+    position: relative;
+    z-index: 10;
+    background-color: #fff;
+    border: 2px solid var(--br-blue);
+    color: var(--br-blue);
+    font-family: var(--font-pixel);
+    font-weight: 400;
+    font-style: normal;
+    font-size: 24px;
+    line-height: 1;
+    padding: 10px 15px;
+}
+
+.br-lts-section-header .br-lts-decoration-dot {
+    position: absolute;
+    z-index: 10;
+    width: 10px;
+    height: 10px;
+    background-color: var(--br-yellow);
+    border-radius: 50%;
+    bottom: 0;
+    left: 0;
+    transform: translate(-50%, 50%);
+}
+
+/**
+ * Numbered titled list.
+ * The number is spanning on the left.
+ * The content is on this right.
+ */
+.br-lts-item-row {
+    display: flex;
+    gap: 25px;
+    max-width: 900px;
+    position: relative;
+}
+
+.br-lts-item-number {
+    font-family: var(--font-pixel);
+    color: var(--br-yellow);
+    font-size: 160px;
+    line-height: 0.8;
+    flex-shrink: 0;
+    user-select: none;
+    margin-top: 20px;
+    text-align: center;
+    width: 60px;
+}
+
+.br-lts-item-content {
+    display: flex;
+    flex-direction: column;
+    gap: 15px;
+    padding-top: 5px;
+}
+
+.br-lts-item-title {
+    font-family: var(--font-serif);
+    font-style: italic;
+    font-weight: 300;
+    font-size: 42px;
+    line-height: 1.1;
+    color: var(--br-blue);
+    letter-spacing: 1px;
+}
+
+.br-lts-item-text {
+    font-family: var(--font-mono);
+    font-size: 16px;
+    line-height: 1.4;
+    color: #333;
+    max-width: 750px;
+}
+
+/**
+ * 'timeline' grid to represent how tasks are expanding across time.
+ */
+.br-lts-chart {
+    display: grid;
+    grid-template-columns: 120px repeat(12, 1fr);
+    gap: 0;
+    width: 100%;
+    max-width: 1000px;
+    background-color: #fff;
+    border: 2px solid var(--br-blue);
+    box-shadow: 6px 6px 0 var(--br-blue);
+    position: relative;
+    overflow-x: auto;
+}
+
+.br-lts-chart::before {
+    content: "";
+    position: absolute;
+    top: 45px;
+    left: 120px;
+    right: 0;
+    bottom: 0;
+    background-size: calc(100% / 12) 100%;
+    z-index: 0;
+    pointer-events: none;
+}
+
+.br-lts-chart-head {
+    grid-column: 1 / -1;
+    display: grid;
+    grid-template-columns: 120px repeat(12, 1fr);
+    border-bottom: 2px solid var(--br-blue);
+    background-color: color-mix(in srgb, var(--br-blue) 6%, white);
+    font-weight: bold;
+    position: relative;
+    z-index: 2;
+}
+
+.br-lts-chart-head-label {
+    text-align: center;
+    padding: 10px;
+    border-left: 2px solid var(--br-grid);
+    font-family: var(--font-pixel);
+    font-size: 20px;
+    color: var(--br-blue);
+}
+
+.br-lts-span-year { grid-column: span 4; }
+.br-lts-span-day { grid-column: span 2; }
+.br-lts-head-spacer { grid-column: span 1; border-right: 2px solid var(--br-blue); }
+
+.br-lts-chart-row {
+    grid-column: 1 / -1;
+    display: grid;
+    grid-template-columns: 120px repeat(12, 1fr);
+    align-items: center;
+    height: 50px;
+    border-bottom: 1px dashed #ddd;
+    position: relative;
+    z-index: 1;
+    transition: background-color 0.2s ease;
+}
+
+.br-lts-chart-row:last-child { border-bottom: none; }
+
+.br-lts-chart-row--tall {
+    height: 100px;
+}
+
+.br-lts-chart-row--faded {
+    color: #999;
+    font-style: italic;
+}
+
+.br-lts-chart-row:hover {
+    background-color: color-mix(in srgb, var(--br-blue) 8%, transparent);
+    z-index: 2;
+}
+
+.br-lts-chart-label {
+    padding: 0 15px;
+    font-weight: bold;
+    color: #555;
+    border-right: 2px solid var(--br-blue);
+    height: 100%;
+    display: flex;
+    align-items: center;
+    background-color: #fff;
+    font-size: 14px;
+    transition: color 0.2s ease, background-color 0.2s ease;
+}
+
+.br-lts-chart-row:hover .br-lts-chart-label {
+    background-color: transparent;
+    color: var(--br-blue);
+}
+
+.br-lts-bar {
+    height: 24px;
+    border-radius: 4px;
+    display: flex;
+    align-items: center;
+    padding-left: 10px;
+    font-size: 12px;
+    color: white;
+    font-weight: bold;
+    box-shadow: 2px 2px 0 rgba(0,0,0,0.1);
+    white-space: nowrap;
+    overflow: hidden;
+    position: relative;
+    background-color: var(--br-blue);
+    grid-column-end: span 1;
+    cursor: default;
+
+    transform-origin: left center;
+    animation: growBar 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards;
+    opacity: 0;
+
+    transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275),
+                box-shadow 0.2s ease,
+                filter 0.2s ease;
+}
+
+.br-lts-chart-row:nth-child(2) .br-lts-bar { animation-delay: 100ms; }
+.br-lts-chart-row:nth-child(3) .br-lts-bar { animation-delay: 200ms; }
+.br-lts-chart-row:nth-child(4) .br-lts-bar { animation-delay: 300ms; }
+.br-lts-chart-row:nth-child(5) .br-lts-bar { animation-delay: 400ms; }
+.br-lts-chart-row:nth-child(6) .br-lts-bar { animation-delay: 500ms; }
+.br-lts-chart-row:nth-child(7) .br-lts-bar { animation-delay: 600ms; }
+.br-lts-chart-row:nth-child(8) .br-lts-bar { animation-delay: 700ms; }
+.br-lts-chart-row:nth-child(9) .br-lts-bar { animation-delay: 800ms; }
+.br-lts-chart-row:nth-child(10) .br-lts-bar { animation-delay: 900ms; }
+.br-lts-chart-row:nth-child(11) .br-lts-bar { animation-delay: 1000ms; }
+
+.br-lts-bar:hover {
+    transform: scale(1.05) translateY(-2px);
+    box-shadow: 4px 6px 12px rgba(0,0,0,0.2);
+    z-index: 10;
+    filter: brightness(1.1);
+}
+
+.br-lts-bar--long {
+    background-color: var(--br-yellow);
+    color: color-mix(in srgb, var(--br-yellow), black 45%);
+    grid-column-end: span 12;
+    border: 2px solid color-mix(in srgb, var(--br-yellow), white 20%);
+}
+
+.br-lts-bar--span-2 { grid-column-end: span 2; }
+.br-lts-bar--span-6 { grid-column-end: span 6; }
+
+.br-lts-col-start-2 { grid-column-start: 2; }
+.br-lts-col-start-3 { grid-column-start: 3; }
+.br-lts-col-start-4 { grid-column-start: 4; }
+.br-lts-col-start-5 { grid-column-start: 5; }
+.br-lts-col-start-6 { grid-column-start: 6; }
+.br-lts-col-start-7 { grid-column-start: 7; }
+.br-lts-col-start-8 { grid-column-start: 8; }
+.br-lts-col-start-9 { grid-column-start: 9; }
+.br-lts-col-start-10 { grid-column-start: 10; }
diff --git a/docs/website/fonts/compagnon-light.woff b/docs/website/fonts/compagnon-light.woff
new file mode 100644
index 0000000000000000000000000000000000000000..b0c6e8764972bd2145f0f7b93a889bfd42b57df8
GIT binary patch
literal 44788
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
CvR_O9

literal 0
HcmV?d00001

diff --git a/docs/website/fonts/terminal-grotesque.woff b/docs/website/fonts/terminal-grotesque.woff
new file mode 100644
index 0000000000000000000000000000000000000000..d721311c12df9ecf2af56942bc062e128d9d1e22
GIT binary patch
literal 35360
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
F0RUN|IVu1E

literal 0
HcmV?d00001

diff --git a/docs/website/header.html b/docs/website/header.html
index 548ed7ad53..8d610bb442 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -41,6 +41,8 @@
 					<span class="glyphicon glyphicon-question-sign"></span> Support</a></li>
 				<li><a href="/contribute.html">
 					<span class="glyphicon glyphicon-share"></span> Contribute</a></li>
+				<li><a href="/lts.html">
+					<span class="glyphicon glyphicon-send"></span> LTS</a></li>
 				<li><a href="/sponsors.html">
 					<span class="glyphicon glyphicon-usd"></span> Sponsors</a></li>
 				<li><a href="/association.html">
diff --git a/docs/website/lts.html b/docs/website/lts.html
new file mode 100644
index 0000000000..750ee30793
--- /dev/null
+++ b/docs/website/lts.html
@@ -0,0 +1,354 @@
+<!--#include file="header.html" -->
+
+<link href="css/lts.css" rel="stylesheet">
+
+<header class="br-lts-header">
+    <div class="br-lts-header-bg"></div>
+
+    <div class="br-lts-header-content">
+        <div class="br-lts-header-title">
+            Buildroot LTS
+        </div>
+        <div class="br-lts-header-title">
+            3-year long-term support with security fixes
+        </div>
+    </div>
+</header>
+
+<main class="br-lts-main">
+    <a href="#objectives" id="objectives" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">LTS Objectives</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">1</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                3-year LTS support
+            </h2>
+            <p class="br-lts-item-text">
+            Starting with version <code>2025.02</code> the LTS support has been extended to
+            <strong>3 years</strong>, replacing the previous 1-year cycle.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">2</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Vulnerability tracking & reporting
+            </h2>
+            <p class="br-lts-item-text">
+            Tracking of the vulnerabilities affecting Buildroot
+            is available at
+            <a href="https://security.buildroot.org/2025.02.x/vulnerability">security.buildroot.org</a>.
+            <br/>
+            LTS stewards ensure this data remains up-to-date by actively
+            maintaining Buildroot packages metadata.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">3</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Sponsored LTS stewards
+            </h2>
+            <p class="br-lts-item-text">
+            To ensure a consistent release cadence and maintainance
+            workflow, paid LTS stewards are assigned to the weekly LTS
+            maintainance tasks.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">4</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Dedicated backports
+            </h2>
+            <p class="br-lts-item-text">
+            Vulnerability fixes applied to the <code>master</code> branch will be
+            prioritized for backporting to the LTS & stable branches.
+            </p>
+        </div>
+    </div>
+
+
+    <a href="#releases" id="releases" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">Releases</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+
+    <p>
+    The Buildroot LTS sponsorship initiative has evolved from a more
+    comprehensive understanding of the needs of our user base.
+    <br/>
+    To address these requirements the release model evolves into the following.
+    <br/>
+    The LTS releases are now extended for a 3-year period. An LTS release
+    is started every 2 years.
+    In between, stable releases are made every 3 months.
+    </p>
+
+    <br/>
+
+    <div class="br-lts-chart">
+        <div class="br-lts-chart-head">
+            <div class="br-lts-head-spacer"></div>
+            <div class="br-lts-chart-head-label br-lts-span-year">2025</div>
+            <div class="br-lts-chart-head-label br-lts-span-year">2026</div>
+            <div class="br-lts-chart-head-label br-lts-span-year">2027</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2025.02</div>
+            <div class="br-lts-bar br-lts-bar--long br-lts-col-start-2">3 Years Support (LTS)</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2025.05</div>
+            <div class="br-lts-bar br-lts-col-start-3">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2025.08</div>
+            <div class="br-lts-bar br-lts-col-start-4">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2025.11</div>
+            <div class="br-lts-bar br-lts-col-start-5">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2026.02</div>
+            <div class="br-lts-bar br-lts-col-start-6">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2026.05</div>
+            <div class="br-lts-bar br-lts-col-start-7">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2026.08</div>
+            <div class="br-lts-bar br-lts-col-start-8">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2026.11</div>
+            <div class="br-lts-bar br-lts-col-start-9">3 mo</div>
+        </div>
+
+        <div class="br-lts-chart-row">
+            <div class="br-lts-chart-label">2027.02</div>
+            <div class="br-lts-bar br-lts-bar--long br-lts-col-start-10">3 Years Support (LTS)</div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--faded">
+            <div class="br-lts-chart-label">...</div>
+        </div>
+    </div>
+
+    <br/>
+    <br/>
+
+    <p>
+    More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
+    </p>
+
+    <a href="#organization" id="organization" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">How we work</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+
+    <p>
+    Each week the LTS stewards defines the set of commits to
+    analyze based on the previous week commits to the master branch. The
+    commits are then annotated to define a list of candidates for the LTS
+    branches.
+    <br><br>
+    On Thursday the candidates are cherry-picked to a staging branch to be
+    reviewed by the other maintainers. On Thursday evening the branch is
+    synced with upstream and contributors are notified. Feedback from
+    users, sponsors and autobuilders are then collected and vulnerability
+    analyses updated.
+    </p>
+    <br/>
+
+    <div class="br-lts-chart">
+        <div class="br-lts-chart-head">
+            <div class="br-lts-head-spacer"></div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Monday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Tuesday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Wednesday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Thursday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">Friday</div>
+            <div class="br-lts-chart-head-label br-lts-span-day">...</div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Freeze weekly commit set from master</div>
+            <div class="br-lts-bar br-lts-col-start-2"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Apply branch specific patches</div>
+            <div class="br-lts-bar br-lts-col-start-2"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Analysis & commit annotation</div>
+            <div class="br-lts-bar br-lts-bar--span-6 br-lts-col-start-2"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Cherry picking to staging branch</div>
+            <div class="br-lts-bar br-lts-bar--span-2 br-lts-col-start-7"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Sync with upstream branch</div>
+            <div class="br-lts-bar br-lts-col-start-9"></div>
+        </div>
+
+        <div class="br-lts-chart-row br-lts-chart-row--tall">
+            <div class="br-lts-chart-label">Update vulns</div>
+            <div class="br-lts-bar br-lts-col-start-10"></div>
+        </div>
+    </div>
+
+    <a href="#benefits" id="benefits" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">Sponsorship benefits</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">1</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Long-term sustainability
+            </h2>
+            <p class="br-lts-item-text">
+                Sponsors ensure the long-term sustainability of the Buildroot
+                LTS effort with dedicated stewards assigned to tasks such as
+                backporting, security monitoring and LTS releases.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">2</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Recognition of your sponsorship
+            </h2>
+            <p class="br-lts-item-text">
+                Sponsors can be publicly acknowledged on the Buildroot website.
+                Sponsors may provide a logo linking to a webpage of their
+                choice.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">3</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Direct interaction with LTS stewards
+            </h2>
+            <p class="br-lts-item-text">
+                Sponsors may submit queries and requests regarding
+                Buildroot LTS and security updates.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">4</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Assignment of priorities for package tracking
+            </h2>
+            <p class="br-lts-item-text">
+                Buildroot integrates more than 2000 open source packages,
+                many of which do not offer long-term stable releases or
+                security updates.
+                <br/>
+                <br/>
+                Sponsors may submit a priority list indicating: <br/>
+                - Packages of interest<br/>
+                - Architectures of interest<br/>
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">5</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Testing of your packages
+            </h2>
+            <p class="br-lts-item-text">
+                To make sure the packages of interest to the sponsors don't
+                include regressions between releases.
+                Sponsors may submit a list of packages to be tested
+                before an LTS & stable release.
+            </p>
+        </div>
+    </div>
+
+    <div class="br-lts-separator"></div>
+
+    <div class="br-lts-item-row">
+        <div class="br-lts-item-number">6</div>
+        <div class="br-lts-item-content">
+            <h2 class="br-lts-item-title">
+                Personalized security reports
+            </h2>
+            <p class="br-lts-item-text">
+                Sponsors receive personalized security reports for their
+                Buildroot packages in the form of
+                <a href="https://security.buildroot.org/">security.buildroot.org</a>
+                with comparison with the upstream branches.
+            </p>
+        </div>
+    </div>
+
+    <a href="#sponsor" id="sponsor" class="br-lts-section-header">
+        <div class="br-lts-bg-grid"></div>
+        <div class="br-lts-title-box">Sponsor now !</div>
+        <div class="br-lts-decoration-dot"></div>
+    </a>
+    <p>
+    Interested ? Contact us at
+    <a href="mailto:buildroot-lts@buildroot.org">buildroot-lts@buildroot.org</a>
+    to learn more about the different sponsorship tiers and get all the
+    details about the sponsorship.
+    </p>
+</main>
+
+<!--#include file="footer.html" -->
diff --git a/docs/website/news.html b/docs/website/news.html
index 71272ab7b7..38599d66ef 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -1181,7 +1181,7 @@
 	  and join this initiative that's shaping the future of Buildroot.</p>
 	<p>
 	<p>Find more information on the
-	  <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsoring
+	  <a href="/lts.html">Buildroot LTS Sponsoring
 	  page</a>.</p>
       </div>
     </div>
diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index ba11b4b081..eef82d2cfa 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -9,7 +9,7 @@
     <div class="panel-body">
       <p>The maintenance of the Long Term Support branch of Buildroot is
          possible thanks to the sponsors of the
-         <a href="https://mind.be/buildroot-lts">Buildroot LTS Sponsorship
+         <a href="lts.html">Buildroot LTS Sponsorship
          Program</a>.</p>
     </div>
     <div class="panel-body">
diff --git a/docs/website/support.html b/docs/website/support.html
index 81f7e863e0..f4eaa8fdbd 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -94,29 +94,6 @@
     </div>
   </div>
 
-  <div class="panel panel-primary">
-    <div class="panel-heading">Buildroot LTS</div>
-    <div class="panel-body">
-      <p>Buildroot's Long Term Support (LTS) branch is maintained thanks to the
-	<a href="https://mind.be/buildroot-lts">LTS Sponsoring program</a>. Its
-	goal is	to provide three or more years of stable support for your
-	Buildroot deployments. The success of this venture depends on the
-	generosity of sponsors like you, willing to make a change and ensuring
-	the longevity of Buildroot's reliability.</p>
-      <p>Prior to this initiative, LTS maintenance was handled by volunteers.
-        As a result, it was limited to just one year. In addition, it diverted
-        maintainer time away from mainline development, slowing  down the overall
-        progress of the project.</p>
-      <p>Thanks to LTS sponsoring, the entire community gets access to a better
-        and longer maintained LTS branch. The sponsors get access to some
-        additional perks, such as selecting which packages to focus on, reports
-        with information that is relevant for you, and direct contact with the
-        LTS maintainers.</p>
-      <p style="text-align: center;"><a href="https://mind.be/buildroot-lts">Ready
-        to sponsor?</a></p>
-    </div>
-  </div>
-
   <div class="panel panel-primary">
     <div class="panel-heading">Commercial support</div>
     <div class="panel-body">
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
