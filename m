Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC6DCC6B1D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 09:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0850D607C2;
	Wed, 14 Oct 2026 09:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLjdpeuIQKil; Wed, 14 Oct 2026 09:36:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 103C8607ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791970603;
	b=MRvX96fBT1e9HgVxVIqyoZTVCUYg5Zgj5fY6ol9qDDezbUHYR6Q6g3Zt91m60vzD+DpL
	 AMxG7UEFwEIVJdOku1RhOhpb5vC8YLM+3K5aAARv1Uh3BCojX3/uLl+WaNlkEP4LZSLkH
	 PGIzFzBPHisRpkFzb5giorrGXmXTJBNfMAKWwEiNQoLtEu2D48IEIYNDG9oIPu5SmEpLD
	 EEHOFiYyvbzUeHLXAyq94st1e3uh0wV1xHkXnSrxnyqISfG6N3WMS5cTnPxCWYwKsJM7i
	 c1mFy077SaQIp5wReFPOLqlbGarqiqpdA6ZNQJ67iMtdewyU/zHsVJeneR0z2jKOnyg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791970603;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=je732CXuzFeGV2abUci5+dTLT9KerVpRNviy5QCt9AI=;
	b=eJm/gJ9X/dDmW4RDNKBgoeWrUsY3RpKsYgFfyILEzqoJLPGqVqHlgufBBUzc+HpyRbvi
	 kDfFB2t8iToFoBypZ+Xes3Dm0k0T3CTUyn3dfyRQgw/dO9/utI1K1BwiJeuhu9yoCc0AB
	 67CKa5UcpaOE4gY8vgAHncachN4uD3IqNLJWjYKMpw+6mnEijFg0G1ZZTaeZGDfol+jti
	 X/kFol9ttOEJQ9Sg8CPtS0O7EM5I59svJzl+WXyd19qFp5YvcdwIk47nHuLYSDeEFrHuX
	 Q5rZuIw2A8DDEYA96KFNulwtUaMkVT6NHwSWOFSnX4g1n/ShCfMIy2Cl235N5lvdysQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791970603;
	bh=je732CXuzFeGV2abUci5+dTLT9KerVpRNviy5QCt9AI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mS0GsVTWg3+iw9VOELi2gtVhdR3H23G2VKuCmxZGKTLdnAO9BTmcQvMaaukS9XmQf
	 dQqwcgm5dbH5xSFd5ULdVfgpcGfnqPaekq9N01yG/iuB8mzyBQtILkyZ2NrRyYbw3h
	 WK5FL7eQi6QVFw+PuBrHa6UziFvUNiMfOcGMD8R4TuH473oP085YWxHjcJBcBZiwHN
	 P4v8vvdqlqiF43LBEZj61ID5gJShlpolhRgtRQ7L8oBXXI7Y+vA1chJk1rdhEk0E3a
	 4g7FmjzhXNeCsSY9VypgNgnH9eWBzhwU0jL4rJw1+6xyJYExmiTfJSuZw84y5fZqWK
	 f8f6cXylEUXaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 103C8607ED;
	Wed, 14 Oct 2026 09:36:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 362512AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 09:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BEF340079
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 09:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OY_5vOlSzbFX for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 09:36:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 371AF40080
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791970600;
 b=dSX82WzSr39cdh50ZptMbXsC+M+lKOGRYQR+B14JpCUhtuzbGOPNv9oNwjnK6lxwm83s
 bcdpkf159JJoz+0Kuq51rpPccQIIh1OGhhf5Dwq5MRSsF9xtZiXL43z0brbebqPQIfWld
 V6KbMccBjgiRJeJIYn6zpgnggkB8NO2D8EXpTLNWxekkt//fNOjEFw9v3P+DZR2ZJGMRm
 QhruJzEHmfrOpBRPQJsJsyzx9Wr5CGSVQ2xin8jCZZuTUs6lzjHXD3FFnLq0eEcBc0HlT
 yQ9UWzg4zy1tiksKBh1w6eiJAKqIRjlw2M9NbFmA9vx7FOQAlLvdJZhRuZZZ/3JkrjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791970600;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=rMd6UCNXkdia/HDbH/vq/XsPD2DcEgMg6Nzl2l5BiLQ=;
 b=XI1hSxu7jCnWmOu5D8oUYkH+cXwYiEbmHBlBtrrM1OcRKoluqXVBCmvsqDTxuJa58uSn
 gDOjeb2Fz8qwK0iYFAZMo1f804CEvai7CvDH+1ftKVLonPlcVT1GJ/eI9W6fR+k/w2BoL
 3p3fKWCq7EpA1fc3sdmLYFYsf7FP6wFpzp3zMIZJj0BFoH4mSBr46HEgqkMsyB6MErImX
 52b8znNaTMa8IJweM3omFX1Y1JrEdCbLFc8xk3oKPzSOw/THU0uBjgB/iheKcuYkUApu5
 bnkFin4/6pnzd721Z2oYWbPwna3vOo6Dagr1HXC0iPKoyps9XZQjZWQo/VPK9cuLlng==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sVZ8PVnf; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::1034"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=aduskett@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sVZ8PVnf
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 371AF40080
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 09:36:37 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-38e42560ebcso91248a91.1
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 02:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970597; cv=none;
 d=google.com; s=arc-20260327;
 b=CmRx/hQDT6BjLLvj9DXyQ5LCRUo0oRHYVzDG5S/mo/GT5/Wwn9Q4omBoyR2aTMWNrw
 WHAwiSfR2jxSf80ABP10ztUpU0UTf/MLOf0ca48/iA8CWGT3FrQ91E+P4VnDcuFOYjx8
 qsf3snAg9FQFkjXRsSFYZt0FGOMelx19sHlgFyTW+3jS+ObrAu2BTtFDO7iHo1L5V4gG
 V7KIm7FJ9t99RzhZKVz6OwY7yU5yEn7DMy18ERvHpHa6y0KUWqyOzocr4mJvG/ml1aJH
 eL/Yp3B4ahLHiof062hxSSpSVychmqNCE8USzFBaOLRYMnm8LI37w1seNcVW4UGVbn7l
 bWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rMd6UCNXkdia/HDbH/vq/XsPD2DcEgMg6Nzl2l5BiLQ=;
 fh=HenTjjLop2hJkO+RjRqnFvH+olfQwXXCYKocq7cQ3Ns=;
 b=lMx/w29hFvItNkl9jkUXoNFZCA/T9wEwVK7aT6rkzr7Z06OoBCqX1rikyFVC7FdLll
 iPHvkdjQ6D7BZr1FIpoImOBthhjD4aYzkp2DxaROIX0siwW8JC52tCA5q0Lj6oNthPtO
 Qq1LN/PIAI+PGGlZIErj54zyKEZY+Fk6S4WrMF39YY2yeKwMoBB5/sVKs8lKKTAMI1Kq
 ytRMLJtpdCrskBFVYe0fW1p4kluNarfEfVgoceSHsOF1fh6eU9uSqbwfKJi65rp1T4Wy
 3ynnE0Eu+PgoPaqo/MC+bYa4n52+zIsnMOWStLJErSA+PsL7yzkFNWbMcmfVDyjcbZa/
 q3Aw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970597; x=1792575397; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rMd6UCNXkdia/HDbH/vq/XsPD2DcEgMg6Nzl2l5BiLQ=;
 b=sVZ8PVnfdM6gmat13qvnn79MO/0ETHHQWCXXppE6voqMvTn4elO+697kK8PsNresnH
 uyfwBOIG2LabzyPTB6hwDYIVaVeEOj36L/ETKvwidoj6I2vTrQFu9tKHIIsY+Zyy8HGx
 nMo7/uPM23AskbY5PU9ydRyVRQMUyy8dPur4+v07paThpRUpBbOB8MgxkG5jNjAdq10t
 48UbrWnf34SLWJGKhLduOPJ8kn0bOOHoCUfcrK/Gjulrc1UgVi+JS/v/Ftmxm6bM2w9F
 +zrdLvHR/EuMlyOf5ne+A5uJe1eIkdJEUUos9RzFdd7vm6G4H36ts7egvIKPnon7pfKz
 kpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970597; x=1792575397;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rMd6UCNXkdia/HDbH/vq/XsPD2DcEgMg6Nzl2l5BiLQ=;
 b=MEGgyoTmx69tKR24+kDYIDSy0EZoCWzbsHGRXGAGekCfwI0hqvQyBd/uOj8tfiGqu4
 QJhwHLkxTcPuM91GIbJInBs/XehpyUD5etKiAhreo/2R8Pqu1Vj8+B3B1T2OySB5cJgc
 iCMLshxNqoWcLbLD+vWSjU4palCTuI7s8jLbtK9lTPaK+ae+nXZkSLjFBUZ02HQH5Jwz
 llbCKJrfLOKMC51nzC711fzbODb1eDs179DYZIt13IScI+h61GjQd3Mo1xvuxLQ5lEex
 zdbQuUHdb++xLo2bOyT+MdsXcfVglKMJY3b3DIcIhk3RsSZFVknk+H6Jw014GTcuXco0
 VyyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxTFEzubiF2EV4Jl7LN6BERYGrnFb1rb5PRttINaOOIDDaInsVeFBZlZuTURWambO4yCKgNOz9fry4=@buildroot.org
