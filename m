Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E31CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 09:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2658F40D76;
	Fri,  5 Jun 2026 09:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6aRYpSINcOl; Fri,  5 Jun 2026 09:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6308D40D77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780653163;
	bh=Q9uVi7JULny/7dIafN45eccENLZMhEgBMxtQCf6LBhU=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XK9e97qklwPjGHECLPJDKKUWwBV4/EPMgKcIcaYFhJBzQPs3xEix2ADJFDgcGP13K
	 tuTBO3cohuJLxU5W3Nx+ePAXT7N7nBn5pX53aH979XQ9/KpZXFFNh4NAAioriADTft
	 3bmJeW1UGdXlvXbmAz1dMNFM+utDn41WUMcLsSTZJT8aJgKue84CccXvUvSM7wfdHn
	 sWfHPQXPKO1N9u0stJ2eHnF6hv6lBvbrGimt26cn1DNWUI1WYVdZ5sbXAtrA26Y60S
	 GNkJbJa+CrOFGeQNHDf/Of27FXBRURH1jhrglp2AKqJ7A8uVXyhu7MzJzMN69kN2eL
	 D2aH8IMsJ42CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6308D40D77;
	Fri,  5 Jun 2026 09:52:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 096583B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 09:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E010181D24
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 09:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_3koGlj-VsP for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 09:52:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE9B381D21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE9B381D21
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE9B381D21
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 09:52:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB8674CEB;
 Fri,  5 Jun 2026 02:43:19 -0700 (PDT)
