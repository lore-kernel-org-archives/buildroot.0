Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D295CAC5AF
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 00:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9470614C7;
	Wed, 18 Sep 2024 00:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70EWTlu2xnaK; Wed, 18 Sep 2024 00:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B3836079F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B3836079F;
	Wed, 18 Sep 2024 00:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9562B1BF969
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EF4641B8B
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 00:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A92qx-mXniWW for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 00:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3770541308
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3770541308
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3770541308
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 00:29:58 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a09cdeab8eso10932975ab.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726619397; x=1727224197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=glHBCAsd5vX7o729O6NtJPr3PSZERfHENnbCTQ3usbU=;
 b=DJszHk9oNN/eFXvg9JJoHD1jMJfwKARoM4Ccd3EIT/+6jgyu9Yi3CFzXKz7A/E8l+O
 UzHmRvS16Bt1Cha25e5u+FnK+dKwJdffwaOzgpNa28/gL+Tg880zlir/wGLR2LaAO4QK
 FT26kBDyGp3wL13CZxORR6BrBZZAZAae4vtBsNGKT4FP3qmKU/l+gTEdRTGdbS4YWPsE
 lvo5hqQtKfsSUsQlUSd2NYxCcUDNYBufFW2ioAmTRRDYMXH/zGe3azX2xDrXsOQOu/gu
 gM5CKg6hsTLtgAoMaYf2+mSwkjY1GH5DNhLlEo43yOalg9m11DmiFaByIeHUWv/HQXe6
 gbnQ==
X-Gm-Message-State: AOJu0YzJb5LxwHOaeqFb9G7+gqScwh2om//MqOFYzsRLdd3JyTyEYRG5
 Dr4wykQ6X39y2sEliEEtA1+3EH0HumQ728kzAoxYF1Suzs+CURKiwVUHxZ0r
X-Google-Smtp-Source: AGHT+IGDN1gXpMPHyGhuQ0ac+w23GmbUY23jZqUOyEblUv+L19I4yJcZYnpjw9TvPuLZh1Rg1/A0Og==
X-Received: by 2002:a92:ca0c:0:b0:3a0:9c99:32d6 with SMTP id
 e9e14a558f8ab-3a09c99366fmr76927445ab.24.1726619396851; 
 Tue, 17 Sep 2024 17:29:56 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1c390sm24820855ab.49.2024.09.17.17.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 17:29:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 18:29:54 -0600
Message-Id: <20240918002954.416994-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726619397; x=1727224197; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=glHBCAsd5vX7o729O6NtJPr3PSZERfHENnbCTQ3usbU=;
 b=UVx4lgQWeW+PD07//dP7+ttHHF3Hx67BYV64CHG58IRNXpC7gBUPjW3iMhbSaVY4YB
 ZRgSF2tbrLrWDy8XbirEbZGt1B1akMyVoriiECIWoEp7zI1Z3Kzlc7n383rqxl1AAFog
 VAGvNk0xu86O0CuJHChDN/bg/Rctzoy3QFTCApG7htpSm7yEzkRmgxLbEl1vKgTzD2ql
 pGLm4YgCMUWAjjLh2n5fTjZCbUvhT2gYVVcSvgpDAyICParYsIUjE6Ls08Dnv7Vur/j5
 eIQFgdD4LijGow2ONJ8JCpwjp7tnEvRqWrq9y9YwOgfWbJLj2j8O5WEwfo7w+rzUFpA7
 5olA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UVx4lgQW
Subject: [Buildroot] [PATCH 1/1] package/python-pyspnego: bump to version
 0.11.1
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
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index dc808d4204..59e5463096 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  b633cab73a1481c5dbc2d6f6857569d0  pyspnego-0.10.2.tar.gz
-sha256  9a22c23aeae7b4424fdb2482450d3f8302ac012e2644e1cfe735cf468fcd12ed  pyspnego-0.10.2.tar.gz
+md5  f13229784747c05d880c25880872f856  pyspnego-0.11.1.tar.gz
+sha256  e92ed8b0a62765b9d6abbb86a48cf871228ddb97678598dc01c9c39a626823f6  pyspnego-0.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 740e6eec15..166e1ec85b 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.10.2
+PYTHON_PYSPNEGO_VERSION = 0.11.1
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/3a/c3/401a5ae889b51f80e91474b6acda7dae8d704c6fe8424fd40e0ff0702812
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/46/f5/1f938a781742d18475ac43a101ec8a9499e1655da0984e08b59e20012c04
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
