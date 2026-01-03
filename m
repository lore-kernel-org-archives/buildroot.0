Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60DCFA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BBB60AC8;
	Sat,  3 Jan 2026 11:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yazTo0yucO44; Sat,  3 Jan 2026 11:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6912860860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767441576;
	bh=tjWWhEF7ewsV8x5mR1jgHGqbpDhtUdk17QwGLFwnIZM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SRY8VdP5/6VRTPppsEDOEriLOPD6yQvF2JYo4oK7wQ+y9WpW0LGUq1jpLoRgJ33vr
	 AnOpv8QwfwDS8OPhCd/hBFhdk+m8F0Bs+7y/CN/q73DP+WITaBMURm1/ymt1SllbwO
	 DS+d2W5rJx8qxMCX3tUopFD3B7YNaX336MTFskPCTDgirgxT5jbMPwa/1Uxtb6G39R
	 OynjrCh/plzPviv5s3yhTzJUYbUBUk19oTUMbTtONB4hvUmckhZsGe2Di8wDkE0cDg
	 8s2VBcI3wmGhxRj8c1Mn25EksibY4xahS4pAyumSjCa9NBjfx8vEHEqXWEIqBSzCAZ
	 i6YUGp9qxLlGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6912860860;
	Sat,  3 Jan 2026 11:59:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32E2A440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3081160860
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_6nR5Khc0X2 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:59:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7814F60801
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7814F60801
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7814F60801
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:59:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 360885FF95;
 Sat,  3 Jan 2026 12:59:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:59:30 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:59:30 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20260103012738.765597-1-james.hilliard1@gmail.com>
References: <20260103012738.765597-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <3dd7af22a14592f7b08bbca33bab59fb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767441572;
 bh=6Q72W+sZetDYkz/MSi7d8RXUQmNBIKROkP3YouGlhm4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pZprNdsKYDzpp/PwHfDArmTkTs/pm/kW3Zb2ORSf587NtXPur4C8jnYgaUCRZnsJz
 qii4v4sxfz1vtBUUWlJG9J8DTPQC43LzEXt8AX0l/5mvzQcBPzdZuKULNKvd8+LatC
 GfoQ8aU7cpitAzjl+23k8h2fpznkupZxmIN5SCKUwYrfoKlPY/OWFnm27fEJFy6ksF
 dVvkQ6DBkcn9aePkI+HyOglNIMj8fIk65KxzM5l/YydgprAr5sK8AsB8Grl7yhLKyF
 w6XROm56Z6w2zAnngz5Jor5rqnEk+IYLbRPyrACv3qTrNAcpl5t3Mx5jnXfLRqyern
 HgOhcs5XocSDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pZprNdsK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.42.21
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

On 03/01/2026 02:27, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
