Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4EDC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A08E60B77;
	Fri, 24 Jan 2025 20:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4fBQed7e3wQ; Fri, 24 Jan 2025 20:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A4060B5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A4060B5F;
	Fri, 24 Jan 2025 20:11:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59FEA944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B8E48225F
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uejg9c9FLSNv for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:11:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A2A482251
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A2A482251
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A2A482251
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:11:26 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-844e394395aso71820539f.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737749485; x=1738354285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LVF/h9ArLKZG9oXuioqIIIyR0MI6ncVm6RBHa0BiqJw=;
 b=B3iZf+FQTlvv22H+QC/avPBUlyUwmiYh6X5VXlLDChATU/WSxZOnx1hU6tarMMsOut
 Kk2isR6/f/pSSXsgH3ugKiWYptKKkAzCfKIXVxmhpYEW6IhHBVgLwRq9s9+/gFe9lbTa
 vEL+U7lMl8mv74Qo8+gvrModY5IqmMTf1nIS1lnTrmSqtR/xRX4s8TFRiSYTd36HTvOS
 Cn1HQRbxRNC4Wfn81fy4WcLvlbQLgGGHfpQIrRRknDnQ/lGvn4QTO7qfzqQstm9KFhxr
 VD128R9aARk9xYDqBtbK/hqt2Q6I6AXgC75I1NbkV70yvPak5yKnbJhgZfrZvGlPo1EV
 SE9w==
X-Gm-Message-State: AOJu0YxmcRCmB6UZDsJdf5S9g2CBal0AFo8edWG3EYxC1MVAdwG0c9ns
 IVKez4JDWON/uY7aPFxpDmVbMfprZPcVH1of6faZEeTgieb58+lWx+1wHrUy
X-Gm-Gg: ASbGnctVGvMMRUDH3qiC+ZYEjzpu1P5SlVKc6Ridlm+vLMNtDRZyh9IlYvVKJbPSUeZ
 X7wPbhTb5B5afpd2H7XoFVlbnBQCy80eq3zJwEAxSkiQechj6J45MscEyj1nsq9YUkaKA+CHVXL
 pvcMswL5JkL2OOC7r6Zx0HOAcRUUpI43SA5lRlGSMLmO2X/eneEDo+wmlrQjGPph8Vi5ZS+IZKK
 SDGa+NY6b5ebkdEvuPmnpCy3NeowZQsddJLNQnOJyNQ7te8WekTCoXBMT5tz0q//zeRwzKYf/LV
 neUUs6qoy1cn8avZt4kzHC9lTPPfhh29Eq5tXP+lzhDOE2E86cQL9jA=
X-Google-Smtp-Source: AGHT+IFpbAOu0Pw8DyScT10bZsRhxllXcqyTx+Xd/Ab029X52W6S1MVdklNrmvbISw54k8ItA/dlNw==
X-Received: by 2002:a05:6602:3e94:b0:843:e667:f196 with SMTP id
 ca18e2360f4ac-851b61ee917mr3189252439f.4.1737749483757; 
 Fri, 24 Jan 2025 12:11:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521de0b300sm87843339f.13.2025.01.24.12.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:11:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:11:20 -0700
Message-Id: <20250124201120.3844267-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737749485; x=1738354285; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LVF/h9ArLKZG9oXuioqIIIyR0MI6ncVm6RBHa0BiqJw=;
 b=Y4rrHO/fNqK8BrKVJg6STehsnu2a2yyUCSE3IGfk+0AwjrHGEo/UiHxaFaziHSul8S
 24KUgOYJ9rDawpsm5yUMNbZli4JnfApyL4nyIAtXBa7Fn05Sol8GZi1Hpb/BCBMIAXdg
 9JsvWRYXeufpeM7fE7rtbBFRZZrioX1ldZsuAFHDl3hsrz0p4pu2414QgQ8q9wcDaQS9
 /MmGzztEsQEvab18sDKRDjLcQlxUpPttvXO7MzOzfOh3qqGCTpVicQTL4hqF+QDYhA+L
 TcXs3KNupnxLBqElb+aNFoz9IxoDsvQPgBBtzvPnDWkY0DEk0wDyqSFfSx+k96/mwI9I
 B+dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y4rrHO/f
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 2.10.6
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
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 2c814b2f40..72470e1f19 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  be725b089172d10a9c95605fed30cdb1  pydantic-2.10.5.tar.gz
-sha256  278b38dbbaec562011d659ee05f63346951b3a248a6f3642e1bc68894ea2b4ff  pydantic-2.10.5.tar.gz
+md5  46b0048f4ad780b0e8a15f602b56c5a1  pydantic-2.10.6.tar.gz
+sha256  ca5daa827cce33de7a42be142548b0096bf05a7e7b365aebfa5f8eeec7128236  pydantic-2.10.6.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 8b9da3d45c..b5808e0201 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.10.5
+PYTHON_PYDANTIC_VERSION = 2.10.6
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/6a/c7/ca334c2ef6f2e046b1144fe4bb2a5da8a4c574e7f2ebf7e16b34a6a2fa92
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b7/ae/d5220c5c52b158b1de7ca89fc5edb72f304a70a4c540c84c8844bf4008de
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
