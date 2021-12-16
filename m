Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348E9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D55B240B4B;
	Thu, 16 Dec 2021 18:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tG8UnDEpvKIz; Thu, 16 Dec 2021 18:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0698401AD;
	Thu, 16 Dec 2021 18:24:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3D841BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93465417A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ciWYrgic-7Dj for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:24:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF8EC4179E
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:24:32 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b7so30911739edd.6
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=s7X+tsfleHy/hNT9QPuQwgn3E5XaZwrN49FjXGyLICY=;
 b=dEyfsCf3mrcbcwnN222A8E1ua9M64COYUwvcYS3ztJsS/p0nHwel9sWB0XFP3b85G2
 G8i18OgzQFRICGsunwL7sgyflvDwbNe+DKSABZSbXc2LsCWBKtEcI/5jlNPa3lCno5Ie
 GCJ1w1ZJNBIqlnT3338MLm764i3n55A0LSTE4m6tUIWSEBSP9bgyNlog7FmLInakiv4i
 qGi06Xj3kLLYizkpPQeMyu4tARH0t+asYqNx1g3wbSQFPBCIzJ7+2Wj6FvjkBCp6ns0v
 /ntmxsMeOnFLQfpTjR1OtSR4ZoliCU4pPGPXcvGahcED47RZwMy7gZfp1ExvAv3bnHNv
 ywzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=s7X+tsfleHy/hNT9QPuQwgn3E5XaZwrN49FjXGyLICY=;
 b=4AqhC68Ji1HG4wgrl5/KOCJO4UocJ4xfxogddBzZKQjlz9fqb8Du2Q0dEFRb5JWMQe
 ljk8bqBlj4miNiHtMWrdscDG6EaIJvu1nlT70+W/WVvoeuZhCV3dlbucqSNTRYe39Nm/
 qjJtiY/cLnOb1yz03DP6BA9dustXsn7ZTpIdeVzLzgvNgyL7fTjWJh5NS4EhlRjjyVTd
 QdZVQnMCZWTMIqoEpMz/KEdeuZivvYT9TJHa2GbQ4pD3ExzScuxStLftI/+nXrP+wdji
 1Mi686e43v7HmivMEMrGG3LoaP2XqkMgNX4lSDobkt8fJ8Mqmcj9eLdl3iU94pFxeq6s
 YaQQ==
X-Gm-Message-State: AOAM532GzoWtdpKqhdPJyDEYgJtio8kRQ70OXi68zks2m2MoR13dg6fc
 oWNHtqPPBypsBqnQlHW9WTJ9GnPFKLaHvw==
X-Google-Smtp-Source: ABdhPJxPKsAX9s5b4jU+kDED/TMQqVejDBSrItjxVzUBGWJe5p+aXVPZQCLOKRgduk2LVk0sJuao2Q==
X-Received: by 2002:aa7:c50b:: with SMTP id o11mr21427633edq.160.1639679070989; 
 Thu, 16 Dec 2021 10:24:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gb4sm2067157ejc.90.2021.12.16.10.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:24:30 -0800 (PST)
Message-ID: <9b2e2536-daed-0b5a-cba3-5d0cb72e1ef3@mind.be>
Date: Thu, 16 Dec 2021 19:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>,
 buildroot@buildroot.org
References: <CAEXMXLRZ5d3RaipEw3ftPfmqLCyYb0CFTyR+oz34COWBVkKfZA@mail.gmail.com>
 <CAEXMXLQVQr_837fH5jR-a0HTfnGZo6Fb+meJLDHh5A1B=_=0QA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAEXMXLQVQr_837fH5jR-a0HTfnGZo6Fb+meJLDHh5A1B=_=0QA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] connman: remove iptables as a fixed
 dependency
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

ICBIaSBOdW5vLAoKT24gMTUvMTIvMjAyMSAxMzowMCwgTnVubyBHb27Dp2FsdmVzIHdyb3RlOgo+
IGNvbm5tYW4gbWlnaHQgZGVwZW5kIG9uIGlwdGFibGVzIG9yIG5mdGFibGVzLCBhbmQgdGhvc2Ug
ZGVwZW5kZW5jaWVzCj4gYXJlIGFscmVhZHkgc2VsZWN0ZWQgbGF0ZXIgaW4gdGhpcyBmaWxlIGFz
IHJlcXVpcmVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gR29uY2FsdmVzIDxudW5vanBnQGdt
YWlsLmNvbT4KCiAgVGhlIHN1YmplY3QgbGluZSBzaG91bGQgc3RhcnQgd2l0aCAicGFja2FnZS9j
b25ubWFuOiIuIEkgYWxzbyB0aGUgZm9sbG93aW5nIHRvIAp0aGUgY29tbWl0IG1lc3NhZ2UgYW5k
IGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpDb25maWcuaW4gYWxyZWFkeSBvbmx5IHNlbGVj
dHMgaXB0YWJsZXMgaWYgQlIyX1BBQ0tBR0VfQ09OTk1BTl9JUFRBQkxFUy4KCiAgUmVnYXJkcywK
ICBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL2Nvbm5tYW4vY29ubm1hbi5tayB8IDIgKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2Nvbm5tYW4vY29ubm1hbi5tayBiL3BhY2thZ2UvY29ubm1hbi9jb25u
bWFuLm1rCj4gaW5kZXggMDM1NTQyNmU5Mi4uZTVlNTk2Yzk3MyAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL2Nvbm5tYW4vY29ubm1hbi5tawo+ICsrKyBiL3BhY2thZ2UvY29ubm1hbi9jb25ubWFuLm1r
Cj4gQEAgLTcsNyArNyw3IEBACj4gICBDT05OTUFOX1ZFUlNJT04gPSAxLjQwCj4gICBDT05OTUFO
X1NPVVJDRSA9IGNvbm5tYW4tJChDT05OTUFOX1ZFUlNJT04pLnRhci54ego+ICAgQ09OTk1BTl9T
SVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvbGludXgvbmV0d29yay9jb25ubWFuCj4gLUNPTk5N
QU5fREVQRU5ERU5DSUVTID0gbGliZ2xpYjIgZGJ1cyBpcHRhYmxlcwo+ICtDT05OTUFOX0RFUEVO
REVOQ0lFUyA9IGxpYmdsaWIyIGRidXMKPiAgIENPTk5NQU5fSU5TVEFMTF9TVEFHSU5HID0gWUVT
Cj4gICBDT05OTUFOX0xJQ0VOU0UgPSBHUEwtMi4wCj4gICBDT05OTUFOX0xJQ0VOU0VfRklMRVMg
PSBDT1BZSU5HCj4gLS0KPiAyLjMyLjAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
