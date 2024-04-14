Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690ADC4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 22:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A0EF400AB;
	Sun, 14 Apr 2024 22:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tI-gDMgbf94l; Sun, 14 Apr 2024 22:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A4B340189
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A4B340189;
	Sun, 14 Apr 2024 22:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3C81BF83C
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 22:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F08EE8186E
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 22:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiLJx1KG9WHU for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 22:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DC368179D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DC368179D
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DC368179D
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 22:24:41 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5d862e8b163so541315a12.1
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 15:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713133481; x=1713738281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=olH9GVzw1Ak5sFHVBGZ5ynYyASPvqkzgKGa+DjNMppY=;
 b=J5q5Vr0uG2Q1ufKyxm0gvlma9ZpgUrNV4thCNqGKU04IOYx1++p+gVeDrzwMaa8o1v
 c/vXx5hIf6yoFZMmc79k3dhFygvEHGjHte6bfnhxeVihuNsLtl9najBNjPyjd2WJ6eVt
 7VS2C58PJVYwYAx/OnZAwKSTJ0n3iaYJTiGEGpO7ZSnT0nwft3fFoQqTzernq9RXQjlT
 iT22N21eP1N81oxVKQV7oXaTXPBjhoAxUzCsRLhuuL7iO322UfAcFQ2mG4ixC86/kz8O
 pUIkGPPkPhEHZDOl/FjAmwDtdA/G5Sh3ssXip2ERk7XiPjWUM8FxPssfZyQvi6gxh7yn
 JwZA==
X-Gm-Message-State: AOJu0YyNPpka1nKIL9zGdFgrOBaRvJcZIFKVyE4T3QNSnjUNOYq6tHbP
 9jL8nADAu/IWPvXBK4l2NSFbhCU45MWBTJkxkojZkZYqXg1IS9zXRlUAX4Dx/eAKqvjpg/Mcvqe
 7kBkw1p02P2CQ0ogG1/6hHKy9+K7v1w==
X-Google-Smtp-Source: AGHT+IGlTbkXT6DGy9HJf5VMLWfGtrssrqABT5A60ySIuxpSeZ3tlLEzFY8ObS4cUeufv5/5QO3fFvL5GM0FXcFJGNk=
X-Received: by 2002:a17:90a:c16:b0:2a2:83b0:5fad with SMTP id
 22-20020a17090a0c1600b002a283b05fadmr7645484pjs.2.1713133481226; Sun, 14 Apr
 2024 15:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240413195612.11925-1-ju.o@free.fr>
In-Reply-To: <20240413195612.11925-1-ju.o@free.fr>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 14 Apr 2024 19:24:30 -0300
Message-ID: <CAOMZO5BkgZr5B9Sjsk3YJCVazZeLE0wJbzaVkd1=71LxjNYG4Q@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713133481; x=1713738281; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=olH9GVzw1Ak5sFHVBGZ5ynYyASPvqkzgKGa+DjNMppY=;
 b=K8kYLY3yG+VTtyY1wBOWIrknOOE9YALGZgd2LIHkiyKq5ScQ+1+KslSErV7ZUTHRxF
 ICtZ/4Wax3tV6HeftSJlOlmo9Da7STL/Jy+YFd+JU9TjraB8Z0bye8BMqNqarO2NDLrS
 TKEDo4TwnBpJAIaeeig8HAei4xMGXlmQzjJPhLK8J6o+D4CN1SW4qifLs6wxuT9TX15v
 RM0iNZp44e2Ovj/c7OFJ+zLGWCYokRukYAWxePG633V7e9EnjbMHP5RqcmCA4GHm82JM
 Buc7n5H3FbSNjQlWyoUEKhk0jw/DYDjaxR47ITW/3kmweKVvd5xiJagCPAhj5dcqfQep
 AYKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=K8kYLY3y
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/warpboard: remove defconfig
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

SGkgSnVsaWVuLAoKT24gU2F0LCBBcHIgMTMsIDIwMjQgYXQgNDo1NuKAr1BNIEp1bGllbiBPbGl2
YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+Cj4gQXMgc3VnZ2VzdGVkIGJ5IEZhYmlvIGluIFsx
XSwgdGhpcyBjb21taXQgcmVtb3ZlcyB0aGUgZGVmY29uZmlnIGFuZCBhbGwKPiBvdGhlciBhc3Nv
Y2lhdGVkIGZpbGVzLgo+Cj4gVGhlIFUtQm9vdCBzdXBwb3J0IGZvciB0aGUgV2FycGJvYXJkIGhh
cyBiZWVuIHJlbW92ZWQgdXBzdHJlYW0gaW4KPiBjb21taXQgWzJdLCBmaXJzdCBpbmNsdWRlZCBp
biB2ZXJzaW9uIDIwMjIuMTAuCj4KPiBGb3IgcmVmZXJlbmNlLCBhdCB0aGUgdGltZSBvZiB0aGlz
IGNvbW1pdCwgdGhlIGxhdGVzdCBLZXJuZWwgaXMgNi44LjYKPiBhbmQgc3RpbGwgaGFzIHN1cHBv
cnQgZm9yIHRoaXMgYm9hcmQuIFNlZSBbM10uCj4KPiBUaGUgcmVhc29uIG9mIHRoaXMgcmVtb3Zh
bCBpcyBiZWNhdXNlIHRoaXMgZGVmY29uZmlnIGZhaWwgdG8gYnVpbGQgd2l0aAo+IHJlY2VudCB0
b29sY2hhaW5zLiBTZWUgWzRdLgo+Cj4gRml4ZXM6IFs0XQo+Cj4gWzFdIGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtQXByaWwvNjg5NTk2Lmh0bWwK
PiBbMl0gaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vY29tbWl0L2M1MGZm
NGE5MzNkNTYxNzQxNTIyMWJiYjg1YjBiZmE1MjQ3YjY5N2EKPiBbM10gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC90cmVlL2Fy
Y2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvaW14NnNsLXdhcnAuZHRzP2g9djYuOC42Cj4gWzRdIGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjYwOTQ2Njc0
OQo+Cj4gU3VnZ2VzdGVkLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KClllcywgbGV0J3Mg
cmVtb3ZlIGl0IGFzIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBib2FyZCBhbnltb3JlLCB0
aGFua3MuCgpSZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
