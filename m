Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C06ACD37B7
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 05:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B364160665;
	Mon, 11 May 2026 05:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brrALHFgfzgc; Mon, 11 May 2026 05:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 976B4606AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778477923;
	bh=2HBwymENZhDCeu463At6jvfOfnY3ATI9pFKj9EYuWFA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S+ZWUC7aPIvlqPOFtuD3tpYnPgDMenunbINpCdTgXhnTp2z1zVdbo2B72818Z/6VR
	 V5TMeHrhNSPIuc85LsZjXmWo5QVXANk42PAAaCLU31MITniLb+rYjRt70EcnfcRTz+
	 i8muAs/S7o+9pRfNrlPgC5+SAvGOZ+PUatepYSpDCt9Ofvi7fPa/nPVEEGh9J/9aRa
	 L969zspGLPZZscYDdOusAmPQmTa+71ZElNFqlSxmsJy4l8/3LBqbGBgxavGHw5TV6G
	 bcX38fmHvB6JoYQKnj/JPW9+eFBflNHdUb6QhzfYWg6zEqV3/JS/v8LHbOiTn7YCvz
	 D5tXBWgS38SAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 976B4606AF;
	Mon, 11 May 2026 05:38:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 639C1173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 05:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4944884191
 for <buildroot@buildroot.org>; Mon, 11 May 2026 05:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f068hhXgPjLU for <buildroot@buildroot.org>;
 Mon, 11 May 2026 05:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DC398418B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DC398418B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DC398418B
 for <buildroot@buildroot.org>; Mon, 11 May 2026 05:38:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4F2BA4C0A4F;
 Mon, 11 May 2026 07:38:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58796)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMJLf-000000006Dr-49jn;
 Mon, 11 May 2026 05:38:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 07:38:36 +0200
Message-ID: <20260511053836.208037-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778477916;
 bh=TKbjrt2a3DqLasTlh4oAEUmoxkBjUAJ18umqYRsMbDE=;
 h=From:To:Cc:Subject:Date:From;
 b=DDfiD78a6FBDAoE7xzUemlvGPR5nTaVuKhiVP7bWSmTLnuRwpVPa5aUoh+fDsicwz
 o7hd6VuWfgDsOJVo4/zcYs/n/+Ho+yiZ5HQ48sgJBNSxKotrfFPowxCpkzg0QMxVfD
 1MJjsd3iOnfsy7wNgn+izfloWMsRS67+FHY97mr906kzZSEFdvQ1igVniOae8I2TFY
 qDi9styezFdUXN547IwWR4NASXZFWk6HYpuxuwTPf5Jo5h54nFO1vdclt87TOw0SAn
 x42plMc+YxjLgERQ8plkaHhepbMjycZ7FQauGXkxJSsAlPNOM8EJHxiH6S5iMOwRNS
 Izm0y/xOvq20g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=DDfiD78a
Subject: [Buildroot] [PATCH 1/1] package/dropbear: bump version to 2026.91
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

https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2026q2/002398.html

This bump includes
"- scp: Fix regression in 2026.90 building on older glibc or other libc.
  reallocarray() was required, it is no longer needed."

and fixes a build error introduced by buildroot commit
5b136c89ffed35c30dff1802924a4dcf9bdab798.

Fixes:
https://autobuild.buildroot.net/results/637/6372e58671d3719b127dcb69642420a07f441790/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 81296375a1..31ac153b89 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
+sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index beb635e15e..a7de8432af 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2026.90
+DROPBEAR_VERSION = 2026.91
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
