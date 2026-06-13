Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCE5CD98C5
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 10:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94391413F2;
	Sat, 13 Jun 2026 10:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCd29dXa7F3g; Sat, 13 Jun 2026 10:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB60413F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781346435;
	bh=Z1fE/8NlX4R+BeW+7ZjGppK6G0tFFcCEzCGR8iQZv5E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZdmtYJL5hYiO8TZWjCd8i3ISOeN66LBqeIe6HeKD9EUR1GDLMygunF/F+26HvO9Or
	 9nvkGlK4Nov2/p7oKric/DVEzyESKNsnzEdMPd64L4SP5DueC2abFDI6yDOVbzgVHr
	 0n3O4xLwdPqWlMEv9uHJmTwlqQH2i2/jj8cLhFvbr8FDKFAGL9+fA+BH+cq/KpToS/
	 5qFv4hqo0iOPoyVABM+expSbSPANvrtipVZNHmYkvdnR0Jgrd40G/9dsk+bHuhpxHv
	 AUAJT8GXHHXzy3YHlrOaLVRF9APM+gYMx62FOa8YaZyjNE8FU7kvUDeE08xAeZYqYL
	 1ja6YNZVaLDSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDB60413F6;
	Sat, 13 Jun 2026 10:27:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82081F4
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 10:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6837A60F36
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 10:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUhy3Ww5DvfC for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 10:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3638260F2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3638260F2D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3638260F2D
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 10:27:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 07D27780383;
 Sat, 13 Jun 2026 12:27:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Jun 2026 12:27:08 +0200
MIME-Version: 1.0
Date: Sat, 13 Jun 2026 12:27:08 +0200
To: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260612221016.1072569-2-salvador.joseluis@gmail.com>
References: <20260612221016.1072569-2-salvador.joseluis@gmail.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <2073ceaa6107f7b2c45d436d21c6e290@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781346430;
 bh=eDWmBBkBlfx0qB07Hy0H97sD02iVNBVzkN7770fdXyA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mC03kfxCa0ANob2qdMBlZBwHu0vCjOMPkc44IBL5sRDrQAE6yS748ckBaHJaIpo9g
 lrdBPSANS+rDPim9k5L7gGZUjamnuT4QvBTkEx3aqaqW+yyxoxdpCgkGx8oZDubmRS
 3QHvkcIVrMCu0DwzxCWrTnG/vUibLse8269FoeyWQ6DCpAE41cxD9RufPo3ZkFrnaL
 QNpPLzp/WV1uqhPRCWm/mKFqGomOIm6e3szZRnTVWAXxuMvmjPmbZhuWhvXw5NC2J3
 4lPbPHMHpRHmr5uqAhJiddSZQIckyHz+gSX35loFNhG4mcXxbqn5EIVrW65X19Rntk
 JTKuo2U6ihOxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mC03kfxC
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.4.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTMvMDYvMjAyNiAwMDoxMCwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIHdyb3RlOgo+IEZv
ciByZWxlYXNlIG5vdGUsIHNlZToKPiBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVs
ZWFzZXMvdGFnL3pmcy0yLjQuMwo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
