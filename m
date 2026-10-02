Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFEACA5FE5
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA474812E1;
	Fri,  2 Oct 2026 20:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_1vJnwYZHYQ; Fri,  2 Oct 2026 20:29:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B1B1E80D50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790972992;
	b=F4R+mDV1JrZD97/Dboc+EGbKPdeT0G83mxRaupj0Q2T+Uf8y2Pry1nQ2EB8jyuQIxhuj
	 BOrw8Hv5nOU5vg0Y1JOdw6o074O1/jAwN8lxL9Elpp+C2t9o2ZZQX/ejJ1ugnEjW1qCux
	 HnHdK0CNm4cmBztR7IrDWS6Bsu5fw7C5Xx0TXqO02I9oOxwSf3vky+0oSKDE8vIJHWQoz
	 JfR+84GIZLxHZxpRfzJTvglkfZUsoY5YCoyJwQnIB8iV8A5mtRXvGJsdcdD+nMQBoCyhI
	 XJE1XVKAX1qK/aXJesZZaKRvEjpM1I7YT0TnGgfFER3blHf0mz1v6+3CWW93TSry2WA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790972992;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=e7qHFGI4Gn0USWaLgA3vYdktpkf8BJIA3YHTGilYTYk=;
	b=sieeTkf2Ht0SDtOz4hkD9aL6rl2WLc/8DD25nrR24o3WFwhmbaSh2RG77AdYSEkQpHsZ
	 N2DMg987+SH674NewX7Gta4h99R2Y3c7Ar60h/wVDww71LBvneZ+Eazyj2LuXRxi6mOpG
	 9DvveOj9B3/KV09JFdpDygOJbjwebbQfutpjUkuMcHkyNK0yNncrD4qQDCFLNAH0aQ1sI
	 8LrqjVuW6A8ztjtE3mrttv1lBXm7FAo3qTcat6Nz6bMmiK9roVWDjzI3P9HkX9Hq8d45n
	 8yxN60CzoviSnfs9YfM3rnrZUhq5onf5FuBMPqTrbHF4d26Jfa4d8ypUGbZ46OW5frw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=bearware.dk;
	dkim=pass header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256 header.s=simplycom2 header.b=IMUzceYl;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790972992;
	bh=e7qHFGI4Gn0USWaLgA3vYdktpkf8BJIA3YHTGilYTYk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TSLqnJbyfsQDfgtcdLQo5dKmxU8fxuA8KDRXf9KeWG0F63BwUc6umTeHVhwns6Shb
	 NbiWgo2lgEGBJQrq6pvIGDvywpdxff2+vFOqKdIkKFH8xRhB66s+iVaUqp+zapA9EU
	 X3q57T2y3/O5mPV3mXOhPhxOtD1hbS57W0isN1xfdq8RJWvNS+kyjNEjuSomLFP2/h
	 yDjch+jkzcMldX5zYRTjdH15dMCctU0GDStHVFZgge7zFo2zgPEIu6WkILXfBA9etj
	 YArNyuoyiUQy7ujzPmCsM8YXgxWIULWagSWyKAmQN9GHt5FMfxKAX62MWPHAf+6RLI
	 aIntQ3pRmY5iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B1E80D50;
	Fri,  2 Oct 2026 20:29:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C83AF282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE973812E1
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-7RGUDGpQiO for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:29:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4691880D50
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790972990;
 b=C1rTb3U7/bPIMap0MVq4ZhvYloazKJLCNUhHwsLyUHjO8fN7eOlQ1hKflYduyREdBfJ5
 W988ddnEjIvoDuyzsVZqH5BSQOA7u/K1zxFwsV/eW4dOn0nhPLkfzyK3Sf95wV7Em4Edo
 3xY6B+s2hnVKaebhwQqssSjLxgfNOSai69S7rRVf98QuQL6E7Mx43jY7pQ68BWwfR/DVI
 taLHiAzyjP7c9iePNwQTELMMCqMAU95UAj7J8Moxje5Tmhx3QFeGHND2Z/E5Oxhj79Xzn
 wWHq62gv114IK/4FgfnuPB0gBlIY6shTGOfB2CMb5O0XySAy76Qe6SU2ebX3N+B9KeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790972990;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=LOTyXepAsTrxDRblus/ZffJopJ3uf6Iuh93rPm1AJ7g=;
 b=f1lcvkTP1RlSyPRROSTMEKhkJ4hqCx0V+6UpuNZs8NtGMPt/B1c0tcfYFts8Wo6u/l7/
 kmSY1W1iXwsGkAaUi2dmU2E6NkiaX/7zVUaQ7ZLMg3QablexclEXTv5nZAPm8bpLvuf30
 Pl9m7P0rfxC3qOj3OOibTVKzOcsONZYX0qdIwgINb/Ks0olagRP1aXhbXj+L1zzlFxsNd
 H4soI8WJXqfCokUo+Cc9XFF4RtNYhUaVW0/9dsLZ2L+xddW8ATSjemMK3za91eG3eh94X
 Fm3kgFjin1WWGBCoTcodMHJcNxRe+ll7zUMAK61j8b/I1/5gpy1WCPcNdMuNKpVUsoA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=bearware.dk; 
 dkim=pass header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b=IMUzceYl; 
 arc=none smtp.remote-ip=94.231.106.210
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=94.231.106.210;
 helo=smtp-out3.simply.com; envelope-from=contact@bearware.dk;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=bearware.dk
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b=IMUzceYl
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4691880D50
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:29:49 +0000 (UTC)
Received: from macmini (85.191.81.201.dynamic.dhcp.aura-net.dk [85.191.81.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4hxL475r8Fz1DDb6;
 Fri,  2 Oct 2026 22:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bearware.dk;
 s=simplycom2; t=1790972987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LOTyXepAsTrxDRblus/ZffJopJ3uf6Iuh93rPm1AJ7g=;
 b=IMUzceYllIIZzyTIqWNm3IsrnbfRcE4lW64U6Jcc1L+kR0SCo0PGwfo9bIj9ntBFebTG3h
 MX+iJfI0/epR4+JDXabsgwtFXtEZhPQMFNdGuGFu6GFPiuzIvnEOpRISmIIx8aion+8Mbq
 XK3UYph+Mwq74wUw2yQKqDePed7MSU5ru090fvpeEJ/+3pmhE+I0UtgdVDixpla7Q6ZmV6
 vUTzHTrrO7v4x3P7nlel97lohEHJgpS2JxhWIS9Zbn9ZvPDRAohVqp1qL+NXWO/MS6GwFq
 0vGmuDthAUkFfTMFmn4dOUEehIB4zzJgVYYmsq08fQN2NKaizb0d8ki8KoUFYA==
From: =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
To: buildroot@buildroot.org
Cc: Tudor Holton <buildroot@tudorholton.com>,
 =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
Date: Fri,  2 Oct 2026 22:29:34 +0200
Message-ID: <20261002202935.943329-1-contact@bearware.dk>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/setserial: CPE ID for setserial
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

VGhpcyBhbGxvd3Mgc2V0c2VyaWFsIHRvIGJlIGNoZWNrZWQgZm9yIENWRXMuCgpTaWduZWQtb2Zm
LWJ5OiBCasO4cm4gRGFtc3RlZHQgUmFzbXVzc2VuIDxjb250YWN0QGJlYXJ3YXJlLmRrPgotLS0K
IHBhY2thZ2Uvc2V0c2VyaWFsL3NldHNlcmlhbC5tayB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zZXRzZXJpYWwvc2V0c2VyaWFs
Lm1rIGIvcGFja2FnZS9zZXRzZXJpYWwvc2V0c2VyaWFsLm1rCmluZGV4IDliZWVlMzQ5YzguLmJi
YThkZmRiODggMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc2V0c2VyaWFsL3NldHNlcmlhbC5taworKysg
Yi9wYWNrYWdlL3NldHNlcmlhbC9zZXRzZXJpYWwubWsKQEAgLTEwLDYgKzEwLDkgQEAgU0VUU0VS
SUFMX1NJVEUgPSBodHRwczovL3NuYXBzaG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4vMjAy
NTAzMDdUMDg0NzAxWi9wb28KIFNFVFNFUklBTF9FWFRSQV9ET1dOTE9BRFMgPSBzZXRzZXJpYWxf
JChTRVRTRVJJQUxfVkVSU0lPTiktNTcuZGViaWFuLnRhci54egogU0VUU0VSSUFMX0xJQ0VOU0Ug
PSBHUEwtMi4wCiBTRVRTRVJJQUxfTElDRU5TRV9GSUxFUyA9IGRlYmlhbi9jb3B5cmlnaHQKK1NF
VFNFUklBTF9DUEVfSURfVkVORE9SID0gc2V0c2VyaWFsX3Byb2plY3QKK1NFVFNFUklBTF9DUEVf
SURfUFJPRFVDVCA9IHNldHNlcmlhbAorCiAjIG1ha2UgYWxsIGFsc28gYnVpbGRzIHNldHNlcmlh
bC5jYXQgd2hpY2ggbmVlZHMgbnJvZmYKIFNFVFNFUklBTF9NQUtFX09QVFMgPSBzZXRzZXJpYWwK
IAotLSAKMi41My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
