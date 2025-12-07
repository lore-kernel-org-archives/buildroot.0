Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D84D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17DA2813AE;
	Sun,  7 Dec 2025 17:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQY1LOgywnmB; Sun,  7 Dec 2025 17:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D41E81746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765129434;
	bh=gadj6l81H0/Pi4kR5hH9cMVagyhwjFESq3B4CTVsEVY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VUHWiGviuD3Zz2NUPFQ4anudh8x6BgRVTEU3sZdlpBdi11ZZJl1PNrX6M97uYrSmy
	 B9B5H+990Op/Cpi4DY74kiR9PdDTrG4x7ldS4e9tuwUCCRlJ/t+y00V/Uro6wkbnaR
	 Dm1y2GzQs8SUNntLRFszhyyafIlJWfdYXNif8EyveO/C5FrxKAPrrGZs1ftuItaItB
	 j3VukjtzdVjfgnnCcOlPg+0J1AijjdfAHlsBedA5yUUPxIRkZpcBaLPU70beMFSbGR
	 BB/0w6n1+EWtCfyvoMCwa+Odmx8tMK4SIYK2gL+tMW/+OwO49Ugl4rCNRBBLC9x1ZW
	 X0HKy+PAAQkag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D41E81746;
	Sun,  7 Dec 2025 17:43:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 787ADE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C25B9406F6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehc3Xpa5YI2d for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE878406F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE878406F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE878406F9
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:43:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0C184A4C00C6;
 Sun,  7 Dec 2025 18:43:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39992)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSInU-000000002Km-1XzC;
 Sun, 07 Dec 2025 17:43:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Dec 2025 18:43:48 +0100
Message-ID: <20251207174348.18519-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765129429;
 bh=qkeV3AAtY6iVSPn0MQQOylPxDUbzRO6R2FsxbgpRdxM=;
 h=From:To:Cc:Subject:Date:From;
 b=FVlgIxQgusTrr/AerPfn2YXOYYWHU32dhEEJ0RqgdwjL0TA5bEAOUeuDmnfi7q5wo
 txgbG5PeRa6zS98zHWJ8S4Q9GbA4y5ycKqGH7CE+XmYi483PkL2Ce28spksTKmiwEL
 n3X9NGjwNMbGRWHWwgwj5f9rEcpQzB6JeNiIocsA/dICg27QhQCXhQfWwSxUaZ1G9a
 KciWVoSbAc00mCQeQhR1mPbrVvDsJGrselXNYmBHeAHgeXohQttRctJY4lQLWdHdI6
 oKRQKyphxnPtr/+o1Rz7L1HfIXL57fAei1Kqb+4ikaib1VZoUyeGXGk38YDKtVuLVL
 8rfhamba1WDWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=FVlgIxQg
Subject: [Buildroot] [PATCH/next 1/1] package/json-c: disable apps for host
 build
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

Fixes:
https://autobuild.buildroot.net/results/dcf/dcf72922750a830901279e8eb8fc2def95d35e01/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Supersedes
https://patchwork.ozlabs.org/project/buildroot/patch/20251203214709.2321976-9-bernd@kuhls.net/

 package/json-c/json-c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 254b6fd838..20fa767c23 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -11,6 +11,7 @@ JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 JSON_C_CPE_ID_VENDOR = json-c
 JSON_C_CONF_OPTS = -DBUILD_APPS=OFF -DDISABLE_EXTRA_LIBS=ON
+HOST_JSON_C_CONF_OPTS = -DBUILD_APPS=OFF -DDISABLE_EXTRA_LIBS=ON
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
