Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E25AE77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 13:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4EB140913;
	Sat,  4 Jan 2025 13:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTwZczFzQd8r; Sat,  4 Jan 2025 13:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D735410A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D735410A7;
	Sat,  4 Jan 2025 13:38:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55EE2F27
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 13:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3368B40A1B
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 13:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teknxk_oisUq for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 13:38:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD99440B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD99440B29
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD99440B29
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 13:38:37 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso175033741fa.0
 for <buildroot@buildroot.org>; Sat, 04 Jan 2025 05:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735997915; x=1736602715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRKczkGKF4lq3VAFG2dj+w09GUqLnnhnyrAVTP28iiw=;
 b=XJeqVKIM47IpGAuxPbRg0vGNmPDlI8p/dO1ZSrME/bFtYsxkJpRqWwOfNna0haEqD3
 7uD/1zF+gzmDgE0HXJNrBp4sRGH514P+UcBUbhCQhPDlILlaq8vgMRqWoaoypKV5BcB2
 wQ04BkqbNj/S0XTI5vuiyHzr/LCF3ftg5wSbOKonuiomcQYMbCp1vlssNBFQ+LwKySDp
 ojjoej0ywwsZ7pGK8aSaWXWDrOmP5mt9SaaLc3ZuSImUi0lk63JrBO9f1H88H+j5QyoK
 hM1BKfLWTFMnwDMgaY8JnnF49BZq5Ici5HMztQNkvKnX2DvT31/wvqRt/HG9lmnTRn8N
 ED0w==
X-Gm-Message-State: AOJu0YyS4lRuRFoUNnjU7ia3PzxpR5x/6QiE2QMpLMD2e2yOxJ2ZcYOU
 VcqsByxfi36BRQljz9TVgQSKXJNjcDHzxCuHjT7TFIjo0Qny8uq6GhKEE6WbX8bcZFScyyJ2zm3
 yQCzyiLH+7/L24pibBmaiEiVA0P97gu9x
X-Gm-Gg: ASbGncsYImLntswVdH7FQzOvb9fqeUlGFgSSTBwiONXA/r+/HWAXwrp4LeQWvOJZq84
 OZj2PYEq+OjUZY5Q3Lo8wwCeENhsQxx7KdjkTwz5CgFlVMXV/43zRlGYtdY/Mivu2zGM/EKCN
X-Google-Smtp-Source: AGHT+IF8BF13L4jhnsmLpmO77fnHTXTKaCG6gHG1YULUbtS1q2Kn4xSZ4Owx37U0V0RgCdv4C290CNT4TZJw7ot7/Yw=
X-Received: by 2002:a2e:a71f:0:b0:300:3a15:8f19 with SMTP id
 38308e7fff4ca-3046860bb6bmr150380541fa.32.1735997915064; Sat, 04 Jan 2025
 05:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20241230113710.679717-1-heiko.thiery@gmail.com>
 <20241230113710.679717-2-heiko.thiery@gmail.com>
 <20241230222054.4eb7aa0c@windsurf>
In-Reply-To: <20241230222054.4eb7aa0c@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 4 Jan 2025 14:38:23 +0100
X-Gm-Features: AbW1kvZxayuC6Wzg-ge4D1FjxI6G6i9te7HRzWdt4hhfJYHzA28ccDr-SMO-2vw
Message-ID: <CAEyMn7bdYiWmL1oOTSe-=-QRN614obLg300f7jzhZ_VuDCGVBA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org,
 =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>, 
 Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735997915; x=1736602715; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aRKczkGKF4lq3VAFG2dj+w09GUqLnnhnyrAVTP28iiw=;
 b=fBdb6iKnEiRw/8QH1HxD+g2v+3QkKeEK4tPA3n6+axFgFkY4xuldzGm2wN+W8PfjBk
 7KoW+tqGR21DY01C1msDtsfOUeNOxl1L9NXT68pa+45epqwyg3lOSG40BH+SAk5rnLtS
 y2SW6eIXbTyZhjKKUfNGfOgLAXVroaoDGe2QUQ1Rt8P4nPDAoi1d/EFa3cCC4/Qu+Q20
 5erKHj4oR1HQl/4RcsMOFhe9bz5YeHXpWOACHc1pszJvySb4GXBVL/BU5tJ5pFmRTOMQ
 NguRHzrLF5p/p8DrzZghe7SryJwvrFJ0E4GD7D2mWst/IveFVXAAicPL+a/b0IYs403j
 Nhqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fBdb6iKn
