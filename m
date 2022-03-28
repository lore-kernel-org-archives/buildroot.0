Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF13C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E6F8405A6;
	Mon, 28 Mar 2022 19:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MOLxBKY_W0I; Mon, 28 Mar 2022 19:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22EAE40191;
	Mon, 28 Mar 2022 19:56:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BCF31BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A80781A30
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOuGf6itO_L8 for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:56:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 245E3819F6
 for <buildroot@busybox.net>; Mon, 28 Mar 2022 19:56:45 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id u26so18181987eda.12
 for <buildroot@busybox.net>; Mon, 28 Mar 2022 12:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=I83RVK1OOPNRGHQBWOR+7TNdiT55VcuZLIupY7cPQhc=;
 b=dLWDrmmHB4zxGefVddZKRhHF4DiBsQFp9/6UDYDju5A36+QNpa31RxiNuwpeIw6S5n
 W21C5qM9WD37lALqjvCNKw8JgYZB6cP19YKCw2LqVmCX8Tz67CuDiaaSJCMQ9sEK+hYZ
 JBZ9AQZMCfB2l9McQQ2CrBKIDk1rWOl8c0b30fktaQ13yCKk3nO3kYRyMaZ+5QTzwza5
 NWef72I1tYdK2j+UApm5jbcvdUVhnxwW9cLI0Zhsj5VO2RjOh2fInodyXtVbTTBmQJxR
 o0qn63lf63xkq7Z0M23YBFsBPx5qjZQRChghm/AAlnMLWsYCO7+WSLJJ8negrVb+w4US
 +zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=I83RVK1OOPNRGHQBWOR+7TNdiT55VcuZLIupY7cPQhc=;
 b=OueVgDoYQ4KhZ3oxucFEI2GmOD06qTTMIUuQCtb9tpOiheJu4si7vO4dngfGzfKoP/
 cUrm/Pzwo+Ia+ZRb3TPCA5Dashxq1TQXQ/Q9i5kNzfKeko1GZpVKX9iqcIXCKmFVmAs8
 gHLfhs9GA/uZQBJb4xoDi0EUNz+xvisHtV3eIf8jTQ61zy31MfhJ6TrlVgTX+x68EdXK
 fYNanZDgAr+Ywl9V/yav3HvWnpnAVn+NYfoVBcki5BYubfRCyomPd2T09AX28IsMKXen
 5C+l4tIgucjqaEHpPT31OU+cj6G/JtLPtdODnBUxiyPw0g+9DBIDT0AxcSbRWjw92hpK
 xX3w==
X-Gm-Message-State: AOAM53281SbCu15HQhpdWIbohhl0FOmhMk51sb6p0IOd9ORb2KgS2/e0
 CKfwGzI6SyojdhXQvYjv2xffaDK0m8AGVw==
X-Google-Smtp-Source: ABdhPJxGom0U3y8tkCb1R1nOMl+stwLjw//H0EpEPi3P/x6CZNQAB3VeTZXM4IE2wRlzWEWWzMGddw==
X-Received: by 2002:a05:6402:2812:b0:418:fc32:be18 with SMTP id
 h18-20020a056402281200b00418fc32be18mr18507792ede.357.1648497403199; 
 Mon, 28 Mar 2022 12:56:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a056402115500b00413c824e422sm7383675edw.72.2022.03.28.12.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:56:42 -0700 (PDT)
Message-ID: <5f14a369-6211-9133-881f-2dbb41a6ad1d@mind.be>
Date: Mon, 28 Mar 2022 21:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220327194740.1482539-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220327194740.1482539-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/luasocket: bump to version 3.0.0
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

