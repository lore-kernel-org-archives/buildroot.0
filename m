Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D6CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC72580BCD;
	Mon, 28 Sep 2026 21:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMPlt4CyF7qz; Mon, 28 Sep 2026 21:01:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2F7CF80AF9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629284;
	b=aHS4DHuZPiu6C+piekaeaZxsSCLJ2t9P7mfPcisto7Lp+ka4WRKQpaI6tSRkqB3O65Fj
	 psLbX01ER1LAZYUK214W6twYaIbYy8ctmgmJUMv77mRT1hXTukIwJNbTceFWYlyTqOHiM
	 v2mTSM6dPNXUEoL2khk7bpO3xJ+WAdvBG1v7E+kCqTdnaSHNt1jML89nzVlDwMMlpEOiT
	 x2gYe5XC6eEggTqD6QPjIy1UlQ2eQOyCjNiuXPZaOOxzdXqol0zaiVpPFs7k+lxposcC+
	 UrFtFBFYf7UZe80GtD1BiLXJHYnp0gbXiL3roCoDvVYaLUsHoLc5XfQ212DHP/jIZuw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629284;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=uezb+ny2855MxNAxpt+up99QS/xoZJiQo7g8T2D0itk=;
	b=PYH44OTnFb1znFzxMw+FKhLSSUCPl/0IqmCBg5B/rv971w10IXuEr0QkLAgLZ1Zd8SbQ
	 2R0radDvlxbkOsllRANF43ErPRCU+UQV5HFie9BCrHDo6GmwSBIFTN84kU1gCFSa5DSAi
	 GI8xVu8g+EpqDRJdSsf9rWSna4DstB/awlbDfsn6qQoryXbf3kOJ7XHkckHbLXje8pOtD
	 pXh8mv5EL5YmK9BcbxHAzhMRTYkV0syiE6zf8kdV/I9Hoayr3Os9sW0O9WRkFLfdKmrRO
	 ZQzrUX5EjMhHFAfz9kxiSjAdoyAaAGlAlq3KExMbE0vJYSnJooVU+iu7njkHXa+SwiA==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; dmarc=none header.from=j-ernberg.se;
	dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=VLtVA2c5;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629284;
	bh=uezb+ny2855MxNAxpt+up99QS/xoZJiQo7g8T2D0itk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EycdP7x8RGKXVaw0nv8bOFh6g88EUKCH2PidoNzOABB3BU5iEtuVAHsjHJV+QPnhS
	 3ktdNb7vh6GmaiQpR3L6Ph+vO5/FHiI/VnRzkqqI681ERRrGO7EX8OlvAdBa9sun40
	 0eW3xeiyPIBs2ePAQJ67GIa59wXbRSKJv0Vf2Gt6Z67DPHV3QSOs+nXQeA2x7I3Oav
	 8plZ8d8oRDd8RQ6fJM6QdkXRSFhMPfoAXujFYTEa6FXvmhjCEQ7L11Hr3dVg5FoM2i
	 K7gIWSyG47gWWG876SZoKpe+dMyg5bZaf7y7s4eWWHPDR4ryz8Z/tb97BWDq95S8rM
	 N+6cBQecxFaRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F7CF80AF9;
	Mon, 28 Sep 2026 21:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D24AC72
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B479F80AF3
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdcWzNA-10_Q for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:01:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 313C480AF9
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:36::d"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790629280;
 b=n3SpT5eSWCowBQHVSAHlf9F5sPAMZa5NX/EpNlYeGlNtQawer5v7Z4NuMxFDQCPgo7xE
 qT0wo04WfMJ/nt1Ea8XKzyMhGOSMb8W42n1gfmBo3/AwdYhqRcWNs/QrxUw1xawovIsQK
 qbw5pCmljG4n1/E4NPRaM2sD7f43Ju/7j+nOXT4+RyQhgktlEps+PZ6EamC4vCH6c8iNg
 qk5YtRBvkfJVaRfiU3CJWhyB6VgAtPGqXzEYMBtFrSBzp8wWM7ZGck8zE65Nfs+gpWJHM
 724KV0OtLEatw/3ppUm98lAdxyvwiPR7AZGvsPL7XQPvpsIMlc8VHATH0ZlwY1NPLJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629280;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=MnvWvAP+LH8N9rCa9+4ykGGj+VHWdA8bwTi5l/lzDHQ=;
 b=qwhzORBjyNwiCPYycRsBNrpf4GH5f45VsQiZnvmD8lyxlUnlykIeNAEbBcpQhUEvJk3H
 TIifFEJab7N6srze96NTbaAVu0Jd7yE7nLErDjKUyKWZyHS/VYTMwIt86ZIR+JliMDXc+
 yx8QwjFTia0alVfY7q5c+LfStAOhlSO4FkMIZdo/30AqrHHzAT43V9D/jHDczwMlMKkBa
 UvY/elLyHAojF579TMlKh7OZsggyd7Xv86nayc4/VVgyVtla+kK4luqI3hhBvYB1JMxUk
 93wDoKs/bBhzS9PD0QbTEwfYNcr3j/NSDJwRNZdcKC6IT5qBkQPR4HmESkjTrr7XI4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=none header.from=j-ernberg.se; 
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=VLtVA2c5; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:36::d"
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:36::d;
 helo=mail-dy2-x0d.google.com; envelope-from=j@j-ernberg.se;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=VLtVA2c5
