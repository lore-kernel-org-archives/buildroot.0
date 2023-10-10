Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BB6CD690C
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 08:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B46960E96;
	Tue, 10 Oct 2023 08:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B46960E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzVVkVhV0P3d; Tue, 10 Oct 2023 08:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2514B60BD4;
	Tue, 10 Oct 2023 08:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2514B60BD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 015E71BF306
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 08:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD2444086C
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 08:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD2444086C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_gpqi5zlUdV for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 08:41:25 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBB5A4085A
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 08:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB5A4085A
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99357737980so930314766b.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 01:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696927283; x=1697532083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=njNqVa3tp0p/GEZb9bw3mMHtyvV00NpZazTWOoI2NSk=;
 b=mTIkUpw9kvIhdvMaveeuw4zuS0zJ91PJJkqHQxyhSOcyVbKpHPtd37/xEe//FeaOD2
 4HROCuUVXCO/QEasi7BQ1rB4sYQzIsMHDb9b5NkfV1vvnFUWNMTTcWNBa1XdBzBCUipo
 t3UVz/U7SuYjSfesF351jblxHRdKbbTJa4YXmL8L8ngv/ghFzGtzsAfbiJmvk1fU+rGK
 Dc27jlSx+lktbmypDvkM0zFh9syUfnyvpU115kWznogHNaCB6gU53VtZmuUKSiRb3tJu
 2jQjIMXy+6FgcZgAOh/adEgeUjDehvRTUN42biXvrVR/Bqt8DC1rPa0JgnIKcE2pagbQ
 mVPw==
X-Gm-Message-State: AOJu0YyxI+3iU/184sYVJrCRawTX+Ihwyic6stOQwk+rdK3lVXjjGcC+
 j1IsRbYpbgX0bcotjaj11UAX7n/AIbp2nHf2b4nt1RXClCQ=
X-Google-Smtp-Source: AGHT+IGDyj3aC1+0jqCP0EJIArraWZCvhz+bDpV+XuHf5PbwhiIrOgLYe0Y7V+vw5uxm18mHUcKCgR1xCVPA1hUdllY=
X-Received: by 2002:a17:906:311b:b0:9b0:169b:eedf with SMTP id
 27-20020a170906311b00b009b0169beedfmr16994346ejx.7.1696927282559; Tue, 10 Oct
 2023 01:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231010070558.9791-1-ramirez.clement3@gmail.com>
 <874jiydiiq.fsf@tarshish>
In-Reply-To: <874jiydiiq.fsf@tarshish>
From: =?UTF-8?Q?Cl=C3=A9ment_Ramirez?= <ramirez.clement3@gmail.com>
Date: Tue, 10 Oct 2023 10:41:11 +0200
Message-ID: <CADRKr2ov7vayiQPreXt1Z5mhy848UJxztJ+seMmGk1t36ikRiw@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696927283; x=1697532083; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=njNqVa3tp0p/GEZb9bw3mMHtyvV00NpZazTWOoI2NSk=;
 b=AShtdixEukJevIatrFnSZ/WmnuerAuU9EgArY4b7KtAVfGz4YFAijGfdk1Yox8QyWj
 CsnFQdhsvKj/qLauBYJTnyQnHBsdRBq2p5wvNJJB0KEemWyPSDJdDSj92jnQxm0rSOma
 vZpoQw+T43mlPJRDFQ+qNOyz0CPZIMDYUVtGedJ+nnnIr29zLDs2VE/oW18yarH0f2+0
 wCW+5JrfWEcGxLM/5sQmZZ/NrK9JAX4CQjeuBO9C9JYooxn/ImSzl6IIEyk6oq7nnvJS
 C9MBSIjr4GBO9Di1JIYFE1Th7QKxw0ezVmXg8lH8ngebyhlHEoIx4PqYKciQvDtYc/pf
 E3Ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AShtdixE
Subject: Re: [Buildroot] [PATCH] package/qemu: security bump version to 8.1.1
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmFydWNoLAoKPiBQcm92aWRlZCB0aGF0IHRoZXNlIENWRXMgYXJlIGZpeGVkIHdpdGggdGhp
cyB2ZXJzaW9uIGJ1bXAsIHdoeSBkbyB3ZQo+IG5lZWQgdG8gaWdub3JlIHRoZW0/CgpXaGVuIEkg
ZG9uJ3QgaWdub3JlIHRoZSBDVkVzIGZpeGVkIHdpdGggdGhlIHZlcnNpb24gYnVtcCwgdGhlCnBr
Zy1zdGF0cyB0b29sIGtlZXBzIGRpc3BsYXlpbmcgdGhlbS4KSSB0aGluayBpdCdzIGJlY2F1c2Ug
dGhlIENQRSBkYXRhYmFzZSBoYXMgbm8gZW50cmllcyBmb3IgdGhlIHFlbXUgOC4xLjEgdmVyc2lv
bgphbmQgdGhlcmVmb3JlIGRvZXMgbm90IGtub3cgd2hpY2ggQ1ZFcyBhcmUgZml4ZWQgaW4gdGhp
cyBzcGVjaWZpYyB2ZXJzaW9uLgoKCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
