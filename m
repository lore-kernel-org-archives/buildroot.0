Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97901EEC2AB
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 23:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330C941ADF;
	Mon, 23 Feb 2026 23:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6H3CMkIpjIpt; Mon, 23 Feb 2026 23:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3729541B84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771890138;
	bh=HYN30v2JIc7FBJZFFVWqRCjGm4V3SgKAgP/GbTRwmww=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q9W8i8yUAXso2a3wKUbVYGUNfPcYjiIui9nLNOWS/R63QeuGhWfUV4U1yDJtz4sn5
	 QmBZhfluV0jGNLjVo2hdcD1HrC9dwMhY3odxEMIPdOfVpfYYTH9LDdxijQnVisVhMb
	 cqBkzUpSbZd6m9oAdkXvLvZ8+3VSRhscfxcK2h59p3DYNvAHEOY/CPiphoh764v05S
	 Q8iU3L1Gc6BNt3+Z4WImFtlrWdZyK7CQ8uNsLjRF9+/I1zLSTOXZS0kUgaYZ4jW9ga
	 BObNmGXt4ci7rSQdq3tExSTrBnkzd6S63X6Z320EC8B8ODfigqvVEujLVSwsYrIgE6
	 WKInDmlceCeZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3729541B84;
	Mon, 23 Feb 2026 23:42:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1AEA237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 23:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 975AC41B84
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 23:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOmeAD5WmCVC for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 23:42:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE7BD41ADF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE7BD41ADF
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE7BD41ADF
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 23:42:15 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6729292dcd7so2444273eaf.0
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 15:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771890134; cv=none;
 d=google.com; s=arc-20240605;
 b=XMAkkUFng53eW/jr25i7oZbE4HuCV0C5HIf6ipNrFudSvPBw5EIpwqDldJgI0sRJZw
 P5JryuRExHWSUSGRJsSEPIWOXnmi+RHQAgfjYORexLZ9KCxckqJ9PUFJGAbSkzmwt3e9
 4HXvoyr/u4R9vx8xUdweZ8B5ITvXYHOAZBC8f801Gq2N0JzJZhcglzXXAG0POgKcUPwY
 VKGEH3AkWGa3ljGr61LdExhHZ1E/tpwFd/Au8UUNw3Srnlguua6Jbpt7PXjo3uJWMqZ+
 fnt9dVwuQc2I87mFB3Z1czDUHP4r151OsQRDeLT23kNcDZtEf0WTiXZerujtvCCmyyMZ
 ipkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=G8zQJ3dqLMp0RoG938A19bCB3/N20wb7dHwk1P9Zv2o=;
 fh=siEEGlK4OxgQsxxDJxK74FwhxxtTUd9xjx4ss01wdDI=;
 b=fildI3l/C81j+lwkN6xyj+2hgEEuoQCs9EQgUy2dZ4vfoQgpEQwyODR2NeQuOCqX0r
 tKZTlR6OydW0/l+FzSIzp1nbBCQn/W5OaHI+rWJc7dbhMaewtWukb9sqSVqsbDkyImUz
 70sCyWijm1C0VHNTb8VzKRHonKZ4zH6F6dCaswzKtyPIkJtqAdI7YKVIiZ/9Iptb9X7k
 nCid6k12azcumIi1rXNIsxsRVYuxEZqd7E0ysXM6oz33O0se4YUPwhmhLT2+SXYvxdqK
 bqvFybysNSo+aMNsXS/CtbCQ2EYCj8TcCEINiVsgQyIVRQloYn3KsSZI8jitKOBp/1Dg
 pX6g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771890134; x=1772494934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G8zQJ3dqLMp0RoG938A19bCB3/N20wb7dHwk1P9Zv2o=;
 b=OU1Beu43emSa/x87OGJ4hXivV3C01iMFD7vgkpODYHwboVm86YrPyQuA4LPxgVhZ9U
 1uu8+EfmZyGJ1Uq2iL6Nd9KsjvEQ5HEsQ2g3Jv5wryK2TYyXTQCegr4MuPXA/BBxO4d6
 uOAIeYZwNmOjuXBtub5cq1/Agh2nmps0+W8bUShhJqCuVWicxvDFIueRQChuAUmme6Bt
 Zi/Nan7ybbLP9xi+b58LTYLMGy79qSIjjUmOToSilUMxZYO1Mi4zpwBvX9T3/pHbSKLd
 MC6pMMJN+19+U3J4Hog2pRYtqrzCCWP2Vimqdl59GUFVf2JBcx9izht3QEH8hd6LK4S8
 t5cw==
X-Gm-Message-State: AOJu0YzyKLpUP3JLoageMOyVR/s1Pn3z/m1UQ0F9BVN1G1a2hEuAxuW6
 lZxEptSsfdNuBsYYBqrcKOOuNDvqnPE8eSC31AqVqRySIpQNX3KvG/r7zxTve/tAsR6DM6t9Nx/
 +kFpL/HF4NPrShU9APej5zMDkU04RcbM=
