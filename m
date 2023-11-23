Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDDFC5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 15:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8156361342;
	Thu, 23 Nov 2023 15:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8156361342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMvB8eza3Nrd; Thu, 23 Nov 2023 15:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C90C660C15;
	Thu, 23 Nov 2023 15:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C90C660C15
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A80721BF410
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 15:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C3F403FB
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 15:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78C3F403FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-i7kjPhslb7 for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 15:38:47 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 732DB403AF
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 15:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 732DB403AF
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so6966055e9.0
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 07:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700753925; x=1701358725;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cW4qOqRZ2nN9QXIquFl4alLA1a3lH03FJ6Hd+1tBJpI=;
 b=SxADZnu5XJME9V0V15u4U3Pw8Tdmd/k3C0uAI154ah3mUOIJ2MLiWr27zwRILDeyR5
 3+3thzheA3WIURG5GZWIaoTFbotRQaGS5H/NgnGtrNC6gMJVmlB+I4xHbAr8rrIDkScD
 Ko/q8CFtne4TTC0EH3manjUrhjcrivF81F/K1o2SwUd9/tLEQ0PnE1cN5t9F9swSuIAb
 uSmVweFRkLPc4Bg+ulrMMzeJE+wRM277WQSqKS0U304G3tfFhMaR3+xikZ+AybWG8eMO
 W0KGIPL+s0uT0J26Etr11F5ju1CEXhLxKr3ZitAqOlSoLldXellwDEGyAjfZT/NW4oSa
 vRww==
X-Gm-Message-State: AOJu0Ywgg+6LgO1q1FW3yx3iPfCrPLwLBU4j52MzE7CI+p5xZcMk/U5u
 lChtKSflZdbqaK/tI15oDBBXzQ==
X-Google-Smtp-Source: AGHT+IH3/Pxhwl/fM3ic/08c1kXv8yiNgORWx6YOTvoOaURflzfroVdfXDRWTJ2/pKkSGCQ2Y/rE/A==
X-Received: by 2002:a05:600c:1d27:b0:40b:3440:c802 with SMTP id
 l39-20020a05600c1d2700b0040b3440c802mr2574498wms.35.1700753925485; 
 Thu, 23 Nov 2023 07:38:45 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 fs27-20020a05600c3f9b00b0040b36787913sm2349683wmb.13.2023.11.23.07.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 07:38:45 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 23 Nov 2023 16:38:44 +0100
Message-Id: <CX6AY6UA72ZB.3SRZZAYMXMZPP@rtone.fr>
To: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
X-Mailer: aerc 0.15.2
References: <20231121193448.1151936-1-gael.portay@rtone.fr>
 <20231123111233.24b5dbf2@windsurf> <CX6AO4BXYX52.FL7MGXII8KB8@rtone.fr>
In-Reply-To: <CX6AO4BXYX52.FL7MGXII8KB8@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700753925; x=1701358725; darn=buildroot.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cW4qOqRZ2nN9QXIquFl4alLA1a3lH03FJ6Hd+1tBJpI=;
 b=Muel4X/jB+T2lVbNj6D1koKnQDN9QMqpVRbCPcT3FSiCwBiwPLUik7/qIub4CJwzA0
 Ak8o7LTP/p5OCTDC8bwNMW+pYJJaUgjC2gvxNgmebpDIypLgKCFV22PWBdpOHEl3/a0h
 ALcFEQQGuVHNwnj2xtleSMNphadmKR+dHNwsg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=Muel4X/j
Subject: Re: [Buildroot] [v1 0/4] [PATCH 0/3] Add support for Pi5
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>, Julien
 Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1IE5vdiAyMywgMjAyMyBhdCA0OjI1IFBNIENFVCwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+
