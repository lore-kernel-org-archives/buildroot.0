Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEC4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 20:31:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B917461179
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 20:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B917461179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AEA7403A3;
	Tue,  9 Nov 2021 20:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LJo0iEJdlQo; Tue,  9 Nov 2021 20:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69FA0401C4;
	Tue,  9 Nov 2021 20:30:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08F711BF3B5
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 20:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED13780F35
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 20:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZYWgllOGJHi for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 20:30:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAF2780EA2
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 20:30:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id j21so1308688edt.11
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 12:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:content-language:from:to
 :subject:organization:cc:content-transfer-encoding;
 bh=IXRv9jjaVmHBWHI4fcYAZIDIQy2VMzx3RAViej+EL9g=;
 b=GO27grjvxpevmrPvYKFmbNU9ZSoVxDUjLjkIqI8lbB20UManRz5iHUVTMfHB2rzu/s
 rMZvGJQJLX/ekd2i7Wdd6qj9KPE2KuUg4BinCWFIcqsoGSFU90gWyGtD3bpIoQb4im6w
 GP09sKubF3gZ738Az6uhdGT4EekoKB7O10X1vf7BbIs8kHBlCT+E23NYQQnVCmnOjzH/
 65xJL8wVs1vcE8yKXwrxaMFae+uiWemM7miaEYxABLky4RB3HHPHrtZ1RhIgt2op/FkC
 JpYpKAhCyjS+T5g4OnvhMfWEB084OXBRt2wwZ0pmtzhrJhUhEt60ba/PJjwGarF0FBjc
 sYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:subject:organization:cc
 :content-transfer-encoding;
 bh=IXRv9jjaVmHBWHI4fcYAZIDIQy2VMzx3RAViej+EL9g=;
 b=WXBypKJrzG782zNSfXZ5NRkOGfBYOvicxkin3fUe1i5BpCAuztG4TqZiV5+QgCTrUj
 8kW9qJRJ1saYDb1Zb3q6aJeDpfU0jvikQsYsBaQyjhzwgR9rnAm8US4OVSBqqpyolbgQ
 bP0Vs5qhKhLBsvXpW496u1FtoaR/uGqv7Tf7XAFjBdVB93jnrlAJ3IDY1V9T9keyQP2v
 HvY4s6t6IQOxmQGkSj0qam/kKD/TMcG09S1MFu/AapphSUVmE0piwz3KK5D1XEQy+d6C
 CqxaQqYCVDP251+F3XtWi0HlIJ4cKtekvQaA8Hs1Ri6AXIhWLA68XxQnNNfYJzyPyC1Q
 Mi6A==
X-Gm-Message-State: AOAM531dUeBHs9XRRlm6uLvrYty5sb+oNJDcxByRwcOPlc9tKfPcnI7i
 6BajGA8B9FS5ixPUUKIsAE8fkRuCgE0NZA==
X-Google-Smtp-Source: ABdhPJxcKJIL9NhlSphnjEPpYauLUs7Y2rkvY0j4mmAnFPCgfrtaf3Kzfz283Dzq+SPnLtzPA9teHQ==
X-Received: by 2002:a05:6402:28a1:: with SMTP id
 eg33mr966311edb.161.1636489847878; 
 Tue, 09 Nov 2021 12:30:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j12sm8274437edr.67.2021.11.09.12.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 12:30:47 -0800 (PST)
