Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF3BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 08:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D65981987;
	Thu, 23 Dec 2021 08:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OxGc4QeiImbM; Thu, 23 Dec 2021 08:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74CD081467;
	Thu, 23 Dec 2021 08:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B84241BF4D7
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 08:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4FD04043D
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 08:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HnVWlTCXoGcR for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 08:53:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F58040438
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 08:53:07 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id i63so7982245lji.3
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 00:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tY8O+d7cor98DSC6B/Dh2TngkgHL8QiJsee/ppokbpk=;
 b=G2TYuXY+ZF3SfytuHRZjLYyVOHwTbVEESX8TJsy+Kfp3nYyJ9MbnFr85yenmuZVAl8
 MaNlrk6GuPs9srE1bZiwEgOKFiXS0ZT7CvaGGKr07cUoK9ZzJ1q2OIc2LrzqIEEPi60l
 xKIrByeBdu5uzyBgcaPRN2tPBj1bwMbMBs9hfSgOomr/udcmW0bq6ll+sHuFSmLv6uiE
 zC64t8XZ8ZaCEy3eardGsc1PJ41n3Vt+ehWkBAIXHhub12jRhkrj+LtJPHSTucxjDpCR
 EPJbu4TZERg9G0ydnniMipWtlM3cFxvUkPi0bq4E7A10WgL5G17OQCnpZ8Uk7KY8aPgQ
 ymtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tY8O+d7cor98DSC6B/Dh2TngkgHL8QiJsee/ppokbpk=;
 b=mMIfInKZcZTv88da1GTnVq37HnEWqzszL0+d9CK9Dq3rPpIb5QYKD7OkvsQX2TN7u7
 RqgxxYHNNMkJ+evZcjVkWJqbk1ldsKPejDbxYJtrUJPvjGl0EEN7Y8B3ywnw+o1TT2gJ
 GKvZEzdJDR2BSgYrboo6EehB32L4l+FC5hcJqcNySVCkRkTUByAWVW/fR0CRejJEMVQV
 DsPnDhRAjZDYzE6w1LBxSWt0W089QadNYlPCw/kreUfLDc/NgZBV5LwdXCS4NDtBeLW8
 c7gPbXExBy/nZouLXmj2a6HLo52N8w98UJ4veWYB+35QX7pgSALKWc22jMRpbM1Z2LZL
 zuLw==
X-Gm-Message-State: AOAM533zo+8qDAy5gGjvOrjtQsOPeCkjOiy8liKgJtvJXeVh/Qdsm/CZ
 RVWUtz74WjjFqBcKG77xmSKgIqbvK+0=
X-Google-Smtp-Source: ABdhPJxI/SoG4mLeqrV/o4aXNw+mJ9qV7BlGJ36ia4BqAw3f7la4PrpKxTV7jPc+67MJGBzZhg8ZJw==
X-Received: by 2002:a2e:b0c5:: with SMTP id g5mr985567ljl.381.1640249585522;
 Thu, 23 Dec 2021 00:53:05 -0800 (PST)
Received: from [10.0.196.136] ([98.128.186.122])
 by smtp.googlemail.com with ESMTPSA id m7sm442947lfr.133.2021.12.23.00.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 00:53:05 -0800 (PST)
To: Arnout Vandecappelle <arnout@mind.be>
References: <20211222083515.1150267-1-troglobit@gmail.com>
 <20211222083515.1150267-3-troglobit@gmail.com>
 <dc4b99fa-1893-d022-ba29-db80c2fc05ba@mind.be>
 <7592df87-e875-5016-db4f-57e5988dfbc4@gmail.com>
 <3d0ea2c6-5d00-c4cf-7008-88aac6ecd788@mind.be>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <e49e2ea8-8bb1-4f7e-8d2b-88a87180508b@gmail.com>
Date: Thu, 23 Dec 2021 09:53:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3d0ea2c6-5d00-c4cf-7008-88aac6ecd788@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2 2/2] package/makedevs: coding style and
 whitespace cleanup
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTIvMjIvMjEgOToyNCBQTSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gT24gMjIv
MTIvMjAyMSAyMDozMiwgSm9hY2hpbSBXaWJlcmcgd3JvdGU6Cj4+IE9uIDEyLzIyLzIxIDM6MTIg
UE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pj4gQWx0aG91Z2ggSSdtIE9LIHdpdGgg
dGhlIGNoYW5nZXMgcGVyIHNlLCBJIGdlbmVyYWwgSSBkb24ndCBiZWxpZXZlIG11Y2gKPj4+IGlu
IG1hbnVhbGx5IG1haW50YWluZWQgY29kaW5nIHN0eWxlLiBTbyBJJ2QgcHJvcG9zZSB0byBhdCBs
ZWFzdCBpbmNsdWRlCj4+PiBhIC5jbGFuZy1mb3JtYXQgZmlsZSBpbiB0aGUgdG9wIGxldmVsIGRp
cmVjdG9yeSB0aGF0IGRlZmluZXMgb3VyIGNvZGluZwo+Pj4gc3R5bGUuIFdlIHdvdWxkbid0IGVu
Zm9yY2UgaXQgd2l0aCBDSSBvciBhbnl0aGluZyAoYXQgbGVhc3QsIG5vdCBmb3IgdGhlCj4+PiB0
aW1lIGJlaW5nKSwgYnV0IGF0IGxlYXN0IGl0IG1ha2VzIGl0IGVhc3kgdG8gYXBwbHkgdGhlIGNv
ZGluZyBzdHlsZSBhbmQKPj4+IHRvIGtub3cgdGhhdCBpdCdzIGNvcnJlY3QuCj4+IFdlIGRvbid0
IHNlZW0gdG8gaGF2ZSBhbnkgLmNsYW5nLWZvcm1hdCBmaWxlIGF0IHRoZSBtb21lbnQsIHNvIGlm
IEkgY29weQo+PiB0aGUgbGF0ZXN0IHZlcnNpb24gZnJvbSBrZXJuZWwub3JnLCB3aGVyZSBpbiB0
aGUgdHJlZSBzaG91bGQgaXQgbGl2ZT8KPiDCoEF0IHRoZSB0b3AgbGV2ZWwsIHNvIGNsYW5nLWZv
cm1hdCBhbmQgZWRpdG9ycyBmaW5kIGl0IG91dCBvZiB0aGUgYm94LgoKQXBvbG9naWVzLCBJIHNl
ZSBub3cgeW91IHdyb3RlIHRoYXQgYWxyZWFkeSBpbiB5b3VyIG9yaWdpbmFsIHJlcGx5LCBidXQK
aXQgc2VlbXMgbXkgZXllcyBmYWlsZWQgbWUuCgpJJ20gY29tcGlsaW5nIGEgdjMgb2YgbXkgcGF0
Y2ggc2V0IG5vdywgd2hpY2ggaW5jbHVkZXMgdGhlIC5jbGFuZy1mb3JtYXQKYXMgYSBzZXBhcmF0
ZSBjb21taXQuICBJIGV4cGVjdCB0aGVyZSBtYXkgYmUgc29tZSBkaXNjdXNzaW9uIHJlZ2FyZGlu
ZwptYXggbGluZSBsZW5ndGhzIGFuZCBzdWNoLCBidXQgaG9wZWZ1bGx5IGl0IHdvbid0IGJlIHRv
byBjb250cm92ZXJzaWFsLgoKQmVzdCByZWdhcmRzCiAvSm9hY2hpbQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
