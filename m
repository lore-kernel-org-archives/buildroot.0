Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B40C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD17F6066C;
	Tue, 15 Sep 2026 17:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mg_UYI3t4Q1U; Tue, 15 Sep 2026 17:14:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A562C606F7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789492471;
	b=en2QZd+HrAn+93IzXyCC4QRQYYQpjfmPjnvKvZub/5Ypli6C5FcpOfCCclgtF0eifirl
	 j68x9+vAKEyDq3RtBKrcPeCkhZGi+a/NOm49HQJGVoFuR5FiHY02YQevS48iD9YKYQKJn
	 W5zCF3HYkKax9vdPYxWJ69d8zXVNWygjy6JoQAejq2SU9iRg6h98nD0wzrG8lBL7gh2Sk
	 QWPHK+uOHgBe/L/73Ryq90pxZwWM5jQkqyRHW2HX0eM27HxmcXNGDZegata4ogxyEei/E
	 73kOzTQbhRcBsa2jifc+4dxNhaDkCMRF/eM6oDOnn8Gv3kC4RD+eEoMiQ65ROVY8W6Q==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789492471;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Jv/eKiQOfp4pQfPhhVZqwL3ZKZsXwVYRF04Z+1WDau8=;
	b=HIgCHz4OoSDkc7db0/pD0KnP9D0uCsGAk35BMHAphVGvYxzr4ZGbLFuH6ovGirHEkbu4
	 EY7zf2I0SNTkkm/IoLmi6OfjHE6XYS36d5chCnqsjfQJre6O9FqYZQkLUbz9dOV8eW6g/
	 uuHqtx8ld7FjC9FRJhkAP5iHjQePy4R3ige2V9bUOcJDVIgVWRQSf99BETCTGZ29AYTX4
	 xJzrRtoy/vZbQytXcXFpsFs+noDpr+LsDWzmug2a3qCvH30EeWxX3EnCLQ1JCo72b8S0a
	 M73cVuUvTcxLZOfrmGX42pJ9Mk5Ggtwp0HpkoajC+8iAXwoKUx3teinnPtVkU1+s/VQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789492471;
	bh=Jv/eKiQOfp4pQfPhhVZqwL3ZKZsXwVYRF04Z+1WDau8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dB5dn9/eMxRAPEBeKPjp1WQ3Wg8tA3TuQQTA7mswCQAcTYk3mUerIn+3Gmo58IZDM
	 aJN4u2n6w57pLFFahBrDHW+/K+ul/efT2qLPocFEgJaEPOjyh7Bh7U9TL1ipsWASLL
	 dTjy8bL9LfpC15DWsH5kFuQFrbDxsM53NmgTOnuG15O66J9szLueYhxLaE4cp8dMAv
	 tqdP3wFzWxetJjYjmDBfqVDKI2CxLFK9W3PnnsCkJZbolj2KbBjWGq2BqK2t4xnsy6
	 Ueuc/SCcu3jnPGD/gZ1bAp2oGYKRfHY/gM5W/af1LsMijsFX6vHR39Kr1h/DOCaRtn
	 /ow7cfmsNsqLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A562C606F7;
	Tue, 15 Sep 2026 17:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EA5023F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 742B8404F9
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeN2n9z0Ah7G for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:14:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 619CE404EB
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:3a::10"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789492469;
 b=RUR4nJdLblYsG/dlLrfBpFHKPoYYUL+VueYdwnjheXX0mPSVh76owxBJcP2UA9NslnwY
 Rysk8hVQiETdqF6BqWpoi/b+bMKgyo01AOqcksHCwPA6EL/DyJTpAZrebtrrZWfGhx8dk
 +hzb8O1Y21gU4bgdugvsL1DNpkGMRR60kWchrS6VdbpOCc90NzYCTgcw3MvaLcnIdOQT9
 PpU6uq1ZvcC1oPXkG8sTwEuXQoMYHxPoKIML/1Z4aNghb2XpmGXXPVzJWk2UCTGqkdl8l
 1BmYxk2tuaivPwJTsxO1rZ1RSR961/uPpYAQYo5Xpzvq/GZmZmv2leYGewKmOUkidPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789492469;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=3yjn/2mwmESkiQqriOe1UB76O1BvW5QY0nqi3obvr3U=;
 b=XoojTdNebAHjVoxAekZLDbfQFAXNBk4GiC9e0XXE924F3gnFmlsC/QoQpEcvXAcJRXVw
 cbn+pAYgvjE6xvWEuXmnrvqpQBAdENeLfmoXAmi+KPSpSsiASvpbu5qsCZLuK5lS78nUc
 hwi+x1rlcTJRPa0R1hVuFVmm3WbEH/pPpxQxq2Ba4IkKZlgmow5zn2saAlxZ9g1Tw86Ro
 S72+FyqDQdUsDnAwIbj79IH/pRTIhHh2SnHWSA5fT8UtWcK3adj7Wwt7lqEGJW/26HOoA
 x8gMqvuKzxQ1cKljYwiY2PPhicBafcK8q+zv8t6lY9pXpdHYs3FRfEj/yVONwP8yCkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="pmgI2/7Z"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:3a::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:3a::10; helo=mail-vs2-x10.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pmgI2/7Z
