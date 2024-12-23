Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EADE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 14:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFFC48188A;
	Mon, 23 Dec 2024 14:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36fyhOnsazLy; Mon, 23 Dec 2024 14:11:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB71181819
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB71181819;
	Mon, 23 Dec 2024 14:11:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21223757
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F8BB6072C
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsrsJb5pivlV for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 14:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D2F56072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D2F56072E
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D2F56072E
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:11:52 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-844e9b7e50dso390357839f.3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 06:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734963111; x=1735567911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xaXP8UBwM0effb5CeXWJDxDDje2C6kvcLFoKQb/gCHQ=;
 b=AFH4rguhOYVc92x4mQi5VGYxYZORf+YyAr+iYBcyA9k7Cl2jypCxB3SWCk1blhDYxF
 h5JaicPcu8LNEh3Oh0m+s8N4EUO905qwZDFXcrAclNPronmmmkSSXpbUKpGQKaqLHcUw
 Ysd8861oWOl+0ibKZYRMl2WGQTlGzzOUBktaHmeR4qIEUfuGzFiEQeRuOpolZ//rSSjQ
 vd3CvGsXGuCWDMJxRuADphdlPVgmbOhlOB44n4MmOT+epUwgbqKG2RyZuL+nIILfPlUg
 6U635iYf9Pnbsg/A//g8fBZXhKET5ISYZdqM/i6iwTty6oCNy+oSSwTdOfUfyK1BjJLv
 YvKA==
X-Gm-Message-State: AOJu0YxNfX+1VIh5z5Nm9urNQVJgr6ZjgP1OKUYoFnT/ceUeNsoLf+kq
 oji7vQJTA2ZPCRucSX8bTjvcl5n5W/WSOQqGHwb6VgYEr4d+oApr98aMs/0h0yE=
X-Gm-Gg: ASbGncu2qIFEG1LQSobKxLJLn5yfBBAQfqZNxZDDVafHZN/UqrHQxzx8WnW+AdToxUl
 /i4+NBJHaNjw/jIdmItMi2W3cVhhGkGkFpu08zkz/yFSuFFxc8x5+VeZcS2LMPJTrrn4KmQwwTx
 N+ToLQ3wSxcqGmLUuRN5M3itEKKSg/cJ9s5BdqqbpDBvzuQnVSQutK+zliXpy26Z3zPcFYW/nCc
 SoE83UY0/TveS27dMidApY6qup5/vwiCququESIgOypMjQJk/KdKXA0h09WMjGiMQJTIvZGnRd8
 Zp9zApKiUYFBsuF1j93GDRIV9Elw+56mrA==
X-Google-Smtp-Source: AGHT+IEJLPhrFLHzTf7Rw2pTAENoaiVYNp271Zue27LvTfgkRpglYLAx9G2t722IWWz0R2ZeeTglUQ==
X-Received: by 2002:a05:6602:3887:b0:849:d268:d75 with SMTP id
 ca18e2360f4ac-849d2681115mr168506339f.9.1734963111143; 
 Mon, 23 Dec 2024 06:11:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf5073dsm2267092173.29.2024.12.23.06.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 06:11:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 07:11:46 -0700
Message-Id: <20241223141146.1708338-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734963111; x=1735567911; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xaXP8UBwM0effb5CeXWJDxDDje2C6kvcLFoKQb/gCHQ=;
 b=OaiCOH9sDbiZ/WSpdBtBlw3MsXdkJNvL3EYdRc4KWD5weQ303SsMag92ryipdzDN4a
 lYU8B3keL2rkPrqWyVc2uvd7J/l1U5w6wY37NN+UAvvPKJJChxakhMEa9nd38Em0GOP6
 jhdVkT5fwr9PQ4NCsF/CvgCyVByWJy/464KVCRIAZfO7esY7gKYfoFJyAx3H7DqLPSW+
 8NJQ2WL2t2ya4mD+FHakRSd99OzgxnZ7g9XStAQoElwPvAJCzO4LiGD/qGbZarmEmVzb
 EGucj89DmpoA8ry5PtNBOMVIipT29pGqd7xpMJXxCfJr2t58w/rOOvLA2kbcAgkKJpv1
 ZX5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OaiCOH9s
Subject: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.12
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
 package/python-aiocoap/python-aiocoap.hash | 4 ++--
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index 33895b2387..30e68a7582 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  09a0cce4b192d861d2becf216f0769fc  aiocoap-0.4.11.tar.gz
-sha256  2603b8ec61caedf008b4a153a94f337262bf89f26d1c030f12c492d085e875f7  aiocoap-0.4.11.tar.gz
+md5  a79e7c7586cbb9056743683eb9bbaef9  aiocoap-0.4.12.tar.gz
+sha256  808e87068aa57dbf31486cfdfa9098b0a6f5ca444c6b8966f3e50a403628981e  aiocoap-0.4.12.tar.gz
 # Locally computed sha256 checksums
 sha256  c59b1339031e4495b336555be42b8b488eacfb037a23fadf2d5e2c8abd0e6366  doc/LICENSE.rst
 sha256  51d56d9e6f9755df590a329e73ca58663605a182a8e80f0166fff65203a1185a  LICENSES/BSD-3-Clause.txt
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index a69722232c..357ac1da08 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.11
+PYTHON_AIOCOAP_VERSION = 0.4.12
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/50/b3/2ea6d3a294ec094da3175aceaa2ad1c2644eab162b48676267e992d4c651
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/a2/16/a9167225339089b2c295cc37aa5a01f758d164c5cda591cc9d2976719196
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
 PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
