Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87927EE49BC
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 14:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 387A2812E7;
	Wed, 11 Sep 2024 14:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teFKrtON5-pE; Wed, 11 Sep 2024 14:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20FE7812F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20FE7812F3;
	Wed, 11 Sep 2024 14:50:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A22801BF954
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 14:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 906E460746
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 14:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XOxTlGGIWry for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 14:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB06B60643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB06B60643
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB06B60643
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 14:50:15 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so19309845e9.3
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 07:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726066213; x=1726671013;
 h=content-transfer-encoding:cc:subject:content-language:from:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TYLmzFZx5Z1RJuIhwfaWBf81Q0+E4+FqKR13PrG/bIY=;
 b=feTV2OETyLyj1fgDlWc1bmU6YZaMzLJKAW7p3ffkFN8flFcGp/foqv8oGMnCp9wk3N
 QGOxEVk7jVvhy67wQd0zgmZ02U/dIteWMVBBR+IoraPNWpnuYQOuhhRWM03WqpGzjAUf
 9IN6j0xzu/vvIF0/jI9wJVUWJa42LWPE+qrGaIqWES7IpwYFh6BVFH3i8o53wTt/JA3I
 iNrmiskVw1ySFBh8Cmsem2X8GzvuozL0k9aHfiVyP35/8A59mJLgv/lQOoKI787wF2L5
 DBRGBfLQfdVLykX8pYKbOPO4tJhIbEXqSr6ve28CuQY2IQrLjGAsUzetZC/ZP/LxImyH
 mREA==
X-Gm-Message-State: AOJu0YykQ+BJAlmLTJRA/3a1JmZ3mowHUNQmF9ja0JkN+/7Mv+wo58zI
 OTH2RvtEl4TvuM/LwEzqSoArKbfQso74M8/6hky9b/gfKhfds9BVlSL282y/dZqwwD+R/ukCh9E
 /
X-Google-Smtp-Source: AGHT+IFq1+FVqxyvuGjdjwRW79Coaw9JwHFfgM5YHlgd0c1ZwBffdtTnDCHjGNzLVZRctCIqvaMqFg==
X-Received: by 2002:a05:600c:b44:b0:42c:a574:6362 with SMTP id
 5b1f17b1804b1-42cce7a4888mr20469605e9.11.1726066213273; 
 Wed, 11 Sep 2024 07:50:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb45c81sm146026515e9.28.2024.09.11.07.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 07:50:12 -0700 (PDT)
Message-ID: <11df1d27-7fd8-4f6c-bdbe-786f46a75c24@mind.be>
Date: Wed, 11 Sep 2024 16:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-GB
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726066213; x=1726671013; darn=buildroot.org;
 h=content-transfer-encoding:cc:subject:content-language:from:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYLmzFZx5Z1RJuIhwfaWBf81Q0+E4+FqKR13PrG/bIY=;
 b=Mbvbw1ENsLSXGt+Xw77167h8YpanAOdCaHX1EnTDwBPWIcBcIMNjRFS9ktDx6K79TL
 A7hhVqIWs/0j8WUdESbtpz0VdWx4VNGRKql3I4h4AA0AnBfM4VU1xK6PGdEhhSDwQ05H
 Fv2nOZKOxkaZQgVdMt72kOslkHC7CNh0vZkPdlRI/iy/KGiPJVygUFmT1OZ5NIzT6ZH9
 Zp6tCeoMIgVzwT7QPiKmixIFs9IxVSqUpq+GfvpcB4MrMl5AsbKHab3NILtdSWLHZtub
 5NxiAxPOgppU9U4SvmdEmYuCpSZhBNzoIWAAlC2coEalxQ0at5F4DLb6sKssYnIN2bRS
 X/Lw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Mbvbw1EN
