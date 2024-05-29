Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40EBC25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 06:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6892B605CF;
	Wed, 29 May 2024 06:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTYi_FTuBiV5; Wed, 29 May 2024 06:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55ED56070C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55ED56070C;
	Wed, 29 May 2024 06:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5F5D1D31DD
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C11F140628
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 06:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nOIYCTj7bRMa for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 06:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7483440821
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7483440821
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7483440821
 for <buildroot@buildroot.org>; Wed, 29 May 2024 06:48:15 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-62a080a171dso16532517b3.0
 for <buildroot@buildroot.org>; Tue, 28 May 2024 23:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716965294; x=1717570094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cMa/LMpEy2RN5YsznoH1KuY/wmTuXXufRSda2wjr3ek=;
 b=hw4no1kH1aytVqXKoE0yJAl66tWyhjZMlpXqw/Uc+gXQDua6BgnFmmiqh4zTrM/LRW
 QmbQMbn0GW0aBTWl5PtXkt/lWump4a1L29kGU+WywPdPVKasdBeFaA0cA93qjxP0duxi
 eL8nVA/OsqIsb0o7uJ5Vdxm8SCnMWpI/Cs+5xgPP0RO8Kzak9lUFlm6lpzgTux7waN1y
 ZKEmgEGmVRPHB1SuXqTCBq0CJMvBbxV4RMNoplbKAOaUWc0FdMSTIsKN1MpVEJk0GZc8
 bP21CGKo4l5LVRDkBwni08Woj5kPkuq3IgO71okY6y/BTRaeIkTNwtYxQ64i3EOjbI2p
 27ZA==
X-Gm-Message-State: AOJu0YzcHQg0UZXEDInDsLgleDwelSNy3PTLmxBBDQnbvfT9LyLCOsvP
 OJZWwrVKQqr6j2c3HN9+p9MAo0Mfyimhc4Qb/Zxxu+je58UiwXD97uWcjRp7bDTxHF63vRB5429
 oEdvFC8j9ZGHcntS9VxP7oQd8hIPVZi1wn6GdDA==
X-Google-Smtp-Source: AGHT+IEZ2bT/TaCkavuHZpBAB+Us2xJWePaF1idDfqXz1+Aoe/8gUXCyeE+Qk5ZY9Y05y8S4RmEwh+FCKoavTHK9Za4=
X-Received: by 2002:a0d:cb45:0:b0:618:92bd:9334 with SMTP id
 00721157ae682-62a08eda53cmr145771067b3.43.1716965294311; Tue, 28 May 2024
 23:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240527160343.2662538-1-dario.binacchi@amarulasolutions.com>
 <87le3trucw.fsf@dell.be.48ers.dk>
In-Reply-To: <87le3trucw.fsf@dell.be.48ers.dk>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 29 May 2024 08:48:03 +0200
Message-ID: <CABGWkvqWT7Xw=LrbJ39ox58=Lr1yp6AfH+GwXzzeSYJ4Wzk0QQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716965294; x=1717570094;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cMa/LMpEy2RN5YsznoH1KuY/wmTuXXufRSda2wjr3ek=;
 b=flKx+AUNWf3a95a4k3FNfGv37e8UTZwV3h0jNKwWF79s6wduODEl3gkKj1MVSmbFTY
 CdnsIVEqRSH3r0iolb/vc6w5Xl27an9Nz/VOh9YsLMielMI5HaYOp5qY7a69PQ7elNXt
 94hQSvQ/yNzECpuNORQXE+WjKfPevnreTS2MM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=flKx+AUN
Subject: Re: [Buildroot] [PATCH 1/1] configs/at91sam9x5ek_dev_defconfig: add
 hashes for at91bootstrap3/Linux/headers/u-boot
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBXZWQsIE1heSAyOSwgMjAyNCBhdCA4OjQz4oCvQU0gUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJEYXJpbyIgPT0gRGFy
aW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cml0ZXM6
Cj4KPiAgPiBBbmQgZW5hYmxlIEJSMl9ET1dOTE9BRF9GT1JDRV9DSEVDS19IQVNIRVMuIFdpdGgg
dGhpcywgd2UgY2FuIG5vdyBkcm9wIHRoZQo+ICA+IGRlZmNvbmZpZyBmcm9tIC5jaGVja3BhY2th
Z2VpZ25vcmUuCj4KPiAgPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmlu
YWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gID4gLS0tCj4gID4gIC5jaGVja3BhY2thZ2Vp
Z25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+
ICA+ICAuLi4vYXQ5MXNhbTl4NWVrX2Rldi9wYXRjaGVzL2F0OTFib290c3RyYXAzL2F0OTFib290
c3RyYXAzLmhhc2ggfCAyICsrCj4gID4gIC4uLi9hdDkxc2FtOXg1ZWtfZGV2L3BhdGNoZXMvbGlu
dXgtaGVhZGVycy9saW51eC1oZWFkZXJzLmhhc2ggICB8IDEgKwo+ICA+ICBib2FyZC9hdG1lbC9h
dDkxc2FtOXg1ZWtfZGV2L3BhdGNoZXMvbGludXgvbGludXguaGFzaCAgICAgICAgICAgfCAyICsr
Cj4gID4gIGJvYXJkL2F0bWVsL2F0OTFzYW05eDVla19kZXYvcGF0Y2hlcy91Ym9vdC91Ym9vdC5o
YXNoICAgICAgICAgICB8IDIgKysKPiAgPiAgY29uZmlncy9hdDkxc2FtOXg1ZWtfZGV2X2RlZmNv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gID4gIDYgZmlsZXMgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBib2FyZC9hdG1lbC9hdDkxc2FtOXg1ZWtfZGV2L3BhdGNoZXMvYXQ5MWJvb3RzdHJhcDMv
YXQ5MWJvb3RzdHJhcDMuaGFzaAo+ICA+ICBjcmVhdGUgbW9kZSAxMjAwMDAgYm9hcmQvYXRtZWwv
YXQ5MXNhbTl4NWVrX2Rldi9wYXRjaGVzL2xpbnV4LWhlYWRlcnMvbGludXgtaGVhZGVycy5oYXNo
Cj4gID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9hdG1lbC9hdDkxc2FtOXg1ZWtfZGV2L3Bh
dGNoZXMvbGludXgvbGludXguaGFzaAo+ICA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvYXRt
ZWwvYXQ5MXNhbTl4NWVrX2Rldi9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKPgo+IFdlIGhhdmUg
NCBhdDkxc2FtOXg1ZWsgZGVmY29uZmlncyBhbGwgdXNpbmcgdGhlIHNhbWUKPiBhdDkxYm9vdHN0
cmFwL0xpbnV4L1UtQm9vdCwgc28gaXQgSU1ITyB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8gcHV0
IHRoZQo+IHBhdGNoZXMgdW5kZXIgYm9hcmQvYXRtZWwvYXQ5MXNhbTl4NWVrL3BhdGNoZXMgYW5k
IHVzZSB0aGVtIGZyb20gYWxsIDQKPiBkZWZjb25maWdzLgo+Cj4gQ2FyZSB0byBzZW5kIGFuIHVw
ZGF0ZSBkb2luZyB0aGF0PyBUaGFua3MuCgpZZXMsIEknbGwgZG8gaXQKClRoYW5rcyBhbmQgcmVn
YXJkcwpEYXJpbwo+Cj4gLS0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZAoKCgotLSAKCkRhcmlvIEJp
bmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBh
bWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoK
CkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNv
LCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5j
b20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
