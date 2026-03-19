Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B77F1090222
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 12:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E9DD841FB;
	Thu, 19 Mar 2026 12:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSNOwDLwQTPz; Thu, 19 Mar 2026 12:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A0F841D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773924198;
	bh=O/aYKvKArpjy7tuWZYabolJZxJhpce6SpwB/5ph1eVc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=XT9BmUfXuSIBRt81Kqa2RP9llqwdlm5AfgPoKViu4h8hGBG0DEQ9WG2h9HKEpPWHw
	 ZkIhT4MbXM8B0aWp6UWsUqnUqxK+Ob97kPHvaufmR8blI2AOeB6KvX7AzAxr9wWksw
	 zcfx2M5J/Eyx2NFceA6UJMK73j/zU+BDpj4hFlcUAsrgNqCWD6rqpM0Q9WIbI0lPTt
	 lXArhm5ptEr8Q1cBNE8Oahthx07jmkfe9YbT457caNmR+ijxnBymaS4aGg1hYojazW
	 Q+99v3hPtXUyOmgTJHMUKXbXrssx3jcLUW5I9ZDFUWAykeF2jksnPmchrDPnmxJAMU
	 Q2aLlAonVcn5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63A0F841D9;
	Thu, 19 Mar 2026 12:43:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8372F1B6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6925640C25
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hSXAsiUXr4UR for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 12:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.171;
 helo=esa4.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C90F540C34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90F540C34
Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com
 [207.54.77.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C90F540C34
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:11 +0000 (UTC)
X-CSE-ConnectionGUID: yhjRqIyGQeeCmP+bynyf9Q==
X-CSE-MsgGUID: kVGfOM0DRTmy/+d2ns+aWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
 by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:43:09 +0200
X-CSE-ConnectionGUID: 0HX0HiYHRc6z2Kg2R79OFQ==
X-CSE-MsgGUID: UKziZ8a4StqSUR/L3Omfqw==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces01_data.me-corp.lan with SMTP; 19 Mar 2026 14:46:20 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Thu, 19 Mar 2026 14:43:08 +0200
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 14:42:41 +0200
Message-ID: <20260319124247.2973165-4-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
 <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773924191; x=1805460191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j4yzLIi572508wZ0U2acGxs+gwmCmXNIT73GatPgwBw=;
 b=qL6kWSA/jEqvaHzXIm3jIx0j2Tn/3wujj/nEx7g7M3un6LPl61xitRjP
 r6G/TwwYJVXAddy5cmbOryoncaNWleYdjGPLm9yR0k7NWEZiFpF0m4SNC
 S2gBxDAkd6O6/53oZQsLxp+jWJeWUL+ey5UDIWx4hNMvTaub+ANFKAl/d
 J9X3tuSog03RXbsPcbnMirosGD96GkiZyTx/yMODiBAS+RVeqL/4cN6BX
 Xg9lNDxj1mVVD7Jjr+gMuBDs0mMNTW8jcr2rjHliI+avtN5cDUCLRylx7
 UVwMyUSrYJYIcPVhDRaeTn0v00J1tzakWLAdGgFzArBfrhr/dlaLfqJwY
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 2025.02.x v2] package/libopenssl: bump version
 to 3.5.2
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, guenther.harrasser@mobileye.com,
 Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Korsgaard <peter@korsgaard.com>

Bugfix release:

- Miscellaneous minor bug fixes.

- The FIPS provider now performs a PCT on key import for RSA, EC and ECX.
  This is mandated by FIPS 140-3 IG 10.3.A additional comment 1.

https://github.com/openssl/openssl/releases/tag/openssl-3.5.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7e5a3c98452c6db8422b0fa6455390d138ad07df)
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
Changes v1 -> v2:
  - cover letter added
  - patch prefix corrected from [PATCH] to [PATCH 2025.02.x]

 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 1675d72fb2..7f3795e1ac 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz.sha256
-sha256  529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f  openssl-3.5.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz.sha256
+sha256  c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec  openssl-3.5.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index f3521b3cf3..38d04ea924 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.1
+LIBOPENSSL_VERSION = 3.5.2
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
