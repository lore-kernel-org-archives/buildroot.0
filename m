Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C500C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D844560E0E;
	Fri,  4 Sep 2026 12:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OD4HFRBLTMQB; Fri,  4 Sep 2026 12:19:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 56C1E60C06
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524340;
	b=Ve5XqpIM50Dp2I/s07lSXnbph45B5dJTYlutiOWDMKC8BPkk3kp3IZp2kfr3xngjVa1c
	 42ayU4xdSqgJIoMfcHY6s7XUixbNbSUHf+vIbg6YS2wsnnytEtNV/mE9xZWNS/Y/bYcGO
	 NQu0B5jxOyesfceiWg2wf2Viw+d1axvThyxqo66We7O2pf66Ksvy1tti3Ds00F/GLNdyI
	 Bp8V2EuCr7IJ30k2q0T6wDAc0bl3O/qXPT/yQvaJ/4B98T3ZrV1Axr5EiBCrSWqwYAchs
	 ncb9Q9kdjn9I6zQOo3wvLsTOhlwGKDT2hvvMFyfdGlCM1wumBBeX1+u542yNHE5lFcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524340;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TrLuO1bFCNoWRp7xJH7WQaFb5Un3WagmT7jK3nXhFt4=;
	b=lg86wPufakXrRT26kDTTCR1Nyg0xBw/9ahirTq6eBvhoZK3TiiuxPSoKMrg7Zo22u2jv
	 pR4pxo7fAvxG/EOevr/waqKIPd9qCjDNY6wGWJq4ylD7fh/kG6AgWA0/qwaxqom1I0KJP
	 V52AtSngGXVLwHHWZ38IrMi+cMrAaX4xLqvx1QYNjGW6MKzfl3lzZBa6DAOFFRT1swqQ7
	 MtKQ0B7nMImlr1OzbaOjpwHtj5+HKsmPWqouQTzE8mi+PhfZiYvlBbV3pQGGdXnbRGjJD
	 S4wVvJKbtBf8uKNGYRW8WrV8Ge7J6vbynq30ysHprir7OSemQQ5Ff9hCL+Rce5Bxqqw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524340;
	bh=TrLuO1bFCNoWRp7xJH7WQaFb5Un3WagmT7jK3nXhFt4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AOiR2QDZweQMvO4QYIB6lIw5XelsmU08s0iGiCR+LcuKLUwUMK8czlx+a2KidXcDD
	 wJDghTzogIRhFAV/W3WrrwxQOLxKNc/nTva5YKleedJKe9VD0NZDzdYPcoUa27/ekd
	 8QE3H0cTVK+Cl4DU/Krfe4APzrNYCyPaKJVTqHV+uBPdcZtywkbybP7TR3YJSv/U9j
	 mUJsKwq0gjQydf7hByLsX5MnD5fd/TeDiLuqmPHx4o703gOeeeBqo2hCPnmWvtI02/
	 rzqIlDmTlqGVN2SDfJ5v5/lyZYT0A6rfY/b1Ufn9Z7Q2GKgc0Yha2NtHms3axN7cUr
	 HRE3NLW/BuX/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56C1E60C06;
	Fri,  4 Sep 2026 12:19:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2C4F10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A51D040B87
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkbHlmqA456e for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6B64540B7F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524336;
 b=p/WtnjfrCLxnkipkjgJtu52VonZ8iUxqWtKWcNnoDt28XXSGlV17uOgkusqDHpMHGlkr
 JjcsNfCdxpb3ZQWqufewZwZI0ONP5zY5YWW8q2KAGKYVPz3Pi4fkdByppc4IJTIA2doGo
 L5K7YBiuIbb3Vztmf0GutsKm2OOWmBu4DDM515FRIfXpmeI8SDYmypwC3kBLi2e0Zm1e2
 tHsDIhC3k44Evug1EX1wiwNZ1zT2qq6ZGj2c7kcSW0dVowXMOYVCtEDiEWQ8cYfAx/QlG
 hgkturi/t8upg9TdNejkB9Z94K3ta5WGHSWXMn31nikd5uDIZO5VUgFPVpYkGP8vOxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524336;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=gDa09gNU8sYC8C6lJkdg3APNsZA+F3WV4hSP5HtPBy8=;
 b=FB9ge3FMhU6m85Yc1lb/gMls5aZMyQFtJHlPU5bEKLIoL7eCqU7mG7s7wLiUy1vkKIYg
 xFu0P0koXTXcC4lyk/d6BaTanolTaLOX3ZSR7ELaQ7Xu5JyO4vvZfSfNACTKy4N2Ng3pU
 xm4z1/dJSsPLWny0Ms3EG26Nl1Q7igXGRsASfJFEl3RKqb0D66S8PkGXe0uKoS4GBQzbb
 F7+Yc1Q4HsCz1PYTIgqNQmCVeapMcW1q0/TX0lvV5RHrJxGCWIoe5BaRx7PiI07OkSWu2
 Vdnmq7cV8myZtfYXSQFKBme0aFTD5r7B2uF78DRUtyGwTMqegUEWSY5VyXql8/cToSg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="BA7N/7PZ"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B64540B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:56 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso14909475e9.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524334; x=1789129134;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gDa09gNU8sYC8C6lJkdg3APNsZA+F3WV4hSP5HtPBy8=;
 b=bmCyECu0yi+8GJnFSpN4KGFGS1aoAzuv/b4/mUDsDgq77bCuX0fz2BSxrVKPHcBs3p
 QdDVORemtSW4zYLvk8jPTZk6LJ41TS0z46ly9uIRLBPezOIxzbJWTSSHJPKQkWbKYCNp
 AZf3fZ07j9LNCdxteYBWsNhrKQfOSkslQIIr7utLOyI14163r+Lew+WYg8WR+2Wi2j09
 JCcVoRAoM9WFNOsbXwSjnCrolO2+gUF79N/Q0cW8HMd6dd9/xVDeajxXqhcO6nTd6IJn
 zrdz02crYjFCW3U7+zrZZnC6UoYJ9ny9qu1/iiQ6QMFYfCqU9Z5SHMhs804Iyv8Aw37V
 GrAw==
