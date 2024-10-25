Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FF6D149F3
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 21:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 631528109E;
	Fri, 25 Oct 2024 21:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MaV16nDA_oD; Fri, 25 Oct 2024 21:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5274881134
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5274881134;
	Fri, 25 Oct 2024 21:30:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A9922318
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2882E605D9
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKJvZ1SLS1IX for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 21:30:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB99A605C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB99A605C8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB99A605C8
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:30:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4314c4cb752so24162915e9.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729891853; x=1730496653;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OWUm76g6nVPmrmDk+bv7X0Huk/aZE0JWtzIBvCfROCQ=;
 b=bZPCKvjqHYVkhXnVHUxw5mJW+qPp8iMNMB+IwdQGiRz5mPIOnJC1S+WKXA5hg0ZBOX
 bcC+o6lDI3iPJzwDMvJbDbTkpRhxCyeQydezErVIDuQN7zEB64q62GxxxfdPnj1jhxLE
 PyxmnmBRYt66z4CSTkIaP7MMGOpuDm7VoBbdhs8mjlNfDN2VJ5VN3SXSOX4WE5c6e/z8
 MGVXSWOtZY/3v2VRY6W4bef33uNmZF/g9KxukM8MDb8vU+jxsQbvuF9EvdyQ3RB0wJrt
 SmmyySgg5lH2byV64dkEhKdDn3e4b/A9LLYiMo774ltKbor0gHSEhUbdq2RSrNffpHIM
 WKvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMssKv0N/urYthJ3ZWnHWhARgb2FG4RSGuF7ibBX626R9Q5apkcN6MiN+nWSdP0F4oLb1s+HfdiuM=@buildroot.org
X-Gm-Message-State: AOJu0YzhYH5X8D1B3KU8VzpQnZ3GcLuLv58G0V7EkbYWuwT9QLexD0jd
 5FLDEBWlVLxVlo8S/8OI+JNgjWHrFU4cjolNC/EpvK88yuFBjv75lhz/wvVU+h1yRqPetEP7sqS
 X
X-Google-Smtp-Source: AGHT+IFBQ1R1g3/3xoiTdSMz5Jo5CWqJn4IcKMvS9UFayrr6ihCrnoNgCZT85XPwd4idEWyFYlDIqw==
X-Received: by 2002:a05:6000:e82:b0:37d:4517:acbb with SMTP id
 ffacd0b85a97d-38061141d9bmr518777f8f.17.1729891852694; 
 Fri, 25 Oct 2024 14:30:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058bac1cfsm2516467f8f.109.2024.10.25.14.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 14:30:52 -0700 (PDT)
Message-ID: <e117b332-3c34-4079-99c8-8e59097c956b@smile.fr>
Date: Fri, 25 Oct 2024 23:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Zuk8u8Ja5KMX9Pvw@waldemar-brodkorb.de>
Content-Language: fr
In-Reply-To: <Zuk8u8Ja5KMX9Pvw@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1729891853; x=1730496653; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OWUm76g6nVPmrmDk+bv7X0Huk/aZE0JWtzIBvCfROCQ=;
 b=CpueRbUOVEMXufpeLobeolXE9tNhCyGcFXRGHlk/H+aRFbNS0bnlejAiNbl715SMw5
 PUcqSCKxhPhZq+xBiLy0V9cwSB2o9IHKovRpHKnUKKoSbeRp0ggC6Qx4AWcFC/E5RvDB
 nCXIkxOZz0lBQckdW3GtAMZL8Uq0BQnYiuKEE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=CpueRbUO
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

