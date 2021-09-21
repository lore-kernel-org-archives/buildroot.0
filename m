Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16B2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 17:20:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E456610A0
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 17:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E456610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE8B780FF2;
	Tue, 21 Sep 2021 17:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uSOCtEmq1_r8; Tue, 21 Sep 2021 17:20:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A6F80FFD;
	Tue, 21 Sep 2021 17:20:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 276C31BF3C2
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 17:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17A0480FFD
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 17:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id csfBddOT37YF for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 17:20:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11FBE80FF2
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 17:20:36 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id c22so76524863edn.12
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 10:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v79yI6bcBQpzoCgJEhJg/42zbkff5I5iAKG0beA+Rw4=;
 b=hA29vvof4vTM1sQgshOIQUzMf5y+xuuYts0sXQKF9VsLh0tMjOEVznl7qbZXF3VVZ+
 /k42KYJlHnrierhNPIdKtt2A6b16Kwv95g11wMAy7UYgfWlIIROnABJ7sBmiUs6XVJtG
 /WbWAyYhhIdnePEeMwSnnArPq2kQ1UTKgMWxVi55TW8KforgKMJR7Q7iFyZQyLE+aoWI
 yjXcdz3yjet+m/CvR4KyWosnuMyWy9iafGxVSEi4D5e/Aa16SQnV3xO0j75MiGTvUd+Y
 0OQdelF4ryZaz3IHl2mu8YfmMhg2koJS0Y5FciCjQP7jzZT6bMnPiKbiNGRNBEltsggk
 rlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v79yI6bcBQpzoCgJEhJg/42zbkff5I5iAKG0beA+Rw4=;
 b=NOCvIzh1mxKuivyIYXRaoKG6oN+W4wgjnIrTQE8lYwP7iWf0++es575Yi2W4NLhgfW
 aJOLX2rsBeAN8pS44F+xtvxMJeKwPHXIOnd+tktt/UNGpqto3kVRIrS50KNQOAfjnXZk
 Bq3o5HGsb9d2TwK7imjlgfzCfVoEjRoeeRz/xv+cijIgiJBDOSh4sPAYjSM/zUTZp9Ge
 cbGXyMxQtxAJDn1/2hja5YO2+u4kl7157onfG3nO877aewLOlC6Tg6gCEaQwZyB9JvZ9
 E6suCEBjKLasYaky45rgtruobfwUCOItuJzw6hfUfvBIdf391+c7YfOn7HnLFi6gB0Zl
 b7tg==
X-Gm-Message-State: AOAM532B2y45zXmsaLc5EiDz46KBQ6Gjc8ojt3PaSZ/BUHjcxAm0aGc4
 iPk15LYHWAh/Fzw8KdlhmtrQhA==
X-Google-Smtp-Source: ABdhPJzIohwXM6L7s0BhGwXpQFwhq4xGEDq06Ytq5gkRKOmcOJ39qTGC9Ke2Xo73B/jPHcf7kSW9iA==
X-Received: by 2002:a17:906:49d0:: with SMTP id
 w16mr35187153ejv.455.1632244834936; 
 Tue, 21 Sep 2021 10:20:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l18sm875685edw.78.2021.09.21.10.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 10:20:34 -0700 (PDT)
Message-ID: <e171aeb5-bf5b-d766-e59f-6092a9f69d16@mind.be>
Date: Tue, 21 Sep 2021 19:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Kory Maincent <kory.maincent@bootlin.com>
References: <20210921132829.56405-1-kory.maincent@bootlin.com>
 <20210921132829.56405-2-kory.maincent@bootlin.com>
 <20210921163727.GW1053080@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210921163727.GW1053080@scaer>
Subject: Re: [Buildroot] [PATCH v2 1/6] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

