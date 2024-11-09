Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700AFD5E377
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 16:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2B4C41999;
	Sat,  9 Nov 2024 16:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wZVuCN9b-4S; Sat,  9 Nov 2024 16:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EA79412F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA79412F8;
	Sat,  9 Nov 2024 16:58:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B82ADD92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99A0384156
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyCruRlHyuDR for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 16:58:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB7008417D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB7008417D
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB7008417D
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:58:54 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83aff992087so107349939f.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 08:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731171533; x=1731776333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dfpPw12fPWMIc/7J1Ga8Dme3pXSI43G4wcGpqTjvPQ=;
 b=bsUDpTDT0vkBHLZdf08IjQbDsUAHlj+t6Q0n14dhGLya/nosA/d59IiEvJixzDVliO
 6rGm4WikPkiFBvmWl0aBH/L8Hiox6o/rKjCA2thqqFwc8zhsf/RzOx29YpzasAgt5v7Z
 If83iSQVF4s4RFaWE2AgDZeM4nrdyxJK+WrQ3f9857JDShj3X5bfILhqgn8qpXvOHBf4
 f1WHJT5cmPFTtRUn0JgnaaLCr31WnAUO2sD6HIG68WvZVrSf7O+ILAMkaksPLWrX37CN
 11mZTnAOJfK8I74spW3gKgZ4svHmltxRxJwImc1v0xOpaAb88feNkw4kBWsna0oJBwdF
 VncQ==
X-Gm-Message-State: AOJu0YxgEPTlpfyQ+ZeyBtpFpFDA5AG8wVGcQqKeHIsfzMhSH9xmkhEF
 DRkMoAp+CMjsQ/lkv4yHipTSlUPjEPi41H/+Fv5Oxz+uRG2g1P3AqntrPAA8
X-Google-Smtp-Source: AGHT+IH2GXurPuGAxZssdXUiPQf1J+wIWiqGpWQtYOylTUPrLPKCa4OZWzV7QXmyOiXGQhsz320pHQ==
X-Received: by 2002:a05:6602:15c2:b0:83a:bd82:78e with SMTP id
 ca18e2360f4ac-83e03362bffmr819917039f.13.1731171533552; 
 Sat, 09 Nov 2024 08:58:53 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83e132237e7sm37286839f.7.2024.11.09.08.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 08:58:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 09:58:51 -0700
Message-Id: <20241109165851.563761-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731171533; x=1731776333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5dfpPw12fPWMIc/7J1Ga8Dme3pXSI43G4wcGpqTjvPQ=;
 b=dccyoex7tvL1MDRe6Io18Py9GDy8gHqNq19VP8MeEcEmm0OHiq0g5hcNFHo1Sb/RHI
 HEZGDr2BPl8FoaNZiAy4nf0TrJgJSJDb1ZOCZTGc/7knd45TvYjavVfMyNfvMJor/2zF
 qI3DZUG0pjUdoiw5c/Qc3xOIs/w4ZD+yQegi2dlHtVhA2q2N8clMDpWli3hnxrNrS8Yz
 uVTN4JxKFsP6X/QZ6MBbsQ1ZOWovnNuyCLWTTjW5C6PoZjd8hUvXHx8kxWtmQKdJiB3F
 YyY+Mo5Q2VpniKdAGIHnAFI6G1oYQ3y452eRiTPMfE4in0NvI5WkJQk8cV7DMkTaJQtg
 oFhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dccyoex7
Subject: [Buildroot] [PATCH 1/1] package/python-blinker: bump to version
 1.9.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-blinker/python-blinker.hash | 4 ++--
 package/python-blinker/python-blinker.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-blinker/python-blinker.hash b/package/python-blinker/python-blinker.hash
index d9f1052254..7039c1a3bc 100644
--- a/package/python-blinker/python-blinker.hash
+++ b/package/python-blinker/python-blinker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/blinker/json
-md5  ce2f9fb3bc0c0000db11f012f5f5afda  blinker-1.8.2.tar.gz
-sha256  8f77b09d3bf7c795e969e9486f39c2c5e9c39d4ee07424be2bc594ece9642d83  blinker-1.8.2.tar.gz
+md5  1ffce54aca3d568ab18ee921d479274f  blinker-1.9.0.tar.gz
+sha256  b4ce2265a7abece45e7cc896e98dbebe6cead56bcf805a3d23136d145f5445bf  blinker-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.txt
diff --git a/package/python-blinker/python-blinker.mk b/package/python-blinker/python-blinker.mk
index 7ce06c2177..a5949e117b 100644
--- a/package/python-blinker/python-blinker.mk
+++ b/package/python-blinker/python-blinker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLINKER_VERSION = 1.8.2
+PYTHON_BLINKER_VERSION = 1.9.0
 PYTHON_BLINKER_SOURCE = blinker-$(PYTHON_BLINKER_VERSION).tar.gz
-PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/1e/57/a6a1721eff09598fb01f3c7cda070c1b6a0f12d63c83236edf79a440abcc
+PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/21/28/9b3f50ce0e048515135495f198351908d99540d69bfdc8c1d15b73dc55ce
 PYTHON_BLINKER_SETUP_TYPE = flit
 PYTHON_BLINKER_LICENSE = MIT
 PYTHON_BLINKER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
