Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853EFC48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 17:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 325BE4245A;
	Fri,  9 Feb 2024 17:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_8Ih5QcR5S5; Fri,  9 Feb 2024 17:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0D6842A4A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0D6842A4A;
	Fri,  9 Feb 2024 17:59:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F92D1BF30A
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 17:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A1478534E
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 17:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4pGXXyd4__O for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 17:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 55A2285348
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55A2285348
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55A2285348
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 17:59:19 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-42ab4f89bdbso6756541cf.0
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 09:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707501558; x=1708106358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YKVGxfD4oQDUImCy8zoeJ7adEqcqI9nm/Lpal0AkqWg=;
 b=OkA1lOg1Lwjy2FZ+I0HsJII7ndaY3INpI5Q/fAxvypgNR0lB94C2U1VjIO7efWFTMJ
 SsFmV8mZspNwSxk3BOmV/tuuNP68lgJMgPmvJVXd40WMfLBgN9cz8IDq8/UoLftfQnQj
 UUd7u6BMruBHKDj0QLgs9U9bzc0unOepJGV1B8s4K3jJ3Ki4BApYrTxcxOrX5XbSAlMW
 /HAlxE1DC7PKepFzHyuggeXMdVUg15v/2RyslS0F4NvfSRSiWoDwvLNSMXkJ77AnkCbt
 hzl7Zw6Y/Rf0+GygsGrfv+l7opvNlPoOEiNPJX1uBFlCQ9u1tWH9lefXQ1EjGFyT0ews
 NdzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7zQo4CYvF9+m4aB/bVE3LymDSVV2P79vUO4wCCyFc3fFw6kjvK2PZQ9TiWeEXrR0xwL2cFmmQrDRvZbfmu8m9EMAVOgCGXg==
X-Gm-Message-State: AOJu0Yy7GgB1o/WdxEH0T/TAtJQq/Fvf2IWCA5b46HQhQ/rTo/fJNmAi
 Q62nswvJO+fvxzivOnkdGvgQi8L39FuY6zn6hPVJ1iFdGoWH2Cyrg4REamf9ctKknMvr2JLxpdt
 Fpn8/ji59veft/xPhtVns3fZI/otClVJN97Sg+Q==
X-Google-Smtp-Source: AGHT+IH2qQcwxxn5UtigisGEE8hDNbEmlMEuw3fIbjs0UrLWPQww2wz3kdXlWNoIDIbsV5z+340onsCtaTJHt+ab4JI=
X-Received: by 2002:ac8:73c7:0:b0:42c:5bcf:9d5c with SMTP id
 v7-20020ac873c7000000b0042c5bcf9d5cmr1854301qtp.9.1707501558122; Fri, 09 Feb
 2024 09:59:18 -0800 (PST)
MIME-Version: 1.0
References: <20231126180840.2081945-1-james.hilliard1@gmail.com>
 <20231126180840.2081945-3-james.hilliard1@gmail.com>
 <9dcac81b-522c-4ea3-80ed-7d9544cea12f@bubu1.eu>
 <20240207112058.37534f3d@windsurf>
 <CADvTj4oDK8UDwAF5oYkULrLKFfZnDMHhk_yH+u3jANXEPdjdOA@mail.gmail.com>
In-Reply-To: <CADvTj4oDK8UDwAF5oYkULrLKFfZnDMHhk_yH+u3jANXEPdjdOA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 9 Feb 2024 10:59:06 -0700
Message-ID: <CADvTj4rj0Oo+CpLrMMOGOu55=JYOzE15kKpH7FqsyHkcZH+ZpQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707501558; x=1708106358; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKVGxfD4oQDUImCy8zoeJ7adEqcqI9nm/Lpal0AkqWg=;
 b=WVYZJDF9DPRJ9iCtRgItuGKMPOicg+lCKom3N/cuxjbQ7NL+JFoH2/DBDeoP8eX7eo
 tRmda6TOQGmBhbhr22vAV2EMhV4fMDy5Yjg2PCT4jzHXmBPtVyw5wY+rh2JNczZeWQDi
 MnEXtBR+NQ5KSEjedsDIe465DNTFpnwF0fzhsnm4Ik9ItvUqqEx8cdgfs1kT1jozLNig
 jpKjTB4W68NNIpmOhIN/ZZ9oFKyPZOJkG+hyxkQCDLWEOjz8tKCPcq8G2BxAdp1cEMgZ
 mIvjif/yhzieStx9UtvC2yQkAiLHiro3UmvLXIVgb8AOzxKukp6cq/r8xrdQSq788Q0a
 +UBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WVYZJDF9