CgpPbiAyMS8wOS8yMDIxIDE4OjM3LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEvDtnJ5LCBBbGws
Cj4gCj4gT24gMjAyMS0wOS0yMSAxNToyOCArMDIwMCwgS29yeSBNYWluY2VudCBzcGFrZSB0aHVz
bHk6Cgpbc25pcF0KPj4gICBpZmVxICgkKEJSMl9UQVJHRVRfR1JVQjJfSTM4Nl9QQykseSkKPiBb
LS1TTklQIHJlbW92YWxzLS1dCj4+ICtHUlVCMl9JTUFHRV9pMzg2LXBjID0gJChCSU5BUklFU19E
SVIpL2dydWIuaW1nCj4+ICtHUlVCMl9DRkdfaTM4Ni1wYyA9ICQoVEFSR0VUX0RJUikvYm9vdC9n
cnViL2dydWIuY2ZnCj4+ICtHUlVCMl9QUkVGSVhfaTM4Ni1wYyA9ICgkKEdSVUIyX0JPT1RfUEFS
VElUSU9OKSkvYm9vdC9ncnViCj4+ICtHUlVCMl9UQVJHRVRfaTM4Ni1wYyA9IGkzODYKPj4gK0dS
VUIyX1BMQVRGT1JNX2kzODYtcGMgPSBwYwo+PiArR1JVQjJfQlVJTFRJTl9pMzg2LXBjID0gUEMK
Pj4gK0dSVUIyX1RVUExFUyArPSBpMzg2LXBjCj4+ICtlbmRpZgo+IAo+IEFueSByZWFzb24gd2h5
IHlvdSBoYXZlIGRlY2lkZWQgbm90IHRvIGdvdCB3aXRoIHRoZSBjb25zdHJ1Y3QgSQo+IHN1Z2dl
c3RlZDoKPiAgICAgIEdSVUIyX1RVUExFUy0kKEJSMl9UQVJHRVRfR1JVQjJfSTM4Nl9QQykgKz0g
aTM4Ni1wYwo+IAo+IGFuZCB0aGVuIHVzZSAkKEdSVUIyX1RVUExFUy15KSB3aGVuIGl0ZXJhdGlu
Zz8KCiAgV2VsbCwgaXQncyBhIGJpZ2dlciBkaWZmIGNvbXBhcmVkIHRvIHdoYXQgeW91IGhhdmUg
bm93LiBFc3BlY2lhbGx5IGJlY2F1c2UgeW91IApoYXZlIHRvIGtlZXAgdGhlIEdSVUIyX0lNQUdF
X2kzODYtcGMgZXRjLiBwYXJ0LCBpdCdzIG9ubHkgVFVQTEVTIHRoYXQgeW91IGNhbiAKdXNlIGxp
a2UgdGhhdC4KCiAgQWxzbywgSSB0aGluayB0aGUgLXkgYXBwcm9hY2ggaXMgZ29vZCBvbmx5IHdo
ZW4geW91IGhhdmUgbWF5IG9wdGlvbnMgKGJlY2F1c2UgCml0IGlzIHNsaWdodGx5IG1vcmUgZGlm
ZmljdWx0IHRvIHBhcnNlKSAtIHdlIGhhdmUgNSBvcHRpb25zIGhlcmUsIHdoaWNoIGlzIGEgYml0
IApib3JkZXJsaW5lLgoKICBIb3dldmVyLCB0aGlzIGFwcHJvYWNoIGJlY29tZXMgYSBsb3QgbW9y
ZSBhdHRyYWN0aXZlIGlmIHdlIGVsaW1pbmF0ZSB0aGUgCmNvbmRpdGlvbnM6CgpHUlVCMl9JTUFH
RV9pMzg2LXBjID0gJChCSU5BUklFU19ESVIpL2dydWIuaW1nCkdSVUIyX0NGR19pMzg2LXBjID0g
JChUQVJHRVRfRElSKS9ib290L2dydWIvZ3J1Yi5jZmcKR1JVQjJfUFJFRklYX2kzODYtcGMgPSAo
JChHUlVCMl9CT09UX1BBUlRJVElPTikpL2Jvb3QvZ3J1YgpHUlVCMl9UQVJHRVRfaTM4Ni1wYyA9
IGkzODYKR1JVQjJfUExBVEZPUk1faTM4Ni1wYyA9IHBjCkdSVUIyX0JVSUxUSU5faTM4Ni1wYyA9
IFBDCkdSVUIyX1RVUExFUy0kKEJSMl9UQVJHRVRfR1JVQjJfSTM4Nl9QQykgKz0gaTM4Ni1wYwoK
R1JVQjJfSU1BR0VfaTM4Ni1lZmkgPSAkKEJJTkFSSUVTX0RJUikvZWZpLXBhcnQvRUZJL0JPT1Qv
Ym9vdGlhMzIuZWZpCkdSVUIyX0NGR19pMzg2LWVmaSA9ICQoQklOQVJJRVNfRElSKS9lZmktcGFy
dC9FRkkvQk9PVC9ncnViLmNmZwpHUlVCMl9QUkVGSVhfaTM4Ni1lZmkgPSAvRUZJL0JPT1QKR1JV
QjJfVEFSR0VUX2kzODYtZWZpID0gaTM4NgpHUlVCMl9QTEFURk9STV9pMzg2LWVmaSA9IGVmaQpH
UlVCMl9CVUlMVElOX2kzODYtZWZpID0gRUZJCkdSVUIyX1RVUExFUy0kKEJSMl9UQVJHRVRfR1JV
QjJfSTM4Nl9FRkkpICs9IGkzODYtZWZpCgo+IAo+IE5vdGU6IHRoaXMgaXMgdXNlZCBldmVyeXdo
ZXJlIGluIHRoZSBrZXJuZWwgdHJlZSwgYW5kIHdlIGFscmVhZHkgdXNlCj4gdGhhdCBjb25zdHJ1
Y3QgaW4gcXVpdGUgYSBmZXcgcGxhY2VzLCBzbyBpdCB3b3VsZCBub3QgYmUgdG90YWxseSBuZXcK
PiBhbmQgbm90IHRvdGFsbHkgdW5rb3duIGVpdGhlcjoKPiAKPiAgICAgICQgZ2l0IGdyZXAgLUUg
LS0gJ1tfLV1cJFwoW14pXStcKVtbOnNwYWNlOl1dKlwrPScgJyoubWsnCj4gCj4gQnV0IE9LLCB0
aGUgbXVsdGktY29uZGl0aW9ucyB3b3JrIGFzIGdvb2QgaWYgeW91IGRvbid0IGxpa2UgdGhlIC15
Cj4gc3R1ZmYuCj4gCj4+ICtpZmVxICgkKEJSMl9UQVJHRVRfR1JVQjJfSTM4Nl9FRkkpLHkpCj4+
ICtHUlVCMl9JTUFHRV9pMzg2LWVmaSA9ICQoQklOQVJJRVNfRElSKS9lZmktcGFydC9FRkkvQk9P
VC9ib290aWEzMi5lZmkKPj4gK0dSVUIyX0NGR19pMzg2LWVmaSA9ICQoQklOQVJJRVNfRElSKS9l
ZmktcGFydC9FRkkvQk9PVC9ncnViLmNmZwo+PiArR1JVQjJfUFJFRklYX2kzODYtZWZpID0gL0VG
SS9CT09UCj4+ICtHUlVCMl9UQVJHRVRfaTM4Ni1lZmkgPSBpMzg2Cj4+ICtHUlVCMl9QTEFURk9S
TV9pMzg2LWVmaSA9IGVmaQo+PiArR1JVQjJfQlVJTFRJTl9pMzg2LWVmaSA9IEVGSQo+IAo+IEFs
bCB0aG9zZSBHUlVCMl9CVUlMVElOXyQodHVwbGUpIHZhcmlhYmxlcyBhcmUganVzdCBzbyB0aGF0
IHlvdSBjYW4gZG8gYQo+IGRvdWJsZSBpbmRlaXJlY3Rpb24gYWx0ZXIgb24sIHdoaWNoIGlzIGhp
Z2hseSB1bnJlYWRhYmxlLgo+IAo+IFdoYXQgYWJvdXQgYXNzaWduaW5nIHRoZSBvcHRpb25zIGRp
cmVjdGx5Ogo+IAo+ICAgICAgR1JVQjJfQ09ORklHX2kzODYtcGMgPSAkKEdSVUIyX0JVSUxUSU5f
Q09ORklHX1BDKQo+ICAgICAgR1JVQjJfTU9EVUxFU19pMzg2LXBjID0gJChHUlVCMl9CVUlMVElO
X01PRFVMRVNfUEMpCj4gICAgICBHUlVCMl9DT05GSUdfaTM4Ni1lZmkgPSAkKEdSVUIyX0JVSUxU
SU5fQ09ORklHX0VGSSkKPiAgICAgIEdSVUIyX01PRFVMRVNfaTM4Ni1lZmkgPSAkKEdSVUIyX0JV
SUxUSU5fTU9EVUxFU19FRkkpCgogIFN0aWxsIGZlZWxzIG92ZXItY29tcGxpY2F0ZWQsIGJ1dCBJ
IGNhbid0IHRoaW5rIG9mIGFueXRoaW5nIGJldHRlci4gQnV0IGl0J3MgCmRlZmluaXRlbHkgYW4g
aW1wcm92ZW1lbnQgb3ZlciB0aGUgQlVJTFRJTl8kKHR1cGxlKS4KCiAgUmVnYXJkcywKICBBcm5v
dXQKCltzbmlwXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
