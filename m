Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C41FD637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B9E6104E;
	Tue, 16 Dec 2025 19:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33va645cxVHG; Tue, 16 Dec 2025 19:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 152DA6106C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914338;
	bh=Gh1FBnu5fWJDqm34tlQZOkQZTY445Fnj4P9URs6P6/Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qqY5lzgAd56aR+dZ59T8YvrF/Jag41TyzgogkIT+GXovY4Z9QBqkUiVko/MOgVbQF
	 vMjLl1PWlzOTgyJVqS1WZmN6jnEft9kK5FprH0vez6k1eyKPar49F8hAIET6C8b9uu
	 qDBTDYkaku+PSqgiuZYBoyoJJl8hwdF7JoiwTD6EQI5065z9XRpXXJIsSoRdZcvLTt
	 fzTs97hg9AebAifSdenaVbElxpEyvdj6Bk8UCCT8O7F0l12wUYt+LCJVg7Lqdlno3P
	 6nhltCLqQ45Trtk+6OgnwlNJdtCS7Kx4Hzmnbj2xvLnjqm44f5PlmuEXpoWTQ/eMK3
	 ETZqsooLRJthg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 152DA6106C;
	Tue, 16 Dec 2025 19:45:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6E20364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDBA640103
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CMhbOCRIOMO for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B116740052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B116740052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B116740052
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DC17A4C45DE;
 Tue, 16 Dec 2025 20:41:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-2B3I;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:15 +0100
Message-ID: <20251216194119.3020421-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914092;
 bh=Rbea4nECmIe6sZvo0H+F0+/H+qh7oeyJrMh5WPNNRP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=agTehGEZDNjpo/rGHZ03+L2Ph+tdxmEmEV3CmSBR0ax0a0xLa/+b1rpHb0gIFmRC+
 6ppSCKDm6Mn5tb5m7IocRVz9z2yAyhzxHkb+IFdmLHag1SD0IDqJfpgMKunm2xkyG9
 +22Da3g55sjMJGOdowcfG41eElgHQvrU8iUdHLrHTMk++ATFjkldWek8+uvBhd+CX5
 AcX/AszTXcNvOGKfA7gypNNm1QB254pBGhD9Xrc2lymDoNZ+OH04PO0CLcGN5xU4n9
 QhmqLO0BSP1689O5FJNFjXXGWOqcL1HAUOyNxQLADPZOdlmn9CAOBFSRtOGkwuyJVf
 xmyFssxyQ+IFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=agTehGEZ
Subject: [Buildroot] [PATCH 22/26] package/python-wsproto: bump version to
 1.3.2
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/python-hyper/wsproto/blob/1.3.2/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-wsproto/python-wsproto.hash | 4 ++--
 package/python-wsproto/python-wsproto.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wsproto/python-wsproto.hash b/package/python-wsproto/python-wsproto.hash
index 4eb3195785..861749a3f2 100644
--- a/package/python-wsproto/python-wsproto.hash
+++ b/package/python-wsproto/python-wsproto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wsproto/json
-md5  f64973434117e23d2079460ed64b05c3  wsproto-1.2.0.tar.gz
-sha256  ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065  wsproto-1.2.0.tar.gz
+md5  b6374a15a82ca55b23cecc31a489deee  wsproto-1.3.2.tar.gz
+sha256  b86885dcf294e15204919950f666e06ffc6c7c114ca900b060d6e16293528294  wsproto-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c0329a8dbf3437b095f7f5cf4257d6bb855e07120cae8786586073ff7a699959  LICENSE
diff --git a/package/python-wsproto/python-wsproto.mk b/package/python-wsproto/python-wsproto.mk
index 629f4431b4..e16f72f6e0 100644
--- a/package/python-wsproto/python-wsproto.mk
+++ b/package/python-wsproto/python-wsproto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WSPROTO_VERSION = 1.2.0
+PYTHON_WSPROTO_VERSION = 1.3.2
 PYTHON_WSPROTO_SOURCE = wsproto-$(PYTHON_WSPROTO_VERSION).tar.gz
-PYTHON_WSPROTO_SITE = https://files.pythonhosted.org/packages/c9/4a/44d3c295350d776427904d73c189e10aeae66d7f555bb2feee16d1e4ba5a
+PYTHON_WSPROTO_SITE = https://files.pythonhosted.org/packages/c7/79/12135bdf8b9c9367b8701c2c19a14c913c120b882d50b014ca0d38083c2c
 PYTHON_WSPROTO_SETUP_TYPE = setuptools
 PYTHON_WSPROTO_LICENSE = MIT
 PYTHON_WSPROTO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
