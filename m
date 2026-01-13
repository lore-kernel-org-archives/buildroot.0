Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B345AD30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AEAB60F9E;
	Tue, 13 Jan 2026 20:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuT-nBE5dgzZ; Tue, 13 Jan 2026 20:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B35660F96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337996;
	bh=QDz1xzSoyvBgMFCQasvUOmElwtNnpllgoau4DjbRQQA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OzEk8xnhmL0hROLt8cN0wU9HrKKQQ4rd9NaCrFDdzQ0kzJA3DX1HR66sxzA91/G84
	 0A5Gm5jWw3crmstIY80kYfs1NA13HsNT4MaQMRvVaM+ECHN1wMTfzNxkmjQKFvIXrD
	 atx3yo3v5BzIQwArSml2XuJ/Hfd2NOcOvQ3NA9F+MTlSp+aV9iWrp/c5kZXWvDOrcd
	 sOImsp0igx86g+k/Gz68WiriZRhjLxV4uWH0xtoo7vL01hg9054dPx8PefFg9s4G4h
	 LKwbeDimpptx/27oCAH7HyZ0z9AJRot49IECj0Kk2p3cwHj8MV5kgBu6ScKsXJAJOz
	 yk5BOuAnwoc8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B35660F96;
	Tue, 13 Jan 2026 20:59:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6F691CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6FBA60D7C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OF3tMwiwjq6G for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:59:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED53D60EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED53D60EA5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED53D60EA5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0321D19F5AF;
 Tue, 13 Jan 2026 21:59:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 13 Jan 2026 21:59:28 +0100
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 21:59:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <e37d3ddedf9c3cb13617b15ecb84c6d1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768337970;
 bh=Qr3XLX+Nxscvz8peGlvH5vniQwzIoFU7eqhUyC19cF0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qdmTM83/f15NtCG0gF7lEJcnQ7byPszQREWeZFB3iSkQGjNLWtbQkPYub9Rai98Gj
 gvaYYD7oeHd6iaC9JImw36mAAixvmDTKimJ1s/Ja97qaSh4N0e0Zx1TQBIY8umnzE4
 HyE0vQzqGosBIkjwbh4rItn+4JHW+TFLVTrQhBqygGURtJrRYVuxtuEYE+t27KzwA0
 +EapdExvRS2BBn5ByPu68IuzV87okAzr7p89ouoYGuY4ayk7EYUQVNxoZJcIUN2YyJ
 bZx1BchJU1fnq5Mx2H1jCQOX05bth4DiIIuzO+OFc0K5tVeBbCq74LX84x6XqaJUPx
 udCxd8ypk/uEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qdmTM83/
Subject: Re: [Buildroot] [PATCH 001/102] package/x11r7/xcb-proto: bump
 version to 1.17.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/01/2026 09:28, Bernd Kuhls wrote:
> https://lists.x.org/archives/xorg-announce/2023-August/003414.html
> https://lists.x.org/archives/xorg-announce/2024-April/003506.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
