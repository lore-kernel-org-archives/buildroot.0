Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B280C433FE
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:21:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3065C61AA9
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3065C61AA9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0569B403D4;
	Tue,  9 Nov 2021 22:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYIlNCLN8OGp; Tue,  9 Nov 2021 22:21:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF315403DC;
	Tue,  9 Nov 2021 22:21:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14DF41BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03D7381871
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zSn9Eg9ncy6 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:21:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6FD481826
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:21:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i5so533097wrb.2
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=knvXtP3iWU1H/65PE1lgDLe1/ByUh8XM+L6jTWxdRMA=;
 b=AnLl88gQ6j0CDNTixoDzvIMz4WmDxhcIrYNwbOTSge8T9xMgFoD8Dokk4K/Wz6Xi69
 AtqkWkM7BPcDBJ4PSetlTtrWs127r8fZIyLk2POg01kChF/wpYH+lQK9SwuvYKtAXsEd
 8eL3+IulGqV1zaSv8Cic+4AabACkOg9urp7903T8r74GzaaY13irKlaO71IGBhy7cYGZ
 kxpCGBpX6kR5argGgS/0wNdBOz65bQIj45Ug/fm0tUKtc8umXvJWHfvj6zxqbNQBziIn
 deGbZ43GuVbVR53/8ovtZZAWi2ZEUb14zWl03ANwIwSuzqryLzYKE1LEvzoyluLkaxd4
 kb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=knvXtP3iWU1H/65PE1lgDLe1/ByUh8XM+L6jTWxdRMA=;
 b=fV01CbVUKh42BJA0DbEmCDBmS31YgKZnLJjvoCkR/u6ScFnyjoItDOh4scrx9M0AL6
 43PPdc3j/5Fz4fzhW7AM3oe1u3rVrOTd2r4F6QoSw6Z+hW51wbPX4N1TOpn4Umf8Ozn+
 TyGaOQsIaZDd8mpNfGw2NGg/uqcmmX3hFPoJcVf3wBO4GF/wBJy2lbYl78MZ3F+dJW4P
 Iwj5G1UKYTbQ10WOeZ8Fe2bGPKQilQyddZq2A5cSScTUP51KU+Bs/wUOZOFHRsPW/OSQ
 SEnSnLUUEUJOnQFfGy2dvN2thtq5PTf3Wezr/+x0cszUUM+dDD1PJAF43+vAB6oQ3YA0
 vmyw==
X-Gm-Message-State: AOAM532xP0hxqjHbjbco0olAgluOL9ewTOGPGSGore8/LNENsnSw4rZB
 +E2RBIpwwebjUP0qqXGyp24=
X-Google-Smtp-Source: ABdhPJwxQUUZHWXLIlVkQiO9VS5rLJNnf9NaR2AjYQ0xbKIX2Oj5wZjzvsrosjg45QM+xegRlT5sUg==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr13582337wrv.240.1636496507257; 
 Tue, 09 Nov 2021 14:21:47 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id x1sm3748363wmc.22.2021.11.09.14.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:21:46 -0800 (PST)
