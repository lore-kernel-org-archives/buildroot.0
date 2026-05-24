Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA7FCD5BB1
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 17:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4740383918;
	Sun, 24 May 2026 17:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYVKmVvNBlIR; Sun, 24 May 2026 17:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37E7E838E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779642996;
	bh=XkaKy+R2PsAUqv++bdcDsm0KxlGOvR1Hi2flfsRuNrs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YkG95n0/3RSPyn0DKNwpfs9v3WTuHQuq0sS2W2FEl74LzIdfzOLF0XyJHS9eJaHD2
	 esjErxxbmqyF9gB1Q75bA8KLfF7KUlgGeiyVUY0A8wGWOfPF4efyFqnP4tnnqMl+PA
	 tEWBEnrt4dPGMvONicNUZmE4ZH/AQjXY3ncTrJ1I70qZwF43GvCjOrqyoSPBN6tmu1
	 uoRdF149ExOM0k3fFWhFvWTj9kFm913v9Svu0wIPkL+q9J1RBsNJur2LY7+12hl+Yo
	 Uz30P/LqS2oSVVueac2XG9dBuMKxCkuMDZ78sHahGezzj+cLHYCe11NDTBwhH9pfX0
	 PxpgG0fLmlVAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37E7E838E0;
	Sun, 24 May 2026 17:16:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13DAC263
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE1DE60ABB
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVnJWdiiHl9s for <buildroot@buildroot.org>;
 Sun, 24 May 2026 17:16:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE3F660ABA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3F660ABA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE3F660ABA
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:16:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beef.dip0.t-ipconnect.de [84.161.190.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8FA6A4C1162
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:16:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46128)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRCR0-000000001IM-0ETH
 for buildroot@buildroot.org; Sun, 24 May 2026 17:16:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 19:16:17 +0200
Message-ID: <20260524171618.3225459-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524171618.3225459-1-bernd@kuhls.net>
References: <20260524171618.3225459-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779642978;
 bh=Rctp9DQQBOFgYvfW+aPU0mLhTqChP6wGiPQVbPLkgxY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=DvDGYYZKR+43n7s2+mpomPlskEQ0iAoOBq6pU6mn7mxv3T5A007491Ze0UjrOjNDe
 5UtxgB3mPHwPwNGfo7e49fwA0bN2LmQSPNPSZKPpTobyvaL6xxN2YjWnwsdyn1VhtZ
 nraocnv4onUxY9cPFVXVlAXiWt0cW5Abs2nMUARKSP9VuCt/j2+uOhHQ2pq5PmMypd
 7rFuD9wHcC/LGkT+T5bKAlys67j3MRWpJLXnFNWsosPuIpP+QW1fjFqC0LN43rzj4+
 mLT1RykbxK1+i0wG2BDnrPTeBWRR04HZ0oQRNQwnt7Hg+KkOG+2ItCaby6LKn+EwfL
 GCqcAdn32EKag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DvDGYYZK
Subject: [Buildroot] [PATCH/next 2/2] package/powerpc-utils: bump version to
 1.3.13
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

https://github.com/ibm-power-utilities/powerpc-utils/compare/v1.3.11...v1.3.13

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 32387014cc..d24017684c 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6bb16078068d8b889afdd78927d2f061702ef155e57fc548ae573e2b0b90ca13  powerpc-utils-1.3.11.tar.gz
+sha256  35efb04063f1b7bd9d715f1d8d3ab75352b595b1fd12349d7570a7ba19ba6d86  powerpc-utils-1.3.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index ddeb830b07..38195835e6 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.3.11
+POWERPC_UTILS_VERSION = 1.3.13
 POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib numactl
 POWERPC_UTILS_AUTORECONF = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
