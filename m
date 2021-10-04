Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00119C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B961661425
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B961661425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C73F40472;
	Mon,  4 Oct 2021 21:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qM2YH9sBMCeP; Mon,  4 Oct 2021 21:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B58F74039E;
	Mon,  4 Oct 2021 21:41:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54ACD1BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F086076B
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SW03LVJa_rH for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:40:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8754060752
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:40:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r7so17817113wrc.10
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 14:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/dozY6EDMGmEgTJZYyBftYlLQiq6YBZB58bH6YC6TfU=;
 b=VWT/2Pj0lKvN52ZhQ3sLVk1xz0Fgog2eHNaK7aKVp83elJMh9UpkoKZ6M7qkkVKeU+
 adlq+EAhGpihE6YMPqDfs41Z86rKXLFbWoa6Af6cW5pjx/fColG4qpt8IO3H5PhIMn+x
 AGZy9QzJSfuQZgRkbGPlhDHXlJgDEKMDCxBSs6D8a806q0bkzK2EHYwEUVlqvJttb8AL
 dUI8OamJKd6n5gAdif50hMuJqm2GFaLKdyQHv2/dyImnhOOWPCjJOmvj/m7iO3FEd897
 FbSf79VBjhnOWhAxEWX94Qg30t4ZOOEbOrzwFnms4le4Rzd2kxQ5gDjPcJQnPdg24lgX
 wudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/dozY6EDMGmEgTJZYyBftYlLQiq6YBZB58bH6YC6TfU=;
 b=e3tsMYG7QXx9n4Ehh+fiO+5sz2sj7JOxjWSSgMJ7hoRU/dbScH8hWpWHLBEoTOqzv4
 PNdGUdyRRSZIYatxq4ddT6/RnltC6cXgeAMJCWCvWTX/oxF1cG4k3DQs7FYIRLHHyjhr
 rK+0zNUZBx3qtF7m/ovHCkXcBAsiOWc7HFoz89mXnxXlt11eIz95Vn+8Kt7FRL8XBudc
 6vZsaunBj3ikavmi7ujIlMLaRO3Bsj5dVHK/8K4O9KJg1yuH1Qbkl0R5pOM+xiTbQwhO
 tnEdojLMhtAcsBU+KKVjY/v/JL7hYArf79Xy9XbQ1Wj38LvYp0pdaRe2BzEWjdPAtG85
 FCaA==
X-Gm-Message-State: AOAM532pYXnqfD9R5R93rAzkXRLJTj/TK2tQGwsbpfLHFZkLzZX28rw7
 tyQ32cwd35mTJ2qveDNMSLh/MRF5VhE=
X-Google-Smtp-Source: ABdhPJyT9zbPqBQ3PPfcLIEZvaNR5Q4QAmRMkvE53DENJexvY0H2vRnpPHrUx4xwbq+vU+4VJ8+anw==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr17437170wrb.77.1633383622612; 
 Mon, 04 Oct 2021 14:40:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id p18sm4431901wrt.96.2021.10.04.14.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 14:40:22 -0700 (PDT)
Message-ID: <cd43a5b0-e868-5188-f9c4-4426657db49c@gmail.com>
Date: Mon, 4 Oct 2021 23:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Guo Ren <ren_guo@c-sky.com>
References: <20211003123932.343326-1-romain.naour@gmail.com>
 <7402CD01-65B9-42B3-B6BF-95F3434B843F@c-sky.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <7402CD01-65B9-42B3-B6BF-95F3434B843F@c-sky.com>
