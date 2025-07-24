Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B567C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 09:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB2B980DA6;
	Thu, 24 Jul 2025 09:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuAzMPYUFKY5; Thu, 24 Jul 2025 09:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0441F80C94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0441F80C94;
	Thu, 24 Jul 2025 09:04:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8390F115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 09:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69E2340781
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 09:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74wzUiYrxUuj for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 09:04:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CCC1401C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CCC1401C8
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CCC1401C8
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 09:04:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5561c20e2d5so1002820e87.0
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 02:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753347872; x=1753952672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IKWro2Eiv9BmNSsjlEqjvdetfzXw3HhywAHrjradIfg=;
 b=bIsTmlH1x0fqdG8UlEybrKRX6IYVv+LLt8quKw6Atb9+zvwKsaUTSIM7QOs7uVWAOk
 a6nqwhjJ13CBPX8xwgfjmElT/p0oIJL/H/JPXnMUrHSw8D0EB4phr4W07xBxzmtgn22l
 bRoD2WrpE409YchCo4n5dTtIeFnaO/bROWfEUqhkWtuMfic2jA+N0Gpnuh5sVHkDXJEQ
 5qyyrsGXDKOlx6mlNngfd4NPjVUdtW4wlKdfhswGClV+q7w38BXxeHQ1M0CKE+49sswW
 7uXPTErD9GHi7TzTH6Ke7V28uv1Uk407TWy7sVLxQCw1TVf9ujQHp7/EiulBn8VAt86w
 5Pdw==
X-Gm-Message-State: AOJu0Yz146gDCycAFgsQBUjTpyXVlS/KPQqQ6jHVCN6kspo9WEi1GzV8
 6osAX/c3/YhjfnnrRfg6bfkycYuqpv7xDylhue1D01ONMVgdtAt0MQIlrAXVQ1XVWzc7J+YthGQ
 fErEiE1Golzwfc8ptwYBJSmsYLTafdgfijIbM
X-Gm-Gg: ASbGncvpy7kagkSSH+Q7vNpWKah2nVDs6bLqO/J02eT0dDwRJIivolhvYs9J0t4ccaj
 XFu5H5gD8tkNVbhVy3BSjvmNa8lHtcLXhTGAoqy5GJgDMbNh+kdzzwlr4J4Cb1OD2rKSoGEzlR2
 wo5DhVVYDSmX1PdcSEwfDtWQOym9JZGZYNvyoS9GyxkIjfsrD8fw/Vqu1NUhmUpf/h58lA44VBz
 sjIIzCk
X-Google-Smtp-Source: AGHT+IEtmiZc910gYNpPIPOVEJc65Vyb5HfIqvAUgpeX9sUZxSoS1HPprQiW9PX/3NBMjHoIijYFNrY5ZH76NXLhE54=
X-Received: by 2002:a05:6512:3c94:b0:553:d9ba:a171 with SMTP id
 2adb3069b0e04-55a513cf3bemr2110902e87.43.1753347871962; Thu, 24 Jul 2025
 02:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250724061810.3677507-1-yegorslists@googlemail.com>
In-Reply-To: <20250724061810.3677507-1-yegorslists@googlemail.com>
Date: Thu, 24 Jul 2025 11:04:19 +0200
X-Gm-Features: Ac12FXzpTQ8EKynZTeJNmhBTl95hH37BfH68BK9dkGPR88AHLwr0JjyEcCiuI6k
Message-ID: <CAGm1_kuT-zo+xdmZ19CvVsc5xPc2CqYRORfM8xRtnpCNvyV44Q@mail.gmail.com>
To: buildroot@buildroot.org
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1753347872; x=1753952672; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IKWro2Eiv9BmNSsjlEqjvdetfzXw3HhywAHrjradIfg=;
 b=Tg678fI3Ysw7SbGQ4znk0byYDdVKoCSVoCBv+4ciQEVf1fnWfItzHLfKevI4Q87bYI
 A9/oqS0By0qfHBfZgpMPRWxSnMIDAd0k3T/BhZaeaBnI8tirc1kM5ONgILVwhE/Fv57u
 58H1YUnlNBXLTF5bjULUphCThsDyUbOhJlfJCVKqiznj/TMlUn1pU/N8IDK9yv0ceJPT
 AbKc++LSiPfCLWzVZqmaEtx1FnspO5aMA9vHJWTBZYz6HFa9Fz8V0Kn/LZPTTInzJcix
 VcYjkj7ehiWgA8zkGAifzQH4m6eJ7y9uCB9R9z2zj3HGzSqL/mX7tkjLXBbuHwAGSZh9
 NLlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tg678fI3
Subject: Re: [Buildroot] [PATCH] package/avrdude: remove the obsolete hook
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gVGh1LCBKdWwgMjQsIDIwMjUgYXQgODoxOOKAr0FNIDx5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlz
dHNAZ29vZ2xlbWFpbC5jb20+Cj4KPiBDTWFrZSByZWNpcGUgZG9lc24ndCBjcmVhdGUgYSBiYWNr
dXAgb2YgdGhlIGF2cmR1ZGUuY29uZi4KPgo+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92
IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9hdnJkdWRlL2F2
cmR1ZGUubWsgfCA4IC0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXZyZHVkZS9hdnJkdWRlLm1rIGIvcGFja2FnZS9hdnJk
dWRlL2F2cmR1ZGUubWsKPiBpbmRleCA2MTk5ODcxMTliLi43OTQ0N2E2MjA1IDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvYXZyZHVkZS9hdnJkdWRlLm1rCj4gKysrIGIvcGFja2FnZS9hdnJkdWRlL2F2
cmR1ZGUubWsKPiBAQCAtMjksMTIgKzI5LDQgQEAgaWZlcSAoJChCUjJfUEFDS0FHRV9ISURBUEkp
LHkpCj4gIEFWUkRVREVfREVQRU5ERU5DSUVTICs9IGhpZGFwaQo+ICBlbmRpZgo+Cj4gLSMgaWYg
L2V0Yy9hdnJkdWRlLmNvbmYgZXhpc3RzLCB0aGUgaW5zdGFsbGF0aW9uIHByb2Nlc3MgY3JlYXRl
cyBhCj4gLSMgYmFja3VwIGZpbGUsIHdoaWNoIHdlIGRvIG5vdCB3YW50IGluIHRoZSBjb250ZXh0
IG9mIEJ1aWxkcm9vdC4KPiAtZGVmaW5lIEFWUkRVREVfUkVNT1ZFX0JBQ0tVUF9GSUxFCj4gLSAg
ICAgICAkKFJNKSAtZiAkKFRBUkdFVF9ESVIpL2V0Yy9hdnJkdWRlLmNvbmYuYmFrCj4gLWVuZGVm
Cj4gLQo+IC1BVlJEVURFX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gQVZSRFVERV9SRU1P
VkVfQkFDS1VQX0ZJTEUKPiAtCj4gICQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQoKUGVyaGFwcywg
aXQgd2lsbCBmaXggYXZyZHVkZSBidWlsZCBmYWlsdXJlcyBbMV0uIFRob3VnaCBJIGNhbm5vdApy
ZXByb2R1Y2UgdGhlbSBsb2NhbGx5LgoKWzFdIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5v
cmcvcmVzdWx0cy8wNzM2YmM5MTFkOTRmMWE5NDM1ZDU1M2VhOTQxMDVmMWNmMWZkZjMwL2J1aWxk
LWVuZC5sb2cKClllZ29yCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