Subject: Re: [Buildroot] [PATCH v6 3/5] package/python-msgpack: add host
 cython dependency
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBGZWIgNywgMjAyNCBhdCAxMjo1NuKAr1BNIEphbWVzIEhpbGxpYXJkCjxqYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDcsIDIwMjQgYXQgMzoy
MeKAr0FNIFRob21hcyBQZXRhenpvbmkKPiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gT24gV2VkLCA3IEZlYiAyMDI0IDExOjE2OjI3ICswMTAwCj4gPiBNYXJj
dXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4gd3JvdGU6Cj4gPgo+ID4gPiBVbmZvcnR1
bmF0ZWx5IG1zZ3BhY2sgMS4wLjcgd2hpY2ggYnVpbGRyb290IGhhcyBub3cgcmVxdWlyZXMgY3l0
aG9uIH4zLjAKPiA+ID4gWzFdLCB3aGljaCB3ZSBkb24ndCBoYXZlIHlldC4gY3l0aG9uIDMuMCBh
bmQgY3l0aG9uIDAuMjkueCAod2hpY2ggdXZsb29wCj4gPiA+IHN0aWxsIHVzZXMpIGFsc28gc2Vl
bSB0byBiZSBzdGlsbCBkZXZlbG9wZWQgaW4gcGFyYWxsZWwuIFNvIG1heWJlIHdlCj4gPiA+IG5l
ZWQgYm90aCBhcyBidWlsZCBob3N0IHBhY2thZ2VzPyBPciBkbyB5b3Ugc2VlIGFub3RoZXIgc29s
dXRpb24/Cj4KPiBUaGF0J3MgYW5ub3lpbmcsIG1heWJlIHRoZSBlYXNpZXN0IG9wdGlvbiBpcyB0
byBkb3duZ3JhZGUgbXNncGFjayBmb3Igbm93Cj4gdW50aWwgZXZlcnl0aGluZyBzdXBwb3J0cyBj
eXRob24gMy4wPwoKVGhlcmUgYXJlIHBhdGNoZXMgYWRkaW5nIGN5dGhvbiAzIHN1cHBvcnQgdG8g
dXZsb29wKGdlbnRvbyBhbHNvIHVzZXMgdGhlc2UpLApzbyBJJ3ZlIGdvbmUgYWhlYWQgYW5kIGFk
ZGVkIHRob3NlIGFuZCBidW1wZWQgY3l0aG9uIHRvIHZlcnNpb24gMy4wOgpodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjA5MTc1NjMxLjEz
MzczNzAtMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwpodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjA5MTc1NjMxLjEzMzczNzAtMi1q
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKPgo+ID4KPiA+IElmIHdlIHdlcmUgdG8gaGF2ZSBi
b3RoIGluIHBhcmFsbGVsLCB0aGVuIHRoZSBiaWcgcXVlc3Rpb24gaXMgd2hldGhlcgo+ID4gaXQg
aXMgcG9zc2libGUgdG8gaW5zdGFsbCB0aGVtIGJvdGggaW4gcGFyYWxsZWwgd2l0aG91dCB0aGVt
Cj4gPiBjb25mbGljdGluZyB3aXRoIGVhY2ggb3RoZXIuCj4KPiBTZWVtcyB0cmlja3kuCj4KPiA+
Cj4gPiBUaG9tYXMKPiA+IC0tCj4gPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VP
LCBCb290bGluCj4gPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0
cmFpbmluZwo+ID4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
