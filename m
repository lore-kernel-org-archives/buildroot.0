Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A681F46C66
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 091228105B;
	Mon,  6 Apr 2026 18:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihAm4S03UX_p; Mon,  6 Apr 2026 18:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67EFB81046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499871;
	bh=Gi/PXtZgBOrmjIlKU4TWYz9ANLgQMj5PTiWqfKFCxNM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjYcOM4UUBBrr89ytbakMweZtwATTJkFna+gohb/QGqstvYfmWzROPaXO5ZYj5vN+
	 korxvIFrhZc/Q8b/WY/uxJNoZ4H/U1u6hnLp12w1TafcmywCWg6x1JcHKfqAfoFsKh
	 AeT/S09b6DFXxtECxe8GZPvb5Nho/dTi/ATeIXYXxLxCIPIN1BkmyXjVPoiwrYMTCi
	 A0jZSPr3CiV+t8o0EhYsOwqUeZr2LH7w6Ng4h7TuedtugnLz+/xD9eYPmeVvxp77m0
	 Ao9zWBW21p2XHj2odf3o38WKaAAz9eUsHAoLHisIS6yP++rp5s7KTw8+k0GTTVGpyN
	 u0hJmI4TBa/1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67EFB81046;
	Mon,  6 Apr 2026 18:24:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66F7D2EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F47B81046
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgbcPDQNjsms for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D12E8103B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D12E8103B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D12E8103B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:24:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1871A4C3963;
 Mon,  6 Apr 2026 20:23:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaY-000000001kA-15GG;
 Mon, 06 Apr 2026 18:22:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:15 +0200
Message-ID: <20260406182217.1853895-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182217.1853895-1-bernd@kuhls.net>
References: <20260406182217.1853895-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499783;
 bh=NQmSwMNoAKyJNSG0crMW3ayLUndnAqF1jF6PORzdUDc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Jl2/md+qYZMsR6jU19XFOYi7HknCR8Jit9AJ6qiVXFnewN1FS09b88x1ko9GhFJwu
 Xmnug5Z9hsqPYVJUdKx/9sP5pEw8eo+bVPON6pM4U0PruC+c0MEUOAlOogDdBkpdz6
 WMxAQEGFud9XRwbS0WNM1Pns6OgVa/RCQpR7M3cfkk+r71bAufk41DUxE4FPXK3O9s
 l7GjnrjeSx4uSPQN5D5pDv8SOhrGJNVq0uii2+nVip1UaV3Gk90V0QYZBQBueE3Gbw
 SXMOP6YGXAaJBiWOiYPKAeYg2BCuXW8Ui/xCzqI7fjAslnoSMxCAYaM6fg6pk7e9q3
 P8Cwbx0xEXckA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Jl2/md+q
Subject: [Buildroot] [PATCH 11/11] package/slang: disable pcre module
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The pcre package is unmaintained and will be removed from buildroot.

Slang has no support for pcre2 so we remove the pcre module.

For reference see:
https://fedoraproject.org/wiki/Changes/PcreDeprecation
https://bugzilla.redhat.com/show_bug.cgi?id=2128372
https://src.fedoraproject.org/rpms/slang/c/40c4fb0556a06ad3ad9abf01bcaef50dde0dc8c2?branch=rawhide

https://github.com/LibreELEC/LibreELEC.tv/pull/8299

https://packagehub.suse.com/packages/slang/2_3_3+git16_89d32bb-160000_2_2/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/slang/slang.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 2b3cbdf27a..5d85e40982 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -10,7 +10,7 @@ SLANG_SITE = http://www.jedsoft.org/releases/slang
 SLANG_LICENSE = GPL-2.0+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
-SLANG_CONF_OPTS = --with-onig=no
+SLANG_CONF_OPTS = --with-onig=no --with-pcre=no
 SLANG_MAKE = $(MAKE1)
 
 # Racy and we don't have/do libtermcap
@@ -26,12 +26,6 @@ SLANG_DEPENDENCIES += libpng
 else
 SLANG_CONF_OPTS += --with-png=no
 endif
-ifeq ($(BR2_PACKAGE_PCRE),y)
-SLANG_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
-SLANG_DEPENDENCIES += pcre
-else
-SLANG_CONF_OPTS += --with-pcre=no
-endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SLANG_CONF_OPTS += --with-z=$(STAGING_DIR)/usr
 SLANG_DEPENDENCIES += zlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
