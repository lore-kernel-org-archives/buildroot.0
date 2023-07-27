Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40C6C001E0
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 11:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7804761327;
	Thu, 27 Jul 2023 11:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7804761327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUB54u2Epa7d; Thu, 27 Jul 2023 11:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C39AF6120E;
	Thu, 27 Jul 2023 11:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C39AF6120E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66A221BF424
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 11:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4752740359
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 11:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4752740359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JeffXwMeeNVY for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 11:47:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26CBB400D0
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 11:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26CBB400D0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBC7C61E02;
 Thu, 27 Jul 2023 11:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE4DC433C7;
 Thu, 27 Jul 2023 11:47:47 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <169045501791.6100.10586717881840201028@kwain>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
 <169044563315.6100.13848963115642161448@kwain>
 <20230727104821.496f8f0b@windsurf>
 <169045318850.6100.416444363161517133@kwain>
 <20230727122449.3b7993c6@windsurf>
 <169045501791.6100.10586717881840201028@kwain>
From: Antoine Tenart <atenart@kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Jul 2023 13:47:44 +0200
Message-ID: <169045846488.6100.3719643344367860802@kwain>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1690458468;
 bh=/FdM142dM6KJspEbU4V5IFAgbcKtN8bOvhcAP5PLsCY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=BD4Mzcd3futcTd6iX249Ce22TwvS7sdSWmwM/8KkmF5dUTEYrrFsyvimsEsJmHds0
 Kghd+l5P7n/iwP+nL3S2mJr6Z1wmfkTqGyXWrOkx+jUeKahjk6pO4sGkCnwPzX31Ph
 l5VtYCpPfz0ALOzulyW3D4J9lW2doOV88X6chuoQJA4CT9Jkhpa4dZRMx0VjSVe+td
 fI37PsTCdto/aIVtahLPQnheTnLmdOV6bbfjQ9eiZqOBM3aoRfNt7Fm9aZZDLETHL6
 W2pt97KAuaqn4Lowdi79pWA1R5Js/LW8DB8+duCqMHV/IHBau/yDGbSmZBDgjF7FVk
 lOHzP4l14Rnow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=BD4Mzcd3
Subject: Re: [Buildroot] [PATCH RFC 1/2] utils/docker-run: make it
 compatible with SELinux
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quoting Antoine Tenart (2023-07-27 12:50:17)
> 
> Without having a full understanding of the implications we can still
> expect child processes not to have more rights than the parent

Hmm, my point doesn't work for non-rootless containers, the Docker
deamon runs as root. Not that this changes the other points.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
