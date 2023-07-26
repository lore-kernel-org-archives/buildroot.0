Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870CBC001E0
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA39340BAB;
	Wed, 26 Jul 2023 20:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA39340BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LsUwAnjAnhx0; Wed, 26 Jul 2023 20:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A83A40649;
	Wed, 26 Jul 2023 20:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A83A40649
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 483621BF40D
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EAB940649
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EAB940649
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TSRYyEDZLj6c for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:42:37 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D7CA40144
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D7CA40144
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe0bb9500aso356711e87.1
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 13:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690404154; x=1691008954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SWOSe/uki8NbjZc+D9fWjX3mcoie37faDv5+kx6R6gA=;
 b=VrbwVYu7DdeRrmhy2AsQREanExvT9hropEQ3IptpVTgaj3AXNbQG3tCK1C2C11ZGsR
 Ah6CUxyLl2shrx8qTyUcUdEF3KNqm35aXoMFShP/OSH3ZDay3S9do/h5o7XdH9VeZioL
 WoMJ34ygLPItNqDYNCU1eTr5N0ArhvGajtVfJjjq9kirHtAAqBcAQ/shECSkYbBizLXb
 tctZXRQQ/0uziFNPMcI+xyogCvV/qc4z+GcQwpv2WKxkUWQaDy3elIJ5eFq5xunJ6MfV
 pjATk2ab8oOb2koxA3TQ8SWwwfGawD9l7R2B0OjSgOsaxHFFsH6a00opzQPpYbX1ypwY
 Q9XA==
X-Gm-Message-State: ABy/qLabi+idRoyfRSAR9jT4lb1VE/4KNLgnHGpiUuUQn2S4CN+3fUfD
 ve1mpLGzSPnVkGPhENbABS4yJ8ib11VxO1lf1Qw=
X-Google-Smtp-Source: APBJJlGtdJuLIevjUTUwE4vMU4aNYZ307Y9Xgq0WvfK2+9ASPw4P7LeqzzeyICzFcP8UZ0LWPNbiRQ==
X-Received: by 2002:a05:6512:1187:b0:4fe:af6:5e5 with SMTP id
 g7-20020a056512118700b004fe0af605e5mr200470lfr.23.1690404154449; 
 Wed, 26 Jul 2023 13:42:34 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 l17-20020ac25551000000b004fb64600e5dsm3462383lfk.219.2023.07.26.13.42.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 13:42:33 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so340149e87.2
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 13:42:33 -0700 (PDT)
X-Received: by 2002:a05:6512:3f15:b0:4fd:c83b:a093 with SMTP id
 y21-20020a0565123f1500b004fdc83ba093mr257565lfa.1.1690404153305; Wed, 26 Jul
 2023 13:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-3-christian@aperture.us>
 <20230726223400.2bcca37c@windsurf>
In-Reply-To: <20230726223400.2bcca37c@windsurf>
Date: Wed, 26 Jul 2023 13:42:21 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qGfLDSasMhTdBxV9LpvfGhpm+rqv7b6BrCEr8vh5=RWA@mail.gmail.com>
Message-ID: <CA+h8R2qGfLDSasMhTdBxV9LpvfGhpm+rqv7b6BrCEr8vh5=RWA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690404154; x=1691008954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SWOSe/uki8NbjZc+D9fWjX3mcoie37faDv5+kx6R6gA=;
 b=i7Dvfv8aXtEoK8ylIOKPEvs+UWVKaNq1+Xq3YNiRaZIBp+n25YAiUxJ+FiDefbXwqc
 6YJq4Ait40lFU3Y03K5msd5lBccBEgkIbgrMBcKVfxGC1RVB1+q8gd7l8FKs6l973LFK
 gDQyvUy3ztKzuHsZbdYU3jZ1VzXe8xNgiv8ul1q1B4t2AINTKbyjnbV4LngRMwpRIKbE
 JpzqdUbcUIzV/krqInKZPQsOo1SpOA5F4tPE2eFm9g316eufv1eYImykqAsOxXLJKBMf
 RAPwfKZDRmormLf/eT8FoghzdAy8F5tDADFM5fDTfg7RAoPG5QmMk39bIsNM2EXNOXes
 HmRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=i7Dvfv8a
