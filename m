Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC2FCA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BBD480D45;
	Mon, 28 Sep 2026 11:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVu-Jq1YTgCw; Mon, 28 Sep 2026 11:23:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0C83380D32
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790594633;
	b=LyD3JCl7r9BwQlyKGC5y1n347/0RrI9GT0AdBAJ5Q7al3zo+huCDVfdCFr/ZRC4P0o+N
	 UhHGPtefzDRUkswf9wZW0uSYsFr5F4MnR/hIyv/5oU1Lz+PEROvru77M11Lire85pXM6O
	 Nb269AMnS3Jptvye+OswQdDOrjTHZp86Imvpg9vSHZLTZKASVddJUgUXnxlx7qrZCDzl1
	 BuH8mkELB/bpn4giXs49y8UXSg7CgtVIi+Zknl/4ck1tc4RniWayQex85FlgWsYHEMgGw
	 rQ6bwsYWPI6nsI091qy74oyS//Iwpn/f1aKe4rBwxcRRc0AbOJSwK5bSm/4au8FmDZw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790594633;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=4IKNgvwUoQ8RzCM3UmCdttHdpd/PMXDQravFNAePVvQ=;
	b=mROUeaNmh2GQQYTbQG67BqHEEJ36qDog/zuf4EYSa2scGrJnHqm5cpY07i3gQ1tHjDLJ
	 qeUJNPyIsEPcs+kGYfddAuFqvyN+DvBhTqUHtKjn8jcccumARqBN/CrVri9qveMYuQuC4
	 nYxkF7sYmBqARlWrD/XKr85NdV2Ar3hkWMl0HLSC8jY5bkBhoR6Omnj7kGlMqfiLHJQME
	 3d7WqlwxBka2LbiW3N8KZeQ6WsNd0cTxvfVa3FvYx3Ygyq/VC9QqlRHjQ+UCYjKxrfh7P
	 yHme5dPxQqUx6BYx0WY1ctcNzBVuMBhoFiZzPwxNTs0MX/JW8n6Q+oRoWnsOFR8jOkg==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C9D3ciTw;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790594633;
	bh=4IKNgvwUoQ8RzCM3UmCdttHdpd/PMXDQravFNAePVvQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGb3/N5mCwDmML+K9BxNYITf/xZSGHja6yyMT5sEzwM412eVjcNJskD4nwarHpWde
	 qoPuT2tSDxPesvkkth2wJTvEXqIT+L+fUpZVc8cD2ScU7IG1ZpTJaZzD6fKhneA9x0
	 bo+l/qJV32oYXVfd3D0UAkofKJt7oyJmYs/U2fEAF8ngzmjZT1AiipWXPUP5O0s/DZ
	 DxikUvq/eeYb9g82fl+m6ti1x0ahPTMwvER9roX95hOav/gkbT6uAG30aTZgJf/SnW
	 fxviHHOP1fJsCktTlW9td8wiLyTs3gPsM9LnF6VH9p3DqZ2obXlsyFG2qMoF3Koi67
	 wOLsw56urd4Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C83380D32;
	Mon, 28 Sep 2026 11:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88E4524E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8608180D32
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfWATN0PKuFl for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:23:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8D81980D2B
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:3a::2b"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790594630;
 b=ofbwKVWIWBk+8Hg+5oio0BBXMhB+iUrzPlTD4icMAjtTxW6+D/lwWGVCreEvRtgirG5a
 5rOd8k730G2xM5WrphUeYNWlen4ioqkX079f1uOxUzDynYTl8AmJbIp8RELwDZAqLawtU
 1kJnyTytS3xEbHbU1ZH4HKGs3XeFnNcS6VwsetyQhGLx7Mc+T8ci0iVIK3HPvcT9Rt02i
 4S8VRMUVcPNFrKqh0TB7dT4DsZSnXIS7hk8NrbOCznN0Hq2SpZoRNzX6GyNOvIn8KVvjK
 9kYJHjW7QiMGnOmr5ftjO/G3mGA89RZYDm91KhpudoOobNDxjDmPHt1K1xF3N8BksUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790594630;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=3kqErdGOr3iWhsPP5nbPxOH1RgGhVJ/XTVaTfLmWc6o=;
 b=pDQpB7s6jxqSSJGX3Ergh9nUjuVSERyckHTq8iIiOYzmKSmhQukckzb0W7j8akuFNKBy
 Rtj4G0ZQiLhel0sT6Jvn/WWDqyGcbiq66o59+4C6LwoeVo8PNaGvPmtyTgRUaD433JQhr
 /kht7FJ+sMMav4TPY8zoT/anVKBJioIw/l0jpTuF+oD1r/pnWvwmQRIxSxX5nmZ8ourKR
 3W4Nsl4TEyoeM85UO6/HyUC96JSqdRxryvMtCl+szd8AIMiWn/Xd7Yd9HgzEBYC47FBBo
 RQlf+NOekDc6NUsmSl4WdCRhug3j3yKrHqtb//EOeQbsApGqIKbxPYoWV19m2xBAVkw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=C9D3ciTw; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:3a::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:3a::2b; helo=mail-vs2-x2b.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=C9D3ciTw
