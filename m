Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84591C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51CC740004;
	Sun, 24 Mar 2024 16:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjCSHbYL30K4; Sun, 24 Mar 2024 16:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6194540296
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6194540296;
	Sun, 24 Mar 2024 16:00:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7931BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09C2340296
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZdp0zvZlmvf for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:00:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2CEA40004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2CEA40004
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2CEA40004
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:00:37 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41489820fcaso728245e9.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711296036; x=1711900836;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UuTcfSc59WM53iVV3dX9b0yeCWqVWtFbdT/6Pm/Q6qI=;
 b=R/M+771XciUrksURiEcrU5zSMliWiXhr/VfWe4yu1RzWu24JgGas0i1xHwFZ7i0Xpp
 Jlp5SfRZeBAixNQICVO/RsiXsavku4+845lxxjnaH3twlNwDAiEFJ0XQVWWaoYMAmoMY
 xD6ORhnCsBxK9IQsoaK36pcrNe8h4yj42UAjUPVHshceZIcbptV1Fr2PkP4rz7LBzBE9
 2v1gMxSjEHpgZxdvOLRVqYfbkzO1gaKTTJayOGBU6nL/cWFsbMKYsVrKR3I+5FK3wVp/
 i7XAf0iNucZfqJ3b9zgsAvSGOQTB7GK2YQZ4T4FLtSckObbllQDMxjdsMW6RZNtLi5KE
 5OJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiKlmNiEcFkbdzT4FE0dTfbH6fSN1EoDrPhloQy20++0Or8DiQNfwxFZ+6yk1nxUUbhcSY8Sxt6qPuFGBLZbeMM+bodO6OaA==
X-Gm-Message-State: AOJu0YxEkWLleWkOQxIsw3PJuCBge0cXTFSriCpo6/b0AhrTrQQwzR0N
 /0BbOr1W2rn+W6N82QDHSMHwgLyOC63ZcUFaWZHy3umPK6cDhJMgL2e/CDlmng0=
X-Google-Smtp-Source: AGHT+IFlv1XopWJHZBtbFHHSzwL5FD96RC3Z1oPkIocYfORv6u+IlmF+44pnrpk+Y9/e7ISHLvGNmA==
X-Received: by 2002:a05:600c:3113:b0:414:669b:aa9 with SMTP id
 g19-20020a05600c311300b00414669b0aa9mr3141524wmo.28.1711296035855; 
 Sun, 24 Mar 2024 09:00:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b0041477f3f99fsm5556770wmg.30.2024.03.24.09.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 09:00:34 -0700 (PDT)
Message-ID: <0c44fe3f-e87e-42fe-bbab-743fee1306a3@mind.be>
Date: Sun, 24 Mar 2024 17:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Korsgaard <peter@korsgaard.com>, Romain Naour <romain.naour@gmail.com>
References: <20240316084335.20839-1-bernd@kuhls.net>
 <20240316084335.20839-2-bernd@kuhls.net>
 <113740e8-230d-4ab3-bb9f-12e1bb66cd85@mind.be>
In-Reply-To: <113740e8-230d-4ab3-bb9f-12e1bb66cd85@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711296036; x=1711900836; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UuTcfSc59WM53iVV3dX9b0yeCWqVWtFbdT/6Pm/Q6qI=;
 b=aksnLW3kn7JosSLcm1Wrur62W1VtVhaBZPaqIJeW2rjr54iB3fViR7pY4et5LDSc5Q
 l0cikv5luYyQB/U/NwdknNjjxTTOptZwcC9iOFvdouFd8kKKxecAo/YqwoPhmYuXyjiy
 r7/bF+gKv/ZHu554tbHzRoIeC0Q8J4lSWt3VxQMtWqZ+JqNLYcbxbOOqMu+LNI3f5e18
 /cnKuwRtRVuC2I3jUO/hU6C8FKoFbG/G7RAGu3YnkQkYMKy+G1NRnkYjADeymfAX5VF8
 +UFZIpkiJQCRZlBha1y1NsnfuflIymzN4SDEO9HCMuIq4hHUBDz5f/Lr9i73xCg91hqN
 ZB6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aksnLW3k
Subject: Re: [Buildroot] [PATCH 2/5] package/busybox: disable tc to fix
 build with kernel >= 6.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE2LzAzLzIwMjQgMjA6MjUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAxNi8wMy8yMDI0IDA5OjQzLCBCZXJuZCBLdWhscyB3cm90ZToKPj4gRm9yIGRldGFpbHMgc2Vl
