Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FB8CD6E5D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 09:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EB8581D3D;
	Fri,  5 Jun 2026 09:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWBabpi7NYen; Fri,  5 Jun 2026 09:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 560BA81D24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780653164;
	bh=y97gIPEEwsDqhqpaQgMnIAuE4cYIZeXOJHowmAyNnjs=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=creZTSJ91u/ucXhIPSca/3USwTrWDlC8pn+miM9CBqIP7dMhElh6yW/q9ddI7aERD
	 9IKQv1ZRVWcRbLbvcI+fKjniRjakMdwSsL41gW/uFgb05t0SfAFeNFttz8Qymn/wHg
	 SwXpw3U6nOtur4/5s/TlpGbYBvf+eXBiBTTdOo30bvIf/CqILRpx44rCMqCyImqRDr
	 wrdZJatx+cFFZdXKSp7PR8MF3F8eODnzSHULgi+vQLwwuznBIGDMKtSmKELEhk7Urm
	 m3MvH5lY43pt3bMHv4qOByMeai7YjdkKFEQ5tdhMj8Py8smQ1D5/wr59CSFdNlSVYh
	 L8HR56n5nlsoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 560BA81D24;
	Fri,  5 Jun 2026 09:52:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C5FA49B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 09:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD1E240334
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 09:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AR3Plpl1wHV3 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 09:52:40 +0000 (UTC)
X-Greylist: delayed 555 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 05 Jun 2026 09:52:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAED940265
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAED940265
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAED940265
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 09:52:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 053154CDF;
 Fri,  5 Jun 2026 02:43:19 -0700 (PDT)
Received: from [127.0.1.1] (X72Y076X74-2.nice.arm.com [10.34.129.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E3BF3F86F;
 Fri,  5 Jun 2026 02:43:23 -0700 (PDT)
From: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri, 05 Jun 2026 11:43:06 +0200
MIME-Version: 1.0
Message-Id: <20260605-p11-v1-1-f3a206958d94@arm.com>
References: <20260605-p11-v1-0-f3a206958d94@arm.com>
In-Reply-To: <20260605-p11-v1-0-f3a206958d94@arm.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
X-Mailer: b4 0.14.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1780652603; bh=R5lJiHLU8I/awLczxPcg/EZxucV/EhDrgBGs8Oylggs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=uitjTjY0Sinnkc00Gj7X1rNhV4SJQqHGeIJaKyjNcfdls3LNefQslIWZzI76GGq9M
 EUYDXTmnLAvDzz8ZWbVU8ubDT3h0acHFbpeYqm9ORxLADVTOIOfV2QjrnGs+p0nCYC
 sHMeR8/INK/Kyq7sAOt9ThuRXZHpVp76KDa0dvsU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256
 header.s=foss header.b=uitjTjY0
Subject: [Buildroot] [PATCH next 1/2] package/p11-kit: enable host build
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

RW5hYmxlIHRvIGJ1aWxkIHAxMS1raXQgb24gdGhlIGhvc3QuClRoaXMgaXMgdG8gc3VwcG9ydCBl
bmFibGluZyBwa2NzMTEgaW4gaG9zdC1nbnV0bHMuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0
ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KIHBhY2thZ2UvcDExLWtpdC9wMTEta2l0Lm1r
IHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3AxMS1raXQvcDExLWtpdC5tayBiL3BhY2thZ2UvcDExLWtpdC9wMTEta2l0
Lm1rCmluZGV4IDY4YjE4OTQxODMuLjRmNGI3NmQ1NDMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcDEx
LWtpdC9wMTEta2l0Lm1rCisrKyBiL3BhY2thZ2UvcDExLWtpdC9wMTEta2l0Lm1rCkBAIC00NCw0
ICs0NCwxMyBAQCBQMTFfS0lUX0NPTkZfT1BUUyArPSBcCiAJLS13aXRob3V0LWxpYnRhc24xCiBl
bmRpZgogCitIT1NUX1AxMV9LSVRfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mCisKK0hPU1Rf
UDExX0tJVF9DT05GX09QVFMgPSBcCisJLS13aXRob3V0LWxpYmZmaSBcCisJLS13aXRob3V0LXRy
dXN0LXBhdGhzIFwKKwktLWRpc2FibGUtdHJ1c3QtbW9kdWxlIFwKKwktLXdpdGhvdXQtbGlidGFz
bjEKKwogJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQorJChldmFsICQoaG9zdC1hdXRvdG9v
bHMtcGFja2FnZSkpCgotLSAKMi41My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
