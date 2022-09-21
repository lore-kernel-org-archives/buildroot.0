Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60533ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07C586105E;
	Wed, 21 Sep 2022 18:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07C586105E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7lAj3ihTuZc; Wed, 21 Sep 2022 18:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44D1C60F39;
	Wed, 21 Sep 2022 18:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44D1C60F39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A622E1BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D29140442
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D29140442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlFVZ0RCjM5Y for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:14:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E4754049F
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E4754049F
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:14:06 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y3so15520680ejc.1
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 11:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=vHQ8/nnJrHTUJSy9eRlt4sVkTL7LJgXijxammEYphzQ=;
 b=cxVcSzO5umrRHrLpCEFmZYsAv4px7CmM20YdVrK500YB+h74VI7l+pwF6p6jTUQ2gP
 0d04JfAvjwjTk/INgSkTcx6PvUdLqWw6RD9vkk+iYKLufuwP11eT/5uJvxD44c6Q9jws
 V+C8wYjltj2AAjfLbmx6nmtcTZhTpAwOIzBGoOn6M8EGypgMINb78aYubXsHMjEExl+8
 q0WwV7u7w2Ovqtpi/2/cmMm9ZkDhgZT/QnwGQ2zOQhrlsTQ++isJ9z3h/GtCPBzVYxR1
 TL+OizXG2sPyf+GTVwL6vaFynmKNkiT6WaEtSaVd8k6BWuCTs4slkKHPYyBT4OGPYgAP
 h2Tg==
X-Gm-Message-State: ACrzQf38LTy0VR85HtHW0c1ep2PKAL8sXjU1y8+HSH3j0n5qDm09AE9q
 Ewlv3bYL3eHc4ZEFEENJlXqTZPPlRp0/zw==
X-Google-Smtp-Source: AMsMyM44gJjTOojrmYgk8Ltd9vVhjW0uDtLOJBt4NVdg3HHcNkcAEZXEwZ+q7luEiDBQzZjdVDfCYg==
X-Received: by 2002:a17:907:70a:b0:750:bf91:caa3 with SMTP id
 xb10-20020a170907070a00b00750bf91caa3mr22087373ejb.711.1663784044492; 
 Wed, 21 Sep 2022 11:14:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a50fa88000000b0045256570210sm2307350edr.3.2022.09.21.11.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 11:14:03 -0700 (PDT)
Message-ID: <1e8710d7-21a2-7d8a-15f5-9cff50043965@mind.be>
Date: Wed, 21 Sep 2022 20:14:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Jiwen Qi <Jiwen.Qi@outlook.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <CWLP265MB07397A088F5452EE7C444892954F9@CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM>
 <CWLP265MB073949084186060254912CF0954F9@CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CWLP265MB073949084186060254912CF0954F9@CWLP265MB0739.GBRP265.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=vHQ8/nnJrHTUJSy9eRlt4sVkTL7LJgXijxammEYphzQ=;
 b=MHrFn1zQkxT0Vpsw1kv5YYpSAP2x6RLuY1BvJw/cNnBT8FFbkqCo7RvyXU7feBRKLf
 oKFo3UXnm7ec4UmKzMKZ+j+toLEK2j10uQWULRIdQn2q6ePMofUqXuFo/clTejMIi2dt
 jb4Rxb9n3fEEgiRlI2vLAD3N1d8Rk+O1bUAw0veHOK1EMNHYdNsaDOGeEqi7H8LdvMUa
 1d5q7p+fq27dUIhiEo1kfxOM9mIyZCQy7zho3L9FZLq7z848nzpiKzWjGfD7PSLBwxt2
 9nwL8pQfyqPGQjGbwtlWfIAJXYUgcpqRt+RGUrFyaW+WDrXwaUTYftRksSuGa7fUzDup
 nzBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MHrFn1zQ
Subject: Re: [Buildroot] Does Buildroot provide a mechanism to patch the
 files of a package in the package directory?
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