X-Gm-Gg: AZuq6aIhN5/q3ROByzzWSrFQUOA32Bn1n2pprAEDupnNZNqbn8+1oOsaclm7PcCThNx
 tVCD82MmcGMlNhspD1x83e/RUh6nhj8LkJldCTjBqFzgO8KhB6wtVWewX/yjYLw0a65LC3IMMQv
 FqjH5T0RH8bngP+F5tjjzIhcdhPRFaL/XhadG8onz6qMq30PPM4ibIQhP5jfyPpmWanGrz2mbK+
 D/b2KoguSsFeJsioqv12eZ3qJZ51xgp7qwIeAwqEZnexDub8t3ISLamcqgcNt+pBvD/g8E7x3OT
 q4ybGg==
X-Received: by 2002:a05:6820:2229:b0:677:4fc0:a852 with SMTP id
 006d021491bc7-679c447def4mr5305691eaf.34.1771890134247; Mon, 23 Feb 2026
 15:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20260220-llama-cpp-b8117-v1-1-20e68ea57055@gmail.com>
 <5a727d873b79b960dd824272ab5b4270@free.fr>
In-Reply-To: <5a727d873b79b960dd824272ab5b4270@free.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 23 Feb 2026 15:41:38 -0800
X-Gm-Features: AaiRm520pYCs83OF4KpMFjltwfeR-qnCb6lnr1grdhP_725HlgJ3N86Vb7Ywkt8
Message-ID: <CAMWSM7gvo4BmPaB9LR0ECDCWVcMw6-=RELk3O-ePuAetg-tUVg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771890134; x=1772494934; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G8zQJ3dqLMp0RoG938A19bCB3/N20wb7dHwk1P9Zv2o=;
 b=gZ4mvQb6k9sOPCt0vO/bBfcJ6D4A6HabcHuBzCllonWf8KlQJeEEyefrtoK2vxxgdt
 dm2xaQC9R/XxnzfoS431lxqD5Mt/AdhJv+bUlgq7EWd9D/r4TPV2p9OCQtzSfxdLZlh+
 7a78KP3elnkapWDOdG60u84w93bkjtNrNX9LGTycwnn4Shjr2ICmvPiJcZYP9215Qd3s
 dI3YMYItCqHbDXz6DVauXFdbdiWMQqhNbmgI24pwNM00uzROUNZb87cOS0HOILnIghkh
 MkNgY8SIDrAexrx4LUkyeae8Jdr0VOvtwe/ssh+2jWnxKzF0YfdyF/RWu2WoeL1I6oj/
 3c6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gZ4mvQb6
Subject: Re: [Buildroot] [PATCH] package/llama.cpp: bump to version b8117
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gU3VuLCBGZWIgMjIsIDIwMjYgYXQgMTA6MTjigK9BTSBKdWxpZW4gT2xp
dmFpbiA8anUub0BmcmVlLmZyPiB3cm90ZToKPgo+IENvdWxkIHlvdSBzZW5kIGFuIHVwZGF0ZWQg
cGF0Y2ggZml4aW5nIHRoZSBsaWNlbnNlIGhhc2gsIHBsZWFzZT8KPgoKT2YgY291cnNlLCBteSBt
aXN0YWtlIGZvciBub3QgY2hlY2tpbmcgdGhlIGxpY2Vuc2UgaGFzaCBiZWZvcmUgc2VuZGluZy4K
Cj4gQWxzbywgZHVlIHRvIHVwc3RyZWFtIGNvbW1pdDoKPiBodHRwczovL2dpdGh1Yi5jb20vZ2dt
bC1vcmcvbGxhbWEuY3BwL2NvbW1pdC9hMTgwYmE3OGM3MTBmNTJhZjdjN2VkZWU1NjJmYmU5OGMz
NmQ2ZGRkCj4gdGhlIGNvbW1hbmQgbGxhbWEtY2xpIGlzIG5vIGxvbmdlciBhdmFpbGFibGUgaW4g
dGhlIHJ1bnRpbWUgdGVzdCwKPiB3aGljaCBpcyBmYWlsaW5nIHdpdGggdGhpcyBwYXRjaC4gQ291
bGQgeW91IHVwZGF0ZSB0aGUgQ29uZmlnLmluCj4gY29tbWVudHMgdG8gcmVmbGVjdCB0aGF0IGNo
YW5nZSwgYW5kIHVwZGF0ZSB0aGUgcnVudGltZSB0ZXN0LCBpZgo+IG5lY2Vzc2FyeT8KPgo+IFlv
dSBjYW4gdGVzdCB3aXRoIHRoZSBjb21tYW5kOgo+Cj4gICAgICB1dGlscy9kb2NrZXItcnVuIHN1
cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAo+ICAgICAgICAgIC1rIC1kIGRsIC1vIG91dHB1dF9m
b2xkZXIgXAo+ICAgICAgICAgIHRlc3RzLnBhY2thZ2UudGVzdF9sbGFtYV9jcHAKPgoKV2lsbCBk
by4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKQmVzdCwKSm9zZXBoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
