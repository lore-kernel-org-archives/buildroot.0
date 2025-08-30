Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE764CA0FFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 15:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D504806B3;
	Sat, 30 Aug 2025 15:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nD6UCROGMjDw; Sat, 30 Aug 2025 15:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A79CD8136F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A79CD8136F;
	Sat, 30 Aug 2025 15:19:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D282DFA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 15:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C415D408B6
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 15:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuSTN4iyFlhV for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 15:19:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D2A040815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D2A040815
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D2A040815
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 15:19:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0E2C7780520;
 Sat, 30 Aug 2025 17:19:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 30 Aug 2025 17:19:08 +0200
MIME-Version: 1.0
Date: Sat, 30 Aug 2025 17:19:08 +0200
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250828122306.2223870-1-vincent.stehle@arm.com>
References: <20250828122306.2223870-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <694087008024af3425f49b3c4f2d1208@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756567151;
 bh=IoYdV8Uwi+mgdscVTZyUC7MUvvab6hetWT9mlTGpFTs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vEqPG4mumEGVgJ8z0Cv8tJ2sxcMo620WLUh6n/yWGlEKxKlRlwh4T9KQHCvvkYfHf
 9kiae0R2zunGPjuai1kgR7DP+5ONp9vM3iu2qEDCL/GAq99Fz8dmq/dt2Uc6CWbYjD
 K2FO4L9x48mgp2ED0mOXjVprln1bFViNVre9tDEs6p7IxYaK+ortyK4hNVJw7XTjzi
 KKSRhW1e314avEXP5bPBJjFyFTp3LzzzSdsJUPbzb6nTgoJbTfxLcdcHdtSGczKZiu
 d9DU2MuwwD0LRfUbNjevfqJtaLc8Sabnn+YMrnEobtXMatsv7cXS1jZfTfFkeoGDwW
 I+V63reX/jsug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vEqPG4mu
Subject: Re: [Buildroot] [PATCH] configs/qemu_{arm,
 aarch64}_ebbr: linux needs host python3
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

T24gMjgvMDgvMjAyNSAxNDoyMywgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFN0YXJ0aW5nIHdp
dGggTGludXggNi4xMCwgdGhlIGFybSBhbmQgYXJtNjQgYXJjaGl0ZWN0dXJlIGRlZmNvbmZpZ3Mg
Cj4gbmVlZAo+IHB5dGhvbjMgdG8gYnVpbGQuIFsxXQo+IAo+IEFkZCB0aGUgbWlzc2luZyBkZXBl
bmRlbmNpZXMgdG8gZml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3I6Cj4gCj4gICAvYmluL3No
OiAxOiBweXRob24zOiBub3QgZm91bmQKPiAgIG1ha2VbN106ICoqKiBbZHJpdmVycy9ncHUvZHJt
L21zbS9NYWtlZmlsZToxODI6IAo+IGRyaXZlcnMvZ3B1L2RybS9tc20vZ2VuZXJhdGVkL2EyeHgu
eG1sLmhdIEVycm9yIDEyNwo+IAo+IFsxXSAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9oPTBmZGRkMDQ1
Zjg4ZTM0ZDYxNjA3ODVhM2E1ZTUwNmQzNzQ1NjY0NTQKPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5j
ZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gQ2M6IFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpJIHJl
d29yZGVkIHRoZSBjb21taXQgbG9nIHRvIGluY2x1ZGUgdGhlIGNvbW1pdCBpbnRyb2R1Y2luZwp0
aGUgaXNzdWUuIEkgYWxzbyBhcHBsaWVkIHRoZSBzYW1lIGZpeCB0bwpxZW11X2FhcmNoNjRfc2Jz
YV9kZWZjb25maWcgd2hpY2ggd2FzIHN1YmplY3QgdG8gdGhlIHNhbWUgaXNzdWUuClNlZToKaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzYwMDE2MDE1
NDRlY2ViMjYzMTg3YWE0NDY2MjJjZmViZGM2NjhlZTMKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
