Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670C7C2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 18:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29A94409E8;
	Fri,  7 Aug 2026 18:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQBum0Qg0BgO; Fri,  7 Aug 2026 18:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E8D409C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786128580;
	bh=gxLP566bsdSYp4buTdLz9Ch+l7+gnYjoNTkl0D6UR+g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sodyNceq+Hyj+Uu1VC3mGJQpzFeIirul5McBuUslC2AS9c0A51Ghlp047w11uasmU
	 5eUZE731wrVa2ey9q9//5ES2qjpyoTko7VPBOS5dIHL53RMuI3DJRKgFX/+UYPJiRv
	 KbbqpAaf90LbyfXBjka3S9dSVriB+YnuG6DY4xENqUi6zCwLILHrZ75UGwSTtNQ4iE
	 edLtcwdA5KEvka3rE+mTXyzjfPHBDB1vhhWk4t9S7EPOOzKx44GQZuSUy+TEJWP9ud
	 7Ax9rARFC7G51085Ec3BODAR2yL2xX+QsBheQHFlFurbMBEx/NrcnCyHZbbhgoz9ci
	 zh74K/Ujy4bnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49E8D409C7;
	Fri,  7 Aug 2026 18:49:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A00282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 18:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 485F84017C
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 18:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ifkorkovo5sR for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 18:49:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2385740024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2385740024
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2385740024
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 18:49:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c228.dip0.t-ipconnect.de [79.214.194.40])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 455B7A4C4850
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 20:49:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39130)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wsPdP-000000002Vq-345Z
 for buildroot@buildroot.org; Fri, 07 Aug 2026 18:49:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Aug 2026 20:49:35 +0200
Message-ID: <20260807184935.2744630-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786128576;
 bh=3RRqwjzESTLX0972O18af4os+FejiWQhqBqwIfTRr7s=;
 h=From:To:Subject:Date:From;
 b=kTNpegLygijRvbBy7Tj6zoGWqf/+P44P7LEZ8QDS2gVrv488TTo31p9Pmg2AAnVJp
 8CejQ7MlrxF6q+JsxuaepsEQg1IwozDGaKDmTXBR4iQKaUhIX++hmqo34xQ6TzhBQw
 tilKaoGcc5X7BXib21BxvLpAxgsVxi4MNSF5S8CbORZNmREqmTY0OBqkNY8/720dGQ
 USf8PQtRpdTw+EOQlyHjPigDcF6x6P4Fye4rdexVsC1Z25/iJA6Nf76WsjORNQjvyP
 jZvzdo0iSoBz/gPz0biRcFfM4LaVNETLfolMhE+k4C6fvW03tOj02UFWYPfB25rUPc
 LguLV1Q4erxDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kTNpegLy
Subject: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to
 22.10.1
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

https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.10.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/da045019726f476f5508cf4459884f757428a8b4

 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 1b7c7a2c84..0d65167829 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  893e3c5a24b408ac312a0318b70f38f427f297646e323f31e79d3a06a92c1543  intel-gmmlib-22.10.0.tar.gz
+sha256  33ebb6e65a2617c59f95a9e70ce0cbeca098316cd265345a0f4db5b381f1024c  intel-gmmlib-22.10.1.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 7cb784f361..6fe5c1c067 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.10.0
+INTEL_GMMLIB_VERSION = 22.10.1
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