IE9uIFRodSBOb3YgMjMsIDIwMjMgYXQgMTE6MTIgQU0gQ0VULCBUaG9tYXMgUGV0YXp6b25pIHdy
b3RlOgo+ID4gT24gVHVlLCAyMSBOb3YgMjAyMyAyMDozNDo0NCArMDEwMAo+ID4gR2HDq2wgUE9S
VEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4gd3JvdGU6Cj4gPgo+ID4gPiBUaGUgb3V0cHV0IGJv
b3RzIGZpbmUgYW5kIGl0IHJ1bnMgZ2V0dHkgb24gdWFydCBhbmQgdmlydHVhbCB0dHkgaWYgaXQg
aXMKPiA+ID4gYnVpbHQgdXNpbmcgdGhlIHRvb2xjaGFpbiBidWlsdCBieSBidWlsZHJvb3QuCj4g
PiA+IAo+ID4gPiBUaGUgb3V0cHV0IGJvb3RzIHRoZSBrZXJuZWwgYnV0IHRoZSBrZXJuZWwgY2Fu
bm90IHJ1biB0aGUgaW5pdCBwcm9jZXNzCj4gPiA+IGlmIGl0IGlzIGJ1aWx0IHVzaW5nIHRoZSBi
b290bGluIHByZWJ1aWx0IHRvb2xjaGFpbi4gU29tZXRoaW5nIGlzIGJyb2tlbgo+ID4gPiBkdWUg
dG8gdGhlIDE2ayBNTVUgcGFnZS1zaXplIDooCj4gPgo+ID4gSSAqdGhpbmsqIHRoaXMgaXMgZXhw
ZWN0ZWQuIFRoZSBCb290bGluIHRvb2xjaGFpbnMgYXJlIGJ1aWx0IGZvciB0aGUKPiA+IGRlZmF1
bHQgcGFnZSBzaXplIG9mIDRLQiwgc28gdGhlIGxpYmMgaW4gdGhvc2UgdG9vbGNoYWlucyBleHBl
Y3RzIDRLQgo+ID4gcGFnZXMsIGFuZCB0aGlzIGJyZWFrcyBpZiB5b3UgbWl4IGl0IHdpdGggY29k
ZSB0aGF0IHdhcyBidWlsdCBmb3IgMTYgS0IKPiA+IHBhZ2Ugc2l6ZS4KPiA+Cj4KPiBPa2F5LiBT
byBpdCBuZWVkcyB0byBzaGlwIG11bHRpcGxlIHRvb2xjaGFpbnMsIG9uZSBwZXIgcGFnZS1zaXpl
PyBPcgo+IG1heWJlIHRoZXJlIGlzIGEgY29tcGlsZXIgZmxhZyBvciB3aGF0c29ldmVyOyBJIHNh
dyBhIGxpbmtlciBmbGFnLiBJCj4ga25vdyBub3RoaW5nIGFib3V0IHRoYXQgZm9yIG5vdy4gSSBu
ZWVkIHRvIGRpZyBpbi4KPgo+IEJUVywgSSB3b25kZXIgaG93IHRoZSBSYXNwYmVycnkgT1MgZGVh
bHMgd2l0aCBhbiBpbWFnZSB3b3JraW5nIGZvciBib3RoCj4gNGsgYW5kIDE2ayBpbiBhIHNpbmds
ZSB1c2VybGFuZDsgbWF5YmUgaXQgaXMganVzdCBhIG1hdHRlciBvZiB0b29sY2hhaW4uCj4KPiA+
ID4gUXVlc3Rpb246IHRoZSBkZXZpY2UtdHJlZSBvdmVybGF5cyBhcmUgdGFrZW4gZnJvbSB0aGUg
cnBpLWZpcm13YXJlOyBpcwo+ID4gPiB0aGVyZSBhIHBsYW4gdG8gY29tcGlsZSB0aGUgb25lIGZy
b20gdGhlIGRvd25zdHJlYW0ga2VybmVsIHNvdXJjZXMKPiA+ID4gaW5zdGVhZD8gYnkgdHdlYWtp
bmcgdGhlIGxpbnV4Lm1rIG1heWJlPwoKSSBoYXZlIGp1c3QgdGVzdGVkIHdpdGggdGhlIHRvb2xj
aGFpbiAiQXJtIEFBcmNoNjQgMTIuMi5yZWwxIiBhbmQgaXQKd29ya3MhIEl0IGlzIGp1c3QgYSBt
YXR0ZXIgb2YgdG9vbGNoYWluLgoKR2HDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
