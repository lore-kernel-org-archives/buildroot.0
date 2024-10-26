Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96838D10BF0
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 10:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAEC740947;
	Sat, 26 Oct 2024 10:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wBMeP60v0bG; Sat, 26 Oct 2024 10:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5085F40873
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5085F40873;
	Sat, 26 Oct 2024 10:00:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D2532318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CAF581FC6
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWguK84WZmxU for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 10:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0715C81FBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0715C81FBE
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0715C81FBE
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:00:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d4ac91d97so2252623f8f.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 03:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729936801; x=1730541601;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VbdruiLOHeCnpsLOGBt2WXipBcef8dynQfHxziVys3g=;
 b=s4M2PxH+QibBq06OXZlvB0KwuMDllEBG1aWC2o/HwyqvGrsWUczHkFdoMuG35rWx6b
 JalwKjNx6t3+NEF/mHK/zL9WqpQ6Upi0yA1QMGcrRlPigxfZRXroi8TAHRJafAiHR5N9
 P7sbsUmhFMcGNpY6y+8Ek/onGsYCvoW++pSxtM1AXYJRPJucHtXD5sKvHitchsAGnTgl
 5dYuNnRrWTfvpss5eXgdaT6kY4UYElIT+FZHnVscxH3BbqCs1+WCriG7zrTVb9bkNnpJ
 1p3vOZ27hGiF5H7D7vo5cMmJAeYnrFegQhSKKG8GRcJPETUA9ArYu2fKq+CRl1rbiLiP
 oLFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1vx1aFUz+nmcXuO1i68QSdMS87Z9n1oM+vonB7z6CSI8wj7pMIHBfMk6rLQ1uhUELO+BE+ETNarc=@buildroot.org
X-Gm-Message-State: AOJu0YxkLhSt9Y936Eva/mDKUUbs7kxEEL2QSr28rDVAf7ejjCeo9cs/
 a1rGYFwC/dYVCdKVwzk7i5lKT/43NDQdcaIB8BW8/+2E27a9r53dv8FcvFHhq70=
X-Google-Smtp-Source: AGHT+IHHgnBsYwCEudzO83lmN59CF7y/VfZ9w3FW3KtQRR387YhJyzDW3bZbjmO6lQJ0P2a/BmyJnw==
X-Received: by 2002:a5d:4292:0:b0:37d:52fc:edf9 with SMTP id
 ffacd0b85a97d-38061173237mr1682258f8f.20.1729936800659; 
 Sat, 26 Oct 2024 03:00:00 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b70f25sm3916312f8f.67.2024.10.26.03.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2024 03:00:00 -0700 (PDT)
Message-ID: <6d864249-c442-454b-8242-3fc79b09ab8c@smile.fr>
Date: Sat, 26 Oct 2024 11:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Zuk8u8Ja5KMX9Pvw@waldemar-brodkorb.de>
 <e117b332-3c34-4079-99c8-8e59097c956b@smile.fr>
 <9bc95d4b-0224-42b8-93e1-447e02808433@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <9bc95d4b-0224-42b8-93e1-447e02808433@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1729936801; x=1730541601; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VbdruiLOHeCnpsLOGBt2WXipBcef8dynQfHxziVys3g=;
 b=y/IVeeTOOU95s0KVYNvtkuNsC4fG6/Efr4+eYUiFnFuuY9/i01mf76akGTHjB+1Lmb
 TMFtHVozit2WYotYRgrb46n7ur8JGsUB8KPin8aoC5dYgaRZSDIBv6YotK/A9RjjiyYP
 Lo6wK15ddg4I+8dcl40bIA/8Fq4BHzNLoBSBc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=y/IVeeTO
Subject: Re: [Buildroot] [PATCH v2 1/3] qemu: fixup riscv32/64 bootup with
 Qemu 9.1.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gV2FsZGVtYXIsIEFsbCwKCkxlIDI2LzEwLzIwMjQgw6AgMTE6NDYsIFJvbWFpbiBOYW91
