Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BAAF8809B
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 07:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB37E80B1D;
	Thu, 16 Apr 2026 07:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoCnQvZELMP8; Thu, 16 Apr 2026 07:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B064C80B20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776324952;
	bh=gf023g86x+HzK9igv3UZdGSyIAuqENXF4D7/weHDfnc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dY3y2qLyaXW9syymUy51rbUHtSEf5QRp++q/J7f0xFgQh2yMtF9RKvgKqlkK7UZNQ
	 X5PCxNmMdSlj5+B2QA1BilE4myLvllmFuDVRbfskEE+UReO+jI6/u6mK5reiq29AWY
	 D7Snzu4hL75gZkFx9jCo0J6w8D2iisQ4NXge6TmMNYIEIiiHdcczVzUet36efVLzha
	 vGp4NO+IRksQltRhmVWXQyyDsWvjAONTp4uN3aw8npenQBjnRiKxRsPkHCmMGDn25V
	 s1X/5vvVPSNwYDSDHNaqv4SOlHjQGA0NSZEDufMsFz8sHoiApMl78LNXCCc/0NvAWr
	 pUlR3khs9A7Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B064C80B20;
	Thu, 16 Apr 2026 07:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88A57127
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8689E4017C
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJ_mBNi5KP0N for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 07:35:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FF7440128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF7440128
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FF7440128
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:35:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf3d.dip0.t-ipconnect.de [79.214.207.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D34AA4C0BEA;
 Thu, 16 Apr 2026 09:35:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44564)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDHGO-000000007S8-0AFq;
 Thu, 16 Apr 2026 07:35:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
Date: Thu, 16 Apr 2026 09:35:47 +0200
Message-ID: <20260416073548.3605471-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776324948;
 bh=89U9MGAQvg0UzCIofdPazw2b4oyz0PgPxPicFn76YcY=;
 h=From:To:Cc:Subject:Date:From;
 b=hiOP+Cd9LZ0DX/1/iYh0SSArrg38bL17PpxGP6KF45oYWCFxQLPC40mQenO1f9C6G
 Dc6VzPMD8Qondt5rZv6z/H50HsNlilc96i9DUYgFda06wd9QmuCl+cuNq/Sfv5qETa
 rkpd/SsRjOQyXauH35kOjOkUCM9ZrlemFq1BlpOuFAeMqiChRbOT8d6pSGDXUq4WvF
 Gmc/8MKCi2AMDaA2jWJR8m7ofCz8Lrrnp54Q7wlBYZKIBklvffPDUJ+iZ4/2yzKXvh
 tLA+vui6/y/KSCMiNqlw3Ou6GZNXVHDQFLd4G57/MWiDv/qBj8tYAECs8Cwuc2zNPo
 nj5+p1b2osWZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hiOP+Cd9
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: security bump
 version to 1.0.4
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

https://fossies.org/linux/libmicrohttpd/NEWS

Fixes CWE-444: https://cwe.mitre.org/data/definitions/444.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index bd5d0b3e8b..41b370015b 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7816b57aae199cf5c3645e8770e1be5f0a4dfafbcb24b3772173dc4ee634126a  libmicrohttpd-1.0.3.tar.gz
+sha256  d72e5cfccd62bf2f79252edbc3828eeedc088ce71fc47b7c9e3bd7246b3d54de  libmicrohttpd-1.0.4.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index b74a7a1338..49b5d4b0f5 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.3
+LIBMICROHTTPD_VERSION = 1.0.4
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