Received: from mail-vs2-x10.google.com (mail-vs2-x10.google.com
 [IPv6:2a00:1450:4864:3a::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 619CE404EB
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:14:28 +0000 (UTC)
Received: by mail-vs2-x10.google.com with SMTP id
 ada2fe7eead31-7856441f7d8so318618137.0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 10:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789492468; cv=none;
 d=google.com; s=arc-20260327;
 b=RdVBOax+2A9VlKrP+cHRBC7luBWIDQUzRcAMg/i99onuHqrrORkK/sCAswS1diWpwN
 kIcgXFYntUv101Z1XqIF2uaZ4sEWf5F1eEllwnLBjlVh1UzkrG0mbhk12ggyJ8fqNWMl
 QuiQzM9TA1jGnNUMrzRIh1+xHXO4ZNRs7Hv3RaXJziVHoJ2CP2uxTgbUqM4Of8Z2WovB
 zk8sioSt7eNR8GOpj5Luz6khW2M54j2yA/+ImZJP2JXnmQgOUtgwdPbh3OorNdFIkodG
 kqihtuMu901744HI38YRVaK/52InK+/XCMZtrPZfJdftG3B//2AnTQTr4YE3TyXPU/he
 lP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3yjn/2mwmESkiQqriOe1UB76O1BvW5QY0nqi3obvr3U=;
 fh=cbzJwqa1/G06Noe/l78kroKjuU3+xaJA/PkbCFTgy/k=;
 b=Ki84c03kRTVqMKvBr+bd700jkeP6xrDuAekcFwxmWOvR81Kql+/ONGEZ+STdLVI25L
 f5k0ufBhkq7aPIzNeCc3VAwuOROKGAG+RuTyNIs4Cf36jGX6vqIYZO2nEFmSXssasLwZ
 OaHAzpMoCSibVCGnyBY7yzd/sq16eJGAK60KBNvQyyM5EqBjRNIUoSDn0eyuexlDSLWi
 J7XlXnfOVSwaMl65t5EfmvEeaax8T+xb9A3/TlyHoBzv8Op4+pcFgHXcqpdHg1vr9OVh
 5er3vU8dbGbVzcUpuSU7BZ2MbiIVd9rLb4GhkaI78eB0PgEQwwXEHR9H2h1CcpEBsJ/w
 38tg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789492468; x=1790097268; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3yjn/2mwmESkiQqriOe1UB76O1BvW5QY0nqi3obvr3U=;
 b=pmgI2/7Z3ElZU0TO69VQ+Q0LKDdj6rlqDa2TRhCZA+nOdReSmN0GFewSFb3UMW3vpR
 QpOwcX6DmS/yKijYl9lMFOD5I6CQjk7QO59ABnSrCx2e+TvjE09i5gZsL4ajGbcN8KeE
 QmFbEAsnEJj2oq4+VQ7kU4VAor8TW8mW4KskkRdNVGz6NyzLEgktCG16iNY7leJ7vfHy
 o2Uok0kEaHXndDWvd6M+sQxLvEfecuk7G/6HBYYobo5BxMGPlg0i5B0TiCJkQ0Dy0Uel
 /2LVHE/YIMgY59yRCJPIRKBcnRJGVicYql3QhOmLdBmv8rx/7kIfxcvBdHxJxhDrYVAQ
 WyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789492468; x=1790097268;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3yjn/2mwmESkiQqriOe1UB76O1BvW5QY0nqi3obvr3U=;
 b=I8eCJjYywqbV7zNmD77Ytb4joLn7cKIFwiJJhZef4fqfeNatvQDVNIFsXgtOHoo056
 rwqthe5xUY6EKB2EbIW2IwlFUbwzBBsYHiAe5IUaHrrJPP5GICnGtv/NxxZA3oF/+rqQ
 uAD0Rmp+5VVgViqQwY9rOgqA6Q/8ybxCQ3gOPWP9kup5Vr4fOSuTsNag37UtG0h4SynR
 GDQQ0HhsXr7fq7dT9AZGH/iuYWjRU6tF9sP6oeIrso6L+hQASThaLu9037+TiHgH8hkJ
 E5h6I47pFwRfRrDtka5O1OH6LfJlUHyVoPqwKILLg/zV7jrMpRefKnPbPuUEecQz+s0h
 rjAQ==
X-Gm-Message-State: AFuF++lajJK6MZfsf6x+ftCJxJZHWi8mRk5ZarxDxIn9pPdyQrpfO9OE
 utFcGI9vkX7leMxX/giiWgJoapzZBEC1hVdVicc+25r5hNrRSVJI+6XBW5Xf3HJSA1xhXwltFLc
 wafU10zSR3i90TvcCkxZjqg3L/8AV0w0=
X-Gm-Gg: AYBFou3yee0D7vM4iR/ovbyPNOb+crKukL17FBx6VzLhTVoEBCKZx2yvl36J5eb/0e9
 qLQYbPSgYFbxiL1/y9l0JQUFRjXHaObzsZymZ1/ZFwixviI2qekgn1VcgtRt2Sx9M1nK4ug82Z3
 ehnGeBMBMYLC3SmzGDQiX/0I1HZ4nrGxI2IdJU5hMtNCOJ1UeAOjL4YxFV7c7sStWCIGaZQbm+g
 uDaPXafk2dkna+sxSCasP4PT8ntaqoqljKMrzafg8nUqNrf79fhBo48McaDO6CjRbetZ89z0qpQ
 TLdpIw93Gf50wvnUqNkIHklD85TY+oj+iBn5HNInXQ1zywRSi7tJzyIeFEicTXUQFxtBYr+gv55
 dgmTs1sjY+6AVvfCxVolX5+R/D77cym4LO4+yKoIHO9G7DD74tz2kQXGmAUbYkpj1iCpt8tf9Ql
 kVqzOby20wsBRMxZZWIfBgERwYbvnOYJ9QVLSwb3wDkDow
X-Received: by 2002:a05:6102:5cc4:b0:792:94bd:9be7 with SMTP id
 ada2fe7eead31-79ed35a2d1cmr4182413137.2.1789492467642; Tue, 15 Sep 2026
 10:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260618065137.3987932-1-james.hilliard1@gmail.com>
 <20260618065137.3987932-2-james.hilliard1@gmail.com>
 <aqhkbaMkRynOxfoT@windsurf>
In-Reply-To: <aqhkbaMkRynOxfoT@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 11:14:14 -0600
X-Gm-Features: AcwNN1WFP45syFSmN5WweGe_JCYaX1yQssU6Sh3wtRMqEJow4PlugU-Z0Druy7A
Message-ID: <CADvTj4qjk_fMqf4M8Mq4C=w34GuL4e8uYBFsUSx2grCC2Dukdw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-python: derive PyPI site
 from blake2b-256 hash
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMzoyM+KAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiBUaHUsIEp1
biAxOCwgMjAyNiBhdCAxMjo1MTozNkFNIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+
IFB5dGhvbiBwYWNrYWdlcyBkb3dubG9hZGVkIGZyb20gUHlQSSBjdXJyZW50bHkgc3RvcmUgdGhl
IGNvbXBsZXRlCj4gPiBmaWxlcy5weXRob25ob3N0ZWQub3JnIHBhY2thZ2UgcGF0aCBpbiB0aGVp
ciAubWsgZmlsZS4gVGhhdCBwYXRoIGlzCj4gPiBoYXNoLWJhc2VkLCBzbyBpdCBjaGFuZ2VzIGZv
ciBldmVyeSB2ZXJzaW9uIGJ1bXAgYW5kIGFkZHMgY2h1cm4gdG8KPiA+IHVwZGF0ZXMgYW5kIGJh
Y2twb3J0cy4KPiA+Cj4gPiBXaGVuIGEgUHl0aG9uIHBhY2thZ2UgZG9lcyBub3QgZGVmaW5lIF9T
SVRFLCBkZXJpdmUgdGhlIGhhc2gtYmFzZWQKPiA+IGZpbGVzLnB5dGhvbmhvc3RlZC5vcmcgc2l0
ZSBmcm9tIHRoZSBibGFrZTJiLTI1NiBlbnRyeSBtYXRjaGluZyB0aGUKPiA+IHBhY2thZ2Ugc291
cmNlIGFyY2hpdmUgaW4gdGhlIHBhY2thZ2UgLmhhc2ggZmlsZSBiZWZvcmUgdGhlIGdlbmVyaWMK
PiA+IHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgdmFsaWRhdGVzIF9TSVRFLgo+ID4KPiA+IEZvbGxv
dyB0aGUgdXN1YWwgdGFyZ2V0L2hvc3QgZmFsbGJhY2sgcGF0dGVybiBmb3IgX1NJVEUsIGFuZCBy
YWlzZSBhbgo+ID4gZXhwbGljaXQgZXJyb3IgaWYgbm8gaGFzaCBmaWxlIGlzIGF2YWlsYWJsZSBv
ciBpZiB0aGUgaGFzaCBmaWxlIGRvZXMgbm90Cj4gPiBjb250YWluIGEgbWF0Y2hpbmcgYmxha2Uy
Yi0yNTYgZW50cnkuIEFkZCB0aGUgaG9zdCBjb3JldXRpbHMgZGVwZW5kZW5jeQo+ID4gZm9yIHBh
Y2thZ2VzIHVzaW5nIHRoaXMgcmVzb2x2ZXIgc28gYjJzdW0gaXMgYXZhaWxhYmxlIHdoZW4gbmVl
ZGVkIGZvcgo+ID4gaGFzaCB2ZXJpZmljYXRpb24uCj4gPgo+ID4gVXBkYXRlIHNjYW5weXBpIHRv
IG9taXQgZ2VuZXJhdGVkIF9TSVRFIGFzc2lnbm1lbnRzIHNvIG5ld2x5IGdlbmVyYXRlZAo+ID4g
UHlQSSBwYWNrYWdlcyBjYW4gdXNlIHRoZSByZXNvbHZlci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+IEkgbXVzdCBz
YXkgSSBhbSBub3QgYSBmYW4gb2YgdGhpcyBhcHByb2FjaC4gSXQgaXMgdmVyeSAidHJpY2t5IiBh
bmQKPiBub3Qgb2J2aW91cyB0byB1bmRlcnN0YW5kIHRoYXQgdGhlIF9TSVRFIGluZm9ybWF0aW9u
IGlzIGluIHNvbWUgY2FzZXMKPiBkZXJpdmVkIGZyb20gaW5mb3JtYXRpb24gaW4gdGhlIC5oYXNo
IGZpbGUuIEZvciBtZSB0aGlzIGJyZWFrcyB0aGUKPiBwcmluY2lwbGUgb2YgIm9idmlvdXNuZXNz
IiB0aGF0IG1ha2VzIEJ1aWxkcm9vdCBnZW5lcmFsbHkgcXVpdGUgbmljZQo+IHRvIHdvcmsgd2l0
aC4gSSBkb24ndCByZWFsbHkgZmluZCB0aGUgY3VycmVudCBzaXR1YXRpb24gcHJvYmxlbWF0aWMs
Cj4gYW5kIHdoYXQgd2UgaGF2ZSBjdXJyZW50bHkgaXMgY29tcGxldGVseSBvYnZpb3VzIHRvIHVz
ZS91bmRlcnN0YW5kLgoKWWVhaCwgaXQncyBhIGJpdCB3ZWlyZCBkZXJpdmluZyBmcm9tIGEgbm9u
LW1ha2UgZmlsZSwgYWx0aG91Z2ggYXV0byBkZXJpdmluZwpfU0lURSBpbiBnZW5lcmFsIGRvZXMg
aGF2ZSBwcmVjZWRlbnQgYW5kIGlmIHRoZSBoYXNoIGlzIG1pc3NpbmcgdGhlcmUKc2hvdWxkIGF0
IGxlYXN0IGJlIGEgY2xlYXIgZXJyb3IgZXhwbGFpbmluZyB0aGUgcmVhc29uOgpodHRwczovL2dp
dGh1Yi5jb20vYnVpbGRyb290L2J1aWxkcm9vdC9ibG9iLzIwMjYuMDgvcGFja2FnZS9wa2ctbHVh
cm9ja3MubWsjTDc5LUw4NQoKPiBPZiBjb3Vyc2UsIGlmIHRoZSBvdGhlciBtYWludGFpbmVycyBh
cmUgaGFwcHkgd2l0aCB5b3VyIGFwcHJvYWNoLCBJCj4gd2lsbCBub3Qgb3Bwb3NlLiBCdXQgc2lu
Y2Ugc28gZmFyIG5vYm9keSBwcm92aWRlZCBmZWVkYmFjaywgSSB0aG91Z2h0Cj4gSSBzaG91bGQg
c2hhcmUgbXkgaHVtYmxlIGZlZWRiYWNrLgoKSGVyZSdzIHNvbWUgYmFja2dyb3VuZCBvbiB3aGVy
ZSB0aGUgc3VnZ2VzdGlvbiBmb3IgdGhpcyBjaGFuZ2UgY2FtZSBmcm9tOgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9idWlsZHJvb3QvZmIxODYyNDgtN2RmNC00ZjczLTk0YTItYzliMmViZWZhODQz
QGJ1YnUxLmV1LwoKPiBBbm90aGVyIGNvbmNlcm46IEkgYXNzdW1lIHlvdSdyZSBhZGRpbmcKPiAk
KEJSMl9DT1JFVVRJTFNfSE9TVF9ERVBFTkRFTkNZKSB0byBET1dOTE9BRF9ERVBFTkRFTkNJRVMg
c28gdGhhdAo+ICdhd2snIGlzIGF2YWlsYWJsZT8KCklzbid0IGF3ayBhbHJlYWR5IG1hbmRhdG9y
eT86Cmh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290L2Jsb2IvMjAyNi4wOC9z
dXBwb3J0L2RlcGVuZGVuY2llcy9kZXBlbmRlbmNpZXMuc2gjTDE1NwoKPiBCdXQgdGhlbiBpZiB3
ZSBydW4gIm1ha2Ugc2hvdy1pbmZvIiB3aXRob3V0IGRvaW5nCj4gYW55IGJ1aWxkLCBpdCBtZWFu
cyB3ZSBubyBsb25nZXIgaGF2ZSB0aGUgX1NJVEUgaW5mb3JtYXRpb24/CgpUaGF0IHNob3VsZCBz
dGlsbCB3b3JrIGZpbmUsIHdlIHN0aWxsIHNldCBfU0lURSB3aXRoIHRoaXMgYXBwcm9hY2gsIGl0
IG9ubHkKY2hhbmdlcyBob3cvd2hlcmUgaXQgZ2V0cyBzZXQuCgo+Cj4gQmVzdCByZWdhcmRzLAo+
Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
PiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
