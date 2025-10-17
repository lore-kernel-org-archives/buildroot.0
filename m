Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039A1CCD184
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 06:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A7A40A6A;
	Fri, 17 Oct 2025 06:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zU9Pua5d1snj; Fri, 17 Oct 2025 06:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 097AB40A5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 097AB40A5E;
	Fri, 17 Oct 2025 06:47:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F06281EB1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 06:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E16E960B96
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 06:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xoZpkaN9Pw7w for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 06:47:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FE6660B94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FE6660B94
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FE6660B94
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 06:47:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4D8A4C041DB
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 06:46:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8BDA3606DB;
 Fri, 17 Oct 2025 06:46:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 53693102F2329; 
 Fri, 17 Oct 2025 08:46:58 +0200 (CEST)
Date: Fri, 17 Oct 2025 08:46:57 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 nicolas.carrier@nav-timing.safrangroup.com
Message-ID: <20251017084657.21b8d34b@windsurf>
In-Reply-To: <20251016-libldns_drill-v1-2-21bfa8c53896@bootlin.com>
References: <20251016-libldns_drill-v1-0-21bfa8c53896@bootlin.com>
 <20251016-libldns_drill-v1-2-21bfa8c53896@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760683619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OA1vOoFXpms0YMqEy7tuKzZMgqic9COT7apLFz9vA8g=;
 b=WVW6pEwle2Si6L3B38a3ph4ooNoko+QcOH2gIcEdJ2pk7DxHdZzV0IMWivkNsXh08se9Zn
 hBgCmjzYsqA46CAGaf+iMpqi0a3aifX7GT+OGcAZlE2sVL0a+MZy04mPAxn7Xan9+osGpu
 XqRFUVmtAc5Ac++QebRujGSjayshPzlO3Ou4999eBReElc8mOl1jV2f+OC1T+3VCIJP1Ee
 8eeFYZNefLLEB2IrpLWcA5oHG0rXXyjNknfgwcrF1hjhonG68f77PmSspJK4ZkVAaUNbMu
 OaJVP2iZC7BYjUTVCxGVzYpyfjC37N0604pwajem2+yJlClFPQjGTEPW7v9hEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=WVW6pEwl
Subject: Re: [Buildroot] [PATCH RESEND 2/2] support/testing: add basic
 runtime test for libldns/drill
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsIDE2IE9jdCAyMDI1IDE3OjI3OjAzICswMjAwCkFsZXhpcyBMb3Rob3LD
qSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBBZGQgYSBzaW1wbGUgdGVz
dCBlbnN1cmluZyB0aGF0Cj4gLSBsaWJsZG5zIGlzIGNvcnJlY3RseSBidWlsdCBhbmQgaW5zdGFs
bGVkCj4gLSBkcmlsbCBpcyBjb3JyZWN0bHkgYnVpbHQgYW5kIGluc3RhbGxlZAo+IC0gZHJpbGwg
aXMgYWJsZSB0byBleGVjdXRlIG9uIHRoZSB0YXJnZXQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKUmV2aWV3ZWQtYnk6IFRo
b21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgotLSAKVGhvbWFz
IFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
