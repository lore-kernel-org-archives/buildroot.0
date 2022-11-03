Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7528AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00FEA60FF8;
	Thu,  3 Nov 2022 13:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00FEA60FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bH_KDt0h5RsX; Thu,  3 Nov 2022 13:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D6360FF6;
	Thu,  3 Nov 2022 13:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41D6360FF6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 910421BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7799660FF6
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7799660FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EURQNghGaNHe for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:28:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68BEF60FEF
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68BEF60FEF
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:28:33 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id o65so1291720iof.4
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jHX1JlFoWUtTNoyYXq6Ge6B9//2mD1P+LyKaGlU3tDI=;
 b=f6bOi20Q6gM5WvkyjSh30tLos6BpJKBZHs6/WRd9FdWpmNdIsnffs4sxLmFJVo97s4
 9DwsoI5gq6BNbk84KWPNhGCYoeo43bmnB/8rvC3ySUVC0NezKp3ZOLk0EQxf8IMJH3/L
 1MJL62Skn4OY0vdScHnHqYawt9MTwP5GUNxxTEYu8n51iSM6mJrsM1DYx0X+3kk+uWXw
 rIJbDDWK9pWdPYKB42DDOoeMlU24XnREGRdIGUdGLEdmg5essv6h8smBJ0MIygyDbva9
 l+0RXkuAo1n9kz3eVrIBHew92tTy1bmf6fQgTv+9XgB7RYHUhonnAVhLw79V+o9tULru
 cjtw==
X-Gm-Message-State: ACrzQf2TxY3G1Zj4XvGkFhrX3itdwY19FxYSi/+0eXVw68b10tgkB1hN
 hIx9Yrw+QTOWbcCs30BKlPCLZPLPkqjCoFwQ
X-Google-Smtp-Source: AMsMyM72uMPA3iqbAaC0avmEf8WnwMnG2J+hhwvpXDEBrFGoqzI+JeEs9tFkfBjtjzeKlK3aYd/WVQ==
X-Received: by 2002:a6b:f107:0:b0:6d3:a804:75bf with SMTP id
 e7-20020a6bf107000000b006d3a80475bfmr8290726iog.186.1667482112226; 
 Thu, 03 Nov 2022 06:28:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f23-20020a056602071700b006d48e577221sm350170iox.2.2022.11.03.06.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:28:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:28:29 -0600
Message-Id: <20221103132829.1589487-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jHX1JlFoWUtTNoyYXq6Ge6B9//2mD1P+LyKaGlU3tDI=;
 b=hwNgvSwiZlWDhLjdgsg/70V2QLEjIReIe5Fg9ZUvuY6cAITZPNjuGn27avKhpQJ41j
 pYeZ1GummTcfxfaWnmemwbI0il1F/OtejFBfLLuqrfUftC6ONXGRFbJtGjS58nnNRRMo
 UYfUwoLFkhWIVAfSh+y8ZYKhb7oEbbr3E+eDBBsQJIkuoFishitd1Mgxqi9G/Wv/oKan
 8yogBBLJg9C7d9rxrMSdaDKK041wmGEJ4lJNwXoUBM5D7qNyv7mRzVTMhHmYrfsVfbYe
 JA1gL9gibb03RA8fZC7+ewCvbkSAcxych0rbF18SuSSQi+wheTr7bc8W53me3D8RJWtz
 bkbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hwNgvSwi
Subject: [Buildroot] [PATCH 1/1] package/python-opcua-asyncio: bump to
 version 1.0.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 6 ++++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index d8aee272de..36b16a1596 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  e5fab37a92162351fe40cab43df09db8a2e9f8b8a2a8f13ed680aa6f6d687ec3  opcua-asyncio-0.8.4.tar.gz
+# md5, sha256 from https://pypi.org/pypi/asyncua/json
+md5  a52df0dc0586abd1592c97a0274d1c9d  asyncua-1.0.0.tar.gz
+sha256  25966e374b0c90da112a96e9dbc5cc36c123b2b60412eac6f26b04a4b0b4d91e  asyncua-1.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 50b581037b..54f8a1d0a0 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 0.8.4
-PYTHON_OPCUA_ASYNCIO_SOURCE = opcua-asyncio-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = $(call github,FreeOpcUa,opcua-asyncio,$(PYTHON_OPCUA_ASYNCIO_VERSION))
+PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.0
+PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_ASYNCUA_VERSION).tar.gz
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/e7/ea/6fe0799c740b0fc8ffda42fc97bf45204ffe06fe41d505c02654e0d4e379
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
