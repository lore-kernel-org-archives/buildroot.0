Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B454BC982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5025280DEC;
	Tue, 22 Sep 2026 10:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3A8MqlD6RJd; Tue, 22 Sep 2026 10:33:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 073DB80DF6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790073195;
	b=YsruEt8Ow+R8+QMv5l9AUVekn+H9MiuQ3xla+nOnPmsRB4uIhS5LFygHNXQxXVhaSQCh
	 1+zQIFCbAwlCXZHcnV9rQt5Jg+504UhRjui9hBq26e0Ez5mAfI1+OEo/s0EZh6Bmpe1Ms
	 2KvDinhnsOJV6kk2dL6G+Ebkm2Xrs3xw13a3MYAEd/BWK28eVuZwd2/VbExzFl1KnD44I
	 MjAAqtdgO+a/Mq4KIXsKTKGss0DrLdod7AmjyVmcBa0KWSlr28sI49rVED4L8eHxnMHYs
	 SLFuhXax9go60bbHqUXb41PjauhqjJay+PS7bRcqjQRLOXwHHc7hSZldO04RWpmzu7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790073195;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Swyie8NiE/yPZZjeWQiqsDquz87QxuUesbek+Vp9oWI=;
	b=Cld9pW75LrRik+iWhERUkgEeJbhOnu3TDJyao2pn8HQuSN5WQLDA2JJup1N+j6DSsZAI
	 +Y/P8YgZDfzJp/lf+CNrwDgB+oTnod5iapQ9Oz1EmD4UFO9LiR121xSFSXInDlVhTtjrw
	 hKL10xZBCWZS4rEWGKF6UHkVdHtTagRYCiYri7JXvU+Jt1ac44BN7e4pvTY66HEbBOLpP
	 RPQasm/Nk8Je9D/kI8oE6RaY1KNNVLhNkCf+PSfiEB7J58T3qOH+vMwZnm4CUHXSqy3A1
	 tht+N9sJTtZl61WGwjARBtpiHLY0n9LYCZ4r1H+FbQ3n5pvrgXDiF4YQCjeBeHOqhYA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790073195;
	bh=Swyie8NiE/yPZZjeWQiqsDquz87QxuUesbek+Vp9oWI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UgUzKx5uVmjKidoTRBnww5eXE05X+bOSo/Gk7I9swrW0h4eniS4heY+wmZSzR2tEE
	 6C+cCSAV0SHEBM0a6CfsNNErUmE6xyjmesgbP+5a0JJjJgcyldXh8lUleEGxwdb33P
	 mfaQk4NadN6qzd/3lENNBdNxuNDrp+CDwZ46nVUiIqIWsMW6903fHMgaSVW1VMzoX2
	 3+ithUVPE5jS1E+3mvLbkjRtnwBj9CVe3cF7HXikdluLT55I1qVJoysUiFB+wW0F2v
	 r8FROmkot5hX07BegyefcDve34asX8ffw6lBQd48kBG0GVDBs9gl/DeNspyNCmKtrl
	 nxXqrguy9pkqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 073DB80DF6;
	Tue, 22 Sep 2026 10:33:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D6BF352
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E804A40709
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uy8_Cez5uaQd for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:33:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B604C406EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790073191;
 b=bzXSNiZiOD/30A948NiL3DUfnBlRoX4Y32EpxF6iFfbe4gdJyxXYimw6EEtZKcCHOYVG
 z2YOYGXURGo+oziUwLpg5o6cH1QDE4Ezwngb9In3P/oZs/pZl5bGzt4zNTeWMG8XD9EqV
 HFSdWJGjEdlfhaM6AKzeqaUxFZdV8KZXHLedmMVTUzjbM8Qv/lfdsR1yyQ9WP0oNkgnC5
 +YIuhRuMuijigowZBuP9PCKSYVJdfqU+5WfDWKQqDa7Fxpkx/B1XCcFefbKfN2sinkehb
 bVB0D4K3X9sw9MAqa/4ycj/R3n+NoDxGX/RgET7DQzMoeJas7R4Qe82ff9412wwWgKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790073191;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rL6rE7ntBv74vGt6CiLrqGrVVmB8ay6tNhcs6amPKaU=;
 b=QALc9q/8slUkAUwoy6HDdo3bEfBAvsZBZ8uqa0rDryrocssNeTiWljvnEz68gZWDU3nt
 LFfPBXhSFH6wFzx64z7I7MzaRRUcWiWvdu55dbMPvg5UTUcqSMiAW5kSxBxK12dfbgCEr
 /IV5xlqmtNuuT+qEyRppFEFmVnXbzU3sc7EMzwfPEtJ6h1vVjohDUk2PXPLzW2vhExvCC
 hxgd/GhVP/vMP2Vp6Fv0fbxMRf+3DDaNzQoMBm4Tzz/T22EFxMcKUwPg4rYbXsNOHvvrR
 d09oOIytJZ+HbEUeXmPzfx2hA2ucNwP4bs2kNYrU52nRvn4hgW+vBxhOcz79hSaxujg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="UhGx/tTu"; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B604C406EC
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6qp-1wOdhX3wKJ-00eErs; Tue, 22
 Sep 2026 12:33:01 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Tue, 22 Sep 2026 12:32:35 +0200
Message-ID: <20260922103237.712596-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922103237.712596-1-fiona.klute@gmx.de>
References: <20260922103237.712596-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8NB2FOuHOJ/hufmTfBT5+6HmtmjgXtZmA5sJSQNVVoXcTVPviDP
 Xki4j8EnxViB1CKRWRHgb6bcx5kDLjgyXZE7++MmfcWfLtpDezTrxr4VYHSasNzDQZU+izY
 bWOMqiVhCdoY2o93jH8vvzWfwzikQBA5wme+WZmrlR1KbNsjo0xC1G/DUrH8UQPzPykMQ+G
 xynV4pRTen1nJjgVj4Myw==
UI-OutboundReport: notjunk:1;M01:P0:KcL94ZubwFE=;MWyGB+txOsML30Mh6kr5kFcG0Si
 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
Subject: [Buildroot] [PATCH v2 2/4] package/tpm2-tss: enable host build
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

Building host systemd with tpm2=enabled (to build systemd-measure)
requires tpm2-tss.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/tpm2-tss/tpm2-tss.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index b9653ad33f..9bb3b9d677 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -50,4 +50,20 @@ define TPM2_TSS_USERS
 	tss -1 tss -1 * - - - tss user for tpm2
 endef
 
+HOST_TPM2_TSS_DEPENDENCIES = host-openssl host-pkgconf
+HOST_TPM2_TSS_CONF_OPTS = \
+	ac_cv_prog_result_groupadd=yes \
+	ac_cv_prog_result_setfacl=yes \
+	ac_cv_prog_systemd_sysusers=no \
+	ac_cv_prog_systemd_tmpfiles=no \
+	ac_cv_prog_useradd=yes \
+	ac_cv_prog_groupadd=yes \
+	--disable-defaultflags \
+	--disable-doxygen-doc \
+	--disable-fapi \
+	--disable-policy \
+	--with-crypto=ossl
+HOST_TPM2_TSS_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=c99"
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
