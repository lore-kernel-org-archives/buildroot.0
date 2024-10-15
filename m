Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F72D1D893
	for <buildroot@archiver.kernel.org>; Tue, 15 Oct 2024 17:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4527F6081A;
	Tue, 15 Oct 2024 17:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CNwWry-FWdd; Tue, 15 Oct 2024 17:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41D8060888
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D8060888;
	Tue, 15 Oct 2024 17:54:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABBB61BF35B
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 17:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A9CC80E2F
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 17:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrxOW0zYy2FX for <buildroot@lists.busybox.net>;
 Tue, 15 Oct 2024 17:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2B0E80E2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2B0E80E2A
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2B0E80E2A
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 17:54:32 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a3a03399fbso32017255ab.0
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 10:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729014871; x=1729619671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+q4JMUSUk3SQGgJC2qZ9ORnpF1a/tkXWZRl2yXivF/4=;
 b=H0ZogzezCj2hXnk4AnFB28eVKHbnCjqQvEtm9i2f/+QUeaX6Wn10P3qZiC4sNPk/Yj
 z9j6aivRJRMS3ARMbvVhXk8Ugeo3nZFNzvYIDNEoki9I7/nHPc6/d8Rf5K3H6UkHrilZ
 3lxrpvtthUIA+4tONFvogrikKKzIKFIMYTsNjb7+JTM/BxYBtURVgfpY7P/LIIC/SZ1k
 8xJC5Xy9jAKgMNpmQDPg+qp/F/FXnYA3et5iBU/VoVJ8lYQ8JBT0cigGHcPR+oRkV5zR
 E/e1UJr2FPwuXJyFfD1jIByQEgyXLnPQLsL7em20dhaw2I4DN/DKNV5KwFhCcvnlK7zi
 X3FQ==
X-Gm-Message-State: AOJu0YziNru2iNKGIjgGPE6CgLs4Hnxm4eO1az53z5myfTsrS4ozPhPh
 8BHYQD8H/OpYJpmu0cpiwzlIy8aMjo/gaQFJngqXY0n95LHmJHBK0p5XxQ==
X-Google-Smtp-Source: AGHT+IHnoR0ul7tjwgROw1OEIjts7RIXRQ9wa6Ze++uJO8Qo6kymNZRk+p0bliCy5d3C2T81yyWBwQ==
X-Received: by 2002:a05:6e02:2185:b0:3a0:bd91:3842 with SMTP id
 e9e14a558f8ab-3a3bce0b188mr116587305ab.24.1729014871260; 
 Tue, 15 Oct 2024 10:54:31 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a3d70aeca2sm4204695ab.26.2024.10.15.10.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 10:54:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Oct 2024 11:54:28 -0600
Message-Id: <20241015175428.3438643-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729014871; x=1729619671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+q4JMUSUk3SQGgJC2qZ9ORnpF1a/tkXWZRl2yXivF/4=;
 b=Mg3sLMAbBtH8xGVx46tsYn4hMf5DSoCxki4Sr359pHRe4cVaUUm/QXqd+Lw6yyLaGf
 nTVBXmpVPf/JQ0H7fSuNSJc++0NKlYLnPi2bcDDEZEhScm4SIBqXq0Eu0HNPR7RT40MJ
 rBYv4/VBb+q+3WSwNiAzQc0BtetAzruxnTHsVri5fwhhvLz4dBUCpTeBuE2FhqdPHyZP
 tIZOAYwcm1Lu7vI5t/Y1iEgj87D2h12NyrC/iQhPXTxW+Gy9AKCzbWuQ1kyL7wjvZvk0
 bISXvuGqYMi06xDH7b04e80DIldxVgwWAQRX/TdvKSQJWTpyzg4gSbzopWonMAMGilar
 WcGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Mg3sLMAb
Subject: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to version
 0.32.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index be6e2e325c..42f29766db 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  a5b7951b8d9e335fbee8002e9081c108  uvicorn-0.31.0.tar.gz
-sha256  13bc21373d103859f68fe739608e2eb054a816dea79189bc3ca08ea89a275906  uvicorn-0.31.0.tar.gz
+md5  ec8e5bbfecd14029c81730c0a42ed731  uvicorn-0.32.0.tar.gz
+sha256  f78b36b143c16f54ccdb8190d0a26b5f1901fe5a3c777e1ab29f26391af8551e  uvicorn-0.32.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 3917e3a4e7..a80927643b 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.31.0
+PYTHON_UVICORN_VERSION = 0.32.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/0a/96/ee52d900f8e41cc35eaebfda76f3619c2e45b741f3ee957d6fe32be1b2aa
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/e0/fc/1d785078eefd6945f3e5bab5c076e4230698046231eb0f3747bc5c8fa992
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
