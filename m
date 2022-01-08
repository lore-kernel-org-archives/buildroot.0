Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD51C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221C34021E;
	Sat,  8 Jan 2022 14:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpns0DuI15Nv; Sat,  8 Jan 2022 14:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6989C401D5;
	Sat,  8 Jan 2022 14:16:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 472591BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42DF380BE1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ad97wMXQyOrl for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:16:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A59980BDD
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 14:16:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso6555470wmj.2
 for <buildroot@busybox.net>; Sat, 08 Jan 2022 06:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iveENBfrMo+0ws/jf/sWbhNknSNnl3F3e5CTA2xQuik=;
 b=ImsAcOThAF5KkvCZdED27ELvDI9NjWuC0wLTum+DTDfAWY7jNDRkvHKs5re16mZsEf
 Ben2D1NNJaRAzyGaPybV6jdUDURSAQuKwuimTNJmk8keP8BuOmf212iGnUNlz4i6B7yF
 e4kjL+O05MfTu3GxbgOeRA1uI178IIBa84hXJbWEN5gbZIbCBvDiZkAAkzwjqJpSAGWw
 E98VjmiC03ITIFxIZIfnFCZggG6jOScQ22sb6/0LnqmsxT4D0kWN3LVPhesJFsky0Y7y
 Gm3XK/Zg7exQ+AlRzM/sgZZ/HHM+1ilVfj8llsz3dObm1bnilvM+GMzVWGYERaY0RwEA
 yklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iveENBfrMo+0ws/jf/sWbhNknSNnl3F3e5CTA2xQuik=;
 b=nvWU6gzHCCyJN4Iq4qvg5DFgq+6XE7CgfaO7DPVdiiUJcRQgDenDI6N/+MlZjCbVxy
 QcQO3/ylHBa3oQaY65l2C61+B7EUaTMrHfTKE94XKGYrYkSab8hI9XCwfaWd72Fu1GU3
 odoJdv7/BzHVj6OelmlC787E90942y8McL80BPDXorrBK5TXFwZDqx1aiX8iBYLxo3Tp
 CutEHNThHX8Bfr6JgIesAdshtW4V8XwSpOGBn3eAZypAPfnZ27p1jzRlV9dQ2Ok1gCAC
 S1+wQMANDMWHgLRDpT2t9+caLJ8gZm7RLgzyWVFcxGgnmFxlMUXqfY5OWnzeWGFa35O8
 K9BQ==
X-Gm-Message-State: AOAM530Ya6A2NRllFaLiX+KoM1O1qhxmOENT5EcmBbx6TFx/MM0sMsEn
 kjLU/q9y6U4Qen6zvvg5a4hXuA==
X-Google-Smtp-Source: ABdhPJxXbP0z9mWU0YDnaM9uK1O95N1HMym7SZy+8ETFfCEIAprEtLKQGh+0dR3yVYNMXO/B+BOCsw==
X-Received: by 2002:a1c:5445:: with SMTP id p5mr14570057wmi.137.1641651405459; 
 Sat, 08 Jan 2022 06:16:45 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id t15sm1719974wrz.82.2022.01.08.06.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 06:16:45 -0800 (PST)
