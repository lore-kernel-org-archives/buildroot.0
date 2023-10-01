Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077E9E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 08:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7733E41722;
	Sun,  1 Oct 2023 08:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7733E41722
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epIZALVwDKEi; Sun,  1 Oct 2023 08:22:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A2564170E;
	Sun,  1 Oct 2023 08:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A2564170E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC1B1BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 08:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65A4861221
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 08:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65A4861221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryR7RvbPiHFq for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 08:21:55 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DB6460C20
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 08:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DB6460C20
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so124652815e9.3
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 01:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696148513; x=1696753313;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ucIxAKUuxVe4cQOkvu5y8gaf63tdCG0HJQX5UFhNDE0=;
 b=gy5kDIQJEqhmN8StFF38KsjvYutue1/LqxGQPJlzPJFlQc2u2UqTb3sT2WTpUeUdn/
 Ud2KlRiU86LlexVEGjRnaXMU1TEAWoYsZEjaCRxKe6uUeDzAsmQXT6QUM83DRo9KZYm8
 PM/CQJf+HxQyq+vS9EKRmdom+I//5fCrwcsrvgxDPfozOU2srCRos9e6LuVz2mhLWrGO
 /lTF/2Aq+henLpnqTcrjoE7TpQp+YNRA1phEIXt2aQvHpyjPpYcdvbZNdYgHMLilL8mG
 Cf0j6is4j0lX4PVveVKF4hMIskR4DuufgCANm4kya/OQi4s8PQ+b/Rtxs8rGabSDHnym
 3kmQ==
X-Gm-Message-State: AOJu0YwyxU/OY6ZhlKwLXxOS6OyOCzPR/+wUofJcsVGwkJUqQHVO8wrh
 diQuI9692mlh9gC6e+JEs+QE3w==
X-Google-Smtp-Source: AGHT+IET3zz/Mfn0tpOzEOiDhUdSltIsssxEu6ZSA1iS62C280/D/IsNoGkz6Jnhrfb7CZZ5W5F/hQ==
X-Received: by 2002:a1c:7211:0:b0:405:367d:4656 with SMTP id
 n17-20020a1c7211000000b00405367d4656mr7990305wmc.29.1696148512940; 
 Sun, 01 Oct 2023 01:21:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0ac400b00405442edc69sm4789972wmr.14.2023.10.01.01.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 01:21:52 -0700 (PDT)
Message-ID: <4ea102e8-0fb6-b158-c96a-b1d9d6004925@mind.be>
Date: Sun, 1 Oct 2023 10:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>
References: <20230930221727.1458825-1-arnout@mind.be>
 <CADvTj4qkFQXKXQp_brP2RJ-0KZCMd6U44xEuPY6pYLRtpaOFrA@mail.gmail.com>
In-Reply-To: <CADvTj4qkFQXKXQp_brP2RJ-0KZCMd6U44xEuPY6pYLRtpaOFrA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696148513; x=1696753313; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ucIxAKUuxVe4cQOkvu5y8gaf63tdCG0HJQX5UFhNDE0=;
 b=TJY6HiHzMJXMO13dvarzvaN3VA/GJCsYBe0Orvlvul/Ci5KmEveTRcxEuH7C2khmvc
 mZeNoVIocLALW8CLNzYrH0z0LiVjcoNQtBjJJfx4T2VBm6Df30ytRQDnrEOKEIKH0YRa
 XwvrWV3amXUyvli+vSJqNDje3fypR1O4q0tuRy76h2Bar13PblOpWz6KDDBvgi5IvPJp
 O/DAp/fSw6AlwiBIraKaUkq8AaxGEQfSZaBhGK7RVuRWo/ZWemKhknmVU6uOPrl61N3d
 PU7tze2pbhu4FSMxcLhx48h8Iz2YNX3y/l60gEQr1jDP/zM5yTVlz7XV4QJhq0P86yTt
 LUOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TJY6HiHz
