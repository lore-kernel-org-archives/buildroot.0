Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7C2C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 12:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 031CF40A61;
	Sat,  5 Sep 2026 12:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMV6GuITHXJR; Sat,  5 Sep 2026 12:45:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1495240A6E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788612333;
	b=iXDKMXaDcrzyPYZuyjUmU0Rwn/eftjXicIS7xIAmgSShmUsk0GvG4ht9CkohhrhYcvV0
	 ahfPqD+ziNO/BVw1TQ8FrJI1NaMkitvpzmO1siT3uWV0hHaPXcCPLIQfOkKzMsFXlaGyO
	 wfI0FmwOc8JekbimF13EllIGR3Ri7OUqbLKyeLKUEHhLc87/yv5uMQSKtdOynfJi4NbR4
	 vSAz73LwybmsXa66ixyXzoEL3zrpuktGfj3URRIax4aPBJA8I+xVTDCZO36jwOwtH21Dz
	 f4f/n7JgWUkwE/+Pk8phN6CG3GvyigBdW+nkEPimwFxq54mb1Iqk0dgIcMnVcPDE/zg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788612333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=g2OGt3SGe2G1sFFTgEwIyRDqeq8TxY8Y/I1g9dVmz5E=;
	b=SLEJzrEwquHFHRJqOA3vhXIxLp+rchEpDB0Nj8rejcltlRl1Q/axW3CoS97quuYUGdvk
	 dyXjxRPYa1UUUcwxZuQE8d3puDIdtB2psA/Hvuiqak77ys6GuP3E+tv1EXJgUydefpQ5l
	 P2PaT2MDu2PxBDSekOyigJnecKT7SJjtHB9Zd7uRGQxwrZlJFP8iP+RSJArv1mzMo13dH
	 ONmSNvOolZ8zblfrg5WmZfNHkDTrYbAqso6bBGEb4rBY2+S2MstXPeMFIv5F0iWfU7NIz
	 njL5iKyv1uNv3jfwib6jcSuvTSzQ7HpfAK/ejZSAhBzDLM37lUqRsvxP9AiIxEw2d1Q==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788612333;
	bh=g2OGt3SGe2G1sFFTgEwIyRDqeq8TxY8Y/I1g9dVmz5E=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KZzIMRxj9BQiPeZHCGb5QveVsjA/tEARjIbjtYJTH0dDgDLkAi0z2o0sfmEetUIgv
	 tL3R0sOVTQuglTX+ix0/jnC35uYeTT52ha6Wj95rNHXV+CFzhOt7yrKyQArI9HjxTI
	 xBuT/QATdTyNXtKhBHiIejpYqAieLgJjKw2Ta+MoraCN2n3Wta4BJDcXSl6fFqO5dd
	 Tq78j6H0oBl8cDs9wopTN+vjw/UVum/aSGiK9xjt1QtNlebZB4UJs4wwBDHX2vjSsM
	 lzUwu9jVTTdEo2wNFV6t1htvpxKNyLMXIF+SmxIqv6NTvI4dX7tV0xvSg+DhtZ49XY
	 E7zeIZp5wmP7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1495240A6E;
	Sat,  5 Sep 2026 12:45:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E1E0388
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3027940A6E
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOzJTvXtmOCV for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 12:45:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E6C5740A61
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1788612330;
 b=biBeGOOoduf4G5IKQXNASrjoFPrgqsdycDEZYX3bPpAvUX+F4gBFGaVsHfqJ/B3KPDcG
 2WcuVvRWcGtctqM7QKURFCbj0uu0+Qo3lME+T5+vn+RoRB+J6KkilOrVKLXuEjIJYPXUh
 zp00HN0iQBTRESOyrRM6ZZk3KswSDCIJS3vWeMrhobH5bRy13p5CdoF9+7dyE0EXQpPg6
 YuRBrBaDlCg43hGiKyCT0J3Xb0Lc2ALUa7Ea65jW4q7uc9Hlrk5XZAThyZpUAXOp4kEzL
 V2dqne+o3dTPgbb9Qj4qLDUo9emyBGsxHsOg1iL3ZW4+1EyPRN4snZ9JsZ2/ZZg21OQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788612330;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=wB/sFcPQMh5ZFQxf6SWBmujiCphcn6mIEk2cCwOPoHE=;
 b=UPfcvKhTE/ek8jQnquAflUS+pqMn4hZ8tlsNxfHg5aiZ1pUBUKOICrUxi53CDmnP5biI
 RahURaDyJrIulpfEU93AYTxfNnwlxLEKtcN30x/UOesU9E04yUj+m26RwsKmebx4MjDJW
 MHamg6433c4NqTjqMf4t2gmHmeTmaokDzWmY0isCo7QtHBz6xyNbYeD9uRgox8DpsdsFg
 Y2R9/2HJe6YciZzoah2Li9lebrffrAnoqoOkSCdEJZzkIwH5cz4wvHMJMK2Qui9yBiaCC
 R+hLyudS9k+B+/aWREcZArBbhh41iqk/9FFDftYj+KuzTpNOXKPh8pr7dt64rSCbGkw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=sg4vqR6a; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6C5740A61
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 12:45:29 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6a6868f18aeso2834608a12.0
 for <buildroot@buildroot.org>; Sat, 05 Sep 2026 05:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788612327; cv=none;
 d=google.com; s=arc-20260327;
 b=Uw/UUH8JKhSuHrkdpRZXIfStpPjGBgbgQ4B2k54hHVEWfzewxWzVFapPDvumUIKd93
 ntRMB5Fzee7hjap2FU4eVuXIU2FK6xyNOXgAQARKglE62YVGp8H9YLFJB3f0stlHzomn
 Rltz50JwVEc9vhwS+NmV/KS721alHzuLnB56c/j/ncRcl4KdDRwQy+iHxx2mzYm6d8me
 JpPz25dSk5g2eFLokgdTUy/J2Xh9GgJdDJdmFGZYqVpLXIqPYGIOV+OHLyCn78sCyhwC
 DvK61qsOd8NdH7aooOggEdUbml+zBSWOA86vk1bYX8ZqlZt2dcrc38TJRW69JI568pGD
 q0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wB/sFcPQMh5ZFQxf6SWBmujiCphcn6mIEk2cCwOPoHE=;
 fh=eKd68SYs49y2DRZ9tDX+kqXwnVz9rB9kc8+cFSXGP9I=;
 b=VFCbm70iUFNsnvCkSC9A9NBvcoh3NznISxWg6k9F5Cz42y5irRw4IB6Wp3U2awhT44
 05RFogl5tN+IzdB7nQPK3IlE8e+4I/67ULROwMtX1NKhiFbKSNfDvdJ03nYYHzgEpaXR
 YNeLz51bq9UyJD/f9Ufn3Fn8CPOpjK1bnoMHTtx1b73RXvHc3dGTVezyD1Qzy3sHXlVO
 Qks4nkqUvPqf8IDyr+7tr9+bp+YoFhmGPQ9b8h52/hgJt/VXmhZlpY7DWsfEMi7LFsnz
 QwPfVXwvNVX0nm4MP4ZSeJEJAbIrtOSmaBXJKm1QS2CIZMlxpRvD3svzZuPAIseZ5COR
 zpGQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788612327; x=1789217127;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wB/sFcPQMh5ZFQxf6SWBmujiCphcn6mIEk2cCwOPoHE=;
 b=abYasdYrWmFFpvKdwKtCEZgE7BIL3snD94Gg2JYwUYrNOtPeaFMVs5T4svO8l6F6tJ
 p6wWLCE1eAtp2W7kb7ZQUwInADbvLRNV7NL6o71Cs14l90CSqoWSMBIMbxdLusZf8cUt
 Sb3hRC6Av63ezz6CW2QoSfgEttRD6A/ngoY7j/kwfU8J6wbGkhnJqW4zR4oXIi/0cz7X
 OfbItAQrR7XzqugaZ2+JWEsQy7xHep93Nt2/26IRtQvPwsltnC1gR1J01oXRqwgcReZC
 qOxEFcIg/yriEPRorxph6BcGMi7vhS9wHbp2+/3xktKJyaBDkoQc1dUe6nfiUSp+5sGx
 3s4A==
