Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D9EC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E921405BB;
	Thu, 12 Jun 2025 20:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oigy85t_Lagj; Thu, 12 Jun 2025 20:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABDA24056F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDA24056F;
	Thu, 12 Jun 2025 20:05:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A0F41BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E4EE4067B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQignDyheERy for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:04:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 809D640456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 809D640456
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 809D640456
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:04:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 68AEB1C1064; Thu, 12 Jun 2025 22:04:56 +0200 (CEST)
Message-ID: <6e5c2176-bc36-4b06-926c-3a525b1e1759@rnout.be>
Date: Thu, 12 Jun 2025 22:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20250303161557.571619-1-alex.bennee@linaro.org>
 <20250303161557.571619-2-alex.bennee@linaro.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250303161557.571619-2-alex.bennee@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CZ8wyiDjk6P8NUx1dMeN6UM7vny6yruqNbd9GWUn8xE=;
 b=VLLfsvd01nWY5MeptCQR98ym9A6hSWgln7Gv9eBVcV5y6wxIzBjhLU8GH8J/xPsIS3vhdm
 RRRVRSCcogVos2K4lYCuS+nB9dIQW4GUjsyPuExAq/pVK8LusTrvldar/SSxfvftpZqX8L
 DEBTBxHV+1jzq0Rk2Qcf39cRMq2z+rHnne3kMZ3nxLj0KVGcJeEFLzNSnOowRseZWZSllF
 ZBU8bmjlaHiLdzRHqRF9A8lJJ1tOoVdpAnYd1/z9vnS4Z83BRr+gqP7INLGRZYfn0KhGvT
 0k6FDhz9fW6pb2O/PC8n3/5MLIp0NlF810qLSovxY8yQATqx4hwCKePYM+0iNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VLLfsvd0
Subject: Re: [Buildroot] [PATCH v4 1/6] testing: drop unneeded vga/vnc
 stanzas from QEMU invocation
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wMy8yMDI1IDE3OjE1LCBBbGV4IEJlbm7DqWUgd3JvdGU6Cj4gVGhlIGFhcmNoNjQg
dmlydCBwbGF0Zm9ybSBkb2Vzbid0IGhhdmUgYW55IGRlZmF1bHQgVkdBIGRldmljZXMgc28gd2UK
PiBkb24ndCBuZWVkIHRvIGNvbmZpZ3VyZSB0aGVtIGhlcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKICBBcHBsaWVkIHRvIDIwMjUu
MDIueCwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIHN1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZmx1dHRlci5weSB8IDIgLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X2ZsdXR0ZXIucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X2ZsdXR0ZXIucHkKPiBpbmRleCBlNDA0MGNhN2RjLi4xOTQwNmI3Y2IxIDEwMDY0NAo+
IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZmx1dHRlci5weQo+ICsr
KyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZmx1dHRlci5weQo+IEBAIC00
OCw4ICs0OCw2IEBAIGNsYXNzIFRlc3RGbHV0dGVyKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCwgR3Jh
cGhpY3NCYXNlKToKPiAgICAgICAgICAgICAgICAgICAgICAgICItY3B1IiwgImNvcnRleC1hNTci
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgIi1tIiwgIjUxMk0iLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIi1zbXAiLCAiNCIsCj4gLSAgICAgICAgICAgICAgICAgICAgICItdmdhIiwgInN0
ZCIsCj4gLSAgICAgICAgICAgICAgICAgICAgICItdm5jIiwgIm5vbmUiLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIi1kcml2ZSIsIGYiZmlsZT17aW1nfSxpZj12aXJ0aW8sZm9ybWF0PXJhdyJd
KQo+ICAgICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKPiAgIAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