X-Gm-Message-State: AFuF++mMmKT8PEOpqF/fcd9YGuIktEVMZOO1TsXaMdcC4yZbnXaj7h4h
 kt2sXbX09OHw1ngFUjJifmf46RHfn3m5S6HnQKDMpl/h7pE92BhEIQaEGv8NwO3ry9M=
X-Gm-Gg: AYBFou0yP9iz4olSzYP1f6a0rizT+0FnT06WKzxMZ8ry5wtd8r+If/ktcpOwRVlSQ/M
 nrv+Mk7jq2nE7/TzdngRDrIp182ExAID3bxj5V9PLD2uqciheayTQ0KMhQ1IRgVmpePR0+kV0/T
 hCBCy5Trqcgn++dsK3Srxf9SLg2yLiHZSkx4+BXZJAfLG4trqWptc6bfPUBOuEI7AvyBxdUgeKH
 iJ+tvnIaQR7owPLNFMHILKoD6ZFb05XMPZPE6dg+cmkaRxmrgOBGVWBZ1AXwJx150jjuzcWFqh4
 uszn/EQ11MzJRjkBtnjF/xG8gP2PbD4jo3uJTc4BvVc92BGsg5KcBlVv1akxl6iQIW0j6tXFOJw
 sLB0Bf/1UnoOFgufRj/Q+WG/tXTPT6Yu+rwZPRis6UNqKBgUfJg5TWwSztekUI0kVpQjPKXQDtd
 hSK2qvs+cXs3lm9XjVfZku5Yw/67IODhNmI+YmtxWkGZ2swjjW7RHaEg==