X-Gm-Message-State: AFuF++m+IFHkKtpvmKW1855cBfTLSTQU+Q1VE4kjOimeTg2BckC96Syd
 J6UhPQszeNTHtXHj93g3rabD520cD2CFhD7Unh714fzpf6+iveH6xtjYHChfRwQ5JN4GE7Vyhol
 MkO9eVQTO859lkJZIe38lrV2fahGeMDg=
X-Gm-Gg: AYBFou3BXwIFh5n1j8x55PII/zvFdrUwC7U/b736hOVhZYXzMcy5xab0uoVHAoFh147
 A0ltNwzt4u0gtqvgOI5q5Ilym52zRZHCTdwO83ngs19a/jOwe/nxKWW8EL1GgCapuHp27POcqcM
 ejSNvsGWtouz12rsGzX0qGoVBRUfaSWoNMdX8CGdTyeM1361HbHpzTP8+P2gDzFA/5oConps8g/
 CkM+fmpdj+TnVV14ipLPWi6lc7zEttqV7L5wiB72O/sOA2HB4n6LOFk+bip/awd2ME9tmeaAcn2
 I7pM9TRF/XyDIPeL0p1BXg2KqJqcxrMtGMpJSbyJKg==
X-Received: by 2002:a05:6402:52d7:b0:69c:6547:518b with SMTP id
 4fb4d7f45d1cf-6a7e8d951a0mr4192523a12.12.1788612327239; Sat, 05 Sep 2026
 05:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260905122040.2054789-1-bernd@kuhls.net>
 <20260905122040.2054789-7-bernd@kuhls.net>
