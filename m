Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A94C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 20:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F043418D8;
	Mon, 20 Jun 2022 20:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F043418D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iakOZqQOeE5j; Mon, 20 Jun 2022 20:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D05341845;
	Mon, 20 Jun 2022 20:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D05341845
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A89CF1BF3EE
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 20:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EF3560FDA
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 20:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF3560FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrKP46nK8pqQ for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 20:04:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B749F60035
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B749F60035
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 20:04:24 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id g26so1814963ejb.5
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 13:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=koWuENOfGRebwKprQ6OFiD6QCjVJCe2xrCX81Hc+ufY=;
 b=4zbr+iQ7NbZaM6A6W1g+HZFthB8KH38XkX3cM2k+EfmepuOzCiTLnniinRlGMv3iY2
 Es25Xt0mHJW7QQxu4Kb9nTL5sgumNcXTf/CL0jkKhS4aIE8wt0fTnaxTlXLRIVD+Ak+4
 /OivOFy+ryv2YsIHWBL6B7+u9TtQcoglvbkmSoF/vpYPHAEceepDbaAmu9uf2G+AoVcM
 QpGe0GuLwcBYwBhoxItfJufOrjAGomZRzAuu19c1c7RKxlfKf/8QMzaAJO1dLBm1xIZa
 0Wm2op9QAFeX3etnTZodNXxk7/BMV6rjki+gbFBdkzzlVMorfnZQ1b+kiw3ENBn0iC3a
 Ugtg==
X-Gm-Message-State: AJIora+yqz6ounj5skD/auMhib9ur/rbEv6P/Of4nGULLs5Hi0JjvSO5
 4Zo81Il1vNVVmiq7X8o6ZNKRc9Ak8+B6NA==
X-Google-Smtp-Source: AGRyM1vCEEyWxdpElgetvSR+2lqj5x7uHVz3NAl872yXZREyR3XpIae3+klE5wo9NUQ5qRwmrEQuXg==
X-Received: by 2002:a17:907:7642:b0:706:fd3a:61f0 with SMTP id
 kj2-20020a170907764200b00706fd3a61f0mr22473166ejc.503.1655755463011; 
 Mon, 20 Jun 2022 13:04:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a17090630c900b006feba31171bsm6595615ejb.11.2022.06.20.13.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 13:04:22 -0700 (PDT)
Message-ID: <1ae45d2d-5619-c740-58b3-4623e9587b30@mind.be>
Date: Mon, 20 Jun 2022 22:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220606135756.2264709-1-clg@kaod.org>
 <20220606135756.2264709-2-clg@kaod.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220606135756.2264709-2-clg@kaod.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=koWuENOfGRebwKprQ6OFiD6QCjVJCe2xrCX81Hc+ufY=;
 b=B/Yl4v+6X/xRFVuq6QRzfHkMKETgDTf+qT2wxrpxFwtM17t2mIBHQDcknJqxdoigH+
 6NMkZc6Ak2hlyr5IZiI3bpvncLRzcSXKTuIwnwZZUPe8QVNvSjZV6z0qUi3B5hMv4+mE
 ONn08vi3aJ4vm9anhtgA/1rZC67wDPojo52wRjzYbHb5JT7wnPaP5xrBNHEFWf1E/u6J
 LeHADZjGjSx3KBn/sgl6jWpoGCluR8I3xZglsyhuWDItv5+Uw3F6oz5GdVJ/Mrw4rSDb
 2nGgCsG2Olq7gSuPBRFE1OdmDzozFBuib96OS0WXAzJjjl4UxGPlB3W5ipO4UV3gd+8n
 wNew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B/Yl4v+6
Subject: Re: [Buildroot] [PATCH v2 2/2] configs/aspeed_ast2500evb: new
 defconfig
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
Cc: chin-ting_kuo@aspeedtech.com, troy_lee@aspeedtech.com,
 Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNi8yMDIyIDE1OjU3LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPiBUaGUga2Vy
