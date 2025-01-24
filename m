Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3F7C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 18:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B99E58124B;
	Fri, 24 Jan 2025 18:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SjHG7eKexkm; Fri, 24 Jan 2025 18:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D0781272
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D0781272;
	Fri, 24 Jan 2025 18:32:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2B4D94A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B332340787
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:32:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxbTQUJXLO-R for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 18:32:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 881C04029C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 881C04029C
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 881C04029C
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:32:45 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3ce87d31480so7317185ab.2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 10:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737743564; x=1738348364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E8uMWh7RWupEa1x5ku3OCmHgdWD/15IRjmmsMzESYSw=;
 b=P945tTYt/CBv3zGi721zqY9m92Mj2qoMZwqF5kBt/BpU5JkFle7dsIE6luJ6DjMwRq
 IqGnap0lhO6exfEEGI44OONCjAfHUDb8ObCksdQoEnXDuDCmvVhRoNQQBeEc5+9hoyal
 Jzf65bB4I1S8Zq5q1ByU5FolahxHL7qge2Q9K0dEXoSuJDx3R2Nub4QO7kkPCsyiqZwK
 raGLMVSXkXGbe7isilUxvjDOSzdCyvWniyqTi8Rtycc9vfA1zyH5xkXEwF8jtXRygYpM
 C4erarGQkvAptnBzO1pKPEqjWnIoFlb2aqknQrMoX3Jtw1Trp6dxD2tPLZIiotAc0PhP
 LohA==
X-Gm-Message-State: AOJu0YzdM8InjRaG3peZTGV3u+ir26wHvwgx1ZejxphvSILJkGKw39Fd
 nr3EsA3rXkXPTFR2MhR95sDkSWHhmMkSrhS9+bOp+hyytzzf7esWQGt61ezo
X-Gm-Gg: ASbGncvdmq4zOT1jOfGUZT7A8vW8z6Ng6cIuJFep23Oh15VuwT4PzlSG6z1C5I9oogi
 DpOLkcxrck0lTdD+/uI/dwo8I7mVEjYiA5Nj2YyJfPwM+o9ty6MKpwzwuBNq7sEQCb/WQTa5adi
 5IPz6KUPoYglFMt/sMVAQ9dZACQqlbNlOl93MUjNGHK02WfT1auIz/RZL4pH/jnyPbB2fADpnrH
 q6ugG7I+/CkjQ77RffqcBc0eKh55Cz+z9GTdH74UICHlfZpkx+ZXUGso4BXZTnFJTwmqN63oXOt
 Er7Dj9oERMePGxG1GvgAN7vASetzHMGamzOqR8iOBqnG7g/QpYTma6k=
X-Google-Smtp-Source: AGHT+IF1Nd4ANU+eSSJkmskP2X3i30phzyp2SEC8cPinXSC0cJd/S/Ic0lgrB4u2lW/i9bEdUYtT6g==
X-Received: by 2002:a05:6e02:138c:b0:3cf:cd3c:bdfd with SMTP id
 e9e14a558f8ab-3cfcd3cbeabmr23606815ab.12.1737743562660; 
 Fri, 24 Jan 2025 10:32:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc740f78csm8135355ab.4.2025.01.24.10.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 10:32:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 11:32:40 -0700
Message-Id: <20250124183240.3786530-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737743564; x=1738348364; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E8uMWh7RWupEa1x5ku3OCmHgdWD/15IRjmmsMzESYSw=;
 b=Gw7hjVKVCKN3xTkfx+D+c7DpyOGDJKTjLJm2iDJfUMne1b8J1uqHwNFQlfsza8heZK
 mQbg8xpw+sQA550UfFblbW/qtYW0uRCtp5Ymy+EyK5OEDLx/G3Px/kEz0XR3yDc6wtfF
 baY1ozbtRCm8+aEjQEKHVeSfmaZnIyxhZiaUZ3fiX3qY9NPZtwDvXauyU17GPfTkVA3D
 d5+YREVVFqrFRU7qBgBLGfiSLRgH4p0XtzCqi0aTpdx8qQ8HvPqqpvv8FYnkM+/lyAif
 TMG/fgtsWtqlO5+bY/wyr1F6KJe2Eqiky+X9KRqgbFCM9aVdXh3kKCjO6BoWEZEST0fG
 u1yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gw7hjVKV
Subject: [Buildroot] [PATCH 1/1] package/python-cachetools: bump to version
 5.5.1
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
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index fb16cb492b..aee9548b9e 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  d589387a314eed031e97348a73b8cf91  cachetools-5.5.0.tar.gz
-sha256  2cc24fb4cbe39633fb7badd9db9ca6295d766d9c2995f245725a46715d050f2a  cachetools-5.5.0.tar.gz
+md5  a9855be6d00255c175529d91f1c4003f  cachetools-5.5.1.tar.gz
+sha256  70f238fbba50383ef62e55c6aff6d9673175fe59f7c6782c7a0b9e38f4a9df95  cachetools-5.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2f4d2ff05f05c5da3879f40292b7600332d775dc7ed320d43dd42f3cd7d92c9b  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 38a2313d59..e1b27cf362 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 5.5.0
+PYTHON_CACHETOOLS_VERSION = 5.5.1
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/c3/38/a0f315319737ecf45b4319a8cd1f3a908e29d9277b46942263292115eee7
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/d9/74/57df1ab0ce6bc5f6fa868e08de20df8ac58f9c44330c7671ad922d2bbeae
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
