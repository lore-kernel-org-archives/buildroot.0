Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9DEC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E1F56080F;
	Mon, 12 Aug 2024 20:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RyAopsLlCgS; Mon, 12 Aug 2024 20:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC9C60810
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC9C60810;
	Mon, 12 Aug 2024 20:18:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAC3E1BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A46F3403F0
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Or-HOgXAFiH for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23C6340038
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C6340038
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23C6340038
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:18:04 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so6005570e87.1
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723493882; x=1724098682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jlx2597Z4ObpsyOP0idB5Ko7HGN5gt6x3YqAM5vMhFY=;
 b=lpgV3DBDMNyhBSAAMeGeh6i/7LVOwRsfIufL/xc9iSAGRhA60aOwQMxgsG7kH/VHyM
 xhs0fVuUza8SOuFqY1rl0uQ66AIq47328zXz1CSjC9i0+KDWKCrolvPt25Ridh1WYJ+s
 hItBEGH49Q62y4VY1RE5TSO0uyDUK2oXf/85NC18PzRsuxKfeolCSfTQb2qLWExtbX0f
 esiIWFA4CKunDv+VztgpZhQOc/NIhO8VJ255Hg3eQGkfjrq9H18eZtc9RmMspEvQlST6
 FpevKfXv/8nxtqmCUI0g2IRhDnyY03gjMur/LZY2yJMYmhwyGqTDNNx/gsaAuLSbExYb
 xx0w==
X-Gm-Message-State: AOJu0YxfNbaiPo/T0dj0GaN0YWZWvNrxyP9e9aIYgNxFhm97PD6DXtd/
 nUvrG1mGElwQ26bbBd7uLk+jxB8huQpf+TB39BpsKqK8F23GbLeTfnumlLBjJR2mgXh1ji+pdsu
 vWghB1A==
X-Google-Smtp-Source: AGHT+IG0COs+0uF2lgBtPvDgfBrXGV+LndvCuHwbN/2W+6GTGx0GbVvv+AHS7UqJ0nDHBQFlkX9VdQ==
X-Received: by 2002:a05:6512:3e0a:b0:530:bb10:2874 with SMTP id
 2adb3069b0e04-53213650ec6mr889506e87.6.1723493881396; 
 Mon, 12 Aug 2024 13:18:01 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f1b71dsm814153e87.223.2024.08.12.13.18.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 13:18:00 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52ef95ec938so4849327e87.3
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:18:00 -0700 (PDT)
X-Received: by 2002:a05:6512:10cf:b0:52c:6461:e913 with SMTP id
 2adb3069b0e04-532136586abmr935468e87.16.1723493879723; Mon, 12 Aug 2024
 13:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <20240805163133.4126564-2-james.hilliard1@gmail.com>
 <CA+h8R2pN8q8iF5JZy7BTkcVU0Qnn8-LV+OJbNa-WJ0-uGCxVKQ@mail.gmail.com>
In-Reply-To: <CA+h8R2pN8q8iF5JZy7BTkcVU0Qnn8-LV+OJbNa-WJ0-uGCxVKQ@mail.gmail.com>
Date: Mon, 12 Aug 2024 13:17:48 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rW4UEADdjQVduCRx8c3LpxkmLKL8JMPwOd_dBH2+0mfw@mail.gmail.com>
Message-ID: <CA+h8R2rW4UEADdjQVduCRx8c3LpxkmLKL8JMPwOd_dBH2+0mfw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1723493882; x=1724098682; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlx2597Z4ObpsyOP0idB5Ko7HGN5gt6x3YqAM5vMhFY=;
 b=wrRqBJAgIJlGgNnrhwDnGTmRguwfWCT2C8onQDKKLlQBRxX37oRN89vLfDysOU4dJK
 MAWsKZ9iBUc12YebRrVeHDVkVuJHTEBUpDZEL6Hrm8txDmE836QFMY9JXnz31GE062Gs
 qsDg6T/EygG1lnVwhzSWEHcrzdtxf4J/S8WGlAwaw5L/ZFfactW2S5bd+JDAGk8Ef9qo
 r4CyRnrVGzdxmG4hUFTuDKpA7a3FVV1HKNHke/E5mIWpl2Nb3wIDAgv2T1lcsh1sYMgC
 /QvuCkb1qKpfWnt+aX0SZp8u2S1j5i779P5ywW2PfnooowqELOyoKa9cml1c5oJ7tTag
 ZJug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=wrRqBJAg
Subject: Re: [Buildroot] [PATCH v4 2/2] package/tailscale: new package
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gTW9uLCBBdWcgNSwgMjAyNCBhdCA2OjE04oCvUE0gQ2hyaXN0aWFuIFN0ZXdh
cnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4gVGhlIGlzc3VlIHdpdGggR09QUk9Y
WT1kaXJlY3QgaXMgZml4ZWQgYXMgb2YgdGFpbHNjYWxlIG1haW4gYnJhbmNoIGF0Cj4gY29tbWl0
IDIyNzUwOTU0N2YwZTcxOWVmNmNlMmVjMzBkOTU2ZmRlNTE4YzAzNjcKPgo+IEkgcmVxdWVzdGVk
IHRoYXQgdGhleSBzcGluIGEgbmV3IHJlbGVhc2UgaGVyZToKPgo+IGh0dHBzOi8vZ2l0aHViLmNv
bS90YWlsc2NhbGUvdGFpbHNjYWxlL2lzc3Vlcy8xMjg1OSNpc3N1ZWNvbW1lbnQtMjI3MDE3Nzgx
MQoKPgo+IFRoZSBHT1BST1hZIHRvcGljIC0gSSBtZW50aW9uZWQgaXQgaGVyZToKPgo+IGh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA4MDUx
NjMxMzMuNDEyNjU2NC0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vIzMzNTc0MTUKPgo+IEkg
dGhpbmsgd2Ugc2hvdWxkIGFkZCBIT1NUX0dPX0dPUFJPWFkgdG8gYWxsb3cgdGhlIHVzZXIgdG8g
b3ZlcnJpZGUKPiB0aGlzLCBhbmQgZGVmaW5pdGVseSBub3Qgb3ZlcnJpZGUgaXQgcGVyLXBhY2th
Z2UuCj4KPiBCdXQgdGhpcyBtYXkgbm90IGJlIG5lY2Vzc2FyeSBub3cgdGhhdCB0YWlsc2NhbGUg
Zml4ZWQgdGhlaXIgZGVwcy4KClRhaWxzY2FsZSBzYXlzIHRoZXkgd2lsbCByZWxlYXNlIGEgbmV3
IHBvaW50IHJlbGVhc2UgdGhpcyB3ZWVrLgoKV2UgY2FuIG1lcmdlIHRoZSB0YWlsc2NhbGUgcGFj
a2FnZSBvbmNlIHRoYXQgaGFwcGVucyB3L28gY2hhbmdpbmcgYW55dGhpbmcuCgpUaGF0IHNhaWQg
SSB3aWxsIHRyeSB0byBzdWJtaXQgYSBwYXRjaCBzb29uIHRoYXQgc3dpdGNoZXMgdGhlIGRlZmF1
bHQKdG8gdXNlIHRoZSB1c3VhbCBHb29nbGUgR09QUk9YWSwgYW5kIGFkZHMgYSBDb25maWcuaW4g
b3B0aW9uIHRvCm92ZXJyaWRlIHRoaXMuCgpUaGFua3MgJiBiZXN0IHJlZ2FyZHMsCkNocmlzdGlh
biBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
