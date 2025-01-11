Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B330FE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EE9C8101B;
	Sat, 11 Jan 2025 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWkplu22ZPs2; Sat, 11 Jan 2025 19:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94868810A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94868810A0;
	Sat, 11 Jan 2025 19:36:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F6B4942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4339606ED
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHSmc9cVEzqx for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 19:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2BF46067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2BF46067E
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2BF46067E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 19:36:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-84f1ea04c64so195391239f.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736624179; x=1737228979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TXJU1UBkU/w5uOkbyI7YMNTw3TC8fjYHlHoTkDUBLas=;
 b=F74s0e8V90f2+5eshffqYW+xy2sG/v4DGf9MXBaP7sGT2gk5NctcUriNofdGaaRrT4
 W91wu+KQXMzr91huRkj0xCElVhDGPp1Rrih1YqI1DeoVUaz1VdiCFfhuk/2O4mmi6O9t
 Zw1jVCtTLwWjUmX+hreZ/yFMrSkTReSLTOkt7369IQYQhRnglsHQW0RuljB4emGlOiCg
 tAUW8aQHtoKGuSy6rQD5aTIwe0ke0anV6bdoP0MBq9RpJJ3OhjS+hNktcTrwbSLFMHPy
 bRlilmnBn563ZDw4IkQZSBAFHpo8cGh5RlzSV5ca9GOAYQq3fmB5Z0CVF5dnPpmIHM2M
 uNvw==
X-Gm-Message-State: AOJu0Yyr34bQEQdORjlKS6nQBKSb0X8MfElhK24tfqS/lut0J8fRrl0v
 m86Gisw2+l7Wbtk2MnGy4t2Dq5LBSMpV8J80m6p+mU34Z3Mv2UnqijbnnzLM+W0=
X-Gm-Gg: ASbGncsWzSLw1K6Mm6wk+lZW/CXpkp44iG33cqUOjSlmzGo0XynGf5M6BGA4Wvf1OOz
 prQU+fpvjHLXNvTtu69J5GiKph4DX/kAwu+Rquk4k8oKA74cfWKo9uw1RJGasb5AQnN4cXABTFF
 GPIb45UJZbME6gk++2/iSAGkRs7rZTw7q79r3Lf/DIfIqVloPHp4/5mWAT27GmDHCFWJuFFpRyo
 9Q6DL5GPZkpFlZTZ6OIPYImE+qvimt0KjCHKSyBLY3T/5crWSipXZvcd+1Jde/wIoYyVAt1bp3f
 78jqap9jNcENNWVJAOuMGtR2h2TwII0=
X-Google-Smtp-Source: AGHT+IHa493480nwMDcOrRR/wdlZbjXXcRA39bdamm9pHs292BrID+nTnslDBDVI3CRCUUeWH8rNUQ==
X-Received: by 2002:a05:6e02:1d06:b0:3ce:647f:82c3 with SMTP id
 e9e14a558f8ab-3ce647f8730mr24222175ab.7.1736624178643; 
 Sat, 11 Jan 2025 11:36:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b613044sm1697801173.50.2025.01.11.11.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 11:36:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 12:36:16 -0700
Message-Id: <20250111193616.2972188-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736624179; x=1737228979; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TXJU1UBkU/w5uOkbyI7YMNTw3TC8fjYHlHoTkDUBLas=;
 b=kAgkVZNj+BTbgEGGxVl2ypHJm8oxszzZP59s2YOoaDmfdugvkvKcOvRM6DwlyuaKH1
 4SLQwrntRAbrkw02ze5xhVuFLhsDZNmP0v6yQEroPFc51oR+U6yTEzNYj101Wy8olaZt
 NuhwsWfLG6GTYJfes1tsBWakr58Cnpzwo1+7MihHHxRuYHZcg9a++61aIRCciS3rY6AX
 OEDCUng1t3yUtf1Wo2/OCvrRluOblNdArhS6sgd74LBGeXt+2hxfWbjompODPyoR35KE
 LsmebBsfjIsnZVisQGjbpOaFuSZxmYNvJT9aog0ZPpGQZjR9yyiYUDEiEeZ9ZUSBvsBT
 Q9uQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kAgkVZNj
Subject: [Buildroot] [PATCH 1/1] package/python-zope-interface: bump to
 version 7.2
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
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index a580b5dff7..08965901c9 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  38f56d8efc8eda2cc40c206d7fd2a016  zope.interface-7.1.1.tar.gz
-sha256  4284d664ef0ff7b709836d4de7b13d80873dc5faeffc073abdb280058bfac5e3  zope.interface-7.1.1.tar.gz
+md5  583dac724d227b3ee2d4d4a940425961  zope.interface-7.2.tar.gz
+sha256  8b49f1a3d1ee4cdaf5b32d2e738362c7f5e40ac8b46dd7d1a65e82a4872728fe  zope.interface-7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index b2e3b8a561..36ab9a9e64 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 7.1.1
+PYTHON_ZOPE_INTERFACE_VERSION = 7.2
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/3c/f5/1079cab32302359cc09bd1dca9656e680601e0e8af9397322ab0fe85f368
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/30/93/9210e7606be57a2dfc6277ac97dcc864fd8d39f142ca194fdc186d596fda
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
