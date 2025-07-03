Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E602AC83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A303883A45;
	Thu,  3 Jul 2025 20:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdK_kPwf14_N; Thu,  3 Jul 2025 20:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C861F83B08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C861F83B08;
	Thu,  3 Jul 2025 20:09:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7464B0A
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C92354013F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geRLI5VUfMzC for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA1C240050
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA1C240050
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA1C240050
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:09:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so135760f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 13:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751573360; x=1752178160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DtXDUXHJtkUw8SVmWBuuAItF19I2DpNAGafVwq00R/s=;
 b=OpM/dIWDOfV0O3pdcxZolS/9U7gMcmXJd8bV/DwtKXo1APRot8RIAhGj40wTXRr+T2
 sfVRYXbQyFEr5EM2+1kmvDgUnGNMoGt9inaH8jwZiyvUmpC3gnhoJvEWlAU9Ny5QJWLL
 x99gIb5S5pU7CaVxyUkioCqQer+MMoN+RiJkEvj0cLbzhoLlKQriKpqVs4VneYEHYrNb
 b0dhlHaOrn6Sn9wuxq55yVrH1inwTQ/tPYW5Coba7rmBFqS+KzKAJMTHtWupmvz6XNeY
 jzYQ3RmbgIeJMk00K2XgKFg7ns3DLhVrWs219NajRYWJ7e7DevCNQE3RioQQzfWmntvL
 VAxg==
X-Gm-Message-State: AOJu0YyZzzAGffOLPPqSPU9ttWy1x1jHeCAejF9KYtLNSy7KIL81GCW/
 7/mJo4vOpqgVG5ivbgQOKeC3u+c2MAupqIvH6q91o+HUzdsAQuQCTWQZWQUbF5LMLTSPcywBv1G
 B03o4
X-Gm-Gg: ASbGncsYn/fHUPzsXV2fUNRoqAMgFJHTzwkXNj9qfBZhRJlMYgUFG19d79gE2AwtyFG
 1g5cto7sqUDVzmstQmPoZwZpzpQyBfegp6KlMfEzboQ9u9nXAF32+un3uusbbzHXGKAhmeZqeaF
 0bK2++12mDlOFjJGbNTTR/wID+fJDDIsp2Tf2sMK6lo/F+ELCma3MJgMzHs0j9dLXwGyVytr/Ye
 gUNZ3P44Cu0V6dFLHayKaUOFHiIvilNeaPb4QpvMzGb52UORfS9xHInrOw4+pUFTO9ki8rSZe4z
 /4ACfg9k4gf2iFErGC8j661mVV8F7xwLyY8VmC8NV7PknB6cMVGZsfdjE0O7+Ox6ZM+FjgHTKh0
 xftOa/0yUFXCST8ijxlVa
X-Google-Smtp-Source: AGHT+IF3wFaQCiXxV1I44dVwjUp9H1xpCBaWvTjenKfr6ue8bGjeXfFiavmziam5ILqYCmSblDjvXg==
X-Received: by 2002:a05:6000:43c9:b0:3a5:2599:4178 with SMTP id
 ffacd0b85a97d-3b32bbd689cmr2626087f8f.19.1751573360520; 
 Thu, 03 Jul 2025 13:09:20 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a2e8sm576841f8f.75.2025.07.03.13.09.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 13:09:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  3 Jul 2025 22:09:17 +0200
Message-ID: <20250703200917.4054251-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751573360; x=1752178160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=DtXDUXHJtkUw8SVmWBuuAItF19I2DpNAGafVwq00R/s=;
 b=aBRdRB/KUD5+RB3d3YtQwUVZn3k/KwW30z73jQX2wzlGeXLxJGo7ycbw7c7RscdO2b
 5R0SUcMhaZQWeknz3X0V71VD7f5u2QkgfK55U1uS2UXgqRhQRthl223KzwZbazeP/t16
 RbghfGUqMAQ7LRCEpU8h7OjuEZYDR1O7sKH9ldIIIz5UP3550P4JT9RNbVCI3a0iA+h1
 dcoOdUt5+u4BDHfR+sHznUTVrJTmnqHYXdH5XzN9bx3dXty+w9R96Qi2YM2mKpwgPnrI
 +zqPrzRJCLUC52kJNdM4q4GgrSS1C395OP7it7GAjqaB2G/eHrvyYe/+jPJ90dzM+H1d
 g3ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aBRdRB/K
Subject: [Buildroot] [PATCH] package/python-future: add CPE identifier
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

The cpe:2.3:a:pythoncharmers:python-future:*:*:*:*:*:*:*:* is
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/6E3F033B-5565-461B-8450-D23E68419313

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
See for instance https://nvd.nist.gov/vuln/detail/cve-2022-40899
---
 package/python-future/python-future.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-future/python-future.mk b/package/python-future/python-future.mk
index 698863a13d..6276440c40 100644
--- a/package/python-future/python-future.mk
+++ b/package/python-future/python-future.mk
@@ -10,5 +10,6 @@ PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/a7/b2/4140c69c6a664
 PYTHON_FUTURE_SETUP_TYPE = setuptools
 PYTHON_FUTURE_LICENSE = MIT
 PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt
+PYTHON_FUTURE_CPE_ID_VENDOR = pythoncharmers
 
 $(eval $(python-package))
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
