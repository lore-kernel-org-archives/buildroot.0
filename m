Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FFDC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E79D760613;
	Fri, 12 Apr 2024 19:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDdE70iuzKI4; Fri, 12 Apr 2024 19:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A0060626
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03A0060626;
	Fri, 12 Apr 2024 19:34:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 648AB1BF4E2
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 19:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5181360626
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 19:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeBgCvKe-Mbp for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 19:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D806560613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D806560613
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D806560613
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 19:34:17 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2a2d37b8c4fso175433a91.1
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 12:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712950457; x=1713555257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=30cuEpzfzcFJ7l33L7OWMFFiUKuCfPj2okhCKd1/ob4=;
 b=nYo2FMQhrC6bjnpeRvMWsC+/IaIV3PtStmmmD26BlJfUOE0g7SWURmEVzTsjP1bq4I
 S/jSYhKOA0FF8ofenKBVRZnMGJu1cnuvgrdZwN7LONyfwwH/MK4cSKUBHyoKbNWyw4tu
 rF5LOS7oI4GCzqKf8VFbTHfGnfbHRP4yv5aTpeNLl4eD6yGfzl/i5J12mlOcitGrFovj
 h/8nZkSSW6LrALD5+D2dmPdq3J/RyIb43idSix8F1QsuXQQ2xRFobdKfodPRFtVsuE5+
 zZkuzZFCm4lUdH6pMAABQsL4yVXsVpyn0SNvF4Li4mivZyKjZfFl6SbVh8t1kyEM13Si
 CkQA==
X-Gm-Message-State: AOJu0YzHhTJNzWIq2sZq7Wh4klVQsT/btwXsCGPUWf5ZCABCnqagCI6e
 sS0/6c3sXQhfBG27m2LFefiGEeZ4X7n7Yl/wS5elouuR0W3b/PAKOofLMB1SqvC+VqDEdGxk/4O
 JfJPT6TJolfpSfRyadHMXJFeQIbRAoQ==
X-Google-Smtp-Source: AGHT+IECituhsztTJ3GyVC+yB7d+p5UWovFm4ZjbJKHIfYKzMeKsbvj9/kz1X6W3NSTNxYJ0fuNuOioDhCa4MSkxvCg=
X-Received: by 2002:a17:90b:180d:b0:2a7:17c5:8035 with SMTP id
 lw13-20020a17090b180d00b002a717c58035mr2032136pjb.1.1712950457091; Fri, 12
 Apr 2024 12:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240412192923.1073882-1-ju.o@free.fr>
In-Reply-To: <20240412192923.1073882-1-ju.o@free.fr>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Apr 2024 16:34:05 -0300
Message-ID: <CAOMZO5DaRdf-hspPsNdK26u5uobeZ6BGT34_OkYHtJXurgJ3sQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712950457; x=1713555257; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=30cuEpzfzcFJ7l33L7OWMFFiUKuCfPj2okhCKd1/ob4=;
 b=CCBycxlYRCn+66z7eC8hEGKzlXL8XZWnzTzwYQ5svpgaVFOpMR8NPtcDbVVi9HTZ/g
 1AyGmUuU8Wvs6fOefri63N5h0dFKdqRoV16HkKgWhj/qDZz+aFVp2Mv/2j8UyqtBVVjm
 0viY082XwsBv6X5lb3K100g8x4BU0t3+dQO0xYsCFTpb33j26eOlzFQb11Xc89pWqb/2
 gikeqxWS51t2fmI71BtBtk9Xdrmua+rklgyIfm9f+Ggfy9SNlir6dlAzNRsXEKSFT/52
 VARTIrFTWi0p0YcKuRo8PruVpwXjd+xAcuhTqxyyXlZZQJD31WznJsFiwYItiHqJZ6Sx
 6SQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CCBycxlY
Subject: Re: [Buildroot] [PATCH 1/1] configs/warpboard: bump U-Boot and
 kernel versions
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgNDoyOeKAr1BNIEp1bGllbiBPbGl2
YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+Cj4gQnVtcCBVLUJvb3QgdG8gMjAyMi4wNyBhbmQg
a2VybmVsIHRvIDYuNi4yNiB2ZXJzaW9ucy4KPgo+IFUtQm9vdCBpcyBidW1wZWQgdG8gMjAyMi4w
NyByYXRoZXIgdGhhbiB0aGUgbGF0ZXN0IHZlcnNpb24gKHdoaWNoIGlzCj4gMjAyNC4wNCBhdCB0
aGUgdGltZSBvZiB0aGlzIGNvbW1pdCksIGJlY2F1c2UgaXQgaXMgdGhlIGxhc3QgdmVyc2lvbgo+
IHN1cHBvcnRpbmcgdGhlIHdhcnBib2FyZC4gVGhlIHN1cHBvcnQgaGFzIGJlZW4gcmVtb3ZlZCB1
cHN0cmVhbSBpbgo+IGNvbW1pdCBbMV0sIGluY2x1ZGVkIGluIHZlcnNpb24gMjAyMi4xMC4KCkkg
bm8gbG9uZ2VyIGhhdmUgYWNjZXNzIHRvIHRoaXMgYm9hcmQuCgpBcyB0aGUgc3VwcG9ydCBpbiB0
aGUgVS1Cb290IG1haW5saW5lIHdhcyByZW1vdmVkLCBJIHN1Z2dlc3Qgd2UgcmVtb3ZlCml0cyBz
dXBwb3J0IGluIEJ1aWxkcm9vdCB0b28uCgpUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