Message-ID: <75228581-2222-7bea-1a96-20202d5c9015@mind.be>
Date: Tue, 9 Nov 2021 21:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Buildroot Mailing List <buildroot@buildroot.org>
Organization: Essensium/Mind
Subject: [Buildroot] Failing tests on gitlab
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IMKgSGkgYWxsLAoKIMKgVGhlIDIwMjEuMTEtcmMxIHRhZyB0cmlnZ2VyZWQgYSBjb21wbGV0ZSBy
dW4gb2YgYWxsIHRoZSBkZWZjb25maWdzIGFuZCBhbGwgdGhlIAp0ZXN0cy4gMTQ4IG91dCBvZiA3
MjUgam9icyBmYWlsZWQgWzBdLgoKCiDCoFRoZXJlIGFyZSB0d28gbWFpbiBjYXVzZXMgZm9yIGZh
aWx1cmVzOgoKCjEuIG11bHRpcGxlIGRlZmluaXRpb24gb2YgYHl5bGxvYycgaW4gdS1ib290IG9y
IGxpbnV4LCBlLmcuIFsxXS4gVGhpcyBpcyAKdHJpZ2dlcmVkIGJ5IHRoZSB1cGRhdGUgb2YgdGhl
IGRvY2tlciBpbWFnZSB3aGljaCBoYXMgYSBuZXcgKGhvc3QpIGdjYyB2ZXJzaW9uIAoxMCwgd2hp
Y2ggZGVmYXVsdHMgdG8gLWZuby1jb21tb24uIFNpbmNlIHRoZXJlIGFyZSBtb3JlIHRoYW4gMTAw
IGRlZmNvbmZpZ3MgdGhhdCAKc3VmZmVyIGZyb20gdGhpcyBwcm9ibGVtLCBJIHRoaW5rIGl0IHdv
dWxkIGJlIGJlc3QgdG8gc29sdmUgdGhpcyBpbiB1Ym9vdC5tayBhbmQgCmxpbnV4Lm1rIHJhdGhl
ciB0aGFuIHBhdGNoaW5nIGFsbCB0aGUgZGVmY29uZmlncy4gVGhlIGZpeCBpcyByYXRoZXIgc2lt
cGxlOiAKcmVtb3ZlIHRoZSBkZWZpbml0aW9uICJZWUxUWVBFIHl5bGxvYyIgZnJvbSBzY3JpcHRz
L2R0Yy9kdGMtbGV4ZXIubC4gVGhlcmUncyBhIApzbGlnaHQgY29tcGxpY2F0aW9uIHRoYXQgb2xk
ZXIga2VybmVscyBzdGlsbCBoYXZlIGEgInNoaXBwZWQiIHZlcnNpb24gb2YgdGhlIApmaWxlLCBi
dXQgdGhhdCBjYW4gYmUgc29sdmVkIHdpdGggd2lsZGNhcmQgbWF0Y2hpbmcuIFRoaXMgd2lsbCBu
ZWVkIGEgYml0IG9mIAp0ZXN0aW5nIHRob3VnaCB0byBzZWUgaG93IGl0IGJlaGF2ZXMgd2l0aCBv
bGRlciBrZXJuZWwvdWJvb3QgdmVyc2lvbnMsIGJlY2F1c2UgCnRoYXQgY29kZSAqaGFzKiBjaGFu
Z2VkIGEgY291cGxlIG9mIHRpbWVzLiBBbHNvLCBmb3IgdGhlIGNhc2VzIHdoZXJlIHRoZXJlJ3Mg
YSAKc2hpcHBlZCB2ZXJzaW9uLCB3ZSBzaG91bGQgcHJvYmFibHkgdGFrZSBjYXJlIHdpdGggdGhl
IHRpbWVzdGFtcHMsIHRvIGF2b2lkIHRoYXQgCnRoZSBjIGZpbGUgaXMgcmVnZW5lcmF0ZWQuCgoK
Mi4gSm9iIHRpbWVvdXQsIGUuZy4gWzJdLiBJJ20gbm90IGVudGlyZWx5IHN1cmUgd2hhdCB0aGlz
IHRpbWVvdXQgaXMuIEl0J3MgCmRlZmluaXRlbHkgbm90IHRoZSA2aCBqb2IgdGltZW91dCwgYmVj
YXVzZSB0aGUgam9iIGhhc24ndCBldmVuIHN0YXJ0ZWQuIEkgCnN1c3BlY3QgdGhhdCB0aGVyZSdz
IHNvbWUgaGlkZGVuIG92ZXJhbGwgMjRoIHRpbWVvdXQgZm9yIHRoZSBlbnRpcmUgcGlwZWxpbmUs
IAphbmQgdGhhdCBiZWNhdXNlIHdlIGhhdmUgc28gbWFueSBqb2JzLCB3ZSdyZSBub3QgYWJsZSB0
byBmaW5pc2ggYWxsIG9mIHRoZW0gCndpdGhpbiB0aGF0IHRpbWUuIFRoZSBvbmx5IHNvbHV0aW9u
IGZvciB0aGF0IGlzIHRvIGFkZCBhZGRpdGlvbmFsIHJ1bm5lcnMuIFNvLCAKaWYgdGhlcmUncyBh
bnlib2R5IG91dCB0aGVyZSB3aXRoIHNwYXJlIGN5Y2xlcywgcGxlYXNlIHZvbHVudGVlciB0byBh
ZGQgYSAKcnVubmVyISBZb3UgY2FuIGNvbnRhY3QgbWUgb3IgUm9tYWluIHRvIGxlYXJuIGhvdyB0
byBzZXQgb25lIHVwLgoKCiDCoEhvcGVmdWxseSwgd2UgY2FuIGdldCBiZXR0ZXIgcmVzdWx0cyBi
eSAtcmMyIQoKCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKCgpbMF0gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzQwNDI0OTc0MC9mYWlsdXJlcwoK
WzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTc1
ODk2NjAyOAoKWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2pvYnMvMTc1ODk2NjU2NwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
