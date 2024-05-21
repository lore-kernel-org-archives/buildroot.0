Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D07C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 09:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B9E181F67;
	Tue, 21 May 2024 09:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSmzGHT3y_RS; Tue, 21 May 2024 09:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC5881E02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEC5881E02;
	Tue, 21 May 2024 09:33:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84A881C50A9
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 09:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 706E340373
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 09:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDGKIYaf4wtZ for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 09:32:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C97F840395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C97F840395
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C97F840395
 for <buildroot@buildroot.org>; Tue, 21 May 2024 09:32:57 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52449b7aa2bso2141717e87.3
 for <buildroot@buildroot.org>; Tue, 21 May 2024 02:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716283975; x=1716888775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xx6o9j3VqtpasSCVYCtphGsG6vkW9OnOF/IiuPi4RbE=;
 b=fyPt9XLQz5vG3NLmeGuGwvKSNfo5UIcefEK4/xMxA0Hk0XE8OkxbppMwYEHqmc/88e
 6fO4J1/NFoFyQfAadJdqiYQOhCAPD14nnRMoG/COlQrn7/b3W4dlh56hiXycfYBsS5yM
 jyy1jgQa3QudW/8P7sbdIBV9AxOD7NfOckcSw0Bv12vFbTQLfhiiEzGi2WZO9zlT/PnF
 rISV//fWBVQstasCGQgkbAb3CiMcFfcuNIZlwk2fDdmPPsZZIk6itjWpKyZ3gJ8gPpx/
 NkTPWksdX7VZniytzHJXBvnqBPjK3doDmamL0RqFQAdg1yg3siPRdutJe+82F0qycVQN
 Yt+g==
X-Gm-Message-State: AOJu0Yy+LXSvgOlAQ70ixz2evG+qN44LzEba5CuVvAi3rc32rh3qXFAl
 ziIVyQT7muDlE606E+cFF1/v8wYC1lx3ePG91k5gbHZumzQAFJ/+kwVNIjUOOjVPvd7FuGKaafk
 QN0rC5PsYk4FRFVhgAmN0dya5o9NpWQ==
X-Google-Smtp-Source: AGHT+IH2KsXz+2elYxpxDbCBLKPDzHoCwmX+/JM3kbqUVWXeE+ayk5MvoRu9K85Fvuoeg5ekMInF7SzRkWFWlhOefRY=
X-Received: by 2002:ac2:4a6c:0:b0:51d:4c0a:a512 with SMTP id
 2adb3069b0e04-52210273e3cmr18506012e87.68.1716283975406; Tue, 21 May 2024
 02:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240517120057.3736694-1-yegorslists@googlemail.com>
 <ZkehJQxCJHZRJ1lr@landeda>
 <CAGm1_kuhYZ1uCnWquBBnhS89T7antGULc811jzaMAhtiHKFJJg@mail.gmail.com>
 <Zkh_4z6uQm4QNOds@landeda>
In-Reply-To: <Zkh_4z6uQm4QNOds@landeda>
Date: Tue, 21 May 2024 11:35:21 +0200
Message-ID: <CAGm1_ks6pexetTMRV80zXMz4x_ppHNFRB30Gj3o3uy3c7qUdMQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1716283975; x=1716888775; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xx6o9j3VqtpasSCVYCtphGsG6vkW9OnOF/IiuPi4RbE=;
 b=JcYIoiwz09MFzMdhGby2HQbUAosYmzMXelJnSN94NB9kgnMT0Qt5sDpQOlfJFkqhQq
 6Mhb6xQs/ctkq71YptZFvjEQnrG+0/UFXMvfuOuenE+A98VqQIZoo9PZltKcYVBunHcj
 jyk9qqgzRI3IgCkU9JpPBXraVhf+ADkYuAc94Yyd7FIbL0Xh+n+Wdf24tUR4QbGr2Yc2
 hTKGBmF1ZxG8lERXQXoIqZc3o+PewACf5Y4oXAR3PlXK5c/XvqZhNkW0uj42R1ihWNHy
 zU4Szy9/Y0SU5TbbjU+ytbSBgXD3/7queZ9G12LZLt8yOOXaLiLhM93dvJ/SKDR2+OZJ
 nsKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JcYIoiwz
Subject: Re: [Buildroot] [PATCH] package/ntp: fix build with GCC 14.x
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsLAoKT24gU2F0LCBNYXkgMTgsIDIwMjQgYXQgMTI6MTbigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBZZWdvciwgQWxsLAo+Cj4g
T24gMjAyNC0wNS0xOCAxMjowMCArMDIwMCwgWWVnb3IgWWVmcmVtb3Ygc3Bha2UgdGh1c2x5Ogo+
ID4gTm93LCBpdCBpcyBvZmZpY2lhbDogaHR0cHM6Ly9idWdzLm50cC5vcmcvc2hvd19idWcuY2dp
P2lkPTM5MjYKPgo+IFRoYXQncyBncmVhdCwgdGhhbmtzISBBbmQgdXBzdHJlYW0gbG9va3MgcXVp
dGUgaGFwcHkgd2l0aCBpdC4gOi0pCj4KPiA+IEknbGwgd2FpdCB0aWxsIHRoZSBwYXRjaCBpcyBj
b21taXR0ZWQgYW5kIHRoZW4gd2lsbCBtYWtlIHYyLgo+Cj4gWW91IGRvbid0IG5lZWQgdG8gd2Fp
dCBmb3IgdGhlIHBhdGNoIHRvIGJlIGFwcGxpZWQgdXBzdHJlYW07IGp1c3QgYWRkIGFuCj4gdXBz
dHJlYW0gdGFnIHRvIHRoZSBwYXRjaCwgcG9pbnRpbmcgdG8gdGhhdCBidWcgcmVwb3J0Ogo+Cj4g
ICAgIFVwc3RyZWFtOiBodHRwczovL2J1Z3MubnRwLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MzkyNgo+
ICAgICBTaWduZWQtb2ZmLWJ5OiBZb3UKPgo+IFRoYXQgd2F5LCB0aGUgbmV4dCBwZXJzb24gdG8g
YnVtcCBudHAgY2FuIGFzc2VzcyB3aGV0aGVyIHRoYXQgcGF0Y2gKPiBuZWVkcyB0byBiZSBjYXJy
aWVkL3JlYmFzZWQvZHJvcHBlZCwgYnkgY2hlY2tpbmcgdGhlIHVwc3RyZWFtIHN0YXR1cy4KCldl
IGFyZSBhbG1vc3QgdGhlcmUuIFRoZSBmaXggbGFuZGVkIGF0IHRoZSBtYWludGFpbmVyJ3MgcGVy
c29uYWwgcmVwby4KCkFub3RoZXIgc2hvdyBzdG9wcGVyIHdpdGggR0NDIDE0LnggaXMgbHJ6c3ou
IFRoZXJlIGFyZSBhIGxvdCBvZiBpc3N1ZXMKZGVzY3JpYmVkIGluIHRoaXMgb25lIFsxXSBhbmQg
d2l0aG91dCBhbnkgZmVlZGJhY2sgOi0oCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL1V3ZU9oc2Uv
bHJ6c3ovaXNzdWVzLzMKCgpZZWdvcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
