Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1CFCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61AD140BBA;
	Sat,  3 Oct 2026 07:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PYEwxTxIlwg; Sat,  3 Oct 2026 07:02:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6F80D40BC0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010973;
	b=XP9gM5SpgouQh1O+YR0L0jsDPQyWVnF73baegbnm8WJFig13e0B2O2GFtSPmXItzWNA5
	 8LN+okBFLLl0VUU/aXJ5tF95mcyQaOba6+TRz6jJeYOfz1McyNLPALkudz2H/+1fdRu1H
	 nmM28J9sLP0qdlXr0/Uq9ne1KQAODU8pu4S6T+XMolFtUeQ4W0K2XDbkmEAgQTkkWhQjN
	 0CWmNuZikG/Gki87/EO8+8n0ly0cHnB1dx52aMupprwIsHACo1bC3kqwXGOKMxFeK4ESM
	 so+QCSWNTLJUDG143qJ0p+KiAyTXY+v+eF+w2PIRp7gcck8eyv+r95fEIkHsXW6oWWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=l0QsFpYXmVmfJU5pOz93/867aZOLp9ibBrERx+DOuKI=;
	b=UdiEfrUXKzhlUVFDmlxQY6BfFQ0FoI70DemQXlLNVQIeQBoEPAKbKRToY9xrCCaz/Pz1
	 TKMxHF9tcfxpHXBYMcHJsXusYH37loQjXmYsKJxYUUzxlxK621FefW3aT2Y5oNe4kNrJB
	 aYpoEah0IahZ5ec5RTxKKsUyzSp7MGLqYOrevj2NL6WNialbHevCDEuYBCEUWv0wwiZtb
	 uZ2vuA3PhK0pdqaW5SkVKHFszMaMACM+3M67OJC75jX85JaZZTAhbsHULygz0RDcNzjci
	 kLUZoRN9RKhFBwzR2qqKnzdcfWRGYfQ+6MFbFWaZNRYY18grxkiSvpAxCiOfcbfesiw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010973;
	bh=l0QsFpYXmVmfJU5pOz93/867aZOLp9ibBrERx+DOuKI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FTNdY7ZK2OtzLMGNYNuyowUbNt15vR7DtebfIh+3E0zPjVWmYI2UbcG3g1sV0rzlP
	 cwsaytFfjwBWFAS6JovsK7FBWAQl2FZYr/e1Agddb5lTAtTARid8skYkcU56NOdRMG
	 /qtGycX4yUlJeL9GYFCzUMfQR8p4gG6Ddzzv9sC3Ng+CJ1J8409m5G1FEVc8J8Ht+H
	 J1ZY06arnfhAnjStLSO7E8XPclYoY1auHLASIq8GzEcyp9TkC6Cmzc5l7t5z7Ce65x
	 vSOhPS8mDGQThrKLpJ8fAUF/TIRZjj20gSxNtHeEN/hiD5XccGdDWK7qlpw4pxxKIY
	 bvrK4KslWt/DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F80D40BC0;
	Sat,  3 Oct 2026 07:02:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 626B62E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48F9D40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yav-9jUpJVf3 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:02:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DBF9F40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010971;
 b=TkIILZMQCG4ZKIbfgMINpD0mZDgtdA+qEpYDoaJaJW3AEWMHGy/msMX+e43onOMvjm18
 mnGccftIVu7BvMUF3BmY8V3PJbI9h+umAIv3/gN7hyujQRLwW0koK4WHXZt13m9cxIjFZ
 8reeVj3bnKh6BIgyHWUjVQfSB5tdS9pRFLy+zmmNx3dDQCwZW63Qi0ZBXl/PibVTo6oc/
 B5mTKGZpo13L53L4wSQXfLLOEb4ik7rb1k+KsMEnNMmxf8yeYrajgGPSY7KLVyBd5+Mvp
 ltuZ0IDOao5BWZsT4bq9Uu9Bsw7ekcFCFFgCMSxRgmrrS7+YsPuW0TngBv+e6GQmEKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010971;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=R0To15TmED2AlYQdVmbSprAtzPf95bYsNWokFy48r9M=;
 b=X3K+k2PaC8gmEKfqfxk4GbgZESmwG+e83AFlbB3qnkDizFcyFf3Z1QwbZ0zKD/2zuir8
 Y4AtRIvEUkl3lIIV6CLMYV3Nx7T5lbX6c65PRoLhnaGgB7t/E3OD4PaU3cripj+ertA0Q
 tmtTRMAclizP7BBmz5mNOJXpdOHQdYd8KVv0dI6Nt6/aqwwf+jAX/AaMgilZBtcW7hb6V
 A7CnJNXxI1CIK1dwyA4535hYFPtY3kzMIa9oK4Y2XcA3BYwVKyT1dyu/OcPGG/nICWVXV
 bSEsYeTwXA3aO2Z4UqvAJoxLJ+8h4JLXdEUkVOB220OwxGPAut+7JDCKbZRknWd4a4Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pW0kTjKo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pW0kTjKo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBF9F40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010921;
 bh=R0To15TmED2AlYQdVmbSprAtzPf95bYsNWokFy48r9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pW0kTjKoknlypzkez0FZ42qXsZtU//2CMZ1fxvtL+hoSTI592Io/OxAEyQoJMFm+5
 ksSdgMhPtsuJOO2t+0Bz1ysrFOaoVAt7l0NMnDih5guVaa8iaoBbojAXKqDmrlIp4P
 1bchTP74ISVbe5xydlw/fFNpz1p6qSgdixhOgQ3ICgH5V/6Rg8FWIe6jXtInR2GJqS
 PDAkFCqLmFqGn9WJHgF7eTjnVQbLCCerPtrVy8SRI7SrOQCUYp41X1P1hHpxjqvnPA
 7+WIYUk+yIn44v2Xgu0tywTDQ3QX5NEzg6PoBiBsnTQ89YRxhKgfP0n7zSwhHbky3E
 Oto8J84TzuXJg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 NAwmJK0ftN1WYp1NLtajdcyIlAX8hQyM6w1tnKPVbPnRVho+n3k//W+52T05tvp2Hoyos2Zmw48
 oVQA3z/uExaFZ6G0uscPruNyzaFpEhA+7EK6RSHYgSj/WtAFckZL3MdNDfHYv5LsLyO/7P2Dsvi
 Sz8AidU7xGO8k563ekBIIOAIduaumkbOjkfgIj4Kfj6r+pyCsREA7/LiZ6jAhAfK1KJ3Hhbkmy/
 qiYeI2bIHtomW+QYAdy3XVplrBEumBp1y150LQJsi7TYLBdWjLCPGYh5dBS/mcF0AoGSSUEFFaj
 4D9bxDNpKEfOu+8YtFyWB1t5RLoAwPwvk17CTFoqDUEnRmQ4Ac7cbk2Gsg08LRinipN5kEoIrY0
 5wC97xHD0pBG023LtQar8A0GTDP9OFLMigme1Xr4lCoAqsTErpIh5bCGU+9clLVOyYfy9GU7CHJ
 8as+YZPncbNP7oyr7JKloiEaalq2nsTjPiSyxjr8Co90y77Lu3U+VZsp69qSq9epJannfjX3JjU
 v+O1pV3Zo7uM1GzBTHdg5VCnot/qkdg+zP//NaneFiYHqALdmSTmacTNs5HfHBD9DtgQrUWvT9A
 al7PofnSANs7UPCMRhMVk+qzq8hyNaQN9t+5oYi/OhiG9nLrP3XM2ulk7Q/zktit8g==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DEB1CA4C540D;
 Sat,  3 Oct 2026 09:02:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-0zNa;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:17 +0200