X-Gm-Message-State: AFq9FYKqhwGOo/ejffLIj1PkrAFV+ft5WKnzf6Wb2h/UIwYhcD0xToGh
 w/pAgK/tXwJbpEfVG0VIO6AbH7UXOHzX3HcP7k7P/gWxuFejhyK2fxQaGFHKWuKPE96yWWUSh9j
 0TNKMJiRUgKpIfD5R/mg4wlfgJ8d6l40=
X-Gm-Gg: AYBFou3cKz5hXk9ZhqQJQ+r0PQIyAIGWbr7emI3DYqsHEk5lAf581tw7yZTIYIUel49
 DDn9U+bGGREElNq7dkOyycgwLGg11M4I20i/SZ6/DQYt3KvzCj2DIdXTNVOexy/68yTVoa802m1
 C6kLe5fKb5Ty44avE/Nj4fHDSA2BHIHC3KutxRkwU20ZySL3P/3c2wY1TXTuyufPU8u5SDYSoq3
 GtkETFUd9MXn14qJ4IHxDrXeVhwioe4kA9lTj8serqPaPxncVr1hrxpAYmu7DHXY+jCHyMbzqv9
 oSPtBlq1ucAaKEsi6bna0QLF5Ao1A1IE/6/8z+K1IOpbcnwL8vDEVrCj+2Ge8DhN+ZPwLLixf3z
 DB3mSFyKflnCP
