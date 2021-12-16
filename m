Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B26C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 17:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C64A440102;
	Thu, 16 Dec 2021 17:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLD0lq2NTl-r; Thu, 16 Dec 2021 17:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D953B40B37;
	Thu, 16 Dec 2021 17:29:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 631CE1BF3AE
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 17:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51D3F61039
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 17:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UfvlWQReGKfu for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 17:29:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D69FD61034
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 17:28:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r11so88732295edd.9
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 09:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mZLH/5tLNWrMpEnmM8OOvQX8yGcbkMww4yOsXd0S/CE=;
 b=EY8pSpk8v0CaDE79XH4bzDXu9nYQIDvPuwh1OT/PQDu3Q1taujv+pvH9hQ15reT52b
 McyariWpHLKeum8d0LW+fymno2ufDzSBdt8BLzPgNDhYMED6aiDldb+8QNa69JH9ghBv
 4oK8vpi+0rP/y07/G/8hWcfhjqTYctIS0LZGTBg7x+4nQIAfdEiiEhtRuaNYgDc0be0U
 Xz24vei53aqy5gBimDE3YO/WqYgnw+/nc283kxsLIOoP5hVYDLGMI0JL8fCMThvUMW+c
 tCAqlhUDjfgvxzxA+GZZZZ2G2yYfbcHtLdJsxHWk8WL3LlTdyQj3odORPsPyy5VoPKZu
 19dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mZLH/5tLNWrMpEnmM8OOvQX8yGcbkMww4yOsXd0S/CE=;
 b=wEeWxHCqDPi4d0HsCe9lkL3Iy5fIR/87/CPgg9ek4VD62wB/HFcoMETx81egtq+FUZ
 66KgEWHtuJtTLjCe7XF1aZsmqV81yanuE2HFd56ZECwvIJpmbGhg5JfdrhmD+T0QQS/9
 J69WBZuaXqB9jWrONbZlb3kINcg2zjKwgK9rQPrBuAHLBBaAUH7LIirHfPZgbbtbp4d+
 ysrP+efXXqum4yIdpX2txSr8DVIrfZ/yTJ6+CLgvDacLy0i824hQnGcTy8N1rCP7xPbW
 9+HH41Qyzh4XCdHyQPqk49RoEaefOEpZYHa/Pqj8D6q1O0HkxQgz1nvATHwRS1/LJkEa
 xKWw==
X-Gm-Message-State: AOAM53146l0sbHFt89ejFITqYudRkXUl9+1339nPJy+Kxd84S8SLeD96
 gND3bnV8uaSqIApeu180HNVJFQ==
X-Google-Smtp-Source: ABdhPJyy+m5zMdxgE32cq1vVhCtTaGXzir2nm1G3Dk2oGEAL3uoG/1P3l+Q+uOFJro97jibAEZWngA==
X-Received: by 2002:a05:6402:147:: with SMTP id
 s7mr21717708edu.8.1639675738167; 
 Thu, 16 Dec 2021 09:28:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hc33sm2056157ejc.93.2021.12.16.09.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 09:28:57 -0800 (PST)
Message-ID: <aafcded5-c0f4-4745-a226-da57d0e7a805@mind.be>
Date: Thu, 16 Dec 2021 18:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Michael Taubert <info@arachnodroid.de>, buildroot@buildroot.org
References: <bug-14451-163@https.bugs.busybox.net/>
 <bug-14451-163-aEqUC9bjBs@https.bugs.busybox.net/>
 <5e9075fc-3083-b8d2-2358-cc5281b306ac@arachnodroid.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <5e9075fc-3083-b8d2-2358-cc5281b306ac@arachnodroid.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: don't disable DRI3 for
 some Gallium drivers
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
Cc: bernd.kuhls@t-online.de, romain.naour@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBNaWNoYWVsLAoKT24gMTQvMTIvMjAyMSAyMDowNiwgTWljaGFlbCBUYXViZXJ0IHdyb3Rl
Ogo+IENlcnRhaW4gR2FsbGl1bSBkcml2ZXJzIG5lZWQgRFJJMyBzdXBwb3J0LCBvdGhlcndpc2Ug
b3BlbmdsIHdvbid0IHdvcmsuCj4gT24gdGhlIFJhc3BiZXJyeSBQaSA0LCBmb3IgZXhhbXBsZSwg
Z2x4Z2VhcnMgd2lsbCBjb21wbGFpbiBhYm91dAo+IAo+ICdGYWlsZWQgdG8gb3BlbiBibyAxOiBw
ZXJtaXNzaW9uIGRlbmllZCcKPiAKPiBUaGVzZSBkcml2ZXJzIG11c3Qgbm90IGJlIHNlbGVjdGVk
IHRvIGRpc2FibGUgRFJJMyBzdXBwb3J0LiBJdCBzZWVtcyB0bwo+IGJlIHRoZSBzYW1lIGZvciBM
aW1hIGFuZCBQYW5mcm9zdCwgcGxlYXNlIGNoZWNrIGJ1ZyAxMzgzMS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIFRhdWJlcnQgPGluZm9AYXJhY2hub2Ryb2lkLmRlPgo+IC0tLQo+ICDCoHBh
Y2thZ2UvbWVzYTNkL21lc2EzZC5tayB8IDYgKysrKystCj4gIMKgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21l
c2EzZC9tZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiBpbmRleCA2MWIwOTVj
Y2NhLi45NzgwZDVhOTYwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+
ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+IEBAIC0xMjEsNyArMTIxLDExIEBAIE1F
U0EzRF9DT05GX09QVFMgKz0gXAo+ICDCoMKgwqDCoMKgwqDCoCAtRGdhbGxpdW0tZXh0cmEtaHVk
PXRydWUKPiAgwqBlbmRpZgo+IAo+IC1pZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9EUklfRFJJ
VkVSKSwpCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX0RSSV9EUklWRVIpIFwKPiArwqDC
oMKgwqDCoMKgICQoQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1YzRCkgXAo+ICvC
oMKgwqDCoMKgwqAgJChCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVkM0KSBcCj4g
K8KgwqDCoMKgwqDCoCAkKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9MSU1BKSBc
Cj4gK8KgwqDCoMKgwqDCoCAkKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9QQU5G
Uk9TVCksKQoKICBUaGUgbWVzYTNkIHN0dWZmIGdvZXMgd2F5IG92ZXIgbXkgaGVhZCwgYWN0dWFs
bHksIGJ1dCBJIHdvdWxkIHRoaW5rIHRoYXQgdGhlIApwcm9wZXIgc29sdXRpb24gaGVyZSB3b3Vs
ZCBiZSB0aGF0IHRoZXNlIGNvbmZpZ3Mgc2VsZWN0IApCUjJfUEFDS0FHRV9NRVNBM0RfRFJJX0RS
SVZFUi4KCiAgSSBrbm93IGl0IHNvdW5kcyB3ZWlyZCB0aGF0IGEgZ2FsbGl1bSBkcml2ZXIgaXMg
YWxzbyBhIERSSSBkcml2ZXIsIGJ1dCBJIGd1ZXNzIAp0aGF0J3Mgd2hhdCBpdCBpcy4uLgoKICBC
ZXJuZCwgY2FuIHlvdSBjb21tZW50PwoKICBSZWdhcmRzLAogIEFybm91dAoKPiAgwqBNRVNBM0Rf
Q09ORl9PUFRTICs9IFwKPiAgwqDCoMKgwqDCoMKgwqAgLURkcmktZHJpdmVycz0gLURkcmkzPWRp
c2FibGVkCj4gIMKgZWxzZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