Message-ID: <d13e37ce-b5d7-1dfe-e2fd-55887e9b6065@gmail.com>
Date: Tue, 9 Nov 2021 23:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <75228581-2222-7bea-1a96-20202d5c9015@mind.be>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <75228581-2222-7bea-1a96-20202d5c9015@mind.be>
Subject: Re: [Buildroot] Failing tests on gitlab
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMDkvMTEvMjAyMSDDoCAyMTozMCwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiDCoEhpIGFsbCwKPiAKPiDCoFRoZSAyMDIxLjExLXJjMSB0YWcgdHJp
Z2dlcmVkIGEgY29tcGxldGUgcnVuIG9mIGFsbCB0aGUgZGVmY29uZmlncyBhbmQgYWxsIHRoZQo+
IHRlc3RzLiAxNDggb3V0IG9mIDcyNSBqb2JzIGZhaWxlZCBbMF0uCj4gCj4gCj4gwqBUaGVyZSBh
cmUgdHdvIG1haW4gY2F1c2VzIGZvciBmYWlsdXJlczoKPiAKPiAKPiAxLiBtdWx0aXBsZSBkZWZp
bml0aW9uIG9mIGB5eWxsb2MnIGluIHUtYm9vdCBvciBsaW51eCwgZS5nLiBbMV0uIFRoaXMgaXMK
PiB0cmlnZ2VyZWQgYnkgdGhlIHVwZGF0ZSBvZiB0aGUgZG9ja2VyIGltYWdlIHdoaWNoIGhhcyBh
IG5ldyAoaG9zdCkgZ2NjIHZlcnNpb24KPiAxMCwgd2hpY2ggZGVmYXVsdHMgdG8gLWZuby1jb21t
b24uIFNpbmNlIHRoZXJlIGFyZSBtb3JlIHRoYW4gMTAwIGRlZmNvbmZpZ3MgdGhhdAo+IHN1ZmZl
ciBmcm9tIHRoaXMgcHJvYmxlbSwgSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIHNvbHZlIHRo
aXMgaW4gdWJvb3QubWsgYW5kCj4gbGludXgubWsgcmF0aGVyIHRoYW4gcGF0Y2hpbmcgYWxsIHRo
ZSBkZWZjb25maWdzLiBUaGUgZml4IGlzIHJhdGhlciBzaW1wbGU6Cj4gcmVtb3ZlIHRoZSBkZWZp
bml0aW9uICJZWUxUWVBFIHl5bGxvYyIgZnJvbSBzY3JpcHRzL2R0Yy9kdGMtbGV4ZXIubC4gVGhl
cmUncyBhCj4gc2xpZ2h0IGNvbXBsaWNhdGlvbiB0aGF0IG9sZGVyIGtlcm5lbHMgc3RpbGwgaGF2
ZSBhICJzaGlwcGVkIiB2ZXJzaW9uIG9mIHRoZQo+IGZpbGUsIGJ1dCB0aGF0IGNhbiBiZSBzb2x2
ZWQgd2l0aCB3aWxkY2FyZCBtYXRjaGluZy4gVGhpcyB3aWxsIG5lZWQgYSBiaXQgb2YKPiB0ZXN0
aW5nIHRob3VnaCB0byBzZWUgaG93IGl0IGJlaGF2ZXMgd2l0aCBvbGRlciBrZXJuZWwvdWJvb3Qg
dmVyc2lvbnMsIGJlY2F1c2UKPiB0aGF0IGNvZGUgKmhhcyogY2hhbmdlZCBhIGNvdXBsZSBvZiB0
aW1lcy4gQWxzbywgZm9yIHRoZSBjYXNlcyB3aGVyZSB0aGVyZSdzIGEKPiBzaGlwcGVkIHZlcnNp
b24sIHdlIHNob3VsZCBwcm9iYWJseSB0YWtlIGNhcmUgd2l0aCB0aGUgdGltZXN0YW1wcywgdG8g
YXZvaWQgdGhhdAo+IHRoZSBjIGZpbGUgaXMgcmVnZW5lcmF0ZWQuCgpBY3R1YWxseSB0aGlzIHBy
b2JsZW0gYWxyZWFkeSBhZmZlY3QgdXNlcnMgdXNpbmcgYSByZWNlbnQgTGludXggZGlzdHJpYnV0
aW9uLiBXZQp1c2VkIGZvciB0b28gbG9uZyB0aGUgcHJldmlvdXMgZG9ja2VyIGltYWdlIGJhc2Vk
IG9uIERlYmlhbiBTdHJldGNoIHNuYXBzaG90CigyMDE3MTIxMCkuCgo+IAo+IAo+IDIuIEpvYiB0
aW1lb3V0LCBlLmcuIFsyXS4gSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgdGhpcyB0aW1lb3V0
IGlzLiBJdCdzCj4gZGVmaW5pdGVseSBub3QgdGhlIDZoIGpvYiB0aW1lb3V0LCBiZWNhdXNlIHRo
ZSBqb2IgaGFzbid0IGV2ZW4gc3RhcnRlZC4gSQo+IHN1c3BlY3QgdGhhdCB0aGVyZSdzIHNvbWUg
aGlkZGVuIG92ZXJhbGwgMjRoIHRpbWVvdXQgZm9yIHRoZSBlbnRpcmUgcGlwZWxpbmUsCj4gYW5k
IHRoYXQgYmVjYXVzZSB3ZSBoYXZlIHNvIG1hbnkgam9icywgd2UncmUgbm90IGFibGUgdG8gZmlu
aXNoIGFsbCBvZiB0aGVtCj4gd2l0aGluIHRoYXQgdGltZS4gVGhlIG9ubHkgc29sdXRpb24gZm9y
IHRoYXQgaXMgdG8gYWRkIGFkZGl0aW9uYWwgcnVubmVycy4gU28sCj4gaWYgdGhlcmUncyBhbnli
b2R5IG91dCB0aGVyZSB3aXRoIHNwYXJlIGN5Y2xlcywgcGxlYXNlIHZvbHVudGVlciB0byBhZGQg
YQo+IHJ1bm5lciEgWW91IGNhbiBjb250YWN0IG1lIG9yIFJvbWFpbiB0byBsZWFybiBob3cgdG8g
c2V0IG9uZSB1cC4KCldlIGNhbiBhbHNvIHJlZHVjZSB0aGUgbnVtYmVyIG9mIGxvbmcgam9iczoK
aHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjEx
MTA5MjIwMzI4LjM4ODg3Mi0xLXJvbWFpbi5uYW91ckBnbWFpbC5jb20vCgpCdWlsZGluZyBhbGwg
Ym9hcmRzIGRlZmNvbmZpZ3MgYXJlIHRpbWUgY29uc3VtaW5nIGZvciB0aGUgQ0kgYW5kIGRvZXNu
J3QgcHJvdmlkZQptdWNoIGJlbmVmaXQuIEFsbCBkZWZjb25maWdzIGFyZSBidWlsZCBldmVyeSB3
ZWVrcyBieSBhIHNjaGVkdWxlZCB0cmlnZ2VkIHBpcGVsaW5lLgoKPiAKPiAKPiDCoEhvcGVmdWxs
eSwgd2UgY2FuIGdldCBiZXR0ZXIgcmVzdWx0cyBieSAtcmMyIQoKV2VsbCwgZXhjZXB0IGZvciB0
aGUgZ2NjIDEwIGlzc3VlLCB0aGUgcmVzdWx0cyBhcmUgYWxyZWFkeSBnb29kLgpPbmx5IG9uZSBp
c3N1ZSBsZWZ0IGluIHRoZSBydW50aW1lIHRlc3RpbmchCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoK
Cj4gCj4gCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4gCj4gCj4gWzBdIGh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy80MDQyNDk3NDAvZmFp
bHVyZXMKPiAKPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy8xNzU4OTY2MDI4Cj4gCj4gWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2pvYnMvMTc1ODk2NjU2Nwo+IAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
