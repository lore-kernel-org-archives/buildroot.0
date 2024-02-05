Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3B2C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 16:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BD5D40459;
	Mon,  5 Feb 2024 16:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BD5D40459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EJvXKwyw8Tu; Mon,  5 Feb 2024 16:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43EE2408BD;
	Mon,  5 Feb 2024 16:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43EE2408BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 478741BF2C6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F91441722
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 16:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F91441722
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1CJ-A7YhSr4 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 16:47:46 +0000 (UTC)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4658D416BF
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 16:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4658D416BF
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3be61772d9aso2323159b6e.3
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 08:47:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707151665; x=1707756465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZ2FEMix6yKBq+8uHDe9KB0iMVDhr/CZYmuE2J6E3r8=;
 b=eHafJEH8yd5sArGwP/QCvB/HrZyxJE1ez97uMcsAEd1L8PsIn92YdSIt4PVYYrsz+0
 FiXj780TaTORIyqXzfYfRHBnXlDAlp+DqvNbbSqGOd+pCkAtJI8XINBwuguInP7LLXyO
 gVLLQ87MWyCberM5LwZ74BM5bvGhScouZJFOX1EOkew7yIF2SY1mcFI6YmzOAO/pgc1U
 oq7/0VIyaeiN/sKexFDhndeivO8m4syrfbpS20Pr48NQLZPD4eOCMEx0y9ZBaPwr2HB9
 xsQzG4gX++xcKkQNIX7Mojl6bJcBS/Dap/as9ARliV26HQOAVxwZasyv+6mbmiqN0Yti
 fLLw==
X-Gm-Message-State: AOJu0Yyl4aLjmTN3NemSaQ9AOTXgQBAf8P63lwsiEtWdbbea1n3aEzNr
 N2ksruEDvQGBFx4e/py07BslpPfc1irrkScQ3mCoJz//SIlr4awqiwhB2XBpix8Ttkka99YaPQI
 iC4xpxGKTR8hSFEWgWqoZVqRtHvo=
X-Google-Smtp-Source: AGHT+IEdxcotvshIhhXiUFq7kk6GYOffzDeX+LqG0frYzisLpgV7xbHOmCREvZPLZ4Q95UJyD6ENel8QIy8C49H8BbA=
X-Received: by 2002:a05:6808:f0e:b0:3bd:815d:3cb1 with SMTP id
 m14-20020a0568080f0e00b003bd815d3cb1mr235493oiw.57.1707151665142; Mon, 05 Feb
 2024 08:47:45 -0800 (PST)
MIME-Version: 1.0
References: <20240111072922.3082638-1-james.hilliard1@gmail.com>
 <87sf27upph.fsf@48ers.dk> <42594955-dcd4-4161-9a84-879f096d49f7@bubu1.eu>
 <87il33rm9s.fsf@48ers.dk>
In-Reply-To: <87il33rm9s.fsf@48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Feb 2024 09:47:33 -0700
Message-ID: <CADvTj4qMZD0BbaV17Y5o06nwrhLrWUeTC35UcbEweBu7jMQy2g@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707151665; x=1707756465; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZ2FEMix6yKBq+8uHDe9KB0iMVDhr/CZYmuE2J6E3r8=;
 b=aB/YkUooAP3dLX2/zvlLxRCYsww9d10oexCnqNffDgP8wtFys7QToaHX0mmXG7NRWi
 R1W/OGcUMSzmwvrBTzqF1Sh1axBvveDGtDRRuB9ruIHJBWUXUQJSEUEQ7NxPUwdBk3q8
 HC3A+Tr6dp4Tvvlp+UfpykMD62ws/P/waUlgQtlhCV4C4Cwg8FYMich66bI+3NLHrV7+
 x+BeN5ZznZYdWgU7mWiAzTKkt7nQYi/xGX58q12KOhbVuzr7Et3cu6jpTXcG34Q6Im34
 iGEKrHAYUWBnmhMXLwgkTMt2GNncpz4t+c4kMOhR0l5shTyxhnHfXj4AB+LOpaeVcciK
 BTVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aB/YkUoo
Subject: Re: [Buildroot] [PATCH 1/1] package/python-starlette: bump to
 version 0.34.0
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBGZWIgNSwgMjAyNCBhdCA3OjU44oCvQU0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBr
b3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJNYXJjdXMiID09IE1hcmN1cyBIb2ZmbWFu
biB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgo+Cj4gID4g
SGkgUGV0ZXIsCj4gID4gT24gMDUuMDIuMjQgMTI6MTUsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToK
PiAgPj4+Pj4+PiAiSmFtZXMiID09IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21h
aWwuY29tPiB3cml0ZXM6Cj4gID4+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gID4+IENvbW1pdHRlZCwgdGhhbmtzLgo+ICA+Pgo+
Cj4gID4gV2UgY3VycmVudGx5IGhhdmUgZmFzdGFwaSAwLjEwNS4wIGluIGJ1aWxkcm9vdCB3aGlj
aCBkZXBlbmRzIG9uCj4gID4gc3RhcmxldHRlIDwgMC4yOC4wLgo+Cj4gID4gVGhlcmUncyBhIHBl
bmRpbmcgcGF0Y2ggYnkgSmFtZXMgdGhhdCBidW1wcyBpdCB0byAwLjEwOC4wLCB3aGljaAo+ICA+
IHVuZm9ydHVuYXRlbHkgaXMgYWxzbyBub3QgY29tcGF0aWJsZSB3aXRoIHN0YXJsZXR0ZSAwLjM0
LjAgWzFdIDotLwo+Cj4gID4gSW4gZmFjdCB0aGVyZSdzIG5vIGZhc3RhcGkgcmVsZWFzZSB0aGF0
IGlzIGNvbXBhdGlibGUgd2l0aCBzdGFybGV0dGUKPiAgPiAwLjM0LjAgKG5ld2VyIGZhc3RhcGkg
cmVsZWFzZXMgcmVxdWlyZSBldmVuIG5ld2VyIHN0YXJsZXR0ZQo+ICA+IHZlcnNpb25zLi4uKQo+
Cj4gQXJnaCA6KAo+Cj4gID4gSSBndWVzcyBJJ2xsIHNlbmQgYSBzZXJpZXMgdGhhdCBidW1wcyAq
Ym90aCogYWdhaW4gdG8gY29tcGF0aWJsZSB2ZXJzaW9ucz8KPgo+IFllcyBwbGVhc2UhCgpVcGRh
dGVkIGJvdGggdG8gY29tcGF0aWJsZSB2ZXJzaW9ucyBoZXJlOgpodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zOTM2NTkKCj4KPiAtLQo+
IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