Message-ID: <7e1c98d7-4d7b-698c-47e2-f7754257023b@mind.be>
Date: Sat, 8 Jan 2022 15:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, buildroot@busybox.net
References: <20210316143822.3421019-1-masahiroy@kernel.org>
 <8bfdc46b-bfbe-2470-0068-ca3a5d72fd89@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <8bfdc46b-bfbe-2470-0068-ca3a5d72fd89@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/2] qemu_arm_versatile: switch to in-kernel
 defconfig + fragment
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wMS8yMDIyIDE1OjA5LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gTWFzYWhp
cm8sIEFsbAo+IAo+IExlIDE2LzAzLzIwMjEgw6AgMTU6MzgsIE1hc2FoaXJvIFlhbWFkYSBhIMOp
Y3JpdMKgOgo+PiBUaGlzIHBsYXRmb3JtIGhhcyBpdHMgb3duIGtlcm5lbCBkZWZjb25maWcgaW4g
QnVpbGRyb290LCBidXQgd2UgY2Fubm90Cj4+IGdldCBxdWljayBpZGVhIGFib3V0IGhvdyBtdWNo
IGl0IGRpdmVyZ2VkIGZyb20gdGhlIGluLWtlcm5lbCBkZWZjb25maWcuCj4+Cj4+IExldCdzIHVz
ZSB0aGUgdXBzdHJlYW0gYXJjaC9hcm0vY29uZmlnL3ZlcnNhdGlsZV9kZWZjb25maWcgYXMgYSBi
YXNlLAo+PiBhbmQgbWFpbnRhaW4gdGhlIGRpZmYgYXMgYSBtZXJnZS1jb25maWcgZnJhZ21lbnQu
IFRoZSBzYW1lIC5jb25maWcgaXMKPj4gc3RpbGwgZ2VuZXJhdGVkIGJhc2VkIG9uIHRoZSA1LjEw
Ljcga2VybmVsLgo+Pgo+PiBUaGUgZGlmZiBpcyBxdWl0ZSBiaWcsIGJ1dCB0aGlzIGlzIGEgZ29v
ZCBzdGFydC1wb2ludCBmb3IgY2xlYW51cHMuCj4+IEZvbGxvdy11cCB3b3JrcyBjYW4gZHJvcCBk
aWZmIGxpbmVzIHVubGVzcyB3ZSBmaW5kIGEgZ29vZCByZWFzb24gZm9yCj4+IGRpdmVyZ2VuY2Uu
Cj4gCj4gV2UgdXNlIGEgY3VzdG9tIGtlcm5lbCBkZWZjb25maWcgZm9yIHRoaXMgZGVmY29uZmln
IHNpbmNlIGl0IHdhcyBhZGRlZCB0bwo+IEJ1aWxkcm9vdCBbMV0uCgogIC4uLiBBbmQgYXQgdGhh
dCB0aW1lIEkgZG9uJ3QgdGhpbmsgd2UgaGFkIGluZnJhc3RydWN0dXJlIGZvciBmcmFnbWVudHMg
eWV0LgoKPiAKPiBJIGd1ZXNzIHRoZSBhaW0gb2YgaGF2aW5nIGEgY3VzdG9tIGtlcm5lbCBkZWZj
b25maWcgaXMgdG8gcmVkdWNlIHRoZSBidWlsZCB0aW1lLgoKICBFdmVuIHNvLCBpdCdzIGJldHRl
ciB0byBoYXZlIHRoZSBkaWZmZXJlbmNlIGFzIGEgZnJhZ21lbnQgcmF0aGVyIHRoYW4gaGF2aW5n
IGEgCmZ1bGwgY29uZmlnLCBzbyBhdCBsZWFzdCB3ZSBjYW4gZWFzaWx5IHNlZSB0aGUgZGlmZmVy
ZW5jZSAoYXMgTWFzYWhpcm8gbWVudGlvbnMgCmluIHRoZSBjb21taXQgbWVzc2FnZSkuCgoKPiBU
aGlzIGRlZmNvbmZpZyBpcyB1c2VkIGZvciBib290IHRlc3Rpbmcgb24gUWVtdSwgSSdtIG5vdCBz
dXJlIGlmIGl0IHJlYWxseSB1c2VkCj4gZm9yIG90aGVyIHVzZSBjYXNlLgo+IAo+IEhhdmUgeW91
IHRlc3RlZCB3aXRob3V0IGFueSBhZGRpdGlvbmFsIGZyYWdtZW50PwoKICBNYXNhaGlybyBtZW50
aW9ucyB0aGF0IGl0IHlpZWxkcyBleGFjdGx5IHRoZSBzYW1lIGZ1bGwgY29uZmlnLCBzbyB0aGlz
IGlzIApwZXJmZWN0IHRvIGtlZXAgdGhlIHJlZHVjZWQgYnVpbGQgdGltZS4gV2UgY2FuIGRlY2lk
ZSBsYXRlciB3aGV0aGVyIG9yIG5vdCB3ZSAKd2FudCB0byBtb3ZlIGNsb3NlciB0byB0aGUgdXBz
dHJlYW0gZGVmY29uZmlnLgoKICBTbywgYXBwbGllZCBib3RoIHRvIG1hc3RlciwgdGhhbmtzISBT
b3JyeSBpdCB0b29rIHNvIGxvbmcuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IFsxXQo+IGh0
dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9ZDM3ODljZTNiNzBh
YWFhNWUxODBkMDQxYjJhZDI4MmIzNmQ5MjllZAo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
