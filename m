Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3110C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 17:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C8B80E23;
	Wed, 22 Jul 2026 17:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dylvNAHX6BfO; Wed, 22 Jul 2026 17:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A88080F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784742553;
	bh=09Sd1DkjO0kx/8VfVWUAk+8YVGhNUU4WpjmzItiVD3M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yq6vAmR2xEgglZ+I2mNeIDlQPikIyIK38TMYeMl4xzuOuLVLzQ/XG4yTdcdMKgnRI
	 BT/y/9tEOb2ow1TENdjrvHAyyGE99Lelfsl750XUDudnrhlnXQSlcYMJD/9aAW7VHb
	 kpUnOfI1jbvQ2ZxqBRYXCfU3BvU3BGbdMK28e1yGgfsAPzlvY/jvcFjKyvSgunzJVN
	 pMH69HVxaLY2chV0tx+r6KIpMLNoxOu4qViT7qa6x9fZoIWwzOAItsoHUldqNQmyyv
	 unJcFV1ZofmMFqyb8hD8F4e+FxWQBMdPTOrNoGMIZlhrpckWx6883Jvjd/bXghSTIm
	 jOsZej2uGeT9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A88080F18;
	Wed, 22 Jul 2026 17:49:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C25F224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 027E2607B8
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njPDmrHSaBF7 for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 17:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDE016072C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDE016072C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDE016072C
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 17:49:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A8A4219F59C;
 Wed, 22 Jul 2026 19:48:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jul 2026 19:48:46 +0200
MIME-Version: 1.0
Date: Wed, 22 Jul 2026 19:48:46 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, Petr Vorel
 <petr.vorel@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>, Kurt
 Van Dijck <dev.kurt@vandijck-laurijssen.be>, Grzegorz Blach
 <grzegorz@blach.pl>, =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?=
 <salvador.joseluis@gmail.com>, Philippe Proulx <eeppeliteloop@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Chen Pei <cp0613@linux.alibaba.com>, Sergio
 Prado <sergio.prado@e-labworks.com>, Alistair Francis
 <alistair@alistair23.me>, Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd
 Kuhls <bernd@kuhls.net>, Gao Xiang <hsiangkao@aol.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Etienne Carriere
 <etienne.carriere@foss.st.com>
In-Reply-To: <20260721125337.2537436-2-dario.binacchi@amarulasolutions.com>
References: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
 <20260721125337.2537436-2-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <dfc5d409468f05cd4f3e8350f72aeaaa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784742547;
 bh=N5Lv45vsmGVH+rGy2vKtm+7QVc0DatVfOvHKs6jx/BY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J+qcYAUWpLsN/yoR6E1jX7jJvUR5vGRgaNPaMEeWms1vu3FxNzFXIFATfxsoGwtS4
 vIkPl4RqweEJXN3S7PtqROREqzBQ97rP+ALvssCtInivXfe0EM7XB6r7yQ3QC5jb/P
 +LbPH/WZbuUgC3gck3u5EZAmOOvTn1Ad1eP9b2BT+1Cdv55JyBn4yj1+JmblnhIoIF
 MywELnWdzUYaOiW+q7UKoij2aAMNDjX9xrBi5GCtaCt0uFvWpZ/v2oAmjxNIc4Hst7
 cNFAUktLobJRUSFsilHUNWhxdcF7kZZpwVL4v2EyJcUMWklr9O02JLOIbotNnOQtva
 OGBardip0JrJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J+qcYAUW
Subject: Re: [Buildroot] [PATCH v4 2/3] package/util-linux: libuuid needs MMU
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

