Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8091F55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A70F941A5F;
	Sat,  7 Mar 2026 20:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kol5ytHISQam; Sat,  7 Mar 2026 20:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D907441A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772914796;
	bh=wwFM0oI/EC685JRKHB+jGfW5zguVXZsjPUjjoEnW5n8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YV7NmDPIb1lBgGp4usgB/yUuAs50I1E+eypqQihJxDdpesp/qWRU3daE2ehJlhGqV
	 02Pf+VdQRX3CeO/EvSksBuNDLPeevtJF3vrBfeyJLOttypXqt6+CU1o5Tgk4/sTs6S
	 iz+xQcXy4XfI6lBcPSQBjHS8dbuooAeue9yGBBqql2IqwuacgOH7mABJR8xBVgN4D5
	 1WdjwP0+mKirVsldslCeIBJ8eW49yU9WGIKvCzhAWFOGBLsZYwxxBxJNv4UHSqP1zY
	 96EPCfNenb2dBslkvVbtJqLyZwUBZmvOkqCkL2I8oykECOogI7Vj7CCPNnNSdZKPAq
	 wO3Em65L6/uwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D907441A3F;
	Sat,  7 Mar 2026 20:19:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C67D169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3991C60B05
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lg5KfuJH8rfY for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65CE060777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65CE060777
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65CE060777
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:19:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8234D13F88E;
 Sat,  7 Mar 2026 21:19:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 21:19:50 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 21:19:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260307185425.729667-1-bernd@kuhls.net>
References: <20260307185425.729667-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <f79eba3dfa95a1b7001bdfb4f9546c33@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772914791;
 bh=ycVafeBsPunLqxvBAb8tlG/D+INv065Xv1UVMBmdzr0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DXI2jdOKw8lBf3tgBVq+i5YVOtyyNe9X1zq1HtkcXIGJpSBLU5E8hA5TJNeP6sP4N
 GFis6aCfsdTqY6UQzxVwNxM6/GToJdLnffALBaVccE+ibYvfR6rm/6Oo8au7/wkQ4B
 pQRn5XGQNBxQIsTicsnLiEPU8HnYDUCxp3ICHJDJ5vS/bVS96cqzA417y9l92k1D7x
 2NQZw4OvbmJPA8lRQ4GqWqeM2kzSA9J+zsZsqZ/jtVJzAz2SN0yuLq+SKvowDbhtY3
 /wzARHfRYREh54tFL6ouVraD4NePCPN7//eJlk3SdD6ohSM/mKnSwWzWZmfTCnomSC
 MnIn7YwGwjnWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DXI2jdOK
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: needs gcc >= 10
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

On 07/03/2026 19:54, Bernd Kuhls wrote:
[...]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
