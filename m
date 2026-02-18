Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2144FE9A047
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 15:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB21F60754;
	Wed, 18 Feb 2026 15:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMOZoUHpnXHw; Wed, 18 Feb 2026 15:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD72F60851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771427174;
	bh=hY71/RuR9rGGpkaOID3p+u26JidP4OPmijDzocIuaNM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Cepi7b/dsJmqG9nA16gCYMDkFcRefIoSmCPDYmvEYy82ynhq0Y9zzPrzvTL8IfWYq
	 q0o60KgK9l/wTGRZcLhGS+ozICbBnJzmvjBtVWZo1f13D3Z22FF3Gmyy3pMyt2PFrJ
	 uHZnHYwlNpC3Zxk/PMNskJmo1fo+u+R9kCCFGloHOn12RqjmoclO+pA+7eav3xH3SP
	 9i268k/ciHYbkY//isVRQjIYFGe4cOtSCeq3sRiIWYWSxonJJDOG6TtUheWLT8QFm6
	 T33FMP4n8DRhZo1KBo9xxVRwVND6BrGeQ8zUXhs62QiPNIjGU4swFD6+fNbRgGbGQG
	 eHhpl2N/25HCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD72F60851;
	Wed, 18 Feb 2026 15:06:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C70101CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 15:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB9A140332
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 15:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbeQdnjVsGFh for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 15:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.50;
 helo=mout-b-105.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C86EA4021E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C86EA4021E
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C86EA4021E
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 15:06:12 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4fGKb404wCz9yGb;
 Wed, 18 Feb 2026 16:06:08 +0100 (CET)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 16:04:51 +0100
Message-ID: <20260218150453.3743924-2-manuel.diener@oss.othermo.de>
In-Reply-To: <20260218150453.3743924-1-manuel.diener@oss.othermo.de>
References: <20260218150453.3743924-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1771427168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmQzyMZXLxEVdnL7Z8/6/oLKBIhL6pN+f6i9bKIwtWM=;
 b=WaAWYZIv51PhYYoM1F276ce2sR+s/XqQbaqfYLXTBT/4AZqNypTHDTpspkw1O6cJAh21rN
 lIEwKt+0cWY20IyipdQialI0m8nHpjX1xLhyLRGO69KWsLFH+8AiYLuAFacWbv1hKnT7Sl
 2tVmjM7Jyv0nfYBO0PMN+dAmQNQj6aik0jkdNFX9JBZ+t6wdfcULxeDnbLltVmufbTMDjq
 WNgH+qTOeYXGLU7xuQtruoWjB6b+I8q83KpBHS1vbYm2TrFcPNVN5rRxWrUn8UnLeK1rng
 itEa8EeeuEvhIBXQBhjCRGvuO0YbYp6Z7ZYzlG90l2FHs+RmH2JY0FyrFwYdGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=WaAWYZIv
Subject: [Buildroot] [PATCH 2/2] package/python-fastapi: bump to version
 0.129.0
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes here: https://fastapi.tiangolo.com/release-notes//\#01290

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 4c87c1a909..9181706180 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  eb8cc0ba48ade2ac08bf55c880a69fdd  fastapi-0.128.0.tar.gz
-sha256  1cc179e1cef10a6be60ffe429f79b829dce99d8de32d7acb7e6c8dfdf7f2645a  fastapi-0.128.0.tar.gz
+md5  62d857497f46ee023ca1b7c5eb27f629  fastapi-0.129.0.tar.gz
+sha256  61315cebd2e65df5f97ec298c888f9de30430dd0612d59d6480beafbc10655af  fastapi-0.129.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 7f2ee7dd64..afb027f383 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.128.0
+PYTHON_FASTAPI_VERSION = 0.129.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/52/08/8c8508db6c7b9aae8f7175046af41baad690771c9bcde676419965e338c7
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/48/47/75f6bea02e797abff1bca968d5997793898032d9923c1935ae2efdece642
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