Subject: Re: [Buildroot] [PATCH 1/5] configs: remove qemu_csky defconfigs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR3VvLAoKTGUgMDQvMTAvMjAyMSDDoCAxNzozNywgR3VvIFJlbiBhIMOpY3JpdMKgOgo+
IAo+IAo+IEJlc3QgUmVnYXJkcwo+ICAgR3VvIFJlbgo+IAo+IAo+IAo+PiDlnKggMjAyMeW5tDEw
5pyIM+aXpe+8jOS4i+WNiDg6MznvvIxSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5j
b20+IOWGmemBk++8mgo+Pgo+PiBXZSBhcmUgZ29pbmcgdG8gcmVtb3ZlIHRoZSBnY2MgZm9yayBm
b3IgY3NreSBzaW5jZSBpdCBkb2Vzbid0IGJ1aWxkCj4+IHdpdGggdGhlIGxhdGVzdCBjb21waWxl
cnMgKGdjYyA4LCAxMCwgMTEgdGVzdGVkKSBbMV0uCj4+Cj4+IFJlbW92aW5nIHRoZXNlcyBkZWZj
b25maWdzIGFuZCB0aGUgY3NreSBnY2MgZm9yayBoYXMgYmVjb21lIHVuYXZvaWRhYmxlCj4+IHNp
bmNlIHRoZSBCdWlsZHJvb3QgRG9ja2VyIGltYWdlIHVzZWQgYnkgdGhlIGdpdGxhYiBDSSB3aWxs
IHN3aXRjaCBzb29uCj4+IHRvIERlYmlhbiBidWxsc2V5ZSBzb29uIFsyXS4KPj4KPj4gVGhlIGNr
c3kgZ2NjIGZvcmsgYmFzZWQgb24gZ2NjIDYgaGFzIG5vdCBiZWVuIHVwZGF0ZWQgc2luY2UgaXQg
aGFzIGJlZW4KPj4gYWRkZWQgdG8gQnVpbGRyb290IFszXS4gU2luY2UgdGhlbiwgY3NreSBoYXMg
YmVlbiBhZGRlZCB0byBiaW51dGlscyBhbmQKPj4gZ2NjIGJ1dCB1c2luZyB0aGUgbGF0ZXN0IHVw
c3RyZWFtIHZlcnNpb24gKGJpbnV0aWxzIDIuMzcgYW5kIGdjYyAxMSkgaXMKPj4gbm90IHlldCBw
b3NzaWJsZSBkdWUgdG8gYnVpbGQgaXNzdWUgd2l0aCBnbGliYyAyLjM0IFs0XS4KPj4KPj4gTW9y
ZW92ZXIsIHFlbXVfY3NreSBkZWZjb25maWdzIHdhcyB0byBiZSB1c2VkIHdpdGggdGhlIGNza3kg
cWVtdSBmb3JrCj4+IChiYXNlZCBvbiBRZW11IDMueCkgYWRkZWQgYnkgY29tbWl0IFs1XSBhbmQg
cmVtb3ZlZCBieSBjb21taXQgWzZdLgo+PiBTaW5jZSB0aGVuIGl0J3Mgbm90IHBvc3NpYmxlIHRv
IGRvIGEgcnVudGltZSB0ZXN0IHdpdGggdGhlc2VzCj4+IGRlZmNvbmZpZ3MuCj4gCj4gQXNrZWQt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IAo+IFRoeCBmb3IgbWFpbnRhaW4gY3Nr
eSBwYXJ0IGZvciBhIGxvbmcgdGltZSwgd2Ugd291bGQgYmFjayB0byBidWlsZHJvb3Qgd2hlbiB1
cHN0cmVhbSB0b29sY2hhaW4gYW5kIFFlbXUgd2VyZSByZWFkeS4KPiAKClRoYW5rcyBmb3IgdGhl
IGZlZWRiYWNrIQoKVGhlIHRvb2xjaGFpbiB1cHN0cmVhbSBwcm9jZXNzIHNlZW1zIGFsbW9zdCBm
aW5pc2hlZCwgdGhlIG5leHQgc3RlcCBpcyB0aGUgcWVtdQp1cHN0cmVhbWluZy4KCkkgaG9wZSBl
dmVyeXRoaW5nIHdpbGwgYmUgYXZhaWxhYmxlIHNvb24uCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
