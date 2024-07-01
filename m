Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41A8C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE28660AB4;
	Mon,  1 Jul 2024 18:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1yHjKxtcZBR; Mon,  1 Jul 2024 18:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D66E5607EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D66E5607EE;
	Mon,  1 Jul 2024 18:01:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 134EA1BF3A1
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 013988145B
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wP4FUZgwOYQm for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3AF581459
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3AF581459
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3AF581459
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:01:56 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7f620f349f9so138309339f.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719856916; x=1720461716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YM1bGyCWyslCDviGNLxCLBCON5ibTuLjTdrD3f+W+1U=;
 b=egMbt3aqBNrcLAdMpOM9JfToQqzAIPbb0+EWeE86ggBz8gessGrZ+N0m8OMIiVdYL7
 g9Bo9fhUk04F9bzUgPp1pazQCvPWjG2CmzJ9tacZFybUQNQIYI3hZjXmhbJeqFc2pFQE
 hEUDejvUuiRAt/MEjAggs/qi0b3dP3ch02fh6Go5KmNonJmtYavd2kad3XT39gqi89A/
 u8lYQrzfCpgx6NI0ESw3dV2Er8Sqxt8lZ42A3BODFhuIeTO5+/q8yxiP8Nv4GlU8gd6R
 xAk0v4N1/tNu9V8Of4zLokR+bKZbyQi40kUKNc1V5C2eFkQd4PA5lUIg+WBzF8wn9V5i
 kwPQ==
X-Gm-Message-State: AOJu0YyOSe6WPxkZx55bwMNsJgczm7O8AjWp3hUzE4YZflwxvicjiPUC
 rCQT/aCo+8rBeJCA2rBaoXQP7WIZ3USEWPcNMHi4kRavE9BI+g9sPqOb/w==
X-Google-Smtp-Source: AGHT+IEEB4xCJM6wDTMfLzCc5cnNYAcA31gRXHOUSDPj4uolWJWOUk1wl74JItItm0Y2SwSd2pO3Ig==
X-Received: by 2002:a05:6602:1306:b0:7f3:ad73:a83 with SMTP id
 ca18e2360f4ac-7f62ed68697mr658496439f.0.1719856915475; 
 Mon, 01 Jul 2024 11:01:55 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73dd4b82sm2352882173.42.2024.07.01.11.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:01:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:01:46 -0600
Message-Id: <20240701180146.1732897-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719856916; x=1720461716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YM1bGyCWyslCDviGNLxCLBCON5ibTuLjTdrD3f+W+1U=;
 b=a4oStC1clIP5OyvAz1Y0awbDHCFrtMXMBZWgqRFTS/Eo1opbIhs6/7twDPq4ZOL1VW
 jyWlNUryZvSvdKiC74VhfzQ1APCPA+mWnspKfzputyYdL4IpwlTiN+LACYmCSwzVmhp/
 mHKJHTMtyh+au00YMMh8t2B/Ny0gSD63IivSwHF5gau93Bk0dC+znLthK3O5N5QjV9Fp
 xuRO9SuhLIr7l1qT51mo4l/UQ5UlfHKFur0IBKhDNwzTytaL85MAP2gFgNXoFjSLPOUs
 eQ+soynD11gQdaOEXXBm4+IbbV1/H3/Ds7Yd5ZI2pL5v7KC4q9QlOoCsLDH9sHT2z7bO
 zUgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a4oStC1c
Subject: [Buildroot] [PATCH 1/1] package/python-httpx: bump to version 0.27.0
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
 package/python-httpx/python-httpx.hash | 4 ++--
 package/python-httpx/python-httpx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpx/python-httpx.hash b/package/python-httpx/python-httpx.hash
index 26e39fcc6d..381439f464 100644
--- a/package/python-httpx/python-httpx.hash
+++ b/package/python-httpx/python-httpx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpx/json
-md5  3785c8a8930a7c7280206f79c170658f  httpx-0.26.0.tar.gz
-sha256  451b55c30d5185ea6b23c2c793abf9bb237d2a7dfb901ced6ff69ad37ec1dfaf  httpx-0.26.0.tar.gz
+md5  d6035d561136590900678ec6c78698cb  httpx-0.27.0.tar.gz
+sha256  a0cb88a46f32dc874e04ee956e4c2764aba2aa228f650b06788ba6bda2962ab5  httpx-0.27.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec59d544f12b5f539a3a716fd321ac58ccd8030b465221f2c880200cdf28d8d  LICENSE.md
diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
index cbc9c9298b..edba2dbb04 100644
--- a/package/python-httpx/python-httpx.mk
+++ b/package/python-httpx/python-httpx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPX_VERSION = 0.26.0
+PYTHON_HTTPX_VERSION = 0.27.0
 PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
-PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/bd/26/2dc654950920f499bd062a211071925533f821ccdca04fa0c2fd914d5d06
+PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/5c/2d/3da5bdf4408b8b2800061c339f240c1802f2e82d55e50bd39c5a881f47f0
 PYTHON_HTTPX_SETUP_TYPE = pep517
 PYTHON_HTTPX_LICENSE = BSD-3-Clause
 PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
