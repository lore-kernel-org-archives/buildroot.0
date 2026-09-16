Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27318C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF124040F;
	Wed, 16 Sep 2026 19:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpqlv0qWiZej; Wed, 16 Sep 2026 19:57:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0F9E5403B3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789588665;
	b=LrHug579OaZHNykcIUCXeYnQb9hKU/1WlMMOQ1XJKAqLNW/MOoJOyo7uOoTOJ8OMbk2v
	 WrcFYjOdyYu66WCSiHmWxq4CFVIx+d1rgwjP65vZTkQBF9k7BpeVZvY69duTq8KRlmefm
	 rMlP3UV4jX3ng9wGzcioTbBxFOIbbjXLYGUf+BGIehuM5LtO9zcnDwJaC5R32T7SOqtVC
	 Anc5f3mnvj1IBLMN9t757httvH+nDTFmCFZ7RcIcuXj9oxUj+Y2zvw5Q4XqFowJ7AIzBO
	 9NhpN8r4i3Le3ePVLuEmdEALl4hctD611i4OUfI9weBlLU+BzfpnU0EX3pDDNkTvHIg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789588665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fJmjjI1D5lYcHyoBeTty1cm+bPUYbi5WV537CzPgAM4=;
	b=J9j0mntM7UCat+HsmaOn18dck8DA64pATTtmKtufQ0hxc8pjH1mW1wzF3+y0vzA7MiyT
	 VA4d/hfXbMcjehP2Wy1phc8VzoYz5S/d75tMbxZtlstM6DG1xmFqe94h1fVUPDwZ25bLt
	 7oR3YC2je8U3XiRvXisDTxmPsQJcwtpNZTRpKB++8h7pm8lXq5kuCFnainYPwMdloHSQO
	 T8Jzez2hfe+w6teqRzmvUmKVe4LYntkmf4XaerWSyHT8bSVzxgbkcw9j2O9yPkSfPsDyp
	 vmjUpIzxO99g8cJCaTEh3ffycY5dfTO0xWTgqF8/oXPeyOYQ0Bp1UygKZ29CMSytuvg==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789588665;
	bh=fJmjjI1D5lYcHyoBeTty1cm+bPUYbi5WV537CzPgAM4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSIvPchm9yPN399FeIy53dKzvsNC/36ZFUD/kPctw4iT2Dwj+3WfqrsBnNYHuvH1m
	 8aPT16H3MLdyPvXVB+ST2zuEyWoIhcqzt4RF62tSrqkrbbiWG9tbVPqF3L44Ayr7q2
	 woNTMwGlExrnB+szfhN0PCbeoKue/A+kL48b96RznI4UXS/62T1IFbjsC7z1Hsa9ka
	 BScFWby9TQAvMWhTwa3lURayezB32c0TTm0pq7x29B+zaWba+UtD3SHFxxmpCw7uo5
	 NJV+cPjVDOeMFiXacFCX3WGrjk5zNem0B53NidkiN9btf0xof4eqv3tykj8rapIOZ1
	 zyyBjZuqfWu4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9E5403B3;
	Wed, 16 Sep 2026 19:57:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DFC12E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F40A80809
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdlLS7RXfDBK for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:57:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 60B2C80806
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:41::f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789588663;
 b=MrUOvcyYaYgtMRKjNE8ozPrYxdYmwL3F0+jf0+YUf7Z0owQBThMe/g7QxugiDS5OFbYa
 fN1HEZ3vHNj4Nv16eh4UXzAG2S09tn4Y9eMwvLtEDiyqCQaR20irTXlI86AKe9VUGKmuh
 Fc3NVWnJu4GE3kLCHcu8x9qFiDE7gjahhq0jGS0J8Wx6NcCernx/j35AWwwT7hBH17Nfm
 c0ASoQd6QPihBYvGTBpC7t9wPEzXK6Joz+6rVKwbEPOiexpB3endkl9AJ79aXEzEv8NWf
 vAVnZn0lC2lgd6lzESrjAmajl2c4wqub2dmH2aq0GHvbkR4Dmkp7/IHHzSsWNDINjAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789588663;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=Zy0c5e/VuONDeMfCMHRICweYhYB0MWKwl65utaa43EE=;
 b=ft3qMtbRUbQ8lcNLCmYA29sIFfMZIw3A5N65S3+b0vUMVv997VyHHeSYTqY8VZpeVyvZ
 wY9n19V7w+zuEontHUZ22ueY6OjzRllHGY7uWai2S8Wh25IAuNH/jCIwqzPxpw0akG5y/
 qwV+k1xMvqDnr1xYAt8DNNs+y7OmEQx2i0ebstZ7Mh6T+63PnWsaqqOQj0siTjdsSRSyw
 rfaq3HRewFlxDu1Z5qZLkbU5qJStt9pUl+j70wd0E6oazV78tnvVKKi8jM1EL4znJCckS
 23OKyiIkyqJS+SYkw5WIc/rbyb49+welnK5LbBtrZOqQM9a09JTCvlilKpWn9tJfrBw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=naLZ49SU; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:41::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:41::f;
 helo=mail-yx2-x0f.google.com; envelope-from=eeppeliteloop@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=naLZ49SU
