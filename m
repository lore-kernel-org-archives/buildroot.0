Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F46E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 14:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E85C683CA0;
	Sat, 11 Jan 2025 14:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTXnkQyt2tg1; Sat, 11 Jan 2025 14:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08AA483CA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08AA483CA4;
	Sat, 11 Jan 2025 14:01:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB4E942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A5D941322
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wer-OOyiY14u for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 14:01:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2640E41321
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2640E41321
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2640E41321
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:01:18 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-844e12f702dso93265639f.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736604077; x=1737208877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mDg+J0aco/IfH2BpWjflXX5H4INU9Z4hnpaV8XYZfMA=;
 b=H+zg4gtd/q7+fX/G3yuabcu7yFrqONc1kBagAI0FymC5XphCeyUunNOU80chu/8fNH
 o3LXE4Ob68h0DEwCffFhn2DISDvD8N4YRctlL8cRDseR0NIxTYQPfNr0F1tQgv0YSAyQ
 cfE44H1Tx8RbEmiUh+Tb9vyWVhmA39+AK6xk6utdkB9GPNdgygHTGlfY1S1V4Q7ljED/
 /psSgfjiX2HabUaPIkHn2eW3W5ZSjry+1RtXMu/GfFR2wNm/fV+z5SouaHst5PmRJqLc
 b7CMPih/DPUnDwP+OewLPyCpvDdjfvXLUQAQxgg3y4Bc8wezsYykiP8Vwo/DrzoAcbx1
 9Exw==
X-Gm-Message-State: AOJu0YwoX0VI6UWHSF4tX6Y095rX2xz1IYGl09bbDwXTGQZibmFMvB9Q
 lQzZDdKPj1OQ4cUkSjzpjN39s+WD8lwRblx+h8o7KxiIXOInBc7kE4CmzsnCGSo=
X-Gm-Gg: ASbGncvcSceFjjnVxPLQ78fVjJGQs0EAejlcHcwSrRDNlZEcLD8uGAw/sGwZ6xhlbWo
 61mOB44ieFVAkdC+ylt8PzSPHdUYcomFPHBA2T5H3rJxaPzlAhKlYKaVQvKudOUxAjvHBiVfHV6
 LlSOgN8xd8BaBvjJF3u3+teDSgbWjYJR+/Ov3PjuBFnABbDmbickKMZljuvq9y1wzEoGPfeJNoA
 m0BRY1+WEWhUv/hzqcuHfe0I2WAMet5ZXAgzPrNbPnOMVpnMI05sY2r+QOdGldaFbpp6Sa48K1S
 Jr4IMyw3AP6KwcrpU1ea0+xUYpp7qGQ=
X-Google-Smtp-Source: AGHT+IHUcZ3o5FiUxpkxDzv6iQAUTKW7PeCcguzkwbo9/7sufPDRQ4NR+vyxK6Xi+QIFd6KuExvwyg==
X-Received: by 2002:a05:6e02:1353:b0:3ce:647f:82b2 with SMTP id
 e9e14a558f8ab-3ce647f8622mr12593095ab.16.1736604076930; 
 Sat, 11 Jan 2025 06:01:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b62921esm1511526173.69.2025.01.11.06.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 06:01:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 07:01:14 -0700
Message-Id: <20250111140114.2509238-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736604077; x=1737208877; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mDg+J0aco/IfH2BpWjflXX5H4INU9Z4hnpaV8XYZfMA=;
 b=iECh1FIdcXA/vvT7FfBqiZS+VdBj0Il++IS5D9j7cNvfAnXLb0aTDRyEjIKl0DMHBR
 p3RNdpNT9oyVaM8Xik5CqnKi3AE/HCz1YcgDezGzV5Kai2bWCQE4WRpTPvH5yuHi5v0n
 0Xw5c6tV6LwbYn1r+DIAciwY2QEfkAjgo08D2vKmEqdN4uv4WOM2TTNuaVB5bpBy+OwD
 32DS5fO6hFngliVclEsTb5LJcib8llwAAFX2aEw8OI88V2iHJYfP0N+SXYzFgLf+OdKL
 9I4Qt9+E/Jsnmm8zEODmTVO/BPXKKFx+eggkWnVY1zwFlKn0JEO4dHaIMPi3PPCzPaiR
 UVlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iECh1FId
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.8.1
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 218b789295..1b295127f6 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  1595a7bdc135888ed0f2c595819f010738196392e3d42569af4bdfe718654899  python-maturin-1.7.4-cargo2.tar.gz
+sha256  da4ab5a84c35d0ab00c0fb63975f25c497d6570dcdeaae0ec0f7d9f70f1d5382  python-maturin-1.8.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 2e59538212..b9816e2119 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.7.4
+PYTHON_MATURIN_VERSION = 1.8.1
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/51/28/31a650d9209d873b6aec759c944bd284155154d7a01f7f541786d7c435ca
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/9a/08/ccb0f917722a35ab0d758be9bb5edaf645c3a3d6170061f10d396ecd273f
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
