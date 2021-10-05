Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48309C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA836124C
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CA836124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA66240167;
	Tue,  5 Oct 2021 19:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPJb7KHxi05k; Tue,  5 Oct 2021 19:46:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF6D24023C;
	Tue,  5 Oct 2021 19:46:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2664B1BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14E7181570
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6i2IFOhRzwM for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:46:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F183780E27
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:46:38 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x7so951648edd.6
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:cc:in-reply-to
 :content-transfer-encoding;
 bh=jYnKTKm5XfekuybtJI3VByAtsPDlIlQqCho4zvOFaBY=;
 b=TXItZmNveefmJyX4MBupiL55020+rAUR/1nr7+hq6Xlz+reJX7AD/7sO74PBOcJRe2
 d6hoK/tQ0c2aqemzOgxIKXD/ZGmEIacElNuNd3uOl2ZOB0YxxBGyj15yuWtvpFtkZIWb
 LhsIeny07eKO0iA8AMa3YjA80DhJ6T7N/6Q5j7sH3+5qqM7MNcPNGicpnmWtifjWr7vT
 IkIqn71Yr2uzkVgE3dHzPEEQwQLgVwioUsiky7bJYNxZl/MZFNh0zrj+n04RrAjhpH+s
 BksbJtJbB6E5RUx3PDgDVBGOknwgXWps0aec0tsQmFCdbQ+j6mudB7z2x+ow6+oh/Pe/
 vX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:cc:in-reply-to
 :content-transfer-encoding;
 bh=jYnKTKm5XfekuybtJI3VByAtsPDlIlQqCho4zvOFaBY=;
 b=NSZ6Ct8aAO7deYLwquUZZX6jGar0x3/rnPA0UNgOOG1rwMbetdJpO8DX18JYJ7CsJN
 JUuAZaMXfZwA/BWptZzqv8e8viGXULBNRzMw/0kPIBHZinwXI0XiXTchbFALN93NdtP2
 nVN1WQZHdNiIHFIdAAzXnGyiCgV846RaP6StvZfF2Mx1FY6Le96QZBgGizKC8LA19Zo3
 +52QHAQGxRkBz106paVYkpT42MOABbRHH763eqFO0qc/wEKMNzxNJUSrkZ6F2f1wE/J6
 R96ka6t/ZVEktfy4Kq46XMFTtY7OtQesAlwTQeojxMn3yAov2lbjn3OqPiKnZPZSreum
 xqpA==
X-Gm-Message-State: AOAM530apbqqU8O3BEtbO8l545y2y2W1jwhEFixwkD9cjdmF8z86yUQX
 P9GAaEuSXrXQJAcz3QSvEm7uZg==
X-Google-Smtp-Source: ABdhPJzti3q7TnR+Rymn8Yl0/yBs/BhrrjRDUJdkkUNBunMt6Eg9OsIQp29QnooQl5ANZ9jUybbpGQ==
X-Received: by 2002:a17:906:c015:: with SMTP id
 e21mr26656635ejz.113.1633463197220; 
 Tue, 05 Oct 2021 12:46:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n16sm1903961edt.59.2021.10.05.12.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:46:36 -0700 (PDT)