X-Received: by 2002:a17:90b:4fcd:b0:3a8:9751:14de with SMTP id
 98e67ed59e1d1-3ab3a747d85mr12690370a91.10.1791970597122; Wed, 14 Oct 2026
 02:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <astWTS0c5f7faDcX@windsurf>
In-Reply-To: <astWTS0c5f7faDcX@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 14 Oct 2026 11:36:26 +0200
X-Gm-Features: AclHuK_ZHsqe7-vzqSEuEa1IoKmzsyx5DTh0BXFjfzz_QjTXTOH6aa_8jMZT0a0
Message-ID: <CAFSsvmqvAXmxjzA_Qhye5dqPiSpFEdXN30xBnacU81eVOQHgeQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Subject: Re: [Buildroot] flutter-engine build failure
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

SGkgVGhvbWFzOwoKQXQgdGhpcyBwb2ludCB0aGUgZmx1dHRlciBwYWNrYWdlcyBhcmUgc2V2ZXJl
bHkgb3V0IG9mIGRhdGUsIGFuZCBhbnkKdGltZSBJIHN0YXJ0IHRvIHVwZGF0ZSB0aGVtIEkgYW0g
ZWl0aGVyIGRpc3RyYWN0ZWQsIG9yIHNvbWUgcmFuZG9tCnByb2JsZW0gY3JvcHMgdXAgdGhhdCBz
dG9wcyBhbnkgcHJvZ3Jlc3MuIEFzIHdlIGRvIG5vdCBoYXZlIGFueQpjdXJyZW50IGN1c3RvbWVy
cyB0aGF0IG5lZWQgYW4gdXBkYXRlZCB2ZXJzaW9uIG9mIGZsdXR0ZXIgSSBoYXZlIG5vdApoYWQg
dGhlIHRpbWUgbm9yIHJlc291cmNlcyB0byB1cGRhdGUgdGhlIHBhY2thZ2UuCgpJZiB5b3UgZmlu
ZCBhIHNvbHV0aW9uLCBvciB3YW50IHRvIHVwZGF0ZSB0aGUgcGFja2FnZXMgb24geW91ciBvd24K
YWNjb3JkLCBwYXRjaGVzIGFyZSB3ZWxjb21lIG9uIHRoZSBtYWlsaW5nIGxpc3QhCgpBZGFtCgpP
biBUdWUsIE9jdCAxMywgMjAyNiBhdCA3OjUz4oCvUE0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVp
bGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBIZWxsbyBBZGFtLAo+
Cj4gSSBhbSBjb250YWN0aW5nIHlvdSBhcyBJIGFtIGZhY2luZyBhIGZsdXR0ZXItZW5naW5lIGJ1
aWxkIGZhaWx1cmUsIG5vdAo+IGZvdW5kIGluIHRoZSBhdXRvYnVpbGRlcnMuIEl0IGdvZXMgbGlr
ZSB0aGlzOgo+Cj4gPj4+IGZsdXR0ZXItZW5naW5lIDMuMjkuMiBDb25maWd1cmluZwo+IGNkIC9o
b21lL3Rob21hcy9idWlsZHJvb3QvYWxsL291dHB1dC1hbGwvYnVpbGQvZmx1dHRlci1lbmdpbmUt
My4yOS4yL2VuZ2luZS9zcmMgJiYgcm0gLXJmIC9ob21lL3Rob21hcy9idWlsZHJvb3QvYWxsL291
dHB1dC1hbGwvYnVpbGQvZmx1dHRlci1lbmdpbmUKPiAtMy4yOS4yL2VuZ2luZS9zcmMvb3V0L2xp
bnV4X3Byb2ZpbGVfYXJtNjQgJiYgUEFUSD0vaG9tZS90aG9tYXMvYnVpbGRyb290L2FsbC9vdXRw
dXQtYWxsL2hvc3Qvc2hhcmUvZGVwb3RfdG9vbHM6Ii9ob21lL3Rob21hcy9idWlsZHJvb3QvYWxs
L291dHB1dC1hCj4gbGwvaG9zdC9iaW46L2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9hbGwvb3V0cHV0
LWFsbC9ob3N0L3NiaW46L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91c3Ivc2Jpbjov
dXNyL2Jpbjovc2JpbjovYmluIiBQVUJfQ0FDSEU9L2hvbWUvdGhvbWFzL2J1aQo+IGxkcm9vdC9k
bC9ici1mbHV0dGVyLXB1Yi1jYWNoZSBIT01FPS9ob21lL3Rob21hcy9idWlsZHJvb3QvYWxsL291
dHB1dC1hbGwvaG9zdC9zaGFyZS9mbHV0dGVyL3NkayAuL2ZsdXR0ZXIvdG9vbHMvZ24gLS1jbGFu
ZyAtLWVtYmVkZGVyLWZvci10YXJnZXQgLS0KPiBsaW51eC1jcHUgYXJtNjQgLS1uby1idWlsZC1l
bWJlZGRlci1leGFtcGxlcyAtLW5vLWNsYW5nLXN0YXRpYy1hbmFseXplciAtLW5vLWVuYWJsZS11
bml0dGVzdHMgLS1uby1nb21hIC0tbm8tcHJlYnVpbHQtZGFydC1zZGsgLS1uby1zdHJpcHBlZCAt
LXJ1bnRpCj4gbWUtbW9kZSBwcm9maWxlIC0tdGFyZ2V0LW9zIGxpbnV4IC0tdGFyZ2V0LXN5c3Jv
b3QgL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9hbGwvb3V0cHV0LWFsbC9ob3N0L2FhcmNoNjQtYnVp
bGRyb290LWxpbnV4LWdudS9zeXNyb290IC0tdGFyZ2V0LXRvb2xjaGFpbgo+ICAvaG9tZS90aG9t
YXMvYnVpbGRyb290L2FsbC9vdXRwdXQtYWxsL2J1aWxkL2ZsdXR0ZXItZW5naW5lLTMuMjkuMi9l
bmdpbmUvc3JjL2ZsdXR0ZXIvYnVpbGR0b29scy9saW51eC14NjQvY2xhbmcgLS10YXJnZXQtdHJp
cGxlIGFhcmNoNjQtdW5rbm93bi1saW4KPiB1eC1nbnUgLS1uby1sdG8gLS1lbmFibGUtZm9udGNv
bmZpZyAtLWVuYWJsZS1pbXBlbGxlci0zZCAtLWJ1aWxkLWdsZnctc2hlbGwgLS1lbmFibGUtdnVs
a2FuCj4gR2VuZXJhdGluZyBHTiBmaWxlcyBpbjogb3V0L2xpbnV4X3Byb2ZpbGVfYXJtNjQKPiBF
UlJPUiBVbnJlc29sdmVkIGRlcGVuZGVuY2llcy4KPiAvL2ZsdXR0ZXIvc2hlbGwvcGxhdGZvcm0v
Z2xmdzpmbHV0dGVyX2dsZncoLy9idWlsZC90b29sY2hhaW4vY3VzdG9tOmN1c3RvbSkKPiAgIG5l
ZWRzIC8vZmx1dHRlci9zaGVsbC9wbGF0Zm9ybS9saW51eC9jb25maWc6eDExKC8vYnVpbGQvdG9v
bGNoYWluL2N1c3RvbTpjdXN0b20pCj4KPiBUaGlzIGhhcHBlbnMgd2hlbiBkb2luZyBhbiBBUk02
NCBhbGwgcGFja2FnZXMgYnVpbGQuIEknbSBhdHRhY2hpbmcgdGhlCj4gZGVmY29uZmlnIHRvIHRo
aXMgZS1tYWlsLCBpdCdzIG9mIGNvdXJzZSBsYXJnZSBhbmQgbG9uZyB0byBidWlsZAo+IGJlY2F1
c2UgaXQgYnVpbGRzIGV2ZXJ5dGhpbmcuIEJ1dCB1bHRpbWF0ZWx5IGl0IGZhaWxzIG9uCj4gZmx1
dHRlci1lbmdpbmUuIEkgZGlkbid0IHRyeSB0byBmaW5kIGEgbW9yZSBtaW5pbWFsIGNvbmZpZ3Vy
YXRpb24gYXQKPiB0aGlzIHBvaW50Lgo+Cj4gRG8geW91IGhhdmUgYW55IGlkZWE/Cj4KPiBUaGFu
a3MgZm9yIHlvdXIgaGVscCEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