CgpPbiAyNy8wMy8yMDIyIDIxOjQ3LCBGcmFuY29pcyBQZXJyYWQgd3JvdGU6Cj4gbW92ZWQgdW5k
ZXIgdGhlIGhhdCBvZiBodHRwczovL2dpdGh1Yi5jb20vbHVuYXJtb2R1bGVzCj4gCj4gZGlmZiBM
SUNFTlNFOgo+IC1MdWFTb2NrZXQgMy4wIGxpY2Vuc2UKPiAtQ29weXJpZ2h0IO+/vSAyMDA0LTIw
MTMgRGllZ28gTmVoYWIKPiArQ29weXJpZ2h0IChDKSAyMDA0LTIwMjIgRGllZ28gTmVoYWIKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9y
Zz4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4g
LS0tCj4gICBwYWNrYWdlL2x1YXNvY2tldC9Db25maWcuaW4gICAgICB8IDIgKy0KPiAgIHBhY2th
Z2UvbHVhc29ja2V0L2x1YXNvY2tldC5oYXNoIHwgNCArKy0tCj4gICBwYWNrYWdlL2x1YXNvY2tl
dC9sdWFzb2NrZXQubWsgICB8IDQgKystLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhc29ja2V0
L0NvbmZpZy5pbiBiL3BhY2thZ2UvbHVhc29ja2V0L0NvbmZpZy5pbgo+IGluZGV4IDQ1MjYzMDMw
Zi4uNWFkMDBmNWM0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHVhc29ja2V0L0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2UvbHVhc29ja2V0L0NvbmZpZy5pbgo+IEBAIC02LDQgKzYsNCBAQCBjb25m
aWcgQlIyX1BBQ0tBR0VfTFVBU09DS0VUCj4gICAJICBJdCBwcm92aWRlcyBlYXN5IGFjY2VzcyB0
byBUQ1AsIFVEUCwgRE5TLCBTTVRQLAo+ICAgCSAgRlRQLCBIVFRQLCBNSU1FIGFuZCBtdWNoIG1v
cmUuCj4gICAKPiAtCSAgaHR0cDovL2x1YWZvcmdlLm5ldC9wcm9qZWN0cy9sdWFzb2NrZXQvCj4g
KwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9sdW5hcm1vZHVsZXMvbHVhc29ja2V0Cj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbHVhc29ja2V0L2x1YXNvY2tldC5oYXNoIGIvcGFja2FnZS9sdWFzb2NrZXQv
bHVhc29ja2V0Lmhhc2gKPiBpbmRleCA4NDM2NDdiMjcuLmI2NmFlNTdiOSAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2x1YXNvY2tldC9sdWFzb2NrZXQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbHVhc29j
a2V0L2x1YXNvY2tldC5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICAjIGNvbXB1dGVkIGJ5IGx1
YXJvY2tzL2J1aWxkcm9vdAo+IC1zaGEyNTYgNDUzZmMxZDBlOWI2YTQ0YmJhZGE0MjkwZDU2NWY4
NDBhNWU5NmJhMmQxYjQ3NTYyYmEzOGJkOWM3ZTgyMTk1YSAgbHVhc29ja2V0LTMuMHJjMS0xLnNy
Yy5yb2NrCj4gLXNoYTI1NiA4ZThjNjMxNGQ5ZTc4ZmU0NTJlZTM1NTE2N2YyYzQwY2ZiZWU4MjA3
ZTE0ZGNiNWRkZDRhMjY1NWNiNWM2YWFkICBsdWFzb2NrZXQtMy4wLXJjMS9MSUNFTlNFCj4gK3No
YTI1NiAgNjNmZDJkZDE4ZGZlMjQyY2E1YmNjMTIwMzgzOWU4NmE5Yzg5MzYyNjFhOWNhOWYzMjAw
ZjJkZWFiNDMxZGE4OCAgbHVhc29ja2V0LTMuMC4wLTEuc3JjLnJvY2sKPiArc2hhMjU2ICAyMjRh
ZmU0MmQwNzM4ZWFhZWI1N2FiMjg5NDY2YTFjNGU3NzA5MTU5MWU2OWRiY2VmMmRiYjM4NTU4OWYy
ZjQxICBsdWFzb2NrZXQvTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YXNvY2tldC9s
dWFzb2NrZXQubWsgYi9wYWNrYWdlL2x1YXNvY2tldC9sdWFzb2NrZXQubWsKPiBpbmRleCAyMDky
N2ZjMWQuLmVlZWNlMjZmZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YXNvY2tldC9sdWFzb2Nr
ZXQubWsKPiArKysgYi9wYWNrYWdlL2x1YXNvY2tldC9sdWFzb2NrZXQubWsKPiBAQCAtNCw4ICs0
LDggQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtTFVBU09DS0VU
X1ZFUlNJT04gPSAzLjByYzEtMQo+IC1MVUFTT0NLRVRfU1VCRElSID0gbHVhc29ja2V0LTMuMC1y
YzEKPiArTFVBU09DS0VUX1ZFUlNJT04gPSAzLjAuMC0xCj4gK0xVQVNPQ0tFVF9TVUJESVIgPSBs
dWFzb2NrZXQKPiAgIExVQVNPQ0tFVF9MSUNFTlNFID0gTUlUCj4gICBMVUFTT0NLRVRfTElDRU5T
RV9GSUxFUyA9ICQoTFVBU09DS0VUX1NVQkRJUikvTElDRU5TRQo+ICAgCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
