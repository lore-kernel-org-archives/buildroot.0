Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A15C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 04:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24AF440581;
	Fri, 19 Jul 2024 04:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUJvqdxp32km; Fri, 19 Jul 2024 04:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D852E405F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D852E405F9;
	Fri, 19 Jul 2024 04:26:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5DEA1BF841
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D391881E4B
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-STaQ4g06JT for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 04:26:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA02981316
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA02981316
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA02981316
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 04:26:35 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-397a363cb13so2239715ab.2
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721363194; x=1721967994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m/1jaGdI7smULy7Ei92geOa81Xi96EB7LTCtQx7m9sk=;
 b=eopALtY58RZ9N143NAITNjF40t785cFRouYoEB9+LIfK1PS54csLv2uttPaWGd6dUp
 q0CuvYj7o2fuv3QbhDPJiHoK8CEY1xGkwZvzteKdHuG6sRWy5AJj0saxJ3oa1qAiIygp
 9j7wdPl0zI271dg52ncNnjYSDcKJealixfQBlLZL6HuSIL1U/Ri/jET5RCB44KCkizx4
 XGQnBYG3kpElcO1LFRZynKo3Ukf32E7Deqifnv2qlJ1cgkkeLGfuAIGsEs1/btmrnYbh
 lKIQLsVk6xC8oZtUOiLtzWAqL1yXEsqEG0iN9czcKPm9K6o6uvIu0i64SNyv2cVz9ihC
 dEUg==
X-Gm-Message-State: AOJu0YydAMZjzpvzvfbhz75knHLgkhaTYh6br0dMRzlv1sgVEttPIjfY
 axn8Dq8S1fgK7iSkl5WDmP98rzNuIiRZZ/goxwS7y77HH9qVhx3Bf5S/fg==
X-Google-Smtp-Source: AGHT+IHJ5nDVA1daYrnzq75KHPp0Cjd6r7YLypCN7URH2dRVudGjKnJLa/d3e4R/zX1bgGqNjXo81A==
X-Received: by 2002:a05:6e02:1aa9:b0:383:5ada:7a65 with SMTP id
 e9e14a558f8ab-39557423c68mr80409365ab.26.1721363194195; 
 Thu, 18 Jul 2024 21:26:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f5d22d99sm1918465ab.44.2024.07.18.21.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 21:26:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:26:32 -0600
Message-Id: <20240719042632.3227242-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721363194; x=1721967994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m/1jaGdI7smULy7Ei92geOa81Xi96EB7LTCtQx7m9sk=;
 b=Ekghv2W4jjv6IRypV9qmPgNq1/PEV3uKXoMtOdGy7kgAlIPI9mFe/XQpkn7LWiKpsW
 Z6L3nSr7whToe3Aq6OkgQR1jNViRvi38sIfQpDFbp8KyDqdpP7qY3K/M08Jvu4ekD0tU
 kpnP5O2s4iWwxiOvUJ9GvWNpwLiZzhNPc99uX7+HO9M+7QpVuluS7g7jE5tJEi3yf8LP
 IeLADUHpa/xhO2lIa9b8WNxPtucwCJxhmKxC1c++ruiiRrZZTDVuQOIpWFOcahL1K2En
 mSSLjXW2PBIMpz8DqbEblzPiW1nqodkZgH9isnn90qtJ9trZk8CYxcMLLNrmWDEKhnml
 bDlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ekghv2W4
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 2.8.2
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
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index caac7f8957..6127dcaf37 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  38edaad5e8687f1b238577ee05a4c968  pydantic-2.8.0.tar.gz
-sha256  d970ffb9d030b710795878940bd0489842c638e7252fc4a19c3ae2f7da4d6141  pydantic-2.8.0.tar.gz
+md5  940d760de174d3567d4f5be28fd215f5  pydantic-2.8.2.tar.gz
+sha256  6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a  pydantic-2.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 4c2becc9c9..c549970db9 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.8.0
+PYTHON_PYDANTIC_VERSION = 2.8.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8b/7b/23dc30fba5793d7be3307f33bebb36e08f78f8af9c03fce608833f01bebd
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8c/99/d0a5dca411e0a017762258013ba9905cd6e7baa9a3fd1fe8b6529472902e
 PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
