Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33802D5B15D
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B39C580DC6;
	Sat, 13 Dec 2025 17:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6jLdxPL23ry; Sat, 13 Dec 2025 17:30:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD36680D99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765647007;
	bh=NXXqCIce7eYba3vdCJCWN7hBLxUMqfaXlhbpOzpybMc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ljoauyGP5Fool7tGdd9ry5zILkbMT9+Fmr8CT1acfITZrSPilYH6K/GlwwSWYefU7
	 FdDoTWT33iyaAahwwxaxb2sq3g9kByTVzEz93KBkLVAyX6hqCTvVxD/uz5GZnXL+ML
	 z/mBWjhFCDxjE7BfOkUsFuWF5hxVEWDmteasEqAdoA+ofLFwFPn2UQMSCNbyWoAoGL
	 RXSDMCt8bJg9bUuvJRSVb0VTwqXmH5rWO/NrDbq8eJVOkVpz8Jj14ZSnz9I9mflRM8
	 k8v6SB+QHfvWwmCcIoOPVpL/8bUlcPFLRWE6s09EXM05Ib56ITJjQjW5laC71HUKX4
	 vzw1COasrJlAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD36680D99;
	Sat, 13 Dec 2025 17:30:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 661E313D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5879260773
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUFGVr4-JLZ1 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:30:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 923016074A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 923016074A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 923016074A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:30:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 606ED5FFC0;
 Sat, 13 Dec 2025 18:30:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 18:30:02 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 18:30:02 +0100
To: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: buildroot@buildroot.org
In-Reply-To: <20251211124539.58728-1-jonhenrik@qbee.io>
References: <20251211124539.58728-1-jonhenrik@qbee.io>
User-Agent: Webmail Free/1.6.11
Message-ID: <84f88d96d3f6829925f587bd5a0dd42a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765647003;
 bh=JPK83LPfiCbBlvEQivgaeHR+taAjqxVK3fAkHtF+Xt8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eEO2TzA3qefW24oQHrE/aLj4/hVV9siOjrsx92IPw6yaGizC/YMx7GaUUXtFIk0pC
 eiLefUc6awcOpG1dZ9fabc5feRNfoq3x0NoEBVxrN/jLqsbLFyRs6S9jze4euU9ruw
 99oCDmlELXTEJChg24xzCej4YwL1Rp/PdujrSNavf7whUAjun7NFdrUcMZI8g/Z/+4
 QkDWu6UNLwIEz01lshR3E6+qd/Q6IrSBmjHDF8SqE2biHKVMmO+SSCfwirtM0i04uW
 5Fe9+uPsr1Rf6MIgCT2eib1atcvUI5VU7uFgxM3zrqrmFKPDxwR1qZrP0WVP6qrKfe
 9QfaoiayK/b7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eEO2TzA3
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to
 2025.49
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTEvMTIvMjAyNSAxMzo0NSwgSm9uIEhlbnJpayBCasO4cm5zdGFkIHZpYSBidWlsZHJvb3Qg
d3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtA
cWJlZS5pbz4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