bmVsIGlzIGZyb20gdXBzdHJlYW0gd2l0aCBhIGN1c3RvbSBjb25maWcgYmVjYXVzZSB0aGUgZGVm
YXVsdAo+ICdhc3BlZWRfZzUnIGRlZmNvbmZpZyBidWlsZHMgYSB6SW1hZ2UgZmlsZSBpbWFnZSB0
b28gYmlnIGZvciB0aGUgZmxhc2gKPiBsYXlvdXQuCgogIFN0aWxsLCB3ZSBwcmVmZXIgdG8gdXNl
IHRoZSBpbi10cmVlIGRlZmNvbmZpZyB3aXRoIGEgZnJhZ21lbnQgdG8gcmVtb3ZlIHRoZSAKc3R1
ZmYgdGhhdCBpcyBub3QgbmVlZGVkLgoKPiBVLUJvb3QgaXMgZnJvbSB0aGUgT3BlbkJNQyBicmFu
Y2ggd2hlcmUgbW9zdCBvZiBkZXZlbG9wbWVudCBpcwo+IGRvbmUuIExhdGVzdCBtYWlubGluZSBz
aG91bGQgd29yay4KCiAgSW4gdGhhdCBjYXNlLCB3ZSBnZW5lcmFsbHkgcHJlZmVyIHRoZSBtYWlu
bGluZSB0aGVuLgoKCj4gVGhlIG1haW4gcmVzdWx0aW5nIGZpbGUgZnJvbSB0aGUgYnVpbGQgaXMg
YSBmbGFzaCBpbWFnZS4gVGhlIHBhcnRpdGlvbgo+IGxheW91dCBtYXRjaGVzIHRoZSBPcGVuQk1D
IG9uZSBmb3IgMzJNIGNoaXBzLiBJdCBtYWtlcyBpdCBlYXNpZXIgdG8KPiB1cGRhdGUgdGhlIGRp
ZmZlcmVudCBwYXJ0aXRpb25zIGZyb20gTGludXguIEludGVybWVkaWF0ZSBmaWxlcyBjYW4gYmUK
PiB1c2VkIHRvIGJvb3QgZnJvbSBVLWJvb3Qgb3ZlciB0aGUgbmV0d29yayBvciB0byBib290IFFF
TVUgdXNpbmcKPiAta2VybmVsLy1pbml0cmQvLWR0Yi4KCiAgT29oLCB2ZXJ5IG5pY2UgdGhhdCB0
aGUgc2FtZSBjb25maWcgY2FuIGJlIGJvb3RlZCBpbiBxZW11IGFzIHdlbGwhCgoKICBBbHNvLCBz
YW1lIGNvbW1lbnRzIGFzIGZvciB0aGUgZmlyc3QgcGF0Y2guCgoKICBSZWdhcmRzLAogIEFybm91
dAoKPiAKPiBSZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+IC0tLQo+IAo+ICAg
Q2hhbmdlcyBpbiB2MjoKPiAKPiAgIC0gbWlub3IgY2xlYW51cHMgaW4gcmVhZG1lLnR4dAo+ICAg
Cj4gICBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvZ2VuaW1hZ2UuY2ZnICAgfCAgNDAgKysrKwo+
ICAgYm9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL2xpbnV4LmNvbmZpZyAgIHwgMjYyICsrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAgYm9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL3JlYWRtZS50eHQg
ICAgIHwgIDgwICsrKysrKysrCj4gICBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvdWJvb3QuZnJh
Z21lbnQgfCAgIDEgKwo+ICAgY29uZmlncy9hc3BlZWRfYXN0MjUwMGV2Yl9kZWZjb25maWcgICAg
IHwgIDU4ICsrKysrKwo+ICAgNSBmaWxlcyBjaGFuZ2VkLCA0NDEgaW5zZXJ0aW9ucygrKQo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2FzcGVlZC9hc3QyNTAwLWV2Yi9nZW5pbWFnZS5jZmcK
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvbGludXguY29u
ZmlnCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL3JlYWRt
ZS50eHQKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvdWJv
b3QuZnJhZ21lbnQKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2FzcGVlZF9hc3QyNTAw
ZXZiX2RlZmNvbmZpZwoKW3NuaXBdCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
