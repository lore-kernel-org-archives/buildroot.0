Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185E0C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 08:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 975B840469;
	Thu, 23 Feb 2023 08:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 975B840469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JLh_Qr_i0RP; Thu, 23 Feb 2023 08:01:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA9294035D;
	Thu, 23 Feb 2023 08:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA9294035D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 861661BF339
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 08:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CEE96139F
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 08:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CEE96139F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cz3-AAfPCPak for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 08:01:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5415060B12
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5415060B12
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 08:01:27 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id oj14so10695163qvb.0
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 00:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ITNkGuywE4YSpjogE8nqSPu/r27RlQhjcsvZHMSzQ4=;
 b=T1tbaa0+2ExeykKrxyoGo5SDDAqxCA1TrHqL5lFvVJ1bWdJWj4bbvWyjE6UjhnBP1W
 hr/YxyzCYGtnxvAADQfldJjz3POz1vtGmd3jynEJPcXGhhcry1bZ73JIRThZWzrCliFn
 uMSAfCZ/FZ0Fr7n7SY7/JJerIU6lW3BNI7+P2cJXEUzw6YTK5h7St5nyqwRra1FcAmxa
 8GURcBB4DpfsNVLwRETRkSrI42P/btP6O15erx37NGJpZry78+2DXEEQfuHwc8OEabsd
 lraMd1rMw66qyrGaMP3LrFgBCPb9zKeXS++xMEOkLfQIUKlxHnJCSJDQ9YYNQHf4uF4h
 uUnQ==
X-Gm-Message-State: AO0yUKVFrlFLkJTzn+MB2CLnAJzpZ7Oon69iuMJTkm3FVdZqenKgVC2p
 hx8q/BSkPu0ER/ZPSIK9UmGR7ZZj6Mq09OYi
X-Google-Smtp-Source: AK7set+4HGRQNxd5PFNRpZJg4O6VVOGIMD1aTdKW8S+ftEnniX85jfqy2tWagfexHfmjik/RPcSvuw==
X-Received: by 2002:a05:6214:d6c:b0:535:5492:b427 with SMTP id
 12-20020a0562140d6c00b005355492b427mr18340468qvs.28.1677139285897; 
 Thu, 23 Feb 2023 00:01:25 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 e8-20020a05620a014800b0073b399700adsm5763956qkn.3.2023.02.23.00.01.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 00:01:24 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-536cb25982eso145316697b3.13
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 00:01:24 -0800 (PST)
X-Received: by 2002:a81:ad10:0:b0:52e:bb2d:2841 with SMTP id
 l16-20020a81ad10000000b0052ebb2d2841mr1767981ywh.10.1677139284271; Thu, 23
 Feb 2023 00:01:24 -0800 (PST)
MIME-Version: 1.0
References: <CACXRmJj0nSjChCdU8+fDQsiqVw5gUn-91wqLXhYpcc4GfA-Cug@mail.gmail.com>
 <20230221192802.4117856-1-thomas.devoogdt@barco.com>
 <20230221192802.4117856-4-thomas.devoogdt@barco.com>
 <CAB0FRstzoQ-p1TJjBUzN-hou=t-Vs7=u5XeLxdXZggzq7OxAmA@mail.gmail.com>