Subject: [Buildroot] Sponsoring Buildroot LTS: talk to your managers!
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Buildroot LTS <buildroot-lts@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IMKgSGkgYWxsLAoKIMKgVGhpcyBtZXNzYWdlIGlzIHRhcmdldHRlZCBhdCBwZW9wbGUgd2hvIHVz
ZSBCdWlsZHJvb3QgaW4gYSBwcm9mZXNzaW9uYWwgCmVudmlyb25tZW50LCBhbmQgd2hvIGJlbGll
dmUgQnVpbGRyb290IGlzIGEgZ29vZCB0aGluZyBhbmQgc2hvdWxkIGdldCBiZXR0ZXIgCnN1cHBv
cnQuCgogwqBDdXJyZW50bHksIGlmIHlvdSB1c2UgQnVpbGRyb290IHRvIGJ1aWxkIGEgcHJvZHVj
dCwgeW91J3JlIG5vdCBnZXR0aW5nIGdyZWF0IApzZWN1cml0eSB1cGRhdGVzLiBUaGVyZSBpcyBh
biBMVFMgYnJhbmNoLCBidXQgaXQgaXMgb25seSBtYWludGFpbmVkIGZvciBhIHllYXIuIApUaGlz
IG1lYW5zIHlvdSBuZWVkIHRvIGRvIGEgbWFqb3IgQnVpbGRyb290IHVwZGF0ZSBldmVyeSB5ZWFy
LCB3aGljaCBpcyBtb3JlIApmcmVxdWVudCB0aGFuIG1vc3QgcGVvcGxlIGFyZSB3aWxsaW5nIHRv
IGRvLiBJbiBhZGRpdGlvbiwgdGhlICJtYWludGVuYW5jZSIgaXMgCm5vdCB2ZXJ5IHRob3JvdWdo
OiBpdCdzIGp1c3QgdGhlIHNlY3VyaXR5IHVwZGF0ZXMgdGhhdCBQZXRlciBoYXBwZW5zIHRvIHN0
dW1ibGUgCnVwb24sIG9yIHRoYXQgb3RoZXIgcGVvcGxlIGNvbnRyaWJ1dGUuCgogwqBUaGlzIHNp
dHVhdGlvbiBleGlzdHMgYmVjYXVzZSBpdCdzIGEgY29tcGxldGVseSB2b2x1bnRhcnkgZWZmb3J0
LCBhbmQgUGV0ZXIgaXMgCnRoZSBvbmx5IHZvbHVudGVlciB3aG8gc3RlcHMgdXAsIGFuZCB0aGF0
IGlzIHRoZSBiZXN0IGhlIGNhbiBkby4KCiDCoFRoZSBCdWlsZHJvb3QgTFRTIFNwb25zb3Jpbmcg
Y29uY2VwdCB3YXMgcmFpc2VkIHRvIHRhY2tsZSB0aGlzIHByb2JsZW06IHJhaXNlIApmdW5kcyB0
byBwYXkgc29tZW9uZSB0byBnZXQgYSBiZXR0ZXIgTFRTIGJyYW5jaC4gT25lIHRoYXQgaXMgbWFp
bnRhaW5lZCBmb3IgCnRocmVlIHllYXJzIChvciBtYXliZSBsb25nZXIgaWYgaXQncyBzdWNjZXNz
ZnVsKSwgdGhhdCB0cmFja3Mgc2VjdXJpdHkgaXNzdWVzIApjb25zaXN0ZW50bHksIGFuZCB0aGF0
IGlzIHJlbGVhc2VkIG9uIGEgdGltZWx5IGJhc2lzLiBJbiBhZGRpdGlvbiwgdGhpcyBmcmVlcyB1
cCAKUGV0ZXIgZnJvbSBkb2luZyB0aGF0IHdvcmssIHdoaWNoIG1lYW5zIGhlIGNhbiBpbnZlc3Qg
aW4gdGhlIG1haW50ZW5hbmNlIG9mIHRoZSAKQnVpZHJvb3QgbWFpbmxpbmUsIGFuZCB3ZSBjYW4g
bWFrZSBhIGRlbnQgaW4gdGhlIGV2ZXItZ3Jvd2luZyBiYWNrbG9nIChjdXJyZW50bHkgCmF0IDM3
NyBwYXRjaGVzLi4uKS4KCgogwqBUaGlzIGlzIG9mIGNvdXJzZSBub3QgdGhlIGZpcnN0IHRpbWUg
eW91IGdldCB0aGlzIG1lc3NhZ2UuCgoKIMKgSSdtIHJlYWNoaW5nIG91dCBiZWNhdXNlIHdlIGhh
dmUgbm90ICh5ZXQpIGFjaGlldmVkIG91ciBtaW5pbXVtIHNwb25zb3JpbmcgCmdvYWwgdG8gbWFr
ZSB0aGlzIHBvc3NpYmxlLiBXZSBhcmUgcmVseWluZyBvbiB5b3UgdG8gZ2V0IHRoZSBzcG9uc29y
cyB0byB1cy4KCiDCoE9mIGNvdXJzZSwgeW91J3JlIHByb2JhYmx5IG5vdCBhIHBlcnNvbiB3aG8g
Y2FuIG1ha2UgYSBkZWNpc2lvbiBhYm91dCBzcGVuZGluZyAKbW9uZXkuIFNvIGhlcmUgYXJlIHNv
bWUgdGhpbmdzIHRoYXQgeW91IF9jYW5fIGRvIQoKCiogVGFsayB0byB5b3VyIG1hbmFnZXIgKHdo
byBjYW4gZGVjaWRlIGFib3V0IG1vbmV5KSB0byBleHBsYWluIHdoeSBCdWlsZHJvb3QgTFRTIApp
cyBuZWVkZWQuIENvbnZpbmNlIHRoZW0gdG8gcmVnaXN0ZXIgYXQgaHR0cHM6Ly9taW5kLmJlL2J1
aWxkcm9vdC1sdHMvCgoqIEFsdGVybmF0aXZlbHksIHJlZ2lzdGVyIG9uIGh0dHBzOi8vbWluZC5i
ZS9idWlsZHJvb3QtbHRzLyB5b3Vyc2VsZiwgYW5kIApmb3J3YXJkIHRoZSBjb21tdW5pY2F0aW9u
IHlvdSBnZXQgdG8geW91ciBtYW5hZ2VyLgoKKiBBbHRlcm5hdGl2ZWx5LCBkaXJlY3RseSBhc2sg
dXMgdG8gdGFsayB0byB5b3VyIG1hbmFnZXIuIFNlbmQgYSBtYWlsIHRvIApidWlsZHJvb3QtbHRz
QG1pbmQuYmUgd2l0aCB5b3VyIG1hbmFnZXIgaW4gQ2MsIHdpdGggc29tZXRoaW5nIGxpa2U6ICJD
YW4geW91IApjb250YWN0IHRvIDxKb2huIERvZT4gdG8gZXhwbGFpbiBhYm91dCB0aGUgQnVpbGRy
b290IExUUyBTcG9uc29yaW5nIHByb2dyYW0/Ii4KCiogWW91IGNhbiBhbHNvIHRoaW5rIGFib3V0
IGhvdyBCdWlsZHJvb3QgTFRTIGlzIHJlbGV2YW50IGZvciB5b3VyIHNwZWNpZmljIApzaXR1YXRp
b24uIFdlIG5lZWQgdGhhdCBraW5kIG9mIGlucHV0IHRvIGNvbnZpbmNlIG1hbmFnZXJzIHRvIGlu
dmVzdC4KCiogSWYgeW91IGFyZSBhIGNvbnN1bHRhbnQgKGxpa2UgbWUpLCBpdCdzIHByb2JhYmx5
IG5vdCB5b3VyIGNvbXBhbnkgdGhhdCBzaG91bGQgCmJlIHNwb25zb3JpbmcsIGJ1dCByYXRoZXIg
eW91ciBjdXN0b21lcnMgdGhhdCBhcmUgdXNpbmcgQnVpbGRyb290LiBDb250YWN0IHRoZSAKZW5n
aW5lZXJzIGFuZCBpZGVhbGx5IGFsc28gbWFuYWdlcnMgYXQgeW91ciBjdXN0b21lcnMgd2l0aCB0
aGUgYXBwcm9hY2ggb3V0bGluZWQgCmFib3ZlLgoKKiBBbHNvIGlmIHlvdSdyZSBhIGNvbnN1bHRh
bnQsIHRoaXMgaXMgaW4gZmFjdCBhbiBvcHBvcnR1bml0eSB0byBtYWtlIG1vbmV5ISBZb3UgCmNh
biBzZWxsIHN1cHBvcnQgdG8geW91ciBjdXN0b21lcnMgKGkuZS4gdXBkYXRlIHRoZWlyIEJ1aWxk
cm9vdCBlbnZpcm9ubWVudCBmb3IgCnRoZW0pLCBhbmQgZWl0aGVyIHlvdXJzZWxmIG9yIG91ciBj
dXN0b21lciAob3IgYm90aCEpIGNhbiBzcG9uc29yIEJ1aWxkcm9vdCBMVFMgCnRvIG1ha2UgaXQg
cG9zc2libGUgZm9yIHlvdSB0byBhY3R1YWxseSBwcm92aWRlIHRoYXQgc3VwcG9ydC4KCgogwqBJ
ZiB5b3UgZG9uJ3QgdGFrZSBhbnkgYWN0aW9uLCB3ZSdyZSBub3QgZ29pbmcgdG8gZ2F0aGVyIHN1
ZmZpY2llbnQgc3BvbnNvcnMuIApJbiB0aGF0IGNhc2UsIHRoZSBzaXR1YXRpb24gd2lsbCBjb250
aW51ZSBhcyBpdCBpcyBub3cuIEZvciBtb3N0IGNvbXBhbmllcywgdGhpcyAKaGFzIGJlZW4gT0st
aXNoIHVwIHRvIG5vdy4gSG93ZXZlciwgdGhpcyBzaXR1YXRpb24gd2lsbCBtb3N0IGxpa2VseSBj
aGFuZ2Ugd2l0aCAKdGhlIHVwY29taW5nIHJlcXVpcmVtZW50cyBvbiBDeWJlcnNlY3VyaXR5IGZy
b20gVVMgYW5kIEVVLiBZb3UncmUgbm8gbG9uZ2VyIApnb2luZyB0byBnZXQgYXdheSB3aXRoIG5v
dCBkb2luZyBhbnkgdXBkYXRlcyBvZiB0aGUgdW5kZXJseWluZyBPUyBmb3IgZm91ciAKeWVhcnMu
IFRoYXQgaXMgd2h5IHdlJ3JlIHN0YXJ0aW5nIHRoaXMgbm93LgoKCiDCoFNvLCBwbGVhc2UgZ2V0
IG9mZiB5b3VyIGJlaGluZCBhbmQgZ2V0IHRoZSBiYWxsIHJvbGxpbmcgdG8gZ2l2ZSBCdWlsZHJv
b3QgYSAKbG9uZy10ZXJtIGZ1dHVyZSEKCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgogwqBOb3Rl
OiBGb3IgcHJhY3RpY2FsIHJlYXNvbnMsIHRoZSBCdWlsZHJvb3QgTFRTIFNwb25zb3JpbmcgcHJv
Z3JhbSBpcyBoYW5kbGVkIApieSBNaW5kLiBCYXNpY2FsbHksIHRoZSBCdWlsZHJvb3QgQXNzb2Np
YXRpb24gZG9lc24ndCBoYXZlIHRoZSBtYW5wb3dlciB0byBkbyAKYWxsIHRoZSBhZG1pbmlzdHJh
dGlvbiBpbnZvbHZlZCB3aXRoIGhhbmRsaW5nIHRheGVzIGFuZCBpbnZvaWNlcyBhbmQgc3R1ZmYu
IApCdWlsZHJvb3QgTFRTIGlzIGhvd2V2ZXIgc3RpbGwgZnVsbHkgc3VwZXJ2aXNlZCBieSB0aGUg
QnVpbGRyb290IG1haW50YWluZXIgdGVhbS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
