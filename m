Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44A6E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 13:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CD48127C;
	Thu,  9 Jan 2025 13:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pv0SHCigji8Q; Thu,  9 Jan 2025 13:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9471F8127F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9471F8127F;
	Thu,  9 Jan 2025 13:59:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 247E976C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 13:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 050428127F
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 13:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dr1ux6xi-kHb for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 13:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 067F78127C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 067F78127C
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 067F78127C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 13:59:19 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e4930eca0d4so1257454276.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 05:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736431158; x=1737035958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hqf4hCVMurV9FywAOQ0tyVevyvB7MPwNi3X4OdppcJc=;
 b=wFdZzGTReVpA9rkIGarDdFs6UDoArBu/3sBWnxqb1iM8wBraPBmwMJFUZpliT0jtHL
 ICC3PzZJf+kJyxCc6znPJpv9rs9ipXUiNi6YyiEs1FPn8cFow8W7T/pK0QTMxGAiHrVB
 n2guRAoG2ADdX8WPdbi4C1cF6d5jAhv2AhV0B43ayoB86BIfIW+LpzRIU5O1LQYsdDnW
 2vBU1H42L2t2q3m8FfL4PbbUQa9hTn29oxDph8o2NXiYm7QEGEc6QjyyOTVjLUtrumuA
 gXUuVQGPewHG+0ArcJfASPuzxxtwCauG9tNODRrwr/gNC0f5ux47zC8sdwg5HsGkVlLN
 vVHw==
X-Gm-Message-State: AOJu0YyPSiFY/DYthcrraj46x8Ml+xzhdOYf1EGq06wjP8qCkuRMUx42
 i8F8FHrEUNHZBM7QzbS/SF7++m35OkVGrKhKqgick0K/1itV+iorfD8rSy7/B7wCcUg489PNECo
 boL9M3rImuAZJ9lCCzlSRYcrdjS0iFderbHH/nxM3mtiJzkLiTxA=
X-Gm-Gg: ASbGnctinKFiqQc1s3npWO3o3saSd7hW+Bh72DPkAmCwfitWn8zY2Ct5GoW5hUBKa3n
 ZdtrFEaAc9HfWGXRQ33iJVL03DfPlHdrAENOZ
X-Google-Smtp-Source: AGHT+IGytR4t6VTy62sY6NwHZLxSItxN4w7JArLCwuuCX8iSqZ3B7I1XcMi/J2ofjKIje/czo5ARs8Zw+MJcrQR42OI=
X-Received: by 2002:a05:6902:1a48:b0:e30:d4a2:222a with SMTP id
 3f1490d57ef6-e54ee185c66mr4686208276.31.1736431158171; Thu, 09 Jan 2025
 05:59:18 -0800 (PST)
MIME-Version: 1.0
References: <20250105200826.2858503-1-ju.o@free.fr>
In-Reply-To: <20250105200826.2858503-1-ju.o@free.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 9 Jan 2025 14:59:07 +0100
X-Gm-Features: AbW1kvY2G34HD8al0fRGS4alpUxIe7FF_en9LgZcw5qgeE9OyJGGCN12pr1Lyz8
Message-ID: <CABGWkvrbE2X_ooy29ichMbLa-O78y1h8tV4eFzvmb3si00cRHQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Michael Trimarchi <michael@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736431158; x=1737035958;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hqf4hCVMurV9FywAOQ0tyVevyvB7MPwNi3X4OdppcJc=;
 b=crkSZ61vtS73X2SZK1t9bxFqGVVPsTy6lnJ+xlSDL8wrJoP4/bqGXLm9RciHsjfZ8a
 BE7Zy0UX/ug46sL6koaxL0su3YhuGv+DC/rf2juvwJ5hc+z9serdww5PkkcwQx2D8fqN
 pY72jxiCLxuhEnMoaCctZ7yEQj6dkgWr6Rj/8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=crkSZ61v
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: fix kernel
 hash
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

