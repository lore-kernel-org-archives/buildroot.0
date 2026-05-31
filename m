Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0923BCD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D74AE60FB7;
	Sun, 31 May 2026 17:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VON0ya_JzWxc; Sun, 31 May 2026 17:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32EEB60F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780249190;
	bh=/BwfaJbwVGfKOhLcngGZR1eyEhrqEhKkuG4NLA6vUbU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s3aJKNcHSPzX4PKMqhNVYO3qrAjFPB0O+3VZt6dBfdl8ttaL5xklbTJQp9JIwpvaj
	 rKB60K1+dGu8DwNk2/jOdeEXKvKsf8v9Ri2lmppPrx7H0RTlcRDbx1+afl1G94A2sh
	 PNcY2NMXzaKNxhCYLO+iLwxz4+lngYNTqE9a02/yr+Db2A7ozwcXJZ7nnP3jfznnaA
	 vnIG9TV24Aj2WqMG2iT5mh6cyiS/sokhTp35R1TSJoLgvo2xLVGmeTAFNiN5In9Rwt
	 9huXesq2Z+pXDcXg6DUrlcKLgARy6f/qoL5b3kcZ2br/DK0ouHcSm4Q+xcqFYE/NW2
	 U0j79RBc5L2Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32EEB60F34;
	Sun, 31 May 2026 17:39:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21224F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EEEF60F34
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQGtO9MzYCet for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D9A960ECC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D9A960ECC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D9A960ECC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:39:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6CD2B4E42DB4;
 Sun, 31 May 2026 17:39:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3AB4260230;
 Sun, 31 May 2026 17:39:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 730D110888CC7; 
 Sun, 31 May 2026 19:39:45 +0200 (CEST)
Date: Sun, 31 May 2026 19:39:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <ahxyUyrWzHk0QjCW@windsurf>
References: <20260531172916.1678206-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531172916.1678206-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780249185; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=IOdlyOq8BjOZSYvt/uCTb6BUCMvtaw+HCeEUDIie28I=;
 b=SCOq6ZI71yrJT1pywADZ71N4azHZqm0nxCs1msvfFEps0p2eFbdLWzLT4al30JPoDv0cda
 ypjJGfd5mvpEcESXpPKyJWSuY5T+twGwslY5mbEBLFfJZ96EiEc+2SpenenQOt/BbZOTmj
 qBjYOXG4VbzHqkPfnm5qa6+rglG1KFAvP3Ril4cnGHVaVVv1yrCIasK6BrnH+VbM+g8eW5
 dSTiPtmeiM7MphlYG3+vvGdJRKnFbfhS6dXwpzkODsbsm8NmubeAWX+HQgl78gAtnTNFq1
 bqoqQh+q9lagrsbL1VKpMfo7ha6D8s1P4rW6wG/O55FE/m4PaTTNj/PZldQTOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SCOq6ZI7
Subject: Re: [Buildroot] [PATCH v2 1/1] package/cppdb: remove stale patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, May 31, 2026 at 07:29:16PM +0200, Bernd Kuhls wrote:
> Remove a stale patch which was not removed when the cppdb package was
> removed by buildroot commit b7143b2e22dc6d5f6bc0f7fe745118db7dbcb787.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
