Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFED8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 10:15:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EE4E61B00
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 10:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EE4E61B00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26F8640552;
	Sun,  3 Oct 2021 10:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIyG0Xbpurxw; Sun,  3 Oct 2021 10:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27317404D1;
	Sun,  3 Oct 2021 10:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FC3B1BF59F
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 10:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EDA160AD8
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 10:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8UhG0reiX2iu for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 10:15:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90339606A0
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 10:15:37 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z20so1346420edc.13
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=5BjyxtXsBP2prMZoer2td6+sza+2nRZl4fi95aq9A+o=;
 b=NfzK+g79rJnJNTpzF9vK644uVZ+TVoCAyrtU7azw1Al6BGxaSeYS4m44xPWMU3BaPl
 5FCAeyzuykySbngav9j64UGc0XYLxbCG8opK8IMIjRnYjqK6ZHGRFbh4sgMfcpSuTyuk
 oeTbtMXKuILRgHairspSeZg7vuoy7RC/1M75lgjioYx7OAH6whojQk4FM9QQQceeRiSi
 5VbIbUijZzdNmG9UckS4bRrZmymQ3g0bhy4PiXXQc0WsPJWFJkhgxwT2/EEgfSokF0Dm
 nbPLV4oKf3eFBCMXrIge6UO7xXxs95QLp9rbAogaDOoMVtHfylLX9zmfX0U1xq8i/gPL
 yckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5BjyxtXsBP2prMZoer2td6+sza+2nRZl4fi95aq9A+o=;
 b=Rshq4ARfuoBoIeNeTbyKq+2Z2Tfz9qJpcAULgH6JE/1BZPvOjrOOlkUFroGf3Tr2Ol
 bCb2Uruhkhn5LqjO/T3WRnTGFw9D51sqO4UwemyFpaym5VZZmc/bd/sOJ29Ykr66VCa/
 TIc4miturQNTxkj6L+fpXMX9hUT3RhzqnB/3nCw7DBGZmQg6OgsVdYVqyaxhMN4gKNFi
 vknyjIHqe+bnCcvWudC7wQfbz/mpXOFZQum3Br05+7Lt9IOI6HFUbzk5JuOATQpgBC2s
 TiSkKMKfYxnCYG3yQ+LQzTXK8Q6RuuwNtQ4ugZbrazqd9umSxXOvX6gPK6z9DzD0fBBL
 nAbA==
X-Gm-Message-State: AOAM532ISouuPMz4gJg0rzLS+NPelvkr1KLCZ1KQzVIBLkOzoR2pgmkL
 QnRUhZOeMXJFPc8JEVoBdOSORw==
X-Google-Smtp-Source: ABdhPJw1cS1EBPu95NIq2J8FKkTeK0LSkCcxQZ1nCOuV82Im5uuVgNPGyMO6aRwjWUhPvXj5M0Kv9w==
X-Received: by 2002:a05:6402:1e88:: with SMTP id
 f8mr9988419edf.126.1633256135619; 
 Sun, 03 Oct 2021 03:15:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dj8sm5597770edb.53.2021.10.03.03.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 03:15:35 -0700 (PDT)
Message-ID: <07d1425c-7351-cc34-381c-a6fde26185fd@mind.be>
Date: Sun, 3 Oct 2021 12:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20211001062052.770583-1-jose.pekkarinen@unikie.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211001062052.770583-1-jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH] package/audit: Fix type output on log
 folder creation
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

CgpPbiAwMS8xMC8yMDIxIDA4OjIwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IFRlc3Rpbmcg
YnVpbGRyb290IDIwMjEuMDUgSSBvYnNlcnZlZCB0aGF0IGFmdGVyIGZpcnN0Cj4gYm9vdCBJIHdh
cyBoYXZpbmcgdGhlIGZvbGxvd2luZyBmb2xkZXJzOgo+IAo+IC9jb250ZXh0Ogo+IC9zeXN0ZW1f
dTpvYmplY3RfcjphdWRpdGRfbG9nX3QKPiAKPiBUaGUgcm9vdCBvZiB0aGlzIHByb2JsZW0gdHVy
bmVkIHRvIGJlIGEgZGlmZmVyZW5jZSBpbiB0aGUKPiBvdXRwdXQgb2YgJChzZWxhYmVsX2xvb2t1
cCAtYiBmaWxlIC1rIC92YXIvbG9nL2F1ZGl0KSBjYWxsZWQKPiBieSBTMDJhdWRpdGQgdGhhdCBm
cm9tIHRoaXMgdmVyaXNvbiBvbiBsb29rcyBsaWtlOgo+IAo+ICQgc2VsYWJlbF9sb29rdXAgLWIg
ZmlsZSAtayAvdmFyL2xvZy9hdWRpdAo+IERlZmF1bHQgY29udGV4dDogc3lzdGVtX3U6b2JqZWN0
X3I6YXVkaXRkX2xvZ190CgogIFdoYXQgaXMgdGhlIGNoYW5jZSB0aGF0IHRoaXMgb3V0cHV0IGZv
cm1hdCBpcyBnb2luZyB0byBjaGFuZ2UgYWdhaW4/IERvZXMgCnNlbGFiZWxfbG9va3VwIGhhcyBh
ICJzY3JpcHRhYmxlIiBvdXRwdXQgZm9ybWF0IHRoYXQgd2UgY2FuIHJlbHkgb24gbm90IHRvIGNo
YW5nZT8KCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IFRoaXMgcGF0Y2ggd2lsbCBjdXQgaXQg
dG8gcmV0cmlldmUgdGhlIHR5cGUgcGllY2Ugb25seS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KPiAtLS0KPiAgIHBhY2th
Z2UvYXVkaXQvUzAyYXVkaXRkIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXVkaXQvUzAyYXVk
aXRkIGIvcGFja2FnZS9hdWRpdC9TMDJhdWRpdGQKPiBpbmRleCAwZWVmODgxY2VlLi5kZDNkYzIy
ZDZkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvYXVkaXQvUzAyYXVkaXRkCj4gKysrIGIvcGFja2Fn
ZS9hdWRpdC9TMDJhdWRpdGQKPiBAQCAtMjAsNyArMjAsNyBAQCBzdGFydCgpewo+ICAgCSMgdGhl
IGRpcmVjdG9yeSB3aXRoIFNFTGludXggcGVybWlzc2lvbnMgaWYgcG9zc2libGUKPiAgIAljb21t
YW5kIC12IHNlbGFiZWxfbG9va3VwID4vZGV2L251bGwgMj4mMQo+ICAgCWlmIFsgJD8gPSAwIF07
IHRoZW4KPiAtCQlta2RpciAtcCAvdmFyL2xvZy9hdWRpdCAtWiBgc2VsYWJlbF9sb29rdXAgLWIg
ZmlsZSAtayAvdmFyL2xvZy9hdWRpdGAKPiArCQlta2RpciAtcCAvdmFyL2xvZy9hdWRpdCAtWiBg
c2VsYWJlbF9sb29rdXAgLWIgZmlsZSAtayAvdmFyL2xvZy9hdWRpdCB8IGN1dCAtZCAnICcgLWYg
M2AKPiAgIAllbHNlCj4gICAJCW1rZGlyIC1wIC92YXIvbG9nL2F1ZGl0Cj4gICAJZmkKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