Received: from mail-vs2-x2b.google.com (mail-vs2-x2b.google.com
 [IPv6:2a00:1450:4864:3a::2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D81980D2B
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 11:23:50 +0000 (UTC)
Received: by mail-vs2-x2b.google.com with SMTP id
 ada2fe7eead31-7b2c87a0311so600306137.1
 for <buildroot@busybox.net>; Mon, 28 Sep 2026 04:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790594629; cv=none;
 d=google.com; s=arc-20260327;
 b=askYLMhsfzNT1a3fbP7ZMo+SxmtjcjEvUFN7HsFtIm5O03EMc2FoC5ROSlhmfBbmHV
 XB+JgDkrZ2Z4rcrWnD/dDOdQGCLqnGvUv3Jy1fFUZcvsFwzIgNT9o6aoKdD7IqMKeHiJ
 MgTBkC799gmRTU4cOp+y9rUH4Weh5kCUik9HRCQFwZFoMSsWMa143LfhPi7x04lVO2j8
 WJFORvCGqGV6FGN5RT3CRsd7ny5iMD4nx8L3m2UAMCtoi59Z5P1FHTYlEa9P7YRCKGS5
 VkhYd+8aj1wRUEAsmllTjCg7T+HQmporw1YI1GpEXP5O/9JHtziF/4vInYhCXcRNWaNh
 ReXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3kqErdGOr3iWhsPP5nbPxOH1RgGhVJ/XTVaTfLmWc6o=;
 fh=J6ywOFdhM/uDHB/p6B23q5fRdRpCJ7kirBPCytknF+s=;
 b=SCagTtxxto8eo5vO7llpohMsgj0Ak4d2g4B5F1/TyQRPbGrJ/p+bICedxt+Ye+V3qn
 GMADPLGbRWBLTYaQGxlxQAIPB7xrcIE2F8towjTadCyDs1wR8eSLsHlxWNNnAdx0qPcZ
 cSONu1W6UylguwO/BLawtPGL7GQ8XuCLVHgqza5ASUkiiGnqgNIMAepHb/gj7MblXeyW
 VIPpLqhN0CKZ8SyvJzqFUAv9QYr881B0pOUWPIP/zi19ho54Hl1qLYl+gEvrFCeLvfIp
 fsdvLjk1HKmvB5OoRcFBxHpttPUmpQgvZIQAjQAtTlF2q9Mz2NU7MBxJsZGRBdZGqa8q
 pZLQ==; darn=busybox.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790594629; x=1791199429; darn=busybox.net;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3kqErdGOr3iWhsPP5nbPxOH1RgGhVJ/XTVaTfLmWc6o=;
 b=C9D3ciTwrsfAoOaNQ7RlzFVmHq2nyu5Ndk/GNlqU7cEQ4rnh29pgkIjKTACagCCaFM
 B8s8TLmRQHbfS9ps45qHcNUEjgi4SZwJa9KLjwlzgSwyCFvo3/HrQahxVBaZ2peV6838
 emdkLp8JRn9XWqoNZOT00FEi9RDq5nDpCVrC7f/KWUmpAmqI+8bkFkWNbAQbOmcICISl
 xgvGcVJgFGFHCm5E9aUR3ZCU+If2SdK5UCjNg7mJAqcrgJct8phIEfx4wsOLTIe3m/Iv
 rdXEJK2Rl3R8fMGmrN6j3XWjBfBQNdOQQPQQ+2eJJOZHwMe4hw/i0K3cP3kUd//y78Wp
 fuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790594629; x=1791199429;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3kqErdGOr3iWhsPP5nbPxOH1RgGhVJ/XTVaTfLmWc6o=;
 b=ZXqSHIWJSiShoRrNGo4mLs1CQTsA0qOIcOw4tqbzI85jPNe0KlRkOKKH+hHFqcpm/1
 iu0fu7WkIbG/BM6I8N4842fjMvdgL3pP9OMkuqskRmqj33oaP7nQPyKGGnT9CzL7TeKd
 bBWJF0iF6gLdOU/VlUr9otOwN1T54Rh4cJfNBGVZ6x112gbO8C6DcuzDECNmD+wDC2E5
 pRgs0FiAfxGxfp5ERVuGxX2VsrLhTtQzgghZQgN2wsvXu4r0fGfTsFLeTY7BHYn/po8O
 GDGOztfZN7xhxuU19ume/YxhdVC+gV2zr5s9jV1eZblgEiRtyvila1IifeKK06DrN7km
 q1gA==
X-Gm-Message-State: AFq9FYLxlT8eg/rbqQ4snUP3IIbv28WwQatEYw3g/ZyE8QvBXnSxZgI7
 nmYBPN0t049DxWW4jblpTFIkfnypCJoA6+tOh4+GO/aIwK/sDFc6EtsgmZuMQIO1LytPSnn4DhA
 MrRYA/Xn5kPTNhNHUYFfpRKcrXDlQvuk=
X-Gm-Gg: AYBFou30ZcO0m4mKdFXDeOMb4xJTw/yzoKJAP7Z6FM+X7EpVyEHMcXk5tHPIlDQBfNJ
 b0gFWAae2BRmWpuwd5nRaBDEFFgCz2fhv4YyKAZ9Xxt2c2n42APUb93/XOYH+MexKJzKl+S2NM3
 4MlLIysivf2J22nXCK/pRVtwAUvx+ntqHGV5YNFzhIN/OtVwglCTQtCPRpHpZ0nN/lG7TG0qkA7
 Trac4I1d/1SEUC8sBtHPHvvH+5VEIXTE5tCKMHLJq3RL1S5khXZRoS+xJqvqQWB+mKC3ErzLOO2
 i70Z8pAA+/7h+82ztgayHQ2gTi2k0d0Kyd9+AtuPBwwCTBXZiR2K1MtnJSKz4hVwhcMFiHRmg0b
 oPEyPk0ZbR1KvjCpbv5EYUnFKg3DLDklOLUDJ
X-Received: by 2002:a05:6102:1627:b0:7b3:67d6:4d7f with SMTP id
 ada2fe7eead31-7b367d65363mr1224178137.17.1790594628886; Mon, 28 Sep 2026
 04:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260928074239.24304-1-francois.perrad.86@gmail.com>
 <arooOH-qmgHdt6PS@windsurf>
In-Reply-To: <arooOH-qmgHdt6PS@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Mon, 28 Sep 2026 13:23:38 +0200
X-Gm-Features: AclHuK_9tttU5G214LinQLLpWGLcB5ExOGLS-GKlWEDbwBAMMbVu8-yaJxEvPGI
Message-ID: <CAMTop8_8MEF2gDf7WDBGzSZ1SHTD+GZHcHE1eSJzTttFBcg7jg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Subject: Re: [Buildroot] [PATCH] package/wireshark: fix support for lua
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
Content-Type: multipart/mixed; boundary="===============5632928818297300474=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5632928818297300474==
Content-Type: multipart/alternative; boundary="000000000000caa788065c894c68"

--000000000000caa788065c894c68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 28 sept. 2026 =C3=A0 10:42, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> On Mon, Sep 28, 2026 at 09:42:38AM +0200, Francois Perrad wrote:
> > since 4.4.0, support for Lua 5.3 and 5.4 has been added,
> > and support for Lua 5.1 and 5.2 has been removed.
> > see https://www.wireshark.org/docs/relnotes/wireshark-4.4.0.html
>
> Is this fixing a build issue?
>
> I did a build locally, and I see cmake taking 100% CPU time at the
> step:
>
> -- Considering the following Lua versions: 5.4;5.3
>
> is this what you are seeing as well?
>
>
I see the same problem.
But, I found nothing in autobuilder outputs.
If the autobuilder uses only the default version for Lua (ie. 5.4), it
cannot show this issue.

Fran=C3=A7ois


> Since this is a fix, please add a reference to the Buildroot commit
> being fixed:
>
> Fixes: 49fa20e6678ee32e4b26979f5cb4d149876fbedd ("package/wireshark: bump
> to latest upstream stable v4.4.9")
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000caa788065c894c68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 28=
 sept. 2026 =C3=A0=C2=A010:42, Thomas Petazzoni &lt;<a href=3D"mailto:thoma=
s.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, =
Sep 28, 2026 at 09:42:38AM +0200, Francois Perrad wrote:<br>
&gt; since 4.4.0, support for Lua 5.3 and 5.4 has been added,<br>
&gt; and support for Lua 5.1 and 5.2 has been removed.<br>
&gt; see <a href=3D"https://www.wireshark.org/docs/relnotes/wireshark-4.4.0=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.wireshark.org/docs/=
relnotes/wireshark-4.4.0.html</a><br>
<br>
Is this fixing a build issue?<br>
<br>
I did a build locally, and I see cmake taking 100% CPU time at the<br>
step:<br>
<br>
-- Considering the following Lua versions: 5.4;5.3<br>
<br>
is this what you are seeing as well?<br>
<br></blockquote><div><br></div><div>I see the same problem.</div><div>But,=
 I found nothing in autobuilder outputs.</div><div>If the autobuilder uses =
only the default version for Lua (ie. 5.4), it cannot show this issue.</div=
><div><br></div><div>Fran=C3=A7ois</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Since this is a fix, please add a reference to the Buildroot commit<br>
being fixed:<br>
<br>
Fixes: 49fa20e6678ee32e4b26979f5cb4d149876fbedd (&quot;package/wireshark: b=
ump to latest upstream stable v4.4.9&quot;)<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000caa788065c894c68--

--===============5632928818297300474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5632928818297300474==--