SGkgSnVsaWVuLAoKT24gU3VuLCBKYW4gNSwgMjAyNSBhdCA5OjA44oCvUE0gSnVsaWVuIE9saXZh
aW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4KPiBDb21taXQgNzUzMjBmNTY3ZCAiY29uZmlncy9p
bXg2dWx6X2JzaF9zbW1fbTI6IGJ1bXAgVS1Cb290IHRvIDIwMjQuMTAKPiBhbmQgTGludXggdG8g
Ni4xLjEyMCIgdXBkYXRlZCB0aGUga2VybmVsIGZyb20gNi4xLjY4IHRvIDYuMS4xMjAgYnV0Cj4g
Zm9yZ290IHRvIHVwZGF0ZSBpdHMgcGVyLWNvbmZpZyBrZXJuZWwgaGFzaCBmaWxlLgo+Cj4gVGhl
IGRlZmNvbmZpZyBmYWlscyB3aXRoIHRoZSBlcnJvcjoKPgo+ICAgICBFUlJPUjogTm8gaGFzaCBm
b3VuZCBmb3IgbGludXgtNi4xLjEyMC50YXIueHoKPgo+IFRoaXMgZmFpbHVyZSBoYXBwZW4gc2lu
Y2UgY29tbWl0IDA3MTQ5ZTVmMzAgIntsaW51eCwgbGludXgtaGVhZGVyc306Cj4gYnVtcCA1Lns0
LCAxMCwgMTV9LnggLyA2LnsxLCA2LCAxMn0ueCBzZXJpZXMiIHdoaWNoIHVwZGF0ZWQgdGhlCj4g
QnVpbGRyb290IDYuMSBrZXJuZWwgc2VyaWVzIGZyb20gNi4xLjEyMCB0byA2LjEuMTIyLgo+Cj4g
VGhpcyBjb21taXQgZml4ZXMgdGhlIGlzc3VlIGJ5IHVwZGF0aW5nIHRoZSBoYXNoLgo+Cj4gV2hp
bGUgYXQgaXQsIGl0IGFsc28gY2hhbmdlcyB0aGUgIkxvY2FsbHkgY29tcHV0ZWQiIGNvbW1lbnQK
PiBieSB0aGUgdXBzdHJlYW0gbGluayB0byBoYXNoZXMuCj4KPiBGaXhlczoKPiBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzg3NTE5ODMyNDMKPgo+IENj
OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4g
Q2M6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0tCj4gIGJvYXJk
L2JzaC9pbXg2dWx6LWJzaC1zbW0tbTIvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoIHwgNCArKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYm9hcmQvYnNoL2lteDZ1bHotYnNoLXNtbS1tMi9wYXRjaGVzL2xpbnV4L2xp
bnV4Lmhhc2ggYi9ib2FyZC9ic2gvaW14NnVsei1ic2gtc21tLW0yL3BhdGNoZXMvbGludXgvbGlu
dXguaGFzaAo+IGluZGV4IDI1ZTQ0NjRhZGIuLjZkNjllYWJiZDYgMTAwNjQ0Cj4gLS0tIGEvYm9h
cmQvYnNoL2lteDZ1bHotYnNoLXNtbS1tMi9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKPiArKysg
Yi9ib2FyZC9ic2gvaW14NnVsei1ic2gtc21tLW0yL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+
IEBAIC0xLDIgKzEsMiBAQAo+IC0jIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIDM2NWZm
MjZhMzBlMjA2ZGU5YjE4NDg5ZjQ1ZDM4NTgyYTBhNjFiN2M1OTE5ZjhhYjg5Mjk1YTQ3MzE2Nzg0
ZTEgIGxpbnV4LTYuMS42OC50YXIueHoKPiArIyBGcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
cHViL2xpbnV4L2tlcm5lbC92Ni54L3NoYTI1NnN1bXMuYXNjCj4gK3NoYTI1NiAgNjFjOTk3Yjhh
Y2JiYjhhYjE4NDU2NWU5NmY0NzZlY2JiN2U3NzNjYjM1Yjk4YTFhNGM4MzJkODA5YjJiZjcxOSAg
bGludXgtNi4xLjEyMC50YXIueHoKPiAtLQo+IDIuNDcuMQo+CgpSZXZpZXdlZC1ieTogRGFyaW8g
QmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgoKVGhhbmtzIGFu
ZCByZWdhcmRzLApEYXJpbwotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGlu
dXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlh
IExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0
MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
