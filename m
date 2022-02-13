Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A4AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A851D404AF;
	Sun, 13 Feb 2022 15:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpmUiX-kqXkT; Sun, 13 Feb 2022 15:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EECF40484;
	Sun, 13 Feb 2022 15:32:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5291BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E0AE81836
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRLiXiB2CLRW for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:31:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 113AB817D3
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:31:16 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id co28so23630008edb.1
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=zNqlUUUOgkssdYf3ETN8ZGjq9YJ71c6l2pVK4QQozso=;
 b=dfndLQV95FL97hk0i6VO00cjkwx4eQgAqixSnt8t6Yr9h9huOA5ppa4Jq1loKrK+l5
 PM4zm1+NHYbi4p9BkMjr34Yeh1PrdTHEQVDyt/ulsFSAWZ9Rbv5JnS9257BupB/A0XDS
 ZgTp07FsjMbl0zOgygj5FG0nKoPI4Y4Q97plugBI2FW4e2D8ueQr1/Uu0h3NwNvAoCco
 Z8SJ8SXH9dw5Zghm/95MFq5uDBjSrIQ28AYnKlblHQayKXu7cHr85543f3WncgFpsDEV
 KdOxCU9TNsRlkrKsw4WS6HSZ3cLTh3ZWI1PtcFi2Csb/HDxDClmUoQnDKjkwJKDY6ZdI
 wVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zNqlUUUOgkssdYf3ETN8ZGjq9YJ71c6l2pVK4QQozso=;
 b=Z0n1ClU4YCXol0duTel01E+6luzkhqZw4h0d66XmKa50rEu0IOWqmH5BXKrejE8cIH
 I6WnSaYjsG2kMsYNLl1GpHP22VIVNV/gnRpl5Btvr1RcL/XskUyvUL7NrtOjGXfNnRlU
 6J4i0D4wyH4S8yn4f2aEdeGN7UKIdTmNLskROLXbpIhJBJPSAxoHba12NL8dOpCtKK2e
 6kiYN/PrruJKnB6S3uaT8GMnTmfY8o/3A+APBtRu3DQEg0dfQ1BFoogy+0EzK517+QMH
 aETk3QCc47Vh1nBnkRgdvodQNEbEVARkvMN/ILAmMYM4WVfTVTNw4tCb/okSbmTO1MZ+
 ntxw==
X-Gm-Message-State: AOAM530JNQvQLPw34G68GIBTb3YrBjeH+NHAESN37n16HoCEifhaKsp4
 GdKP+yxbyJSpJ7nM0eUV0xI0Pq7ZkrTlpA==
X-Google-Smtp-Source: ABdhPJxzgCAnkC2yrVEWqgygM3I+L5RzMqGJ9qq98pb2/BdOJDLj4Tt4FZjEhjqCeH1CVZRXd29Qpw==
X-Received: by 2002:a05:6402:530d:: with SMTP id
 eo13mr11476340edb.387.1644766275317; 
 Sun, 13 Feb 2022 07:31:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id fy37sm599765ejc.219.2022.02.13.07.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:31:14 -0800 (PST)
Message-ID: <bd92c919-14ad-74b0-5c4e-073c52408035@mind.be>
Date: Sun, 13 Feb 2022 16:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20220207112228.1753927-1-jose.pekkarinen@unikie.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220207112228.1753927-1-jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH] package/alfred: bump to version 2022.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wMi8yMDIyIDEyOjIyLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IGh0dHBzOi8v
d3d3Lm9wZW4tbWVzaC5vcmcvbmV3cy8xMDcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtr
YXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KCiAgQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL2FsZnJlZC9h
bGZyZWQuaGFzaCB8IDYgKysrLS0tCj4gICBwYWNrYWdlL2FsZnJlZC9hbGZyZWQubWsgICB8IDIg
Ky0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQuaGFzaCBiL3BhY2thZ2UvYWxm
cmVkL2FsZnJlZC5oYXNoCj4gaW5kZXggMDc5OTA3MTIzMS4uMmRhN2ViMzFjOCAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvYWxmcmVkL2Fs
ZnJlZC5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gLSMgRnJvbSBodHRwczovL2Rvd25sb2Fkcy5v
cGVuLW1lc2gub3JnL2JhdG1hbi9zdGFibGUvc291cmNlcy9hbGZyZWQvYWxmcmVkLTIwMjEuNC50
YXIuZ3ouc2hhMQo+IC1zaGExICBiZTFlOWMxMzE3ZDQwZTQ2Y2ZjODgxYTMxYzYzMmZlYzc4YzYy
MGExIGFsZnJlZC0yMDIxLjQudGFyLmd6Cj4gKyMgRnJvbSBodHRwczovL2Rvd25sb2Fkcy5vcGVu
LW1lc2gub3JnL2JhdG1hbi9zdGFibGUvc291cmNlcy9hbGZyZWQvYWxmcmVkLTIwMjIuMC50YXIu
Z3ouc2hhMQo+ICtzaGExICA4ZTAwNzg5ZDNlMWU1Yzk1OWRkOTg1ODA5ODYxZmY2MjRkMzcyNjk0
ICBhbGZyZWQtMjAyMi4wLnRhci5nego+ICAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1NiAg
NGM3OWI2YzQ1ZGU0YmNjOGNiZmU2NGNiYTlhMGY4YjRlZjMwNGNhODRjMTk0NjIyZjJiZmE0MWUw
MWUyY2I5NSAgYWxmcmVkLTIwMjEuNC50YXIuZ3oKPiArc2hhMjU2ICBhYmJhMWRhYzYxZWNjZmNk
NjMyOWU3MzMxZDA1NTVmZWNjOTM3NzYwZmIzNmM2Y2Y1NWNlNmMxZDc1MWNmZDk4ICBhbGZyZWQt
MjAyMi4wLnRhci5nego+ICAgc2hhMjU2ICBjZWNiZjUzZDExNDhlMTMyNTZhYzI5ZjhiOTAwNjU1
YjdmYzhkYzEyZDU5OTM5YTk1YmMyMzIzZWExNzQ3MDI1ICBMSUNFTlNFUy9wcmVmZXJyZWQvR1BM
LTIuMAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQubWsgYi9wYWNrYWdlL2Fs
ZnJlZC9hbGZyZWQubWsKPiBpbmRleCBlZDU5MDY2MzkzLi4yNGI5OTU2YjExIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvYWxmcmVkL2FsZnJlZC5tawo+ICsrKyBiL3BhY2thZ2UvYWxmcmVkL2FsZnJl
ZC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
PiAgIAo+IC1BTEZSRURfVkVSU0lPTiA9IDIwMjEuNAo+ICtBTEZSRURfVkVSU0lPTiA9IDIwMjIu
MAo+ICAgQUxGUkVEX1NJVEUgPSBodHRwczovL2Rvd25sb2Fkcy5vcGVuLW1lc2gub3JnL2JhdG1h
bi9zdGFibGUvc291cmNlcy9hbGZyZWQKPiAgIEFMRlJFRF9MSUNFTlNFID0gR1BMLTIuMAo+ICAg
QUxGUkVEX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFUy9wcmVmZXJyZWQvR1BMLTIuMApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