IGh0dHBzOi8vYnVncy5idXN5Ym94Lm5ldC9zaG93X2J1Zy5jZ2k/aWQ9MTU5MzQKPgo+IMKgSSdt
IGEgYml0IGFmcmFpZCB0byBhcHBseSB0aGlzLiBIb3BlZnVsbHkgdGhlIGlzc3VlIHdpbGwgYmUg
Zml4ZWQgYXQgc29tZSAKPiBwb2ludCBpbiBidXN5Ym94OyB0aGVuLCB3ZSBzaG91bGQgcHJvYmFi
bHkgcmV2ZXJ0IHRoaXMgcGF0Y2ggKHRob3VnaCBob25lc3RseSAKPiBJIGRvbid0IGtub3cgd2hh
dCB0YyBpcyBkb2luZyBpbiB0aGUgbWluaW1hbCBjb25maWcuLi4pLgoKCiDCoEkgZGlkbid0IGFw
cGx5IHRoaXMgb25lIG5vciB0aGUgZm9sbG93aW5nIHR3by4gSSdtIGhvcGluZyB0aGUgb3RoZXIg
Cm1haW50YWluZXJzIGNhbiBwaXBlIHVwIHdpdGggaWRlYXMgb2YgaG93IHRvIGJlc3QgZGVhbCB3
aXRoIHRoaXM/CgoKIMKgUmVnYXJkcywKIMKgQXJub3V0CgoKPgo+IMKgUmVnYXJkcywKPiDCoEFy
bm91dAo+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+
Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1taW5pbWFsLmNvbmZpZyB8IDMg
Ky0tCj4+IMKgIHBhY2thZ2UvYnVzeWJveC9idXN5Ym94LmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqAg
fCAzICstLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94LW1pbmltYWwu
Y29uZmlnIAo+PiBiL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94LW1pbmltYWwuY29uZmlnCj4+IGlu
ZGV4IDFlN2FkMWQzNTcuLjVkMmEzMDgwNmEgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvYnVzeWJv
eC9idXN5Ym94LW1pbmltYWwuY29uZmlnCj4+ICsrKyBiL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94
LW1pbmltYWwuY29uZmlnCj4+IEBAIC05NTUsOCArOTU1LDcgQEAgQ09ORklHX1BJTkc9eQo+PiDC
oCBDT05GSUdfUk9VVEU9eQo+PiDCoCAjIENPTkZJR19TTEFUVEFDSCBpcyBub3Qgc2V0Cj4+IMKg
ICMgQ09ORklHX1NTTF9DTElFTlQgaXMgbm90IHNldAo+PiAtQ09ORklHX1RDPXkKPj4gLUNPTkZJ
R19GRUFUVVJFX1RDX0lOR1JFU1M9eQo+PiArIyBDT05GSUdfVEMgaXMgbm90IHNldAo+PiDCoCAj
IENPTkZJR19UQ1BTVkQgaXMgbm90IHNldAo+PiDCoCAjIENPTkZJR19VRFBTVkQgaXMgbm90IHNl
dAo+PiDCoCBDT05GSUdfVEVMTkVUPXkKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnVzeWJveC9i
dXN5Ym94LmNvbmZpZyBiL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94LmNvbmZpZwo+PiBpbmRleCA2
ZThiZDI3OTlkLi5jZmQxNjE3MmZhIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2J1c3lib3gvYnVz
eWJveC5jb25maWcKPj4gKysrIGIvcGFja2FnZS9idXN5Ym94L2J1c3lib3guY29uZmlnCj4+IEBA
IC05NjgsOCArOTY4LDcgQEAgQ09ORklHX0ZFQVRVUkVfRkFOQ1lfUElORz15Cj4+IMKgIENPTkZJ
R19ST1VURT15Cj4+IMKgICMgQ09ORklHX1NMQVRUQUNIIGlzIG5vdCBzZXQKPj4gwqAgIyBDT05G
SUdfU1NMX0NMSUVOVCBpcyBub3Qgc2V0Cj4+IC1DT05GSUdfVEM9eQo+PiAtQ09ORklHX0ZFQVRV
UkVfVENfSU5HUkVTUz15Cj4+ICsjIENPTkZJR19UQyBpcyBub3Qgc2V0Cj4+IMKgICMgQ09ORklH
X1RDUFNWRCBpcyBub3Qgc2V0Cj4+IMKgICMgQ09ORklHX1VEUFNWRCBpcyBub3Qgc2V0Cj4+IMKg
IENPTkZJR19URUxORVQ9eQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