ciBhIMOpY3JpdMKgOgo+IEhlbGxvIFdhbGRlbWFyLCBBbGwsCj4gCj4gTGUgMjUvMTAvMjAyNCDD
oCAyMzozMCwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4+IEhlbGxvIFdhbGRlbWFyLCBBbGws
Cj4+Cj4+IExlIDE3LzA5LzIwMjQgw6AgMTA6MjQsIFdhbGRlbWFyIEJyb2Rrb3JiIGEgw6ljcml0
wqA6Cj4+PiBTaWduZWQtb2ZmLWJ5OiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5hZGsub3Jn
Pgo+Pj4gLS0tCj4+PiB2MS0+djI6Cj4+PiAgLSBuZXcgcGF0Y2gsIGZvdW5kIHZpYSBHaXRsYWIg
YXV0b21hdGljIHRlc3RpbmcKPj4KPj4gV2hhdCB3YXMgdGhlIGlzc3VlIHlvdSBub3RpY2VkPwo+
PiBXaHkvaG93IGFkZGluZyBpZj1ub25lIGZpeCB0aGUgYm9vdCBpc3N1ZT8KPiAKPiBTZWUgdGhl
IGZvbGxvd2luZyBjb21taXQgZnJvbSBRZW11IDkuMToKPiAKPiBody9yaXNjdi92aXJ0LmM6IE1h
a2UgYmxvY2sgZGV2aWNlcyBkZWZhdWx0IHRvIHZpcnRpbwo+IAo+IFJJU0MtViB2aXJ0IGlzIGN1
cnJlbnRseSBtaXNzaW5nIGRlZmF1bHQgdHlwZSBmb3IgYmxvY2sgZGV2aWNlcy4gV2l0aG91dAo+
IHRoaXMgYmVpbmcgc2V0LCBwcm9wZXIgYmFja2VuZCBpcyBub3QgY3JlYXRlZCB3aGVuIG9wdGlv
biBsaWtlIC1jZHJvbQo+IGlzIHVzZWQuIFNvLCBtYWtlIHRoZSB2aXJ0IGJvYXJkJ3MgZGVmYXVs
dCBibG9jayBkZXZpY2UgdHlwZSBiZQo+IElGX1ZJUlRJTyBzaW1pbGFyIHRvIG90aGVyIGFyY2hp
dGVjdHVyZXMuCj4gCj4gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vY29t
bWl0LzQ0MDZiYTJiNWVmY2U2YWY2NDkwNWY4MjdjYTI0NGY2OTlkYjgxNzAKPiAKPiBJdCBtZWFu
cyB3ZSBubyBsb25nZXIgbmVlZCAiLWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1oZDAi
IG9uIHRoZSBxZW11Cj4gY29tbWFuZCBsaW5lLCBzbyAiaWY9bm9uZSIgaXMgbm90IG5lZWRlZC4K
PiAKPiBUZXN0ZWQgbG9jYWxseSB3aXRoIG9ubHk6Cj4gCj4gcWVtdS1zeXN0ZW0tcmlzY3Y2NCAt
TSB2aXJ0IC1iaW9zIGZ3X2p1bXAuZWxmIC1rZXJuZWwgSW1hZ2UgLWFwcGVuZCByb290d2FpdAo+
IHJvb3Q9L2Rldi92ZGEgcm8gLWRyaXZlIGZpbGU9cm9vdGZzLmV4dDIsZm9ybWF0PXJhdyAtbmV0
ZGV2IHVzZXIsaWQ9bmV0MCAtZGV2aWNlCj4gdmlydGlvLW5ldC1kZXZpY2UsbmV0ZGV2PW5ldDAg
LW5vZ3JhcGhpYwoKT2J2aW91c2x5LCBpdCB3aWxsIG5vdCB3b3JrIHdpdGggb25seSBwYXRjaCAx
LzMgYXBwbGllZCAodXNpbmcgcWVtdSA5LjApLgoKU28gYWRkaW5nICJpZj1ub25lIiBpcyBmaW5l
IGJlZm9yZSB0aGUgcWVtdSB2ZXJzaW9uIGJ1bXAgYW5kIHdlIHdlIGNhbiBhZGQgYQpmb2xsb3dp
bmcgcGF0Y2ggcmVtb3ZpbmcgIi1kZXZpY2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIiBh
ZnRlciB0aGUgcWVtdQp2ZXJzaW9uIGJ1bXAuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4g
QmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IFJvbWFp
bgo+Pgo+Pgo+Pj4gLS0tCj4+PiAgYm9hcmQvcWVtdS9yaXNjdjMyLXZpcnQvcmVhZG1lLnR4dCAg
ICAgfCA0ICsrLS0KPj4+ICBib2FyZC9xZW11L3Jpc2N2NjQtdmlydC1lZmkvcmVhZG1lLnR4dCB8
IDIgKy0KPj4+ICBib2FyZC9xZW11L3Jpc2N2NjQtdmlydC9yZWFkbWUudHh0ICAgICB8IDQgKyst
LQo+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9ib2FyZC9xZW11L3Jpc2N2MzItdmlydC9yZWFkbWUudHh0IGIv
Ym9hcmQvcWVtdS9yaXNjdjMyLXZpcnQvcmVhZG1lLnR4dAo+Pj4gaW5kZXggNTU1OTI0Zjk0OS4u
MDQ4MzA2Y2Q1NCAxMDA2NDQKPj4+IC0tLSBhL2JvYXJkL3FlbXUvcmlzY3YzMi12aXJ0L3JlYWRt
ZS50eHQKPj4+ICsrKyBiL2JvYXJkL3FlbXUvcmlzY3YzMi12aXJ0L3JlYWRtZS50eHQKPj4+IEBA
IC0xLDcgKzEsNyBAQAo+Pj4gIFJ1biBMaW51eCBpbiBlbXVsYXRpb24gd2l0aDoKPj4+ICAKPj4+
IC0gIHFlbXUtc3lzdGVtLXJpc2N2MzIgLU0gdmlydCAtYmlvcyBvdXRwdXQvaW1hZ2VzL2Z3X2p1
bXAuZWxmIC1rZXJuZWwgb3V0cHV0L2ltYWdlcy9JbWFnZSAtYXBwZW5kICJyb290d2FpdCByb290
PS9kZXYvdmRhIHJvIiAtZHJpdmUgZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGZvcm1h
dD1yYXcsaWQ9aGQwIC1kZXZpY2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIC1uZXRkZXYg
dXNlcixpZD1uZXQwIC1kZXZpY2UgdmlydGlvLW5ldC1kZXZpY2UsbmV0ZGV2PW5ldDAgLW5vZ3Jh
cGhpYyAjIHFlbXVfcmlzY3YzMl92aXJ0X2RlZmNvbmZpZwo+Pj4gKyAgcWVtdS1zeXN0ZW0tcmlz
Y3YzMiAtTSB2aXJ0IC1iaW9zIG91dHB1dC9pbWFnZXMvZndfanVtcC5lbGYgLWtlcm5lbCBvdXRw
dXQvaW1hZ2VzL0ltYWdlIC1hcHBlbmQgInJvb3R3YWl0IHJvb3Q9L2Rldi92ZGEgcm8iIC1kcml2
ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsZm9ybWF0PXJhdyxpZD1oZDAsaWY9bm9u
ZSAtZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWhkMCAtbmV0ZGV2IHVzZXIsaWQ9bmV0
MCAtZGV2aWNlIHZpcnRpby1uZXQtZGV2aWNlLG5ldGRldj1uZXQwIC1ub2dyYXBoaWMgIyBxZW11
X3Jpc2N2MzJfdmlydF9kZWZjb25maWcKPj4+ICAKPj4+IC0gIHFlbXUtc3lzdGVtLXJpc2N2MzIg
LU0gdmlydCAtYmlvcyBub25lIC1rZXJuZWwgb3V0cHV0L2ltYWdlcy9JbWFnZSAtYXBwZW5kICJy
b290d2FpdCByb290PS9kZXYvdmRhIHJvIiAtZHJpdmUgZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rm
cy5leHQyLGZvcm1hdD1yYXcsaWQ9aGQwIC1kZXZpY2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9
aGQwIC1ub2dyYXBoaWMgLWNwdSBydjMyLG1tdT1vZmYgLW5ldGRldiB1c2VyLGlkPWV0aDAgLWRl
dmljZSB2aXJ0aW8tbmV0LWRldmljZSxuZXRkZXY9ZXRoMCAjIHFlbXVfcmlzY3YzMl9ub21tdV92
aXJ0X2RlZmNvbmZpZwo+Pj4gKyAgcWVtdS1zeXN0ZW0tcmlzY3YzMiAtTSB2aXJ0IC1iaW9zIG5v
bmUgLWtlcm5lbCBvdXRwdXQvaW1hZ2VzL0ltYWdlIC1hcHBlbmQgInJvb3R3YWl0IHJvb3Q9L2Rl
di92ZGEgcm8iIC1kcml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsZm9ybWF0PXJh
dyxpZD1oZDAsaWY9bm9uZSAtZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWhkMCAtbm9n
cmFwaGljIC1jcHUgcnYzMixtbXU9b2ZmIC1uZXRkZXYgdXNlcixpZD1ldGgwIC1kZXZpY2Ugdmly
dGlvLW5ldC1kZXZpY2UsbmV0ZGV2PWV0aDAgIyBxZW11X3Jpc2N2MzJfbm9tbXVfdmlydF9kZWZj
b25maWcKPj4+ICAKPj4+ICBUaGUgbG9naW4gcHJvbXB0IHdpbGwgYXBwZWFyIGluIHRoZSB0ZXJt
aW5hbCB0aGF0IHN0YXJ0ZWQgUWVtdS4KPj4+IGRpZmYgLS1naXQgYS9ib2FyZC9xZW11L3Jpc2N2
NjQtdmlydC1lZmkvcmVhZG1lLnR4dCBiL2JvYXJkL3FlbXUvcmlzY3Y2NC12aXJ0LWVmaS9yZWFk
bWUudHh0Cj4+PiBpbmRleCA2Yjk2NTFhMDExLi5jN2IzMTc3YWYxIDEwMDY0NAo+Pj4gLS0tIGEv
Ym9hcmQvcWVtdS9yaXNjdjY0LXZpcnQtZWZpL3JlYWRtZS50eHQKPj4+ICsrKyBiL2JvYXJkL3Fl
bXUvcmlzY3Y2NC12aXJ0LWVmaS9yZWFkbWUudHh0Cj4+PiBAQCAtMjIsNyArMjIsNyBAQCBSdW4g
dGhlIGVtdWxhdGlvbiB3aXRoOgo+Pj4gICAgICAgICAgLWJsb2NrZGV2IG5vZGUtbmFtZT1wZmxh
c2gwLGRyaXZlcj1maWxlLHJlYWQtb25seT1vbixmaWxlbmFtZT1vdXRwdXQvaW1hZ2VzL1JJU0NW
X1ZJUlRfQ09ERS5mZCBcCj4+PiAgICAgICAgICAtYmxvY2tkZXYgbm9kZS1uYW1lPXBmbGFzaDEs
ZHJpdmVyPWZpbGUsZmlsZW5hbWU9b3V0cHV0L2ltYWdlcy9SSVNDVl9WSVJUX1ZBUlMuZmQgXAo+
Pj4gICAgICAgICAgXAo+Pj4gLSAgICAgICAgLWRyaXZlIGZpbGU9b3V0cHV0L2ltYWdlcy9kaXNr
LmltZyxmb3JtYXQ9cmF3LGlkPWhkMCBcCj4+PiArICAgICAgICAtZHJpdmUgZmlsZT1vdXRwdXQv
aW1hZ2VzL2Rpc2suaW1nLGZvcm1hdD1yYXcsaWQ9aGQwLGlmPW5vbmUgXAo+Pj4gICAgICAgICAg
LWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1oZDAgXAo+Pj4gICAgICAgICAgXAo+Pj4g
ICAgICAgICAgLW5ldGRldiB1c2VyLGlkPW5ldDAgXAo+Pj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Fl
bXUvcmlzY3Y2NC12aXJ0L3JlYWRtZS50eHQgYi9ib2FyZC9xZW11L3Jpc2N2NjQtdmlydC9yZWFk
bWUudHh0Cj4+PiBpbmRleCBmMWM3YmY0MWI1Li41YjNiYjg1YjRiIDEwMDY0NAo+Pj4gLS0tIGEv
Ym9hcmQvcWVtdS9yaXNjdjY0LXZpcnQvcmVhZG1lLnR4dAo+Pj4gKysrIGIvYm9hcmQvcWVtdS9y
aXNjdjY0LXZpcnQvcmVhZG1lLnR4dAo+Pj4gQEAgLTEsNyArMSw3IEBACj4+PiAgUnVuIExpbnV4
IGluIGVtdWxhdGlvbiB3aXRoOgo+Pj4gIAo+Pj4gLSAgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtTSB2
aXJ0IC1iaW9zIG91dHB1dC9pbWFnZXMvZndfanVtcC5lbGYgLWtlcm5lbCBvdXRwdXQvaW1hZ2Vz
L0ltYWdlIC1hcHBlbmQgInJvb3R3YWl0IHJvb3Q9L2Rldi92ZGEgcm8iIC1kcml2ZSBmaWxlPW91
dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsZm9ybWF0PXJhdyxpZD1oZDAgLWRldmljZSB2aXJ0aW8t
YmxrLWRldmljZSxkcml2ZT1oZDAgLW5ldGRldiB1c2VyLGlkPW5ldDAgLWRldmljZSB2aXJ0aW8t
bmV0LWRldmljZSxuZXRkZXY9bmV0MCAtbm9ncmFwaGljICMgcWVtdV9yaXNjdjY0X3ZpcnRfZGVm
Y29uZmlnCj4+PiArICBxZW11LXN5c3RlbS1yaXNjdjY0IC1NIHZpcnQgLWJpb3Mgb3V0cHV0L2lt
YWdlcy9md19qdW1wLmVsZiAta2VybmVsIG91dHB1dC9pbWFnZXMvSW1hZ2UgLWFwcGVuZCAicm9v
dHdhaXQgcm9vdD0vZGV2L3ZkYSBybyIgLWRyaXZlIGZpbGU9b3V0cHV0L2ltYWdlcy9yb290ZnMu
ZXh0Mixmb3JtYXQ9cmF3LGlkPWhkMCxpZj1ub25lIC1kZXZpY2UgdmlydGlvLWJsay1kZXZpY2Us
ZHJpdmU9aGQwIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1kZXZpY2UgdmlydGlvLW5ldC1kZXZpY2Us
bmV0ZGV2PW5ldDAgLW5vZ3JhcGhpYyAjIHFlbXVfcmlzY3Y2NF92aXJ0X2RlZmNvbmZpZwo+Pj4g
IAo+Pj4gLSAgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtTSB2aXJ0IC1iaW9zIG5vbmUgLWtlcm5lbCBv
dXRwdXQvaW1hZ2VzL0ltYWdlIC1hcHBlbmQgInJvb3R3YWl0IHJvb3Q9L2Rldi92ZGEgcm8iIC1k
cml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsZm9ybWF0PXJhdyxpZD1oZDAgLWRl
dmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1oZDAgLW5vZ3JhcGhpYyAtY3B1IHJ2NjQsbW11
PW9mZiAtbmV0ZGV2IHVzZXIsaWQ9bmV0MCAtZGV2aWNlIHZpcnRpby1uZXQtZGV2aWNlLG5ldGRl
dj1uZXQwICMgcWVtdV9yaXNjdjY0X25vbW11X3ZpcnRfZGVmY29uZmlnCj4+PiArICBxZW11LXN5
c3RlbS1yaXNjdjY0IC1NIHZpcnQgLWJpb3Mgbm9uZSAta2VybmVsIG91dHB1dC9pbWFnZXMvSW1h
Z2UgLWFwcGVuZCAicm9vdHdhaXQgcm9vdD0vZGV2L3ZkYSBybyIgLWRyaXZlIGZpbGU9b3V0cHV0
L2ltYWdlcy9yb290ZnMuZXh0Mixmb3JtYXQ9cmF3LGlkPWhkMCxpZj1ub25lIC1kZXZpY2Ugdmly
dGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIC1ub2dyYXBoaWMgLWNwdSBydjY0LG1tdT1vZmYgLW5l
dGRldiB1c2VyLGlkPW5ldDAgLWRldmljZSB2aXJ0aW8tbmV0LWRldmljZSxuZXRkZXY9bmV0MCAj
IHFlbXVfcmlzY3Y2NF9ub21tdV92aXJ0X2RlZmNvbmZpZwo+Pj4gIAo+Pj4gIFRoZSBsb2dpbiBw
cm9tcHQgd2lsbCBhcHBlYXIgaW4gdGhlIHRlcm1pbmFsIHRoYXQgc3RhcnRlZCBRZW11Lgo+Pgo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
