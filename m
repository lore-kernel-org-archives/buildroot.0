Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17A6CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7990740AF8;
	Fri, 16 Oct 2026 15:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCPCrzdOAKBq; Fri, 16 Oct 2026 15:28:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 61C3F40AC0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792164519;
	b=X8U/mWVc8M/lR+jB97vciepRZ4jO4G7/zXKuoFWpO78qm4A+10f98LlaWjkaUuYRH5Xe
	 cyIx6CSZviZBDA6RC6pGCHPUzCfIGt25gIo8yWl5QXfJwN056W59XeWp/kpCSi//+Cna8
	 DKH09frkiHK0atnHy8v7zm7AWHO65s9PY6dMuIK7/1n2N2YtU0SPB7757utry7tGpFbTt
	 K1yeLQ0HS7rl23JDcC2ThIZlKyeGsMbYlPXobOZAn/jbiZikszUusmDNswFkd/gLYtYtJ
	 Ax56wzFhNKzVn2Tl0BnuIHxtVeE195ryxD1AgIQzGOThLZoauzQmlXddE6PpNbgYVlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792164519;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=goJYXc58fwLC3IOmHdUqeuYvBlC6+hV293/7EkPZK/o=;
	b=T0+GJ1mXUoHA8X/DemIb1XUYOUCEFe7XElpPagZpH2hecTR+73VvL3RQjZ0F8wvNWFdR
	 J7gZ2iPbPafuzKrT1N67giUtXtAeB4buL7K5Do3dWXZI1o1Trgi0Xfgdyf2ReaRR4rNdJ
	 3ksyANIAwJQ7uCO0G8sTLfITNcKGuOnHHlahcTfHRu7B9BzNMADVUkFWF7a91OR1d4f9B
	 uFFyjMkSZJZhTxp1mQ9pSSyaoeNmplJQPe7FVWnhm9ce6g+sLp+gVnyie8ZJlc8xP4LDR
	 Rgkq7iAqhy88KZbXqjsBvXGKVXHrnFUvTZQ1xK3P+a2uwiOPoRQ8m7H69K6jPljTDng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792164519;
	bh=goJYXc58fwLC3IOmHdUqeuYvBlC6+hV293/7EkPZK/o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YykW1D+0rM58f6b0nFU9Apokbh3QqBsBbaIibe636UAwfH8ew05y3fVoqvOQAy+v4
	 KUT6HOHWUO6aFzzhHWOqX7aM0rd7PE86U0Jf7AyoTyAIChm6W8Ebf7c1NqvOVkxXMn
	 /6S6kVZs3BsuhFmZ+bxOi1mY6I2k5XnX23ULE94pXs29bpGPRI1SP3s7Ht/nbTyh1C
	 RSu/1SRVml9wO0Kkhui1d3y9ZBbe5xFiyOtb9n7TKZ7TqtImUM2VStT/lNPFD5lLbg
	 GkY8+jVHdARlZQkWTiWKLYxMFnfWFiS5ut52DZH9qHAiiJRs9BSY4YREyeEIh8I66D
	 0OOWk92ic+yXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C3F40AC0;
	Fri, 16 Oct 2026 15:28:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03D43769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DECC560B24
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zt_dFSSsDIbb for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:28:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8EA4660B22
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792164514;
 b=rLlui2GFyj888ryNP44/otcRagos3/aO0GSeK57p+HY/fnVDHR4txke9YoxPwDI6Aop+
 ywuRGjntTFePpyw2zvQrOu/2VZDv+/u3ytOjTF1AlrR+Lc1kZe9/TjlZDgShpkhgbqVDl
 eq8e0gAHUcTotsaNTAlz5BMSJlkQ1bb+xH0ldVqB5iS+Zjt2k98iBuSHzQnDDORx57HgN
 QLfC7O0eFTMH8udxng1Cc8nvIZAZCm+JWHBZ8/ElOOCkDFZnYoxP4PEagMBaaReG5iQvY
 WDXLkFO4vmIMMhFotlddOyHhYOhkzXlNynIzsnbIOka2VxhQIsDPMpLag3PROtMabmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792164514;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=hEqbfaY/DLK/sKIAMwbjSf5n3R0vW5clYzS2qAqoqjI=;
 b=dDFvOES16pfeQ9mjTU7pH86zir/tm4EUTvDlqkAEw5hn5m4zpFJZj56+Um/1i3gscRnN
 JrfE2rWYoL0cs9IBqSl8BWmHTWbnmTmVplE8UExXhv+5dGjkOabWBJc6kkoaUWw41rg96
 qb7/htwxJ6asYYq/toeXvZTFtotrVKB0WHw77JQddpCPNURve3F5iF5VhayILI4+Rd/W4
 fsI+0fPMJku1gSbi+yFVFpGm4ynIYmxyHzvLHQa9UMRRJ/tNm3ZyMs9CrdRVgo1AhhoZp
 DIRFm9lu0wyu3hIdeoGhuS26BL8QQM4m+fKs8FTlaJCs8/w01bQS5XScQuzr+0i3cew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=WUNKNTV0; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EA4660B22
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhhX-1xROuN2tM7-00Cg89; Fri, 16
 Oct 2026 17:28:24 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 16 Oct 2026 17:28:10 +0200
Message-ID: <20261016152811.2817446-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016152811.2817446-1-fiona.klute@gmx.de>
References: <20261016152811.2817446-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:kOAWXtMe+Q/76bal6zodkyiNLrTixhRiQiaf+yfPFp1q1WwxE/V
 +6hBU1cYn4Wi1HNSjUn7GkIJSWIOLOLMTQdMWESclWU7bf+Wgl1Ps7OgpiXfTkTF81vxjB7
 +bbKvqgEt+FFZzKI/kGiYdyw6MpTvhyeJu/U4XCPcfaqESswjeGvzaC8EraakmyCnZjXywI
 bS7lUVM/5uedXgkfS4Msg==
UI-OutboundReport: notjunk:1;M01:P0:OuWqq7vr3Wg=;1GYXbVAO3+ziwH7CipAIclrxgaR
 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
 rOHUw2zzre9jm2mt19xQ=
Subject: [Buildroot] [PATCH 3/4] package/uboot-tools: fix target FIT
 signature support
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Commit 928cc5dc5cb82e6f2cb43f853488309eb806ef89 ("package/uboot-tools:
fix host FIT signature support") fixed building host-uboot-tools with
FIT signature support after upstream changes to the config included
since v2026.04, added to Buildroot with commit
e049f6fef1fd1e1b0b6095e0ff9113312a7d7f81 ("package/uboot-tools: bump
to version 2026.04"). This commit applies the same fixes to
configuration for target uboot-tools.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/uboot-tools/uboot-tools.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b5924f6954..32fe9f1d7b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -33,7 +33,10 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	mkdir -p $(@D)/include/generated
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
-	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
+	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)
 	mkdir -p $(@D)/include/asm
 	touch $(@D)/include/asm/linkage.h
 endef
@@ -50,7 +53,7 @@ UBOOT_TOOLS_DEPENDENCIES += dtc
 endif
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_LIBCRYPTO=y CONFIG_FIT_SIGNATURE=y
 UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
 endif
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