X-Received: by 2002:a05:600c:8b8c:b0:49c:f13e:e52 with SMTP id
 5b1f17b1804b1-49cf893b58bmr41239655e9.15.1788524334145; 
 Fri, 04 Sep 2026 05:18:54 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cefsm91356695e9.5.2026.09.04.05.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:53 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:45 +0200
Message-ID: <20260904121853.406144-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826140414.347415-1-thomas.perale@mind.be>
References: <20260826140414.347415-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to v22.23.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gU2VlIHRoZSByZWxlYXNlIG5vdGVzOgo+IAo+IC0gaHR0cHM6Ly9naXRo
dWIuY29tL25vZGVqcy9ub2RlL3JlbGVhc2VzL3RhZy92MjIuMjMuMgo+IC0gaHR0cHM6Ly9naXRo
dWIuY29tL25vZGVqcy9ub2RlL3JlbGVhc2VzL3RhZy92MjIuMjMuMQo+IC0gaHR0cHM6Ly9naXRo
dWIuY29tL25vZGVqcy9ub2RlL3JlbGVhc2VzL3RhZy92MjIuMjIuMQo+IC0gaHR0cHM6Ly9naXRo
dWIuY29tL25vZGVqcy9ub2RlL3JlbGVhc2VzL3RhZy92MjIuMjIuMgo+IC0gaHR0cHM6Ly9naXRo
dWIuY29tL25vZGVqcy9ub2RlL3JlbGVhc2VzL3RhZy92MjIuMjIuMwo+IAo+IEl0IGZpeGVzIHRo
ZSBmb2xsb3dpbmcgdnVsbmVyYWJpbGl0aWVzOgo+IAo+IC0gKENWRS0yMDI2LTU2ODQ2KSBodHRw
MjogcmV0YWluIGhlYWRlciBtZW1vcnkgaW4gc2Vzc2lvbiBhY2NvdW50aW5nIChNYXR0ZW8gQ29s
bGluYSkg4oCTIEhpZ2gKPiAtIChDVkUtMjAyNi01Njg0OCkgaHR0cDI6IGRlZmVyIHJzdCBzdHJl
YW0gd2hpbGUgaW4gc2NvcGUgKE1hdHRlbyBDb2xsaW5hKSDigJMgSGlnaAo+IC0gKENWRS0yMDI2
LTU4MDQzKSBwZXJtaXNzaW9uOiBhdm9pZCBncmFudGluZyByYWRpeCBzcGxpdCBub2RlcyAoUmFm
YWVsR1NTKSDigJMgSGlnaAo+IC0gKENWRS0yMDI2LTU2ODUwKSBodHRwczogZGlzdGluZ3Vpc2gg
UEZYIG9iamVjdC1hcnJheSBhZ2VudCBrZXlzIChSYWZhZWxHU1MpIOKAkyBNZWRpdW0KPiAtIChD
VkUtMjAyNi01ODA0MCkgaHR0cHM6IGJpbmQgaWRlbnRpdHkgY2hlY2tzIHRvIHNlc3Npb24gcmV1
c2UgKE1hdHRlbyBDb2xsaW5hKSDigJMgTWVkaXVtCj4gLSAoQ1ZFLTIwMjYtNTgwNDIpIGRuczog
aGFuZGxlIGxhcmdlIHJlc29sdmVBbnkgYWRkcmVzcyByZXBsaWVzIChSYWZhZWxHU1MpIOKAkyBN
ZWRpdW0KPiAtIChDVkUtMjAyNi01ODA0NSkgemxpYjogdGhyb3cgb24gb3V0LW9mLWJvdW5kcyB3
cml0ZSBidWZmZXJzIChSYWZhZWxHU1MpIOKAkyBNZWRpdW0KPiAtIChDVkUtMjAyNi01Njg0Nykg
cGVybWlzc2lvbjogZW5mb3JjZSBmcyB3cml0ZSBwZXJtaXNzaW9uIGZvciB0cmFjZSBldmVudHMg
KFJhZmFlbEdTUykg4oCTIExvdwo+IC0gKENWRS0yMDI2LTU4MDM5KSBwZXJtaXNzaW9uOiBjaGVj
ayBmaW5hbCByZXBvcnQgb3V0cHV0IHBhdGggKFJhZmFlbEdTUykg4oCTIExvdwo+IC0gKENWRS0y
MDI2LTU4MDQ0KSBodHRwOiByZWplY3QgcmVxdWVzdHMgZXhjZWVkaW5nIG1heCBoZWFkZXIgY291
bnQgKE1hdHRlbyBDb2xsaW5hKSDigJMgTG93Cj4gCj4gVGhlIExJQ0VOU0Ugd2FzIGNoYW5nZWQg
aW4gMjIuMjIuMSwgc2VlIFsxXS4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL25vZGVqcy9u
b2RlL2NvbW1pdC85Y2FmZWMwODRlNDg1NmUyZjAzZDA2NTIzZWFlZWMwYzhiYTM1MmIyCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgoKQXBw
bGllZCB0byAyMDI1LjAyLnggJiAyMDI2LjA1LnguIFRoYW5rcwoKPiAtLS0KPiAgcGFja2FnZS9u
b2RlanMvbm9kZWpzLmhhc2ggfCAxNSArKysrKysrKy0tLS0tLS0KPiAgcGFja2FnZS9ub2RlanMv
bm9kZWpzLm1rICAgfCAgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ub2RlanMvbm9kZWpzLmhh
c2ggYi9wYWNrYWdlL25vZGVqcy9ub2RlanMuaGFzaAo+IGluZGV4IGMzMzcyZjQ0M2MuLmJmN2E4
MzU4YmEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ub2RlanMvbm9kZWpzLmhhc2gKPiArKysgYi9w
YWNrYWdlL25vZGVqcy9ub2RlanMuaGFzaAo+IEBAIC0xLDggKzEsOSBAQAo+IC0jIEZyb20gaHR0
cHM6Ly9ub2RlanMub3JnL2Rpc3QvdjIyLjIyLjAvU0hBU1VNUzI1Ni50eHQuYXNjCj4gLXNoYTI1
NiAgMWJmMWViOWVlNjNmZmM0ZTVkMzI0YzBiOWI2MmNmNGEyODlmNDQzMzJkZmVmOTYwN2NlYTFh
MGQ5NTk2YmE2ZiAgbm9kZS12MjIuMjIuMC1saW51eC1hcm02NC50YXIueHoKPiAtc2hhMjU2ICBh
OGI0ZjE1ZjZlMWYzNzE0MjJmMWY3YWJjY2E0YzQ2YmQ3YWJjMWM3MzJjMjc0YmM1Y2IxMDhiODQx
YzFmMGZmICBub2RlLXYyMi4yMi4wLWxpbnV4LWFybXY3bC50YXIueHoKPiAtc2hhMjU2ICBkODNi
OTk1NzQzMWNjMThlMWZjMTQzYTRiOTlmODljZGU3YjhhMThmNTNlZjM5MjIzMWI0MzM2YWZkMDU4
ODY1ICBub2RlLXYyMi4yMi4wLWxpbnV4LXBwYzY0bGUudGFyLnh6Cj4gLXNoYTI1NiAgOWFhOGU5
ZDIyOThhYjY4YzYwMGJkNmZiODZhNmMxM2JjZTExYTRlY2ExYmE5YjM5ZDc5ZmEwMjE3NTVkN2Mz
NyAgbm9kZS12MjIuMjIuMC1saW51eC14NjQudGFyLnh6Cj4gLXNoYTI1NiAgNGMxMzgwMTJiYjUz
NTJmNDk4MjJhOGYzZTZkMWRiNzFlMDA2MzlkMGMzNmQ1YjY3NTZmOTFlNGM2ZjMwYjY4MyAgbm9k
ZS12MjIuMjIuMC50YXIueHoKPiArIyBGcm9tIGh0dHBzOi8vbm9kZWpzLm9yZy9kaXN0L3YyMi4y
My4yL1NIQVNVTVMyNTYudHh0LmFzYwo+ICtzaGEyNTYgIGZmZjQwNzhjNWRlZjY1ODU3N2Y5MmM4
OGRiN2RiM2JjMDA3MjkyNGJmYjkzZmU1MmMxZTc0NGE1NGU5NGFiYjggIG5vZGUtdjIyLjIzLjIt
bGludXgtYXJtNjQudGFyLnh6Cj4gK3NoYTI1NiAgZWY4ZjI2YTNkZTE5YWNkOGMyMzU0OGU2YzNj
ZmMyMDUyNjEwYjBlNjdhYmI1ZmQ2NGRiZDkyYzhiMWMxMjQ1YiAgbm9kZS12MjIuMjMuMi1saW51
eC1hcm12N2wudGFyLnh6Cj4gK3NoYTI1NiAgZTJiYTEwMTEwYWQzNDA5NmMwNTFmZTQ3MTM0ZmNk
MTIxNzVlY2M0OGU3ZTg3OWQ3ZDRjNzhiNzBjZjY2NDQyYyAgbm9kZS12MjIuMjMuMi1saW51eC1w
cGM2NGxlLnRhci54ego+ICtzaGEyNTYgIGQ2MGFjZmUwMGEyOTMyMjU0YmIwYWQyMGUwMWIwZDc0
Mzk3YTA4NzU1OTVkZTcxOTY1NGIyMTRmNGIwM2YzMDcgIG5vZGUtdjIyLjIzLjItbGludXgteDY0
LnRhci54ego+ICtzaGEyNTYgIGJiZTc2OGRmOGQ1ODE1ZDdmYTc2MTI0MDUyOTg1MzMyNDUyZTBh
NDc0MmQzOWYzMjAyNzU1MGQxYWFiOGY2ZmIgIG5vZGUtdjIyLjIzLjIudGFyLnh6Cj4gKwo+ICAj
IExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIGU5OTFkODE0OTdhODViYjI0ZmM2YmZmYWUw
YTM2MzdhNmFjY2Q2YzZiYzVjZTFmMmM1Njk4YmQ1NTVjZjlkNDkgIExJQ0VOU0UKPiArc2hhMjU2
ICBjNzM4YWU0MTNjZjU2MWYxNzRlMzRmNjk2MWY4Y2E0NThhYWUyMzY5YTczNjQwZGRhNjIzNGM2
MjliOThiY2M0ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy5t
ayBiL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy5tawo+IGluZGV4IDlmMDFkNjBiYWEuLjExNDcyNDU1
MDQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ub2RlanMvbm9kZWpzLm1rCj4gKysrIGIvcGFja2Fn
ZS9ub2RlanMvbm9kZWpzLm1rCj4gQEAgLTUsNyArNSw3IEBACj4gICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gIAo+ICAjIF9WRVJTSU9OLCBfU09VUkNFIGFuZCBfU0lURSBtdXN0IGJlIGtlcHQg
ZW1wdHkgdG8gYXZvaWQgZG93bmxvYWRpbmcgYW55dGhpbmcKPiAtTk9ERUpTX0NPTU1PTl9WRVJT
SU9OID0gMjIuMjIuMAo+ICtOT0RFSlNfQ09NTU9OX1ZFUlNJT04gPSAyMi4yMy4yCj4gIE5PREVK
U19DT01NT05fU09VUkNFID0gbm9kZS12JChOT0RFSlNfQ09NTU9OX1ZFUlNJT04pLnRhci54ego+
ICBOT0RFSlNfQ09NTU9OX1NJVEUgPSBodHRwczovL25vZGVqcy5vcmcvZGlzdC92JChOT0RFSlNf
Q09NTU9OX1ZFUlNJT04pCj4gIAo+IC0tIAo+IDIuNTUuMAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