Received: from [127.0.1.1] (X72Y076X74-2.nice.arm.com [10.34.129.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40C0C3F86F;
 Fri,  5 Jun 2026 02:43:24 -0700 (PDT)
From: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri, 05 Jun 2026 11:43:07 +0200
MIME-Version: 1.0
Message-Id: <20260605-p11-v1-2-f3a206958d94@arm.com>
References: <20260605-p11-v1-0-f3a206958d94@arm.com>
In-Reply-To: <20260605-p11-v1-0-f3a206958d94@arm.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
X-Mailer: b4 0.14.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1780652604; bh=8SribuQapANqRZTqo4PavhgCJL526NRclNdIB5FDOf0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=g56zppxkefaH9csF+IwV9UQBPPs78Nbfu8VM9oscjcxMbjhlRZWyFpZy/4NI2jdsJ
 hnA3Q91/EG/pI+FEnRByTggjRlaBez4nBbtg6QYLZhA2a0sdt1ka8gfjHGcGf/r27I
 bb8gk5CmsDo4nJhdls62NIPkzPBR27Xt87vWljZU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com
 header.a=rsa-sha256 header.s=foss header.b=g56zppxk
Subject: [Buildroot] [PATCH next 2/2] package/gnutls: add host support for
 pkcs11
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnV0dXJlIFUtQm9vdCAyMDI2LjA3IHdpbGwgYnVpbGQgbWtlZmljYXBzdWxlIHdpdGggcGtjczEx
IHN1cHBvcnQuIFsxXQoKVGhpcyBjYXVzZXMgbGluayBlcnJvcnMgd2l0aCBCdWlsZHJvb3QsIHN1
Y2ggYXMgdGhlIGZvbGxvd2luZyBvbmU6CgogICBta2VmaWNhcHN1bGUuYzooLnRleHQuc3RhcnR1
cCsweGNkMyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGdudXRsc19wa2NzMTFfaW5pdCcKCihP
dGhlciBzeW1ib2xzIHRoZSBsaW5rZXIgY29tcGxhaW5zIGFib3V0IGFyZTogZ251dGxzX3BrY3Mx
MV9hZGRfcHJvdmlkZXIsCmdudXRsc19wa2NzMTFfb2JqX2xpc3RfaW1wb3J0X3VybDQsIGdudXRs
c194NTA5X2NydF9pbXBvcnRfcGtjczExIGFuZApnbnV0bHNfcGtjczExX2RlaW5pdC4pCgpUaGUg
Zm9sbG93aW5nIGV4YW1wbGUgY29tbWFuZHMgY2FuIGJlIHVzZWQgdG8gcmVwcm9kdWNlIHRoZSBp
c3N1ZToKCiAgICAgbWFrZSBxZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcKICAgICBlY2hvICdC
UjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI2LjA3LXJjMyInID4+LmNv
bmZpZwogICAgIGVjaG8gJ0JSMl9UQVJHRVRfVUJPT1RfTkVFRFNfR05VVExTPXknID4+LmNvbmZp
ZwogICAgIGVjaG8gJyMgQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUyBpcyBub3Qgc2V0
JyA+Pi5jb25maWcKICAgICBtYWtlIG9sZGRlZmNvbmZpZwogICAgIG1ha2UgdWJvb3QKClRoaXMg
Y29tbWl0IGFkZHMgdGhlIHBrY3MxMSBzdXBwb3J0IGZvciBob3N0LWdudXRscy4KCkluIEJ1aWxk
cm9vdCwgc2luY2UgaG9zdC1nbnV0bHMgaXMgY3VycmVudGx5IG9ubHkgbmVlZGVkIGJ5IHVib290
CihhbmQgb3RoZXIgdWJvb3QgZGVyaXZhdGl2ZXMgc3VjaCBhcyB1Ym9vdC10b29scykgdGhlIHBr
Y3MxMSBzdXBwb3J0CmlzIGFkZGVkIHVuY29uZGl0aW9uYWxseSB0byBob3N0LWdudXRscy4KCkxp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS91LWJvb3QvdS1ib290L2NvbW1pdC8wYzcxNmExNTdiZTQ2
MDAwNmE0Yjc2MjYyNWRlMzI5YjVlMzZkYmY5IFsxXQpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0
ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Ci0tLQogcGFja2FnZS9nbnV0bHMvZ251dGxz
Lm1rIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dudXRscy9nbnV0bHMubWsgYi9wYWNrYWdlL2du
dXRscy9nbnV0bHMubWsKaW5kZXggNjQxMWE3ZDYyMS4uYWUxY2FhYTIyMSAxMDA2NDQKLS0tIGEv
cGFja2FnZS9nbnV0bHMvZ251dGxzLm1rCisrKyBiL3BhY2thZ2UvZ251dGxzL2dudXRscy5tawpA
QCAtNDMsNyArNDMsOCBAQCBHTlVUTFNfQ09ORl9FTlYgPSBnbF9jdl9zb2NrZXRfaXB2Nj15ZXMg
XAogCWdsX2N2X2Z1bmNfZ2V0dGltZW9mZGF5X2Nsb2JiZXI9bm8KIEdOVVRMU19JTlNUQUxMX1NU
QUdJTkcgPSBZRVMKIAotSE9TVF9HTlVUTFNfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGhv
c3QtbGlidGFzbjEgaG9zdC1saWJ1bmlzdHJpbmcgaG9zdC1uZXR0bGUKK0hPU1RfR05VVExTX0RF
UEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBob3N0LWxpYnRhc24xIGhvc3QtbGlidW5pc3RyaW5n
IFwKKwlob3N0LW5ldHRsZSBob3N0LXAxMS1raXQKIEhPU1RfR05VVExTX0NPTkZfT1BUUyA9IFwK
IAktLWRpc2FibGUtZG9jIFwKIAktLWRpc2FibGUtbGliZGFuZSBcCkBAIC02NCw3ICs2NSw3IEBA
IEhPU1RfR05VVExTX0NPTkZfT1BUUyA9IFwKIAktLWRpc2FibGUtb3BlbnNzbC1jb21wYXRpYmls
aXR5IFwKIAktLXdpdGhvdXQtYnJvdGxpIFwKIAktLXdpdGhvdXQtaWRuIFwKLQktLXdpdGhvdXQt
cDExLWtpdCBcCisJLS13aXRoLXAxMS1raXQgXAogCS0td2l0aG91dC16bGliIFwKIAktLXdpdGhv
dXQtenN0ZAogCgotLSAKMi41My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