Subject: Re: [Buildroot] package/pkg-python.mk: refactor setup-type variables
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMS8xMC8yMDIzIDA2OjA1LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBPbiBTYXQsIFNl
cCAzMCwgMjAyMyBhdCA0OjE34oCvUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5k
LmJlPiB3cm90ZToKPj4KPj4gTW9zdCBvZiB0aGUgcHl0aG9uLXBhY2thZ2UgaW5mcmFzdHJ1Y3R1
cmUgY29uc2lzdHMgb2YgYSBiaWcgY29uZGl0aW9uYWwKPj4gdHJlZSB0aGF0IHNldHMgdmFyaW91
cyB2YXJpYWJsZXMgYmFzZWQgb24gdGhlIHBhY2thZ2UncyBzZXR1cCB0eXBlLgo+PiBJbml0aWFs
bHksIHRoaXMgd2FzIHF1aXRlIE9LLCBidXQgc2luY2Ugd2UgaGF2ZSA3IGRpZmZlcmVudCBzZXR1
cCB0eXBlcwo+PiBub3csIHNvbWUgb2Ygd2hpY2ggc2hhcmUgc29tZSB2YXJpYWJsZXMgd2l0aCBv
dGhlcnMsIGl0J3MgYmVjb21pbmcgcXVpdGUKPj4gY29tcGxpY2F0ZWQgYW5kIGhhcmQgdG8gcmVh
ZC4KPiAKPiBJdCBtaWdodCBiZSBhIGdvb2QgaWRlYSB0byBhcHBseSBteSBzZXR1cHRvb2xzIHBl
cDUxNyBwYXRjaCBmaXJzdCB3aGljaAo+IHNpbXBsaWZpZXMgdGhpbmdzIGEgYml0IGJ5IGxhcmdl
bHkgY29tYmluaW5nIHRoZSBzZXR1cHRvb2xzIHNldHVwIHR5cGUgd2l0aAo+IHBlcDUxNyBidWls
ZHMuCj4gCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDIzMDkzMDE1MjUxNy4xMDc3NTc2LTMtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8K
CiAgWWVhaCwgbXkgc2VyaWVzIHdhcyBhbHJlYWR5IGZpbmlzaGVkIHdoZW4geW91IHNlbnQgdGhh
dCwgYnV0IHRoZSB0ZXN0aW5nIHRvb2sgCm1vcmUgdGhhbiAyNCBob3Vycy4uLgoKICBUaGUgdHdv
IHdpbGwgY29uZmxpY3Qgd2l0aCBlYWNoIG90aGVyLCBvYnZpb3VzbHksIGJ1dCBJIHRoaW5rIHRo
ZXkgY2FuIGJlIAphcHBsaWVkIGluIGVpdGhlciBvcmRlci4KCgo+IFdlIGNhbiBwcm9iYWJseSBk
cm9wIGRpc3R1dGlscyBzZXR1cCB0eXBlIGFzIHdlbGwgYXMgd2Ugc2hvdWxkIGJlIGFibGUgdG8K
PiBpbnN0ZWFkIGp1c3QgdXNlIHNldHVwdG9vbHMgZm9yIGFueSBwYWNrYWdlcyB1c2luZyB0aGF0
LgoKICBUaGF0J3MgYSBiaXQgYSBsb25nZXItdGVybSBwcm9qZWN0LgoKICBUaGF0IHNhaWQsIGFz
c3VtaW5nIHRoYXQgZGlzdHV0aWxzIGlzIGdvbmUsIGRvIHlvdSB0aGluayB0aGUgY3VycmVudCBj
b25kaXRpb24gCnRyZWUgd291bGQgYmUgc2ltcGxlciB0aGFuIHRoZSBpbmRpcmVjdCB2YXJpYWJs
ZXMgdGhhdCBteSBzZXJpZXMgZW5kcyB1cCB3aXRoPwoKICBSZWdhcmRzLAogIEFybm91dAoKW3Nu
aXBdCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