Received: from mail-dy2-x0d.google.com (mail-dy2-x0d.google.com
 [IPv6:2607:f8b0:4864:36::d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 313C480AF9
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:01:18 +0000 (UTC)
Received: by mail-dy2-x0d.google.com with SMTP id
 5a478bee46e88-3468ec308beso1226701eec.1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 14:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790629277; cv=none;
 d=google.com; s=arc-20260327;
 b=FwT/kXm6sbaMsa7qij+uHwzed2q9x7+LQUl+htazvRh+YAlQ0ToBON2OterOc1R/QY
 Q4qu13NXFMROQRUsdkcb4L4N/uepwNez7eaZc0y8A+GLesw93tvRyAqOFyRHtu5Iti6O
 NqTxEZUQpLX83Aef7pNvQOuE1RZW4IorYhYFyaGqsmzvOQrOLkfKIUmzGxG8eTkGdg6c
 yr0ngbzZ6AxI9HvvBFG4DKEKF1b7RupUxpM04ut+vTY/qvIpF+6lVRMT4ryRctVtu79I
 drCAbvM99xzpMQ74LV1d0LP+UThMWL5r4apDvRiHtmF1prcM/plbtthlftAjpzbNXB2y
 69rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MnvWvAP+LH8N9rCa9+4ykGGj+VHWdA8bwTi5l/lzDHQ=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=nFfLSWXY/TzBapEjs/B+I8PwVPVRImLal8eArbErRA0NzFhDrdAEenMoTWRaBPfW5I
 ye6yTC+aBOdGf96xTEr8Ne5Sf0tPpCWHX7XBF333F4s5yD17MEwdQdIPMxhPYdEyzYt5
 7/fX1VhM+XirExaH+VQ5MVhW91auSdJhP0GxPfEfcIo+HCNfflxxB/Xcs5oJwQNh+G1g
 UEsRYgKFz7hQUEPnPbO5YKAImIoFh71n2kZg8h6RRPxyO+D8fvh74wRPBJYj/pLVYygY
 nmYT3mT4d7REO1uOL20ev4ZaxHxbeVmNd2x9c+FvEmhCzC6Z1Urc0MrXlf9O2tMFB7Me
 DBqA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1790629277; x=1791234077;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MnvWvAP+LH8N9rCa9+4ykGGj+VHWdA8bwTi5l/lzDHQ=;
 b=VLtVA2c5bBRGl9bFzqk9UHeTQdel1ZgCGKbtevP0S17BPIowkkcML1BHJAx0XX+EkH
 h9Wa1FRLXJ+bedsMt+3Nhy1JrVN3OV8Y0844tgHazlHsYfeb0VLkzvqhhsP+mxJ7keyz
 d2V0RudCcTIs/1/ipms9wDMQuqIx0kE3NksXXL2IgyEH0iL/8npd5o+5YqZdFyx657Hg
 J5kvy3VlB7E1N/Rg+NB1YfmsvizVRneGYkF1V+3POYo2gOlHxarGhru+wG7EPK1a3BNT
 PuhGVT2+7D3+26qa0q9WvF3DV9ogvMjG2fAdtLdIocWi2MEiCeXi8zSlKabBGxJxCHcW
 VRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790629277; x=1791234077;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MnvWvAP+LH8N9rCa9+4ykGGj+VHWdA8bwTi5l/lzDHQ=;
 b=18gtU6pyM7ZKK6lue/tJF4hazPI7rM2rjiUuhAZhKHC5A/fTODBsUOkvJv+mZ1VPMo
 BNuogQtGG+vQHxxwy/6Prm3sSya5egSlThKDty2Q7IXDm6xUX6pza56gbNsYU2zsJIo4
 ShLwWzfyQpEp1jF6OMbeBy2vWJ8j2s3LTMDz5JiYUrKj2mFB+5ivX0uX2FSVHVykI13n
 sSdvxZIddg8dWBVYIwgUsy81bn9pgYILU5Brrl2EIN6W+soE/1lMx1xTYOQ55ch89Hp5
 bTos5L1GfFQFrDB4Aupx5w+4/E2NAr0nkxrUZ8evR6r67BUo+p12YlvjqpJEtIxHTRDq
 doXg==
X-Gm-Message-State: AFuF++lfILRrnxCeUCq5v60KACbF96ZGIQT+sUhL3NYoJ78xaQ38RSHa
 OmVWoTh9kojWxRc0i/TJLwv8By39Pxzym37cUe/HbJOaAfiPjOKRIwfB5WMB291MJkQHWv3Q8u0
 31Fdfv61BFZlSIBp+ksMtCB4hwZfZySu/mWe4KY1mW4MozXCUp6hUxJbIUQ==
X-Gm-Gg: AYBFou3f8WynqRyk71UKvHdFf+uuYWA/L7et6twDCizxmOt830C1YAugYyHnap1r8E+
 hXgaNGTagIu228sht+6ud39oJTlC5pZ09uXO8FSrXMRYsIrGX2vU5xIg65DegEWXNqDoDhsAzx+
 7F1adtNQSmjjPMEgmJAFf9trZYg5rZTTrREiqzXdLY87a6fHBMyFIZ12cW7j+R/ItGGWtje8CXx
 uefJD7OSCuJLa08IfteIcdIRg/hQo3yD8yFdAeAXx40xOQUXGgzV137M0ODCyFpvt9yCiFUYtzH
 fTzeoMhtfJ4GfMqsj4nqGYTylW/Ui5vsHslPGrfuzAABqioFKo7cdQVlL8aPRAp4OavMTYHlczn
 UEdQYGQPweyi+djFD37B+O0+Ij4nwvZy7NeFEX5CBUi9GGDgq85s=
X-Received: by 2002:a05:701b:20de:10b0:143:2974:bb05 with SMTP id
 a92af1059eb24-146cffbdab6mr11344928c88.31.1790629277168; Mon, 28 Sep 2026
 14:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260927204842.1113860-1-j@j-ernberg.se>
 <20260927204842.1113860-2-j@j-ernberg.se>
 <aropi3gsdof7NK3g@windsurf>
In-Reply-To: <aropi3gsdof7NK3g@windsurf>
From: John Ernberg <j@j-ernberg.se>
Date: Mon, 28 Sep 2026 23:01:06 +0200
X-Gm-Features: AclHuK_vtS-Vx-4L1wlV5amkRdp5-IOYr0ywEJmM2fzztLNgyIOPgXQltIhMl_c
Message-ID: <CAAHg4ZgEo9_KMJ1dq5jnLrUuhF2w-1fWPqqhK8+tsT+FNc92Pg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: glx
 depend on mesa3d{, -headers}
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

SGkgVGhvbWFzLAoKT24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgMTA6NTDigK9BTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIEpv
aG4sCj4KPiBPbiBTdW4sIFNlcCAyNywgMjAyNiBhdCAxMDo0ODo0MVBNICswMjAwLCBKb2huIEVy
bmJlcmcgd3JvdGU6Cj4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3gxMXI3L3hzZXJ2ZXJfeG9y
Zy1zZXJ2ZXIveHNlcnZlcl94b3JnLXNlcnZlci5tayBiL3BhY2thZ2UveDExcjcveHNlcnZlcl94
b3JnLXNlcnZlci94c2VydmVyX3hvcmctc2VydmVyLm1rCj4gPiBpbmRleCBkMTU5NmE4YTNmLi43
YmY5YjY1ZjU4IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS94MTFyNy94c2VydmVyX3hvcmctc2Vy
dmVyL3hzZXJ2ZXJfeG9yZy1zZXJ2ZXIubWsKPiA+ICsrKyBiL3BhY2thZ2UveDExcjcveHNlcnZl
cl94b3JnLXNlcnZlci94c2VydmVyX3hvcmctc2VydmVyLm1rCj4gPiBAQCAtOTksNyArOTksMTAg
QEAgZW5kaWYKPiA+Cj4gPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9IQVNfTElCR0wpLHkpCj4gPiAg
WFNFUlZFUl9YT1JHX1NFUlZFUl9DT05GX09QVFMgKz0gLS1lbmFibGUtZHJpIC0tZW5hYmxlLWds
eAo+ID4gLVhTRVJWRVJfWE9SR19TRVJWRVJfREVQRU5ERU5DSUVTICs9IGxpYmdsCj4gPiArWFNF
UlZFUl9YT1JHX1NFUlZFUl9ERVBFTkRFTkNJRVMgKz0gXAo+ID4gKyAgICAgbGliZ2wgXAo+ID4g
KyAgICAgJChpZiAkKEJSMl9QQUNLQUdFX01FU0EzRCksbWVzYTNkKSBcCj4gPiArICAgICAkKGlm
ICQoQlIyX1BBQ0tBR0VfTUVTQTNEX0hFQURFUlMpLG1lc2EzZC1oZWFkZXJzKQo+Cj4gVGhhbmtz
IGEgbG90IGZvciB0aGUgcGF0Y2guIEhvd2V2ZXIsIHRoaXMgY2Fubm90IGJlIGNvcnJlY3QgYXMg
bWVzYTNkCj4gaXMgbm90IHRoZSBvbmx5IE9wZW5HTCBwcm92aWRlci4gQlIyX1BBQ0tBR0VfSEFT
X0xJQkdMIG9ubHkgdGVsbHMgeW91Cj4gInNvbWUgT3BlbkdMIHByb3ZpZGVyIGlzIGF2YWlsYWJs
ZSIgYW5kIHRoYXQgImxpYmdsIiBkZXBlbmRzIG9uIHRoaXMKPiBPcGVuR0wgcHJvdmlkZXIuIEJ1
dCB0aGVyZSBhcmUgcGxlbnR5IG9mIE9wZW5HTCBwcm92aWRlcnMgd2hpY2ggYXJlCj4gbm90IG1l
c2EzZC4KCkxJQkdMIHNwZWNpZmljYWxseSBpcyBvbmx5IHByb3ZpZGVkIGJ5IDMgcGFja2FnZXMs
IG1lc2EzZCwgbGliZ2x2bmQKYW5kIG52aWRpYS1kcml2ZXIuCkxJQkdMRVMgb24gdGhlIG90aGVy
IGhhbmQuCgpIb3dldmVyLCB0aGF0IGRvZXNuJ3QgbWF0dGVyIGFueW1vcmUsIGR1ZSB0byBiZWxv
dy4KCj4KPiBXaGF0IGlzIHRoZSBmYWlsdXJlIHRoYXQgeW91IGFyZSBzZWVpbmcsIHdpdGggd2hp
Y2ggY29uZmlndXJhdGlvbj8KCkkgcmVhbGl6ZSBJIHN0dXBpZGx5IGZvcmdvdCB0byBpbmNsdWRl
IHRoZSBlcnJvciBpbiB0aGUgY29tbWl0IG1lc3NhZ2U6CgogICAgY29uZmlndXJlOiBlcnJvcjog
UGFja2FnZSByZXF1aXJlbWVudHMgKGZpeGVzcHJvdG8gPj0gNi4wCmRhbWFnZXByb3RvID49IDEu
MSB4Y21pc2Nwcm90byA+PSAxLjIuMCB4dHJhbnMgPj0gMS4zLjUgYmlncmVxc3Byb3RvCj49IDEu
MS4wIHhwcm90byA+PSA3LjAuMzEgcmFuZHJwcm90byA+PSAxLjYuMCByZW5kZXJwcm90byA+PSAw
LjExCnhleHRwcm90byA+PSA3LjIuOTkuOTAxIGlucHV0cHJvdG8gPj0gMi4zLjk5LjEga2Jwcm90
byA+PSAxLjAuMwpmb250c3Byb3RvID49IDIuMS4zIHBpeG1hbi0xID49IDAuMjcuMiB2aWRlb3By
b3RvIHJlY29yZHByb3RvID49CjEuMTMuOTkuMSByZXNvdXJjZXByb3RvID49IDEuMi4wIHhmODZk
cmlwcm90byA+PSAyLjEuMCBnbHByb3RvID49CjEuNC4xNyBkcmkgPj0gNy44LjAgZHJpM3Byb3Rv
IHByZXNlbnRwcm90byA+PSAxLjIgeGluZXJhbWFwcm90bwp4a2JmaWxlICBwaXhtYW4tMSA+PSAw
LjI3LjIgeGZvbnQyID49IDIuMC4wIHhhdSB4c2htZmVuY2UgPj0gMS4xCnhkbWNwKSB3ZXJlIG5v
dCBtZXQ6CgogICAgUGFja2FnZSAnZHJpJyBub3QgZm91bmQKCiAgICBDb25zaWRlciBhZGp1c3Rp
bmcgdGhlIFBLR19DT05GSUdfUEFUSCBlbnZpcm9ubWVudCB2YXJpYWJsZSBpZiB5b3UKICAgIGlu
c3RhbGxlZCBzb2Z0d2FyZSBpbiBhIG5vbi1zdGFuZGFyZCBwcmVmaXguCgpBZGRpbmcgdGhlc2Ug
Y29uZmlndXJhdGlvbnMgdG8gdGhlIHg4Nl82NF9lZmlfZGVmY29uZmlnOgorQlIyX1BFUl9QQUNL
QUdFX0RJUkVDVE9SSUVTPXkKK0JSMl9QQUNLQUdFX0xJQkdMVk5EPXkKK0JSMl9QQUNLQUdFX01F
U0EzRD15CitCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfTk9VVkVBVT15CitCUjJf
UEFDS0FHRV9NRVNBM0RfT1BFTkdMX0dMWD15CitCUjJfUEFDS0FHRV9YT1JHNz15CitCUjJfUEFD
S0FHRV9YU0VSVkVSX1hPUkdfU0VSVkVSPXkKCkFuZCBpdCB0b29rIG1lIGEgd2hpbGUgdG8gcmVh
bGl6ZSBpdCdzIHRoaXMgZXhhY3QgY29uZmlnLCBiZWNhdXNlIEkKb3Zlcmxvb2tlZCBob3cgdGhl
IGxpYmdsIGRlcGVuZGVuY3kgYWN0dWFsbHkgd29ya2VkIHNpbmNlIHRoaXMgd2FzIHRoZQpmaXJz
dCBjb25maWd1cmF0aW9uIEkgdHJpZWQuIExJQkdMVk5EIHNlbGVjdGVkIGlzIHRoZSBrZXkuCgpJ
IGhhZCBpdCBkZS1zZWxlY3RlZCB0ZXN0aW5nIHNvbWV0aGluZyBlbHNlIGluIGJldHdlZW4sIGFu
ZCBjb3VsZG4ndApmb3IgdGhlIGxpZmUgb2YgbWUgcmVwcm9kdWNlIHRoZSBpc3N1ZSBhbmQgdGhv
dWdodCBJIGhhZCBnaG9zdHMgaW4gbXkKbWFjaGluZS4uCgpTbyB0aGlzIHBhdGNoIHNldCBpcyBh
bGwgd3JvbmcsIGFuZCBzb21ldGhpbmcgaXMgbm90IHF1aXRlIHJpZ2h0IHdpdGgKbWVzYTNkICh0
aGUgb25seSBESVNQQVRDSF9HTCBwcm92aWRlcikgb3IgbGliZ2x2bmQuIFNob3VsZCB0aGVyZSBi
ZSBhCnZpcnR1YWwgcGFja2FnZSBmb3IgZ2wtcHJvdmlkZXIgcGVyaGFwcyB0byBjb21wbGV0ZSB0
aGUgZGVwZW5kZW5jeQpjaGFpbj8KClRoYW5rcyEgLy8gSm9obiBFcm5iZXJnCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
