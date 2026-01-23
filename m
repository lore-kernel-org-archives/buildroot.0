Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A52D7237B
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 12:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2EA660850;
	Fri, 23 Jan 2026 12:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkeMTRtWlD4Q; Fri, 23 Jan 2026 12:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80916084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769172426;
	bh=ub0qUiMVvkk7wm1GZD1MIiGhumSLH3ttOExkqZbleA0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J/mUWtWcwNFwNCGH/zhcHN8D/zQfu0aw5QRG5kRndba9i3qKYtPlnI2OryBx97uaa
	 deDm0+rDThavmnwtZAbKagDq5/EMbiAGE/ZQLTgtmqwDDvsrLSvQ0SWj3975H4DK+k
	 F7ERvoRXUmX24EktRmJ68Rm9jCWOV1GXsxKc9AWxmShuyL+zBTuAHmFRq7qKJOrSki
	 5c8tzmAIFqjbkwFX9Df7w3fiKW3A3ykMRHS8reuI1x6fYM73qXrhfkNplyi3W8PmPE
	 jGpFwE/ZCxWKitmhc22jpD5okgauNKS+YUnwDCciZLSjmmJvW4axWNfFv3pakHxfU2
	 kSUdeqrbwM2wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80916084D;
	Fri, 23 Jan 2026 12:47:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8869D23F
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C7D640458
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mtgmU4rKCJX for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 12:47:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E3C140414
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E3C140414
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E3C140414
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:47:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 10F9B60128;
 Fri, 23 Jan 2026 13:46:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 23 Jan 2026 13:46:59 +0100
MIME-Version: 1.0
Date: Fri, 23 Jan 2026 13:46:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260123074449.3991189-1-bernd@kuhls.net>
References: <20260123074449.3991189-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <df6aa629886fec7ed623b4fa041c9bce@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769172422;
 bh=76IkKLSalf9bUtdjnue4iMfRXe+E7HKSFDTw0hqD1Iw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ugn3tkz1dIhXb0cZTuiHl7GB5/RG78H1sYL1FTGBHUy1QIuFx3td4jdfFmCfByYAp
 vJcEs68pgKlHMnKZgu1aSXmnK8aPxLn1yLQ2OdEMDPxy4XfsIzWsNAknj0xmDu05MB
 kOgKMPPUSUuCds/7PHA9d8FAX4cYVAJGLew2RO+4y4/O1rybttCciachpEwLMsOHM7
 fBPeYpTrfO2ILMP+15Cd37Zh3Z/47ZJqFhOFTrdazvnLXe8PGKMkRt1ngQt5N2g16Y
 aRduPOYTZIZnqLWAwS8GLXOVuVhm3EQa36rgDYvl2xBmd93MVEFFb1CQJUzgF7L3Nu
 zTTG0HgQWHw7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ugn3tkz1
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 4.2.2
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

On 23/01/2026 08:44, Bernd Kuhls wrote:
> https://cmake.org/cmake/help/latest/release/4.2.html#id2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