Subject: Re: [Buildroot] [PATCH v3 1/6] package/libyang: bump to version
 3.4.2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKQW0gTW8uLCAzMC4gRGV6LiAyMDI0IHVtIDIyOjIwIFVociBzY2hyaWViIFRo
b21hcyBQZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ogo+Cj4gSGVsbG8g
SGVpa28sCj4KPiBPbiBNb24sIDMwIERlYyAyMDI0IDEyOjM3OjA3ICswMTAwCj4gSGVpa28gVGhp
ZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gVGhlIExJQ0VOU0UgaGFz
aCBoYXMgdG8gYmUgdXBkYXRlZCBkdWUgdG8gY29weXJpZ2h0IHllYXIgY2hhbmdlLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFRoaWVyeSA8aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4KPgo+
IEkgd2FudGVkIHRvIGFwcGx5LCBidXQgSSdtIGFmcmFpZCB0aGVyZSdzIHN0aWxsIHNvbWUgbW9y
ZSB3b3JrLCBhcyB0aGlzCj4gZG9lc24ndCBidWlsZDoKPgo+IC0tIENvdWxkIE5PVCBmaW5kIERv
eHlnZW4gKG1pc3Npbmc6IERPWFlHRU5fRVhFQ1VUQUJMRSkKPiAtLSBDb25maWd1cmluZyBpbmNv
bXBsZXRlLCBlcnJvcnMgb2NjdXJyZWQhCj4gU2VlIGFsc28gIi9ob21lL3Rob21hcy9wcm9qZXRz
L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvbGlieWFuZy0zLjQuMi9idWlsZHJvb3QtYnVpbGQvQ01h
a2VGaWxlcy9DTWFrZU91dHB1dC5sb2ciLgo+IFNlZSBhbHNvICIvaG9tZS90aG9tYXMvcHJvamV0
cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2xpYnlhbmctMy40LjIvYnVpbGRyb290LWJ1aWxkL0NN
YWtlRmlsZXMvQ01ha2VFcnJvci5sb2ciLgo+IG1ha2U6ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJp
Yy5tazoyNzk6IC9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvbGli
eWFuZy0zLjQuMi8uc3RhbXBfY29uZmlndXJlZF0gRXJyb3IgMQo+CgpUaGVyZSBzZWVtcyB0byBi
ZSBhbiBpc3N1ZSB3aXRoIHN0cm5zdHIgcnVubmluZyBidWlsZCBpbiBkb2NrZXIgd2hpbGUKaXQg
d29ya3Mgd2hlbiBydW5uaW5nIGJ1aWxkIGRpcmVjdCBvbiBteSBob3N0OgoKZXJyb3I6IOKAmHN0
cm5zdHLigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91
IG1lYW4g4oCYc3Ryc3Ry4oCZPwogICAgOCB8ICAgcmV0dXJuICgoaW50KikoJnN0cm5zdHIpKVth
cmdjXTsKICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+CiAgICAgIHwgICAgICAgICAg
ICAgICAgICAgc3Ryc3RyCgpUaGVyZSBpcyBhIGNtYWtlIG1vZHVsZSB0aGF0IGNoZWNrcyBmb3Ig
dGhhdCBmdW5jdGlvbi4KCkkgd2lsbCB0cnkgdG8gZmlndXJlIGl0IG91dC4KCgo+IFlvdSBjYW4g
cmVwcm9kdWNlIHlvdXJzZWxmIGJ5IGJ1aWxkaW5nIGluc2lkZSB0aGUgbWluaW1hbCBEb2NrZXIK
PiBjb250YWluZXI6Cj4KPiAkIC4vdXRpbHMvZG9ja2VyLXJ1biBtYWtlCj4KPiBUaG9tYXMKPiAt
LQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