CgpPbiAyMS8wOS8yMDIyIDE5OjEwLCBKaXdlbiBRaSB3cm90ZToKPiBIaSwKPiAKPiBMZXQncyB0
YWtlIHRoZSBEaXJlY3RGQiBwYWNrYWdlIGFzIGFuIGV4YW1wbGUuCj4gSG93IGNhbiBJIHBhdGNo
IHRoZcKgQ29uZmlnLmluIG9ywqBkaXJlY3RmYi5tayBmaWxlIGluIAo+IGJ1aWxkcm9vdC0yMDE4
LjA4LjQvcGFja2FnZS9kaXJlY3RmYi4gVGhlIGJ1aWxkcm9vdC0yMDE4LjA4LjQgZGlyZWN0b3J5
IGlzIHRoZSAKPiByb290IGRpcmVjdG9yeSBvZiBCdWlsZHJvb3QuCgogIFRoZXJlIGlzIGN1cnJl
bnRseSBubyB3YXkgdG8gZG8gdGhhdC4gRm9yIHRoZSB0aW1lIGJlaW5nLCB0aGUgYmVzdCBhcHBy
b2FjaCBpcyAKdG8gd3JpdGUgYSB3cmFwcGVyIHNjcmlwdCBhcm91bmQgeW91ciBidWlsZHJvb3Qg
J21ha2UnIGNhbGwgdGhhdCBjaGVja3MgaWYgCnBhdGNoZXMgaGF2ZSBhbHJlYWR5IGJlZW4gYXBw
bGllZCBhbmQgYXBwbGllcyB0aGVtIGlmIG5vdC4KCiAgSWRlYWxseSB3ZSBzaG91bGQgaW5kZWVk
IGhhdmUgYSB3YXkgdG8gZG8gdGhpcyBpbiBhIEJSMl9FWFRFUk5BTCwgYnV0IGl0IGdldHMgCmEg
Yml0IGNvbXBsaWNhdGVkLi4uIE9uZSBpZGVhIEkgaGFkIGlzIHRvIHNjYW4gdGhlIC5tayBmaWxl
cyBpbiB0aGUgZXh0ZXJuYWwgCmRpcmVjdG9yeSBiZWZvcmUgaW5jbHVkaW5nIHRoZSBpbnRlcm5h
bCBvbmVzLCBhbmQgY3JlYXRlIGEgbGlzdCBvZiBwYWNrYWdlcyB0aGF0IApzaG91bGQgYmUgc2tp
cHBlZCBmcm9tIHRoZSBpbnRlcm5hbCBvbmUuIFRoYXQgd2F5LCBpZiB5b3UgY3JlYXRlIGFuIGV4
dGVybmFsIApwYWNrYWdlIHdpdGggdGhlIHNhbWUgbmFtZSBhcyBhbiBpbnRlcm5hbCBvbmUsIGl0
IHdpbGwgZ2V0IG92ZXJyaWRkZW4uIFRoZXJlIGFyZSAKYSBidW5jaCBvZiBjb3JuZXIgY2FzZXMg
dGhvdWdoOiB3aGF0IGhhcHBlbnMgaWYgdGhlIHNhbWUgcGFja2FnZSBnZXRzIGRlZmluZWQgCnR3
aWNlIGluIHRoZSBleHRlcm5hbD8gV2hhdCBhYm91dCBzdXBwb3J0IGZpbGVzIGxpa2UgLmhhc2gs
IENvbmZpZy5pbiwgcGF0Y2hlcywgCi4uLj8gV2hhdCB3aXRoIHBhY2thZ2VzIGluIHN1YmRpcmVj
dG9yaWVzIGUuZy4gcXQ1PwoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBJIGtub3cgQnVpbGRy
b290IGhhcyBtZWNoYW5pc21zIHRvIHBhdGNoIHRoZSBmaWxlcyAKPiBpbsKgYnVpbGRyb290LTIw
MTguMDguNC9vdXRwdXQvYnVpbGQvZGlyZWN0ZmItMS43LjcuCj4gCj4gVGhhbmtzIGFuZCByZWdh
cmRzCj4gCj4gSml3ZW4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