Subject: Re: [Buildroot] [PATCH v1 3/3] boot/uboot: add host-python-pylibfdt
 dependency if needed
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLAoKT24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgMTozNOKAr1BNIFRob21hcyBQZXRhenpv
bmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCAyNiBK
dWwgMjAyMyAxMzoyODozOCAtMDcwMAo+IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBl
cnR1cmUudXM+IHdyb3RlOgo+Cj4gPiBJZiBCUjJfVEFSR0VUX1VCT09UX05FRURTX1BZTElCRkRU
IGlzIHNldCwgYWRkIGEgZGVwZW5kZW5jeSBvbgo+ID4gaG9zdC1weXRob24tcHlsaWJmZHQuCj4g
Pgo+ID4gRml4ZXMgYSBidWlsZCBmYWlsdXJlIHdpdGggdWJvb3QgMjAyMy4wNzoKPiA+Cj4gPiAk
IG1ha2UgdWJvb3QKPiA+IGVycm9yOiBweWxpYmZkdCBkb2VzIG5vdCBzZWVtIHRvIGJlIGF2YWls
YWJsZSB3aXRoIHB5dGhvbjMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2Fy
dCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgo+Cj4gQnV0IEkgdGhvdWdodCBweWxpYmZkdCB3YXMg
c2hpcHBlZCBhcyBwYXJ0IG9mIFUtQm9vdD8gSXNuJ3QgdGhhdCBubwo+IGxvbmdlciB0aGUgY2Fz
ZT8KClRoYXQgZG9lcyBub3Qgc2VlbSB0byBiZSB0aGUgY2FzZSBpZiBkdGMgaXMgcHJvdmlkZWQs
IGluIHRoZSBtYWtlZmlsZToKCiMgQ2hlY2sgZHRjIGFuZCBweWxpYmZkdCwgaWYgRFRDIGlzIHBy
b3ZpZGVkLCBlbHNlIGJ1aWxkIHRoZW0KUEhPTlkgKz0gc2NyaXB0c19kdGMKc2NyaXB0c19kdGM6
IHNjcmlwdHNfYmFzaWMKICAgICQoUSlpZiB0ZXN0ICIkKERUQykiID0gIiQoRFRDX0lOVFJFRSki
OyB0aGVuIFwKICAgICAgICAkKE1BS0UpICQoYnVpbGQpPXNjcmlwdHMvZHRjOyBcCiAgICBlbHNl
IFwKICAgICAgICBpZiAhICQoRFRDKSAtdiA+L2Rldi9udWxsOyB0aGVuIFwKICAgICAgICAgICAg
ZWNobyAnKioqIEZhaWxlZCB0byBjaGVjayBkdGMgdmVyc2lvbjogJChEVEMpJzsgXAogICAgICAg
ICAgICBmYWxzZTsgXAogICAgICAgIGVsc2UgXAogICAgICAgICAgICBpZiB0ZXN0ICIkKGNhbGwg
ZHRjLXZlcnNpb24pIiAtbHQgJChEVENfTUlOX1ZFUlNJT04pOyB0aGVuIFwKICAgICAgICAgICAg
ICAgIGVjaG8gJyoqKiBZb3VyIGR0YyBpcyB0b28gb2xkLCBwbGVhc2UgdXBncmFkZSB0byBkdGMK
JChEVENfTUlOX1ZFUlNJT04pIG9yIG5ld2VyJzsgXAogICAgICAgICAgICAgICAgZmFsc2U7IFwK
ICAgICAgICAgICAgZWxzZSBcCiAgICAgICAgICAgICAgICBpZiBbIC1uICIkKENPTkZJR19QWUxJ
QkZEVCkiIF07IHRoZW4gXAogICAgICAgICAgICAgICAgICAgIGlmICEgZWNobyAiaW1wb3J0IGxp
YmZkdCIgfCAkKFBZVEhPTjMpIDI+L2Rldi9udWxsOyB0aGVuIFwKICAgICAgICAgICAgICAgICAg
ICAgICAgZWNobyAnKioqIHB5bGliZmR0IGRvZXMgbm90IHNlZW0gdG8gYmUKYXZhaWxhYmxlIHdp
dGggJChQWVRIT04zKSc7IFwKICAgICAgICAgICAgICAgICAgICAgICAgZmFsc2U7IFwKICAgICAg
ICAgICAgICAgICAgICBmaTsgXAogICAgICAgICAgICAgICAgZmk7IFwKICAgICAgICAgICAgZmk7
IFwKICAgICAgICBmaTsgXAogICAgZmkKCkl0IGV4ZWN1dGVzOgoKZWNobyAiaW1wb3J0IGxpYmZk
dCIgfCBweXRob24zCgouLi4gd2hpY2ggZmFpbHMgaW4gQnVpbGRyb290IHVubGVzcyBob3N0LXB5
dGhvbi1weWxpYmZkdCBpcyBpbnN0YWxsZWQuCgpJIHRoaW5rIGlmIHRoaXMgcGFydCBldmFsdWF0
ZXMgdG8gdHJ1ZSBpdCBtaWdodCB1c2UgdGhlIGluLXRyZWUgdmVyc2lvbjoKCiAgICAkKFEpaWYg
dGVzdCAiJChEVEMpIiA9ICIkKERUQ19JTlRSRUUpIjsgdGhlbiBcCiAgICAgICAgJChNQUtFKSAk
KGJ1aWxkKT1zY3JpcHRzL2R0YzsgXAogICAgZWxzZQoKSXQncyB1cCB0byB5b3UgaWYgeW91IHdh
bnQgdG8gc29tZWhvdyBmb3JjZSB0aGUgaW4tdHJlZSB2ZXJzaW9uIGJ1dApmb3IgbXkgcHVycG9z
ZXMgdGhlIGhvc3QtcHl0aG9uLXB5bGliZmR0IHBhY2thZ2UgZG9lcyB0aGUgdHJpY2sgYW5kCmZp
eGVzIHRoZSBidWlsZCBmYWlsdXJlLgoKQmVzdCByZWdhcmRzLApDaHJpc3RpYW4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