Message-ID: <3f981830-2ca9-50ea-6b7c-9c99b6f65517@mind.be>
Date: Tue, 5 Oct 2021 21:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB049315D372F7D5E516E916319FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <VI1P190MB049315D372F7D5E516E916319FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] Question about adding dbus-cxx and updating libsigc
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBEYW5pZWwsCgpPbiAyOC8wOS8yMDIxIDExOjUxLCBMYW5nIERhbmllbCB3cm90ZToKPiBI
ZWxsbyBldmVyeWJvZHksCj4gCj4gSSB3b3VsZCBsaWtlIHRvIGFkZCBkYnVzLWN4eCAoaHR0cHM6
Ly9naXRodWIuY29tL2RidXMtY3h4L2RidXMtY3h4KSwgd2hpY2gKPiBjb21wYXJlZCB0byB0aGUg
ZXhpc3RpbmcgZGJ1cy1jcHAgcGFja2FnZSBpcyBpbiBhY3RpdmUgZGV2ZWxvcG1lbnQuCj4gVGhl
IGxhc3QgcmVsZWFzZSBvZiBkYnVzLWNwcCB3YXMgaW4gMjAxMS4KPiAKPiBJcyBoYXZpbmcgdHdv
IGRpZmZlcmVudCAgZGJ1cyBDKysgcGFja2FnZXMgcHJlZmVycmVkLAo+IG9yIHNob3VsZCBkYnVz
LWNwcCBiZSBkZXByZWNhdGVkPwoKICBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoZSBkZXRhaWxzLCBi
dXQgSSBhc3N1bWUgZGJ1cy1jeHggYW5kIGRidXMtY3BwIGhhdmUgCmNvbXBsZXRlbHkgZGlmZmVy
ZW50LCBpbmNvbXBhdGlibGUgQVBJPyBJbiB0aGF0IGNhc2UsIGRidXMtY3h4IHNob3VsZCBkZWZp
bml0ZWx5IApiZSBhIG5ldyBwYWNrYWdlLgoKICBXZSBjb3VsZCByZW1vdmUgdGhlIG9sZCBkYnVz
LWNwcCwgYnV0IGdlbmVyYWxseSB3ZSBkb24ndCBkbyB0aGF0IHVubGVzcyAKdGhlcmUncyBhIGJp
ZyByZWFzb24gKGRpZmZpY3VsdCB0byBmaXggYnVpbGQtdGltZSBvciBydW50aW1lIHByb2JsZW1z
LCBtYWpvciAKdW5maXhlZCBzZWN1cml0eSBpc3N1ZXMsIC4uLikuCgoKPiBkYnVzLWN4eCBkZXBl
bmRzIG9uIGxpYnNpZ2MgdmVyc2lvbiAzLjAuCj4gVmVyc2lvbiAyLjEwLjYgaXMgY3VycmVudGx5
IGluY2x1ZGVkIGluIGJ1aWxkcm9vdC4KPiBVcGRhdGluZyBsaWJzaWdjIHdvdWxkIG1lYW4gdXBk
YXRpbmcgY2Fpcm9tbSwgYXRrbW0sIGdsaWJtbSBhbmQgZ3RrbW0uCj4gVGhvc2UgdXBkYXRlcyBi
cmluZyBHVEs0IGludG8gdGhlIG1peCwgd2hpY2ggaXNuJ3QgYSBwYXJ0IG9mIGJ1aWxkcm9vdC4K
PiBBdCBsZWFzdCBJIGNvdWxkbid0IGZpbmQgaXQuCgogIFVnaC4uLgoKICBVcGRhdGluZyBjYXJp
b21tIGFuZCBmcmllbmRzIHdpbGwgaGF2ZSB0byBiZSBkb25lIGF0IHNvbWUgcG9pbnQuIEJ1dCBJ
IGJlbGlldmUgCkdUSzQgaXMgYWdhaW4gYSBtYWpvciBBUEkgY2hhbmdlIGxpa2UgR1RLMyB3YXMs
IGkuZS4gdGhlcmUncyBubyBob3BlIHRoYXQgCnBhY2thZ2VzIHRoYXQgY3VycmVudGx5IHVzZSBs
aWJndGszIGFyZSBnb2luZyB0byBidWlsZCBzdWNjZXNzZnVsbHkgYWdhaW5zdCAKR1RLNCwgcmln
aHQ/IEluIHRoYXQgY2FzZSwgdGhlcmUncyBubyBzb2x1dGlvbiBvdGhlciB0aGFuIGFkZGluZyBs
aWJndGs0IHNpZGUgYnkgCnNpZGUgd2l0aCBsaWJndGszLi4uCgoKPiBJIGNhbiB0cnkgdG8gcHJv
dmlkZSBwYXRjaGVzIHRvIHVwZGF0ZSBldmVyeXRoaW5nIGFuZCBpbnRlZ3JhdGUKPiBvciBjcmVh
dGUgYSBzZXBhcmF0ZSBwYWNrYWdlIGZvciBsaWJzaWdjMywgc2luY2UgYm90aCB2ZXJzaW9ucyBj
YW4gYmUKPiBpbnN0YWxsZWQgYXQgdGhlIHNhbWUgdGltZS4gV2hpY2ggb3B0aW9uIGlzIHByZWZl
cnJlZD8KCiAgVGhlICJ1cGRhdGUgZXZlcnl0aGluZyIgaXMgdGhlIHByZWZlcnJlZCBvcHRpb24g
SSB0aGluay4gQnV0IHNpbmNlIHRoYXQgY291bGQgCmdldCBhIGxpdHRsZSBoYWlyeSwgd2Ugd291
bGQgYWxzbyBhY2NlcHQgc2ltcGx5IGFkZGluZyBsaWJzaWdjMy4KCiAgSSd2ZSBhZGRlZCB0aGUg
b3RoZXIgbWFpbnRhaW5lcnMgaW4gQ2MgZm9yIGNvbmZpcm1hdGlvbi4KCiAgUmVnYXJkcywKICBB
cm5vdXQKCgoKPiAKPiBSZWdhcmRzLAo+IERhbmllbCBMYW5nCj4gCj4gU29mdHdhcmUgRW5naW5l
ZXIKPiBhYmF0ZWMgR21iSAo+IE9iZXJyZWdhdWVyIFN0cmHDn2UgNDgKPiA0ODQ0IFJlZ2F1LCBB
dXN0cmlhCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
