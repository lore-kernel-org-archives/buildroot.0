Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB333C001DB
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 14:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A726861087;
	Mon, 14 Aug 2023 14:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A726861087
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGnH96uhCmrD; Mon, 14 Aug 2023 14:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCB8A6107D;
	Mon, 14 Aug 2023 14:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCB8A6107D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A292D1BF385
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8877D6107D
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8877D6107D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33QvFzvO0iNk for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 14:39:39 +0000 (UTC)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FEFB61076
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 14:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FEFB61076
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-589ea153928so14297927b3.2
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 07:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692023978; x=1692628778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wvbKV2huN/zR+JF32fSAJnLflqP36KIKed0C30cVbpE=;
 b=ikrzwIgiUm9Nljp2FLmOgICypPnpQfT0J6pZScjNs0VV13KvPp7lRFiUHXSBi/vTiF
 kyC16uL+Mkeh0qLzsTWYHXg0+marZiSFJdxAxbC3jTaNyXlH7JMzK3vzXlyOtrQ2uTG4
 DOrQ0T1Sy5oEwhvX03BTiiGJN2tdUIQfpoQG7gXIN1NASrXmDtY9zJivzvffESiXvN76
 9zJkHEhb/75rup0qJO6KYze4vCVlw8NhjCBUv6PxC1KcuRzBwDy3gVaN0fIkgdrdRyN1
 E9/5lFacTDqc2vbXQKozX9qnMXjepOBuuBFOopKwskHDJLmsR0NP17j8f1ZrEwQD0njJ
 zN4Q==
X-Gm-Message-State: AOJu0YyQQEFOOQmzgqMyWTrrXdnGLNOwTwNbZWS8AfVKxi2WsfaCqmmf
 fpDnXTEifkCWeoLLmc/NVVKRDBzFFyg8aVmRIjUYvA==
X-Google-Smtp-Source: AGHT+IFT0TnOuDhDhJ9YiIZvV8iLtG1s879omh4SRvhqboULQC2i6K6G9ZJ5kRejF2JJPkHHO53CEG2CM1FETCW6P2w=
X-Received: by 2002:a05:690c:f15:b0:589:a4c6:6211 with SMTP id
 dc21-20020a05690c0f1500b00589a4c66211mr13630534ywb.37.1692023978329; Mon, 14
 Aug 2023 07:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230708173104.686175-1-dario.binacchi@amarulasolutions.com>
 <20230808001057.20ea85cd@windsurf>
In-Reply-To: <20230808001057.20ea85cd@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 14 Aug 2023 16:39:27 +0200
Message-ID: <CABGWkvoZVmitwvb+-x5Bq8cMVGHhr0_QPbWDDu38Nu3+fU-g6A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692023978; x=1692628778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wvbKV2huN/zR+JF32fSAJnLflqP36KIKed0C30cVbpE=;
 b=m0UYL14fiSMIVQCJVeR5Ok65phczqEGxcGoIK7u5uC3aWEPD3v89hvWVCVALPTrw+Z
 GIybBUmbEkK8XQactQUcKbBymE4sN5xDOvch5XN8ro7rcITcJR4cZI8T1HBtnwEsW9Xp
 REYGvZ9O5vnPobu8moecfYwAV3ftdienocZms=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=m0UYL14f
Subject: Re: [Buildroot] [PATCH v2 1/1]
 configs/imx8mn_bsh_smm_s2[_pro]_defconfig: explicitly set binutils version
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gVHVlLCBBdWcgOCwgMjAyMyBhdCAxMjoxMeKAr0FNIFRob21hcyBQ
ZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8s
Cj4KPiBPbiBTYXQsICA4IEp1bCAyMDIzIDE5OjMxOjA0ICswMjAwCj4gRGFyaW8gQmluYWNjaGkg
PGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPgo+ID4gVGhlIGNv
bW1pdCBmYjUwZWFiOGE1ZTZiICgicGFja2FnZS9iaW51dGlsczogc3dpdGNoIHRvIDIuMzkueCBh
cyB0aGUKPiA+IGRlZmF1bHQgdmVyc2lvbiIpIHJhaXNlZCB0aGUgZXJyb3IgcmVwb3J0ZWQgYnkg
R2l0bGFiIENJLgo+ID4KPiA+IEkgdHJpZWQgdG8gYnVtcCBhcm0tdHJ1c3RlZC1maXJtd2FyZSB0
byB0aGUgdmVyc2lvbiB0aGF0IGZpeGVzIHRoZSBpc3N1ZQo+ID4gYWdhaW5zdCBiaW51dGlscyB2
ZXJzaW9uIDIuMzksIGJ1dCB0aGUgc3Vic2VxdWVudCBib2FyZCB1cGRhdGUgd2FzCj4gPiB1bnN1
Y2Nlc3NmdWwuIFRoZXJlZm9yZSwgZm9yIG5vdywgaXQgaXMgYmV0dGVyIG5vdCB0byBjaGFuZ2Ug
dGhlIHZlcnNpb24gb2YKPiA+IGJpbnV0aWxzIHRvIGVuc3VyZSB0aGUgcHJvcGVyIGNvbXBpbGF0
aW9uIG9mIHRoZSBpbWFnZS4KPiA+Cj4gPiBGaXhlczoKPiA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDYwMzk5NjE3OQo+ID4gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy80NjAzOTk2MTgxCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+Cj4gVGhpcyBoYXMgbm9ybWFsbHkgYmVlbiBmaXhlZCBpbiBhIGJldHRlciB3
YXkgYnkgY29tbWl0Ogo+Cj4gICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9jb21taXQvN2I3NzQwNDhiZTYyOTJiYjYxZjkwNzU5YWQzYjdiNThhMzNhMTY1MAo+
Cj4gQ291bGQgeW91IGNoZWNrIGlmIGl0IGlzIHdvcmtpbmcgZmluZSBub3c/CgpZZXMuIE5vdyBJ
dCBpcyB3b3JraW5nLgoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+IFRoYW5rcyEKPgo+
IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4g
aHR0cHM6Ly9ib290bGluLmNvbQoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRk
ZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNS
TAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkg
MDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRp
b25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