SGVsbG8gV2FsZGVtYXIsIEFsbCwKCkxlIDE3LzA5LzIwMjQgw6AgMTA6MjQsIFdhbGRlbWFyIEJy
b2Rrb3JiIGEgw6ljcml0wqA6Cj4gU2lnbmVkLW9mZi1ieTogV2FsZGVtYXIgQnJvZGtvcmIgPHdi
eEBvcGVuYWRrLm9yZz4KPiAtLS0KPiB2MS0+djI6Cj4gIC0gbmV3IHBhdGNoLCBmb3VuZCB2aWEg
R2l0bGFiIGF1dG9tYXRpYyB0ZXN0aW5nCgpXaGF0IHdhcyB0aGUgaXNzdWUgeW91IG5vdGljZWQ/
CldoeS9ob3cgYWRkaW5nIGlmPW5vbmUgZml4IHRoZSBib290IGlzc3VlPwoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+IC0tLQo+ICBib2FyZC9xZW11L3Jpc2N2MzItdmlydC9yZWFkbWUudHh0ICAg
ICB8IDQgKystLQo+ICBib2FyZC9xZW11L3Jpc2N2NjQtdmlydC1lZmkvcmVhZG1lLnR4dCB8IDIg
Ky0KPiAgYm9hcmQvcWVtdS9yaXNjdjY0LXZpcnQvcmVhZG1lLnR4dCAgICAgfCA0ICsrLS0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2JvYXJkL3FlbXUvcmlzY3YzMi12aXJ0L3JlYWRtZS50eHQgYi9ib2FyZC9xZW11
L3Jpc2N2MzItdmlydC9yZWFkbWUudHh0Cj4gaW5kZXggNTU1OTI0Zjk0OS4uMDQ4MzA2Y2Q1NCAx
MDA2NDQKPiAtLS0gYS9ib2FyZC9xZW11L3Jpc2N2MzItdmlydC9yZWFkbWUudHh0Cj4gKysrIGIv
Ym9hcmQvcWVtdS9yaXNjdjMyLXZpcnQvcmVhZG1lLnR4dAo+IEBAIC0xLDcgKzEsNyBAQAo+ICBS
dW4gTGludXggaW4gZW11bGF0aW9uIHdpdGg6Cj4gIAo+IC0gIHFlbXUtc3lzdGVtLXJpc2N2MzIg
LU0gdmlydCAtYmlvcyBvdXRwdXQvaW1hZ2VzL2Z3X2p1bXAuZWxmIC1rZXJuZWwgb3V0cHV0L2lt
YWdlcy9JbWFnZSAtYXBwZW5kICJyb290d2FpdCByb290PS9kZXYvdmRhIHJvIiAtZHJpdmUgZmls
ZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGZvcm1hdD1yYXcsaWQ9aGQwIC1kZXZpY2Ugdmly
dGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1kZXZpY2Ugdmly
dGlvLW5ldC1kZXZpY2UsbmV0ZGV2PW5ldDAgLW5vZ3JhcGhpYyAjIHFlbXVfcmlzY3YzMl92aXJ0
X2RlZmNvbmZpZwo+ICsgIHFlbXUtc3lzdGVtLXJpc2N2MzIgLU0gdmlydCAtYmlvcyBvdXRwdXQv
aW1hZ2VzL2Z3X2p1bXAuZWxmIC1rZXJuZWwgb3V0cHV0L2ltYWdlcy9JbWFnZSAtYXBwZW5kICJy
b290d2FpdCByb290PS9kZXYvdmRhIHJvIiAtZHJpdmUgZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rm
cy5leHQyLGZvcm1hdD1yYXcsaWQ9aGQwLGlmPW5vbmUgLWRldmljZSB2aXJ0aW8tYmxrLWRldmlj
ZSxkcml2ZT1oZDAgLW5ldGRldiB1c2VyLGlkPW5ldDAgLWRldmljZSB2aXJ0aW8tbmV0LWRldmlj
ZSxuZXRkZXY9bmV0MCAtbm9ncmFwaGljICMgcWVtdV9yaXNjdjMyX3ZpcnRfZGVmY29uZmlnCj4g
IAo+IC0gIHFlbXUtc3lzdGVtLXJpc2N2MzIgLU0gdmlydCAtYmlvcyBub25lIC1rZXJuZWwgb3V0
cHV0L2ltYWdlcy9JbWFnZSAtYXBwZW5kICJyb290d2FpdCByb290PS9kZXYvdmRhIHJvIiAtZHJp
dmUgZmlsZT1vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyLGZvcm1hdD1yYXcsaWQ9aGQwIC1kZXZp
Y2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9aGQwIC1ub2dyYXBoaWMgLWNwdSBydjMyLG1tdT1v
ZmYgLW5ldGRldiB1c2VyLGlkPWV0aDAgLWRldmljZSB2aXJ0aW8tbmV0LWRldmljZSxuZXRkZXY9
ZXRoMCAjIHFlbXVfcmlzY3YzMl9ub21tdV92aXJ0X2RlZmNvbmZpZwo+ICsgIHFlbXUtc3lzdGVt
LXJpc2N2MzIgLU0gdmlydCAtYmlvcyBub25lIC1rZXJuZWwgb3V0cHV0L2ltYWdlcy9JbWFnZSAt
YXBwZW5kICJyb290d2FpdCByb290PS9kZXYvdmRhIHJvIiAtZHJpdmUgZmlsZT1vdXRwdXQvaW1h
Z2VzL3Jvb3Rmcy5leHQyLGZvcm1hdD1yYXcsaWQ9aGQwLGlmPW5vbmUgLWRldmljZSB2aXJ0aW8t
YmxrLWRldmljZSxkcml2ZT1oZDAgLW5vZ3JhcGhpYyAtY3B1IHJ2MzIsbW11PW9mZiAtbmV0ZGV2
IHVzZXIsaWQ9ZXRoMCAtZGV2aWNlIHZpcnRpby1uZXQtZGV2aWNlLG5ldGRldj1ldGgwICMgcWVt
dV9yaXNjdjMyX25vbW11X3ZpcnRfZGVmY29uZmlnCj4gIAo+ICBUaGUgbG9naW4gcHJvbXB0IHdp
bGwgYXBwZWFyIGluIHRoZSB0ZXJtaW5hbCB0aGF0IHN0YXJ0ZWQgUWVtdS4KPiBkaWZmIC0tZ2l0
IGEvYm9hcmQvcWVtdS9yaXNjdjY0LXZpcnQtZWZpL3JlYWRtZS50eHQgYi9ib2FyZC9xZW11L3Jp
c2N2NjQtdmlydC1lZmkvcmVhZG1lLnR4dAo+IGluZGV4IDZiOTY1MWEwMTEuLmM3YjMxNzdhZjEg
MTAwNjQ0Cj4gLS0tIGEvYm9hcmQvcWVtdS9yaXNjdjY0LXZpcnQtZWZpL3JlYWRtZS50eHQKPiAr
KysgYi9ib2FyZC9xZW11L3Jpc2N2NjQtdmlydC1lZmkvcmVhZG1lLnR4dAo+IEBAIC0yMiw3ICsy
Miw3IEBAIFJ1biB0aGUgZW11bGF0aW9uIHdpdGg6Cj4gICAgICAgICAgLWJsb2NrZGV2IG5vZGUt
bmFtZT1wZmxhc2gwLGRyaXZlcj1maWxlLHJlYWQtb25seT1vbixmaWxlbmFtZT1vdXRwdXQvaW1h
Z2VzL1JJU0NWX1ZJUlRfQ09ERS5mZCBcCj4gICAgICAgICAgLWJsb2NrZGV2IG5vZGUtbmFtZT1w
Zmxhc2gxLGRyaXZlcj1maWxlLGZpbGVuYW1lPW91dHB1dC9pbWFnZXMvUklTQ1ZfVklSVF9WQVJT
LmZkIFwKPiAgICAgICAgICBcCj4gLSAgICAgICAgLWRyaXZlIGZpbGU9b3V0cHV0L2ltYWdlcy9k
aXNrLmltZyxmb3JtYXQ9cmF3LGlkPWhkMCBcCj4gKyAgICAgICAgLWRyaXZlIGZpbGU9b3V0cHV0
L2ltYWdlcy9kaXNrLmltZyxmb3JtYXQ9cmF3LGlkPWhkMCxpZj1ub25lIFwKPiAgICAgICAgICAt
ZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWhkMCBcCj4gICAgICAgICAgXAo+ICAgICAg
ICAgIC1uZXRkZXYgdXNlcixpZD1uZXQwIFwKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9yaXNj
djY0LXZpcnQvcmVhZG1lLnR4dCBiL2JvYXJkL3FlbXUvcmlzY3Y2NC12aXJ0L3JlYWRtZS50eHQK
PiBpbmRleCBmMWM3YmY0MWI1Li41YjNiYjg1YjRiIDEwMDY0NAo+IC0tLSBhL2JvYXJkL3FlbXUv
cmlzY3Y2NC12aXJ0L3JlYWRtZS50eHQKPiArKysgYi9ib2FyZC9xZW11L3Jpc2N2NjQtdmlydC9y
ZWFkbWUudHh0Cj4gQEAgLTEsNyArMSw3IEBACj4gIFJ1biBMaW51eCBpbiBlbXVsYXRpb24gd2l0
aDoKPiAgCj4gLSAgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtTSB2aXJ0IC1iaW9zIG91dHB1dC9pbWFn
ZXMvZndfanVtcC5lbGYgLWtlcm5lbCBvdXRwdXQvaW1hZ2VzL0ltYWdlIC1hcHBlbmQgInJvb3R3
YWl0IHJvb3Q9L2Rldi92ZGEgcm8iIC1kcml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4
dDIsZm9ybWF0PXJhdyxpZD1oZDAgLWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1oZDAg
LW5ldGRldiB1c2VyLGlkPW5ldDAgLWRldmljZSB2aXJ0aW8tbmV0LWRldmljZSxuZXRkZXY9bmV0
MCAtbm9ncmFwaGljICMgcWVtdV9yaXNjdjY0X3ZpcnRfZGVmY29uZmlnCj4gKyAgcWVtdS1zeXN0
ZW0tcmlzY3Y2NCAtTSB2aXJ0IC1iaW9zIG91dHB1dC9pbWFnZXMvZndfanVtcC5lbGYgLWtlcm5l
bCBvdXRwdXQvaW1hZ2VzL0ltYWdlIC1hcHBlbmQgInJvb3R3YWl0IHJvb3Q9L2Rldi92ZGEgcm8i
IC1kcml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsZm9ybWF0PXJhdyxpZD1oZDAs
aWY9bm9uZSAtZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWhkMCAtbmV0ZGV2IHVzZXIs
aWQ9bmV0MCAtZGV2aWNlIHZpcnRpby1uZXQtZGV2aWNlLG5ldGRldj1uZXQwIC1ub2dyYXBoaWMg
IyBxZW11X3Jpc2N2NjRfdmlydF9kZWZjb25maWcKPiAgCj4gLSAgcWVtdS1zeXN0ZW0tcmlzY3Y2
NCAtTSB2aXJ0IC1iaW9zIG5vbmUgLWtlcm5lbCBvdXRwdXQvaW1hZ2VzL0ltYWdlIC1hcHBlbmQg
InJvb3R3YWl0IHJvb3Q9L2Rldi92ZGEgcm8iIC1kcml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9v
dGZzLmV4dDIsZm9ybWF0PXJhdyxpZD1oZDAgLWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2
ZT1oZDAgLW5vZ3JhcGhpYyAtY3B1IHJ2NjQsbW11PW9mZiAtbmV0ZGV2IHVzZXIsaWQ9bmV0MCAt
ZGV2aWNlIHZpcnRpby1uZXQtZGV2aWNlLG5ldGRldj1uZXQwICMgcWVtdV9yaXNjdjY0X25vbW11
X3ZpcnRfZGVmY29uZmlnCj4gKyAgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtTSB2aXJ0IC1iaW9zIG5v
bmUgLWtlcm5lbCBvdXRwdXQvaW1hZ2VzL0ltYWdlIC1hcHBlbmQgInJvb3R3YWl0IHJvb3Q9L2Rl
di92ZGEgcm8iIC1kcml2ZSBmaWxlPW91dHB1dC9pbWFnZXMvcm9vdGZzLmV4dDIsZm9ybWF0PXJh
dyxpZD1oZDAsaWY9bm9uZSAtZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWhkMCAtbm9n
cmFwaGljIC1jcHUgcnY2NCxtbXU9b2ZmIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1kZXZpY2Ugdmly
dGlvLW5ldC1kZXZpY2UsbmV0ZGV2PW5ldDAgIyBxZW11X3Jpc2N2NjRfbm9tbXVfdmlydF9kZWZj
b25maWcKPiAgCj4gIFRoZSBsb2dpbiBwcm9tcHQgd2lsbCBhcHBlYXIgaW4gdGhlIHRlcm1pbmFs
IHRoYXQgc3RhcnRlZCBRZW11LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
