Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32D7C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2FBC8088A;
	Thu, 22 Aug 2024 18:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEecD7ctn7eF; Thu, 22 Aug 2024 18:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A901580C34
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A901580C34;
	Thu, 22 Aug 2024 18:19:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A26241BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BF75401B0
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEXLbw4hc6Rq for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 788C2400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 788C2400D2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 788C2400D2
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:19:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a54.dip0.t-ipconnect.de [91.58.10.84])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2EEC1A4C2710
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:18:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55196)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1shCOE-000000005cF-2m0I
 for buildroot@buildroot.org; Thu, 22 Aug 2024 18:18:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:18:30 +0200
Message-Id: <20240822181830.65052-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822181830.65052-1-bernd@kuhls.net>
References: <20240822181830.65052-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724350711;
 bh=iQ9fvwQ4y57LBg6j7wmdEkm7pACKEq5EssFqEOeqtf0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=l0hl/Ux6gxfmFNJjQmJ09vs04iH1iRYnWIaB1h6xBQB0xVayN2DFAIj4v3fLTf2H1
 FH527BY5bJUl2CNx4yVFrz/VB8B7L9wxARTkAIm0EclJ/64aNFuLeII37NgBXz/Ouz
 CWq/IEYSSJxwBOCKGdPlM6PYbrKCsuzUHyHVpugqPDj7vrb7fzINQF5xKnybLW6C1N
 uKR2XYNOuKc/ziwfMVhS6RPEeoYzG5jmWz5g/gZuZUs2mhKuYEBiKt0d1pMj8oINtx
 cz7sr2tq/XdJ3hQr3yKiwo8go53cK+2+jQ9zbzx2DsnS/EDZ2MJeZpTRFvskC0I1Qb
 FHX34PBAXJ4gA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=l0hl/Ux6
Subject: [Buildroot] [PATCH/next 7/7] package/kodi: needs python-packaging
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for external addons with python >= 3.12, for example:
https://github.com/emilsvennesson/script.module.inputstreamhelper/issues/550

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 25c5758b85..ca93075c1d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -94,6 +94,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PYTHON_PACKAGING
 	select BR2_PACKAGE_PYTHON3_2TO3
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_PYTHON3_SQLITE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