Received: from mail-yx2-x0f.google.com (mail-yx2-x0f.google.com
 [IPv6:2607:f8b0:4864:41::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60B2C80806
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:57:42 +0000 (UTC)
Received: by mail-yx2-x0f.google.com with SMTP id
 956f58d0204a3-66e4ab201ecso78276d50.2
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789588661; cv=none;
 d=google.com; s=arc-20260327;
 b=EUn/6lHDWoPsrjIvW9MaqPVWuQF/VX8yR6bKU0KdfEXNGNkTPZ7M5ecYfu0Li1cpEw
 0NPnuYqKNEhfCgxEBmINnUXJRR5/pD5btoPvMluc7+sZ7yjJGjhpwvuOOW8RrWaZYxdk
 +iag9KC8qw97I0eL8n9UByIPWO3QhvRWJR6msgLAGSodQTvHrbu2Cyc6jm9ptGUAHBPy
 DGs5mfvO+yMSM6BkpllfDewRjD72vpihoK7FU+WaW/vMif4dwMrh1L96ehQMhT/Kp9Cf
 jj1MagRegBkKzqzePM80tKdUjnz7/ZpUqn8kS19W9R2qFEVER/0laxjcEMshSE4OMyWF
 4zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Zy0c5e/VuONDeMfCMHRICweYhYB0MWKwl65utaa43EE=;
 fh=M4z+1d2itzmM6TdBVcO9og7vZlVpn6MbNz2Giu+Mqjg=;
 b=pjNbWL+0CIU9nzW7MlIa2a3PeEXc624Yn23jvfUXxqVAF4KhHA6Xr2BwNxyZVqryyN
 cotYfHQWpufh+O6H31LXJ/QA8HDrFKD29+kYsndZEtvzR9gncOQiJkzWBEPY/Bme6wMl
 net32GLvnveqbVBqLa6bG3rUQB7MKVuSOs7jNWfVo8LFBEGn/18m+BiZZgLc8Oc3BeLm
 u5LH4S/4GSI3AZx3rjZp8ql6OiLYF5Kd9SIExbFKXkn1cMgK2P69edr+eCyHZKTxaCno
 zdnTQfVUULVr4Bj8zoT9UqKCwR88vCbjrnCcFrwQMd3K5SvtloIv7EPSq8H3U2SSaxyI
 IxcQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789588661; x=1790193461; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Zy0c5e/VuONDeMfCMHRICweYhYB0MWKwl65utaa43EE=;
 b=naLZ49SUFQuH5rvTHbBg+2ZnLInYoCRZ5+pUZFWkGY6ZDkQ//NGdiknCU7lmY9UJKn
 hbyTxjjguZVOvOZHpOL2SaF32zizX2ABZ2JAEhmYVhASVykJYMvhDJkvFzuFte0Aj6nx
 PebrzUn3R4F2PqCZPAgMqfSFvW+lIMbw6BPp0KSJZ+PlxYOl/AbAAvVOymAorNz8/t74
 C/uRjIZJDHx4mUB4Dq2KtT39wdRxq+bul84frZM7PB0UXqh6yH5Cu116FyWmaHC6rDdy
 MG594ZETqDo9x9ItqM12ogGVDkTZVQbswq/nJeAN0Jyp8m0BGiGcrfeN0qwsc/VU/xix
 XOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789588661; x=1790193461;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Zy0c5e/VuONDeMfCMHRICweYhYB0MWKwl65utaa43EE=;
 b=BX+XzG+RBXGIK50CfKTxOe8j1BIzc/HcuaNzsvD3e1zR7JI4zoFdA5Ef90F2hFtiVP
 IPM409yD1yGMqV2PkicPQxz/fcy9funygg948XvFj3bvVsWUnsBv4PQwn0MAtVWpWp9l
 aZ8PCapCFORypxLqcjpstpPSKgdXP2eFbeVwAbzoqd7bxAwsAxoV9zgOz9AKS/AarZgd
 YKn1n+gzGhbL4hOA85QfqItSFUIl50tsnQWKyE8/6kXDpjg0rp7gZL3HL69pBGWdOcie
 UJhSmB6VXGADFbh4iQUpZZssioMyNboJRbMUBrd2Sc7yEGK8fzkUOG1UmoYS7VKZr9+M
 mXAA==
X-Forwarded-Encrypted: i=1;
 AKwUvByzSGKOKMIRd36Cu4AcOEKaaOwa90RZ6XiKSL3F+1iYY+E9DPSU3bgtC44xtTZQIvZNpvBMCQ8DA+c=@buildroot.org
X-Gm-Message-State: AFuF++lZYZvbkmV5UITBG0SmuqsW6563bd9AkASkydj1h4wBMhwGRNvL
 uhZ/sxpV1eOxNnkaBhcGBqJR35QmxOsLEJg/aLVmACwoJk5LvT/NwPaFgpWCh7XIAYZ44wiLStP
 Boh6rtIJhgc8+4lWKqqj+p0yCnHdbUgWuOw71iI8=
X-Gm-Gg: AYBFou3Wj7+UollIgu/PqwfJgurlfuvhLn2XRB0WQ6vC8Q4g9P612K3DaO7qsOwaHtU
 XZzNE5pUb/Kgur3XvRGrRLklqgoqhSysWCnKjzUF+cao2OhaTU5Htls8U89saczBcNYZItK0dhD
 ScDfE1rk6E8Tcd+FP3rixOHBt5gshJxcfNDfmDd7iAPBhTpKwl13+2ns3QtP44Ey0iHRwUSyOS4
 QfUZ5wYtIDQz+PxMRnKa+M1S+Kls+wYzs6CGgoMs+GO+AqbKApLhL8NcCbZO8XFOI+Mf/JCrY8r
 v9LMhhkZLAOTkKlnFh73bhQJD9ImrFMpd5f4FxBFh8XUpH3EzVdw+GM=
X-Received: by 2002:a05:690e:4553:10b0:66f:c1bc:87ea with SMTP id
 956f58d0204a3-671632dbf59mr1024765d50.67.1789588661460; Wed, 16 Sep 2026
 12:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260909081345.3114385-1-bernd@kuhls.net>
 <20260909081345.3114385-3-bernd@kuhls.net>
 <aqrpq30jh80sswHi@windsurf>
In-Reply-To: <aqrpq30jh80sswHi@windsurf>
From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed, 16 Sep 2026 15:57:14 -0400
X-Gm-Features: AcwNN1XaCSEsWTOjU4fJdB7WEs762O3KlNSDyVj1vq8PoBnIvGjwkCLPHJH4WW8
Message-ID: <CAB4xu_2iabS+DTc8bah_bssPhx9QtEBTFPhvDbWcecmOLcaVeg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 3/4] package/lttng-tools: bump version to
 2.16.0
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

T24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgMzoxMeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMDksIDIwMjYg
YXQgMTA6MTM6NDNBTSArMDIwMCwgQmVybmQgS3VobHMgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9sdHRuZy10b29scy8wMDAxLWNvbmZpZ3VyZS5hYy1hZGQtZGlzYWJsZS10ZXN0cy5w
YXRjaCBiL3BhY2thZ2UvbHR0bmctdG9vbHMvMDAwMS1jb25maWd1cmUuYWMtYWRkLWRpc2FibGUt
dGVzdHMucGF0Y2gKPiA+IGluZGV4IDRiYzkyMzljM2QuLmJkZjYyMWI0ZWMgMTAwNjQ0Cj4gPiAt
LS0gYS9wYWNrYWdlL2x0dG5nLXRvb2xzLzAwMDEtY29uZmlndXJlLmFjLWFkZC1kaXNhYmxlLXRl
c3RzLnBhdGNoCj4gPiArKysgYi9wYWNrYWdlL2x0dG5nLXRvb2xzLzAwMDEtY29uZmlndXJlLmFj
LWFkZC1kaXNhYmxlLXRlc3RzLnBhdGNoCj4gPiBAQCAtNSw4ICs1LDkgQEAgU3ViamVjdDogW1BB
VENIXSBjb25maWd1cmUuYWM6IGFkZCAtLWRpc2FibGUtdGVzdHMKPiA+Cj4gPiAgQWxsb3cgdGhl
IHVzZXIgdG8gZXhwbGljaXRseSBkaXNhYmxlIHRlc3RzCj4gPgo+ID4gK1Vwc3RyZWFtOiBodHRw
czovL2dpdGh1Yi5jb20vbHR0bmcvbHR0bmctdG9vbHMvcHVsbC8xNjIgKHJlamVjdGVkKQo+Cj4g
Q29uc2lkZXJpbmcgdXBzdHJlYW0ncyBmZWVkYmFjayBvbiB0aGlzIHBhdGNoLCBJIGJlbGlldmUg
d2Ugc2hvdWxkOgoKQWN0dWFsbHkgdGhpcyB3YXMgZml2ZSB5ZWFycyBhZ287IGluIHRoZSBtZWFu
dGltZSwgd2UndmUgaGFkCmAtLWRpc2FibGUtdGVzdHNgIGF2YWlsYWJsZSBzaW5jZSBjb21taXQg
NmJhOTQ5NjAxICgiY29tbW9uOiBQcm92aWRlCi0tZGlzYWJsZS10ZXN0cyBjb25maWd1cmF0aW9u
IG9wdGlvbiIpLCBpbmNsdWRlZCBpbiBib3RoIHYyLjE1IGFuZAp2Mi4xNi4KCktpZW5hbiB3cm90
ZSB0aGUgcGF0Y2ggdG8gYmUgYWJsZSB0byBidWlsZCBMVFRuZy10b29scyBvbiBhIHN5c3RlbSB0
aGF0CmRvZXNuJ3QgaGF2ZSBsaWJiYWJlbHRyYWNlMiAodGVzdHMgbmVlZCB0aGF0IG5vdykuIFNv
IGl0IHdhc24ndCB3cml0dGVuCndpdGggeW91ciB1c2UgY2FzZSBpbiBtaW5kLCBidXQgYC0tZGlz
YWJsZS10ZXN0c2AgYWNoaWV2ZXMgdGhlCnNhbWUgdGhpbmcuCgpXaXNoaW5nIHlvdSBhIHdvbmRl
cmZ1bCBkYXksCgpQaGlsCgo+Cj4gMS4gRHJvcCBvdXIgcGF0Y2gKPgo+IDIuIERpc2FibGUgbHR0
bmctdG9vbHMgb24gYXJjaGl0ZWN0dXJlcyB0aGF0IGRvbid0IGJ1aWxkCj4KPiBUaGlzIHdvdWxk
IGZvbGxvdyB1cHN0cmVhbSdzIGd1aWRhbmNlIG9uIHRoaXMgbWF0dGVyLgo+Cj4gVGhhbmtzIQo+
Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
PiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