In-Reply-To: <CAB0FRstzoQ-p1TJjBUzN-hou=t-Vs7=u5XeLxdXZggzq7OxAmA@mail.gmail.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 23 Feb 2023 09:01:13 +0100
X-Gmail-Original-Message-ID: <CACXRmJhC6PHB4HJbj3rYQyoH=xSY6Ua_V8-+57G7LrL4gcGBPw@mail.gmail.com>
Message-ID: <CACXRmJhC6PHB4HJbj3rYQyoH=xSY6Ua_V8-+57G7LrL4gcGBPw@mail.gmail.com>
To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH v3 4/4] package/libgtk3: only
 update-icon-cache when the demos are built
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPaywgdGhlIHByb3Bvc2VkIHNvbHV0aW9uIG1ha2VzIHNlbnNlLiBBbmQgd291bGQgYmUg
c2FmZXIgYW55d2F5LiBJCmFkYXB0IHRoZSBsYXN0IHBhdGNoLgoKS3IsCgpUaG9tYXMKCk9wIGRv
IDIzIGZlYi4gMjAyMyBvbSAwNzo1OCBzY2hyZWVmIEZyYW7Dp29pcyBQZXJyYWQgPGZyYW5jb2lz
LnBlcnJhZEBnYWR6Lm9yZz46Cj4KPgo+Cj4gTGUgbWFyLiAyMSBmw6l2ci4gMjAyMyDDoCAyMDoy
OSwgVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNAZGV2b29nZHQuY29tPiBhIMOpY3JpdCA6Cj4+Cj4+
IFNpbWlsYXIgdG86Cj4+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9ndGsvLS9tZXJn
ZV9yZXF1ZXN0cy80MzU4L2RpZmZzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dk
dCA8dGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KPj4gLS0tCj4+IHYzOgo+PiAgLSByZWJhc2Vk
IG9uIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/
c2VyaWVzPTMzNjI1NAo+PiAgLSBuZWVkZWQgdG8gZml4IHRoZSB3ZWJraXRndGsgMi4zOC41IGNv
bXBpbGF0aW9uCj4+ICAgIChodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjMwMjIwMDkwOTIzLjIxNTU2MzUtMi10aG9tYXMuZGV2b29nZHRAYmFy
Y28uY29tLykKPj4gLS0tCj4+ICBwYWNrYWdlL2xpYmd0azMvbGliZ3RrMy5tayB8IDIgKysKPj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGliZ3RrMy9saWJndGszLm1rIGIvcGFja2FnZS9saWJndGszL2xpYmd0azMubWsKPj4gaW5k
ZXggMjgyMWM3ZWI1Mi4uYjc4NTc4ZDU2OCAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9saWJndGsz
L2xpYmd0azMubWsKPj4gKysrIGIvcGFja2FnZS9saWJndGszL2xpYmd0azMubWsKPj4gQEAgLTE0
NSwxMSArMTQ1LDEzIEBAIGVuZGVmCj4+Cj4+ICAjIENyZWF0ZSBpY29uLXRoZW1lLmNhY2hlIGZv
ciBlYWNoIG9mIHRoZSBpY29uIGRpcmVjdG9yaWVzL3RoZW1lcwo+PiAgIyBJdCdzIG5vdCBzdHJp
Y3RseSBuZWNlc3NhcnkgYnV0IHNwZWVkcyB1cCBsb29rdXBzCj4+ICtpZmVxICgkKEJSMl9QQUNL
QUdFX0xJQkdUSzNfREVNTykseSkKPgo+Cj4gSSBkaXNhZ3JlZSB3aXRoIHRoaXMgbG9naWMuCj4g
QXQgdGhpcyB0aW1lLCBpY29ucyBjb3VsZCBpbnN0YWxsZWQgYnkgMiBwYWNrYWdlczoKPiAtIGhp
Y29sb3ItaWNvbi10aGVtZSB3aGljaCBpcyBzZWxlY3RlZCBieSBsaWJndGszLWRlbW8KPiAtIGFk
d2FpdGEtaWNvbi10aGVtZQo+Cj4gRnJvbSBteSBwb2ludCBvZiB2aWV3LCB0aGlzIGZpbmFsaXpl
IGhvb2sgbXVzdCBiZSBhbHdheXMgZW5hYmxlZCBhcyBhY3R1YWxseSwKPiBidXQgaXQgbXVzdCBu
ZXZlciBmYWlscyBldmVuIHdoZW4gdGhlcmUgaXMgbm8gaWNvbnMuCj4KPiBGcmFuw6dvaXMKPgo+
Cj4+Cj4+ICBkZWZpbmUgTElCR1RLM19VUERBVEVfSUNPTl9DQUNIRQo+PiAgICAgICAgIGZpbmQg
JChUQVJHRVRfRElSKS91c3Ivc2hhcmUvaWNvbnMgLW1heGRlcHRoIDEgLW1pbmRlcHRoIDEgLXR5
cGUgZCBcCj4+ICAgICAgICAgICAgICAgICAtZXhlYyAkKEhPU1RfRElSKS9iaW4vZ3RrLXVwZGF0
ZS1pY29uLWNhY2hlIHt9IFw7Cj4+ICBlbmRlZgo+PiAgTElCR1RLM19UQVJHRVRfRklOQUxJWkVf
SE9PS1MgKz0gTElCR1RLM19VUERBVEVfSUNPTl9DQUNIRQo+PiArZW5kaWYKPj4KPj4gICQoZXZh
bCAkKG1lc29uLXBhY2thZ2UpKQo+PiAgJChldmFsICQoaG9zdC1nZW5lcmljLXBhY2thZ2UpKQo+
PiAtLQo+PiAyLjM5LjIKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