SGkgRGFyaW8sIGFsbCwKCk9uIDIxLzA3LzIwMjYgMTQ6NTMsIERhcmlvIEJpbmFjY2hpIHdyb3Rl
Ogo+IFdoZW4gYnVpbGRpbmcgdXRpbC1saW51eCB3aXRoIGxpYnV1aWQgZW5hYmxlZCBvbiBub01N
VSB0YXJnZXRzCj4gKGUuZy4sIGJvb3RsaW4tYXJtdjdtLXVjbGliYyBvciBib290bGluLW02OGst
NTIwOC11Y2xpYmMpLCB0aGUgYnVpbGQKPiBmYWlscyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJyb3I6
Cj4gCj4gbGlidXVpZC9zcmMvZ2VuX3V1aWQuYzogSW4gZnVuY3Rpb24g4oCYdXVpZF9nZW5lcmF0
ZV90aW1lX2dlbmVyaWPigJk6Cj4gbGlidXVpZC9zcmMvZ2VuX3V1aWQuYzo2Mjk6MTc6IGVycm9y
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAKPiDigJhwdGhyZWFkX2F0Zm9ya+KA
mTsgZGlkIHlvdSBtZWFuIOKAmHB0aHJlYWRfam9pbuKAmT8gCj4gWy1XaW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb25dCj4gICA2MjkgfCAgICAgICAgICAgICAgICAgcHRocmVhZF9hdGZvcmso
TlVMTCwgTlVMTCwgcmVzZXRfdXVpZGRfY2FjaGUpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgcHRocmVhZF9qb2luCj4g
Cj4gVGhpcyBoYXBwZW5zIGJlY2F1c2UgcHRocmVhZF9hdGZvcmsoKSBpcyBub3QgYXZhaWxhYmxl
IG9uIG5vTU1VCj4gY29uZmlndXJhdGlvbnMgYXMgcmVwb3J0ZWQgYnkgY29tbWl0IDU5ZmU3NTQ3
YTQ5NSAoInBhY2thZ2UvbGliY2FwLW5nOgo+IGRpc2FibGUgcHRocmVhZCBzdXBwb3J0IG9uIG5v
bW11IikuCj4gCj4gRml4IHRoaXMgYnkgYWRkaW5nIGEgZGVwZW5kZW5jeSBvbiBCUjJfVVNFX01N
VSB0byBsaWJ1dWlkLiBBcyBhCj4gY29uc2VxdWVuY2UsIGFsc28gcHJvcGFnYXRlIHRoZSBCUjJf
VVNFX01NVSBkZXBlbmRlbmN5IHRvIGFsbCBwYWNrYWdlcwo+IHNlbGVjdGluZyBCUjJfUEFDS0FH
RV9VVElMX0xJTlVYX0xJQlVVSUQgdG8gcHJldmVudCAidW5tZXQgZGlyZWN0Cj4gZGVwZW5kZW5j
aWVzIiBLY29uZmlnIGVycm9ycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpJIHNlZSB3ZSBmaXhlZCB0aGlz
IGtpbmQgb2YgaXNzdWUgaW4gdGhlIHBhc3QsIGluIGNvbW1pdDoKaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0Lzg0ODljYjA5MzJiNmNhMDAxMDRkYWIz
YmQ1NGU3NmQxYmNmNmM2NWMKCkJ1dCBhcHBhcmVudGx5LCB0aGUgZmFpbGluZyB0b29sY2hhaW5z
IGluY2x1ZGUgYSBsaWJwdGhyZWFkIHdoaWNoCmdldHMgZGV0ZWN0ZWQgYnkgdXRpbC1saW51eCBj
b25maWd1cmUgc2NyaXB0LiBJJ20gbm90IHN1cmUgd2hlbiB0aGlzCmJyb2tlIGFnYWluLgoKVGhl
cmUgd2FzIHRoaXMgcHJvcG9zYWwgdG9vOgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjYwNDI2MTAyMjE1LjMxMDAwNDMtMS1iZXJuZEBrdWhs
cy5uZXQvCgpCdXQgSSdkIHByZWZlciB0byBub3QgaW5jbHVkZSB0aGlzIHBhdGNoIGFuZCB0cnkg
dG8gbWFrZSBsaWJ1dWlkCndvcmsgb24gbm9NTVUsIHNpbmNlIHVwc3RyZWFtIGlzIHN1cHBvc2Vk
IHRvIHN1cHBvcnQgaXQuIFdlIGNhbiBmaXgKdXRpbC1saW51eCB0aGlzIGluIGFub3RoZXIgcGF0
Y2guCgpUaGUgcmVzdCBvZiB0aGUgc2VyaWVzIGxvb2tzIGdvb2QsIHNvIEkgbWlnaHQganVzdCBy
ZW1vdmUgdGhlCkJSMl9VU0VfTU1VIGRlcGVuZGVuY3kgd2hlbiBhcHBseWluZy4KCkJlc3QgcmVn
YXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