Message-ID: <20261003070128.1295458-105-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 105/114] package/python-wcwidth: bump version to
 0.9.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-wcwidth/python-wcwidth.hash | 4 ++--
 package/python-wcwidth/python-wcwidth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
index 8c43b3729c..db635d2a1b 100644
--- a/package/python-wcwidth/python-wcwidth.hash
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wcwidth/json
-md5  c179ab1aff6e3b48ac9617cf19f580d4  wcwidth-0.2.14.tar.gz
-sha256  4d478375d31bc5395a3c55c40ccdf3354688364cd61c4f6adacaa9215d0b3605  wcwidth-0.2.14.tar.gz
+md5  326db5f3f49128f6b69d967ee633c44b  wcwidth-0.9.1.tar.gz
+sha256  5823209b0d43af322ce698c689380d7c15ca31fa8e6e3be8459f27031bef0af5  wcwidth-0.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  70b98a95a2144eb70af8017fa8c6d95ce247e40867436e8bc649e137fe13d21a  LICENSE
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
index 15b5f495e8..32acf28e93 100644
--- a/package/python-wcwidth/python-wcwidth.mk
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WCWIDTH_VERSION = 0.2.14
+PYTHON_WCWIDTH_VERSION = 0.9.1
 PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
-PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/24/30/6b0809f4510673dc723187aeaf24c7f5459922d01e2f794277a3dfb90345
+PYTHON_WCWIDTH_SITE = https://files.pythonhosted.org/packages/dc/ac/3a943d2792c9bb368aaa8b50121c0f778460ba2d7fbdc0a0366201d9e761
 PYTHON_WCWIDTH_SETUP_TYPE = setuptools
 PYTHON_WCWIDTH_LICENSE = MIT
 PYTHON_WCWIDTH_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
