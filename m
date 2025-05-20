Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6D9C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C204140B59;
	Tue, 20 May 2025 17:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N--0JBZdel23; Tue, 20 May 2025 17:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03B2040B18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03B2040B18;
	Tue, 20 May 2025 17:43:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BFC9D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 998C44015F
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GZ8V6QKYpXD for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B2CF40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B2CF40153
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B2CF40153
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:43:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D12B1B00579;
 Tue, 20 May 2025 19:43:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:43:16 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:43:16 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Julien Grossholtz
 <julien.grossholtz@openest.io>, Martin Bark <martin@barkynet.com>
In-Reply-To: <20250520155946.622481-1-gael.portay+rtone@gmail.com>
References: <20250520155946.622481-1-gael.portay+rtone@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ef6700dd0b8780c7e5d73b300f3e2ede@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747763001;
 bh=vJATT6je1pgEdKYyn1bKzwRoZZHHtTIe6RQKcjxNS7k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Je6BnEyI9M09+nNcDVAte2oArxIAOJ8aufsYRaAjyc69cMR83hYobh+X941VMQxlN
 WUosZissdQTVQ9zqcU0zHjoHnpnHveUdZj5IVoHZnXArKFbUUffaLgyaNfbe7d7/O7
 Q19vNtzCpmL4naTTW+JJZR+jeNFuDVij00iPqbrcPs8FjsnbVLLh70ZtQ1xEi0D2LO
 PSnJgWdjrv1Bg/tapjuhvvHAXLXPNFE4+wPsmOe5Ra4p7uKK1hnEkaHKlIiYpJiaww
 4Vefw84LPV94SOnvbad1Yyh+h64qp3Oe8Qt3DEgIGWSAIfm4J99nyXf0NhNtsXFnG5
 Z7XaoPKli2Uxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Je6BnEyI
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/raspberrypicm5io: new
 defconfig
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAvMDUvMjAyNSAxNzo1OSwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFRoaXMgY29uZmlndXJh
dGlvbiBidWlsZHMgYW4gaW1hZ2UgZm9yIHRoZSBDb21wdXRlIE1vZHVsZSA1IElPIEJvYXJkLgo+
IAo+IE5vdGU6IFVubGlrZSB0aGUgUmFzcGJlcnJ5IFBpIDUgYW5kIGl0cyBkZWRpY2F0ZWQgZGVi
dWcgdWFydCBjb25uZWN0b3IsCj4gdGhlIGtlcm5lbCBjb25zb2xlIG9uIENvbXB1dGUgTW9kdWxl
IDUgSU8gQm9hcmQgaXMgYmFjayB0byBVQVJUMAo+ICh0dHlBTUEwKSBvbiBQSU44IChHUElPMTQs
IFRYLCB5ZWxsb3cpIGFuZCBQSU4xMCAoR1BJTzE1LCBSWCwgb3JhbmdlKSAKPiBvbgo+IHRoZSA0
MC1waW4gaGVhZGVyLCBhcyB0aGUgZm9ybWVyIHZlcnNpb24gb2YgdGhlIFJhc3BiZXJyeSBQaS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWls
LmNvbT4KCkFwcGxpZWQgdG8gbmV4dCwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
