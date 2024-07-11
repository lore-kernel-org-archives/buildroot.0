Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012D8C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 00:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 983FA83AFE;
	Thu, 11 Jul 2024 00:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gA09nS02NKIF; Thu, 11 Jul 2024 00:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECD183B29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ECD183B29;
	Thu, 11 Jul 2024 00:43:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 214E61BF36F
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 00:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C1B061070
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 00:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxGJtCUej12f for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 00:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1CCB061063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CCB061063
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CCB061063
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 00:43:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52e9a920e73so359178e87.2
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 17:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720658590; x=1721263390;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U1cVZLrLEUDk5+QgRhZg2BxubYqFB4SrWyitFVXDqRU=;
 b=LCTi6PyAOiV2bU1iKO/q9kdaFrprd8L/flFGjaEJAVDExDcszlfysfWsQNQXYleCxh
 nR7r9wZE93Id6tz/yyHXyMZ8BHPl97VKMSJdu2mH+C6yZWIUS4x0FbSbAOqkKknlA4gN
 LwC17ui5IG3jRvVBT4Z39uZdFiQ9yOUlddhuqxyNwVV5xxFCT05V3z4/HD31oyhSe3Nm
 pzvgvh4wPIOS0wHASjoH2uWruEJthSjv14t6mKpY+wNkPTqqhE0O9S4qF5jzNzyJmDoS
 SgvsBpZ+YjOCdI1Yc34WZiUTla7i5nQvHRtYdbdQRzjc/a+8Mmcdz0GE0EZs2r/kQ0sR
 1t9w==
X-Gm-Message-State: AOJu0YwpjqJAPIRo/VOtCqUmmkKcWkN5M4Q2qpLXHQE33sRj6i4BmC0C
 Cf5kEOr0d702Gfne4kJo2FqaRNM96eDRiu6fW2Gd9mqxNlu00wRf
X-Google-Smtp-Source: AGHT+IEEXOmuPsXX0qEWzZVsD2X4SjxzdaIW6nx4Y+x3FA9pX1u13WNh2oLL1rWWUxt9gUeY4Od7Qg==
X-Received: by 2002:a05:6512:3c99:b0:52c:ddb8:6cfd with SMTP id
 2adb3069b0e04-52eb99a0965mr4758636e87.40.1720658589252; 
 Wed, 10 Jul 2024 17:43:09 -0700 (PDT)
Received: from gimli.local ([2001:9b0:214:3500::522])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eb9061a66sm800844e87.155.2024.07.10.17.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 17:43:08 -0700 (PDT)
Message-ID: <28e88acaa040437b937f875616ab0489366e356a.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Heiko Thiery
 <heiko.thiery@gmail.com>
Date: Thu, 11 Jul 2024 02:43:08 +0200
In-Reply-To: <20240710165106.5066873b@windsurf>
References: <20240709202438.27298-1-heiko.thiery@gmail.com>
 <20240710165106.5066873b@windsurf>
Organization: Addiva Elektronik
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720658590; x=1721263390; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U1cVZLrLEUDk5+QgRhZg2BxubYqFB4SrWyitFVXDqRU=;
 b=PEfWztZe5uZuRLPH/gqhUPZ0pqwSQR5IKRiRJawktgLg7t+7GrpLgpWfjipCdkHYW0
 ea1rzVXeeKVMWGnzenEvzNBNwO5JAdqAOIrjkb9ajpf9ijYv99emfZG0X1AIlRdW6/lR
 glFtcbh0VgqJOOLpy36ghA311eNF3FVCwyEcwW7qKGhp8KG/V77ojkwjqtVjkRorAYTu
 C9usHEmZPbqnlFwjWVzkKlJAygQ/7tSC3WgXZCEofSfUGcpFmGBN2aXFRc1HOwBn43ut
 TjTTCG6B15F2zI9pRB04CuBx5YvgeFn1FxRArhMQamWmFYMDVuK7XIjSjcC22E+1E+8B
 UM2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PEfWztZe
Subject: Re: [Buildroot] [PATCH] package/libssh: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

T24gV2VkLCAyMDI0LTA3LTEwIGF0IDE2OjUxICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHZpYSBi
dWlsZHJvb3QKd3JvdGU6Cj4gT24gVHVlLMKgIDkgSnVsIDIwMjQgMjI6MjQ6MzkgKzAyMDAKPiBI
ZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gVGhpcyBmaXhl
cyBsaW5rIHRpbWUgZXJyb3JzLCB1bmRlZmluZWQgcmVmZXJlbmNlcyB0byB2YXJpb3VzCj4gPiBF
TkdJTkVfKiBmdW5jdGlvbnMgaW4gY2FzZSBsaWJvcGVuc3NsIGJhY2tlbmQgaXMgdXNlZC4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29t
Pgo+IAo+IElzIHRoaXMgZml4aW5nCj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jl
c3VsdHMvNWJiLzViYjg0NWJlN2Y4NjFkYzM1NDBhOGRjNjE4Y2NkMWEwYTc1OWYyZDUvYnVpbGQt
ZW5kLmxvZwo+IGFuZCBzaW1pbGFyIGJ1aWxkIGlzc3VlcyA/Cj4gCgpJbmRlZWQgaXQgaXMuICAg
U2FtZSBpc3N1ZSBhbHNvIG9uIDIwMjQuMDIueCAocGluZyBQZXRlcikKCkl0IHNlZW1zIHRvIGhh
dmUgYWNjaWRlbnRhbGx5IHdvcmtlZCBhZnRlciB0aGUgdXBncmFkZSBmcm9tIE9wZW5TU0wgMS54
CnRvIDMueCwgYnV0IGJyb2tlIGVpdGhlciBpbiA4ZmVkNDgwIG9yIDE4OTk1ODkgKGFsc28gb24g
MjAyNC4wMi54KQoKVGVzdGVkLWJ5OiBKb2FjaGltIFdpYmVyZyA8dHJvZ2xvYml0QGdtYWlsLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