In-Reply-To: <20260905122040.2054789-7-bernd@kuhls.net>
Date: Sat, 5 Sep 2026 14:45:13 +0200
X-Gm-Features: AcwNN1UfA_X8FA2DJV-SDXXk6GomILSW1rXY1xhWTZRzUTq7ZktQxBlxqqkWsJY
Message-ID: <CAGm1_kvN6WWB1yqB6mkNkONLMk8u52Y=s19eV8YqemEYEYnm_Q@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Daniel Sangue <daniel.sangue@sangue.ch>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Pierre Floury <pierre.floury@gmail.com>
Subject: Re: [Buildroot] [PATCH 7/7] package/swig: bump version to 4.5.1
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgNSwgMjAyNiBhdCAyOjIx4oCvUE0gQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4gd3JvdGU6Cj4KPiBodHRwczovL3d3dy5zd2lnLm9yZy9SZWxlYXNlL1JFTEVBU0VOT1RF
Uwo+Cj4gQWRkZWQgdXBzdHJlYW0gc2hhMSAmIHNoYTI1NiBoYXNoZXMuCj4KPiBTd2l0Y2hlZCBf
U0lURSB0byBodHRwcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+CgpSZXZpZXdlZC1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1h
aWwuY29tPgoKPiAtLS0KPiBTZXJpZXMgcGFzc2VkIEdpdGxhYiBwaXBlbGluZXM6Cj4gaHR0cHM6
Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzLzNhMWUwMThiZDkyZjkyOWQx
YWNjMTg4Mjc0MjgyMGJiZWZlMDY4MDAKPgo+IHdpdGggdGhlIGV4Y2VwdGlvbiBvZiBib290bGlu
LXg4Ni02NC11Y2xpYmMKPiBodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2pv
YnMvMTYzMjMwNzc1ODQKPiB3aGVyZSBsaWJzZWxpbnV4IGNhdXNlZCBhbiB1bnJlbGF0ZWQgYnVp
bGQgZXJyb3IgYWxzbyBjYXVnaHQgYnkgdGhlCj4gYXV0b2J1aWxkZXJzOgo+IGh0dHBzOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82ODQvNjg0YTc3OTg0MWMyNjQ5OWYyYjI4Zjc0
ZWRmMTgzYzczZDEyNzczYi8KPgo+IGFuZCB0aGUgZXhjZXB0aW9uIG9mIGJvb3RsaW4tcG93ZXJw
Yy1lNTAwbWMtdWNsaWJjCj4gaHR0cHM6Ly9naXRsYWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9q
b2JzLzE2MzIzMDc3NTgyCj4gd2hlcmUgc2RsMiBjYXVzZWQgYW4gdW5yZWxhdGVkIGJ1aWxkIGVy
cm9yIGFsc28gY2F1Z2h0IGJ5IHRoZQo+IGF1dG9idWlsZGVyczoKPiBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvOTY4Lzk2ODYwOGJmZDQxZDQwZWNlYzNjMmNmOTU0NGNk
Y2ZkMTY5M2RhM2YvCj4KPiAgcGFja2FnZS9zd2lnL3N3aWcuaGFzaCB8IDQgKysrLQo+ICBwYWNr
YWdlL3N3aWcvc3dpZy5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3dpZy9zd2ln
Lmhhc2ggYi9wYWNrYWdlL3N3aWcvc3dpZy5oYXNoCj4gaW5kZXggMjE1OTBjNDIyYS4uZjNkNGEx
ODI5ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N3aWcvc3dpZy5oYXNoCj4gKysrIGIvcGFja2Fn
ZS9zd2lnL3N3aWcuaGFzaAo+IEBAIC0xLDUgKzEsNyBAQAo+ICsjIEZyb20gaHR0cHM6Ly9zb3Vy
Y2Vmb3JnZS5uZXQvcHJvamVjdHMvc3dpZy9maWxlcy9zd2lnL3N3aWctNC41LjEKPiArc2hhMSAg
ZmFiNWVlOWUyN2I3MDNlYTk2NGU1NWFiY2E1ODU1NjdlYmFjOWJjZiAgc3dpZy00LjUuMS50YXIu
Z3oKPiArc2hhMjU2ICA3ZmVjNTBiMjdkZWRkYWI1NDU1YTk2MzM3ODBiNjM0MWVkZGZiOTYyMTVh
NzYxOWU5M2E3NmViMjcxNzhmNjUzICBzd2lnLTQuNS4xLnRhci5nego+ICAjIExvY2FsbHkgY29t
cHV0ZWQ6Cj4gLXNoYTI1NiAgMmFmMDhhY2VkOGZjZDY1Y2RiNWNjNjI0MjY3Njg5MTRiZWRjNzM1
YjFjMjUwMzI1MjAzNzE2Zjc4ZTM5YWM5YiAgc3dpZy00LjEuMS50YXIuZ3oKPiAgc2hhMjU2ICBm
NTNhYmFlZWQ3NzUwMThkNTE5YTFiOTYxNWYwY2ExNzg5NDc3MmJkOWNhMjFjMmExNTZiZjM0MGFj
NDFjMTNlICBMSUNFTlNFCj4gIHNoYTI1NiAgOGNlYjRiOWVlNWFkZWRkZTQ3YjMxZTk3NWMxZDkw
YzczYWQyN2I2YjE2NWExZGNkODBjN2M1NDVlYjY1YjkwMyAgTElDRU5TRS1HUEwKPiAgc2hhMjU2
ICA3ZjUwZDk0MjM3M2E4NzEyMTFjNWVmZWUwM2YzZGIyZjllZmQxY2ZmMTAwMmIwZWY4ZTM3NDhi
YWE2MTFhNWMyICBMSUNFTlNFLVVOSVZFUlNJVElFUwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N3
aWcvc3dpZy5tayBiL3BhY2thZ2Uvc3dpZy9zd2lnLm1rCj4gaW5kZXggNzFlNWUwNWY5Ni4uZTI3
N2Y1MDQ5YSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N3aWcvc3dpZy5tawo+ICsrKyBiL3BhY2th
Z2Uvc3dpZy9zd2lnLm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPgo+IC1TV0lHX1ZFUlNJT05fTUFKT1IgPSA0LjEKPiArU1dJR19WRVJTSU9OX01B
Sk9SID0gNC41Cj4gIFNXSUdfVkVSU0lPTiA9ICQoU1dJR19WRVJTSU9OX01BSk9SKS4xCj4gLVNX
SUdfU0lURSA9IGh0dHA6Ly9kb3dubG9hZHMuc291cmNlZm9yZ2UubmV0L3Byb2plY3Qvc3dpZy9z
d2lnL3N3aWctJChTV0lHX1ZFUlNJT04pCj4gK1NXSUdfU0lURSA9IGh0dHBzOi8vZG93bmxvYWRz
LnNvdXJjZWZvcmdlLm5ldC9wcm9qZWN0L3N3aWcvc3dpZy9zd2lnLSQoU1dJR19WRVJTSU9OKQo+
ICBIT1NUX1NXSUdfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBob3N0LXBjcmUyCj4gIEhPU1Rf
U1dJR19DT05GX09QVFMgPSBcCj4gICAgICAgICAtLXdpdGgtcGNyZSBcCj4gLS0KPiAyLjQ3LjMK
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
