Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CE8CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE57E80D50;
	Sun,  4 Oct 2026 16:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQofD9smPeRp; Sun,  4 Oct 2026 16:01:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 004F480D83
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129689;
	b=VEImIzrZcG3PsGUbMfO9kDe/rHmnr5pv8yff7uKNCk7fIHv6mugsAaMOyL9KXd7wYV9R
	 JIvLeNFqmAKCjuhGYpL3rX1jqmGkS3noaW38Qc3DDQTxJoBIYO6vwwjxybTseDzZDu8jZ
	 K6RQhVs5ELIlzcmbWs7jX4KMxHLH2iyLCx+S4qesCnqbGgmUzFfhTEOxQB8ADerbJITdQ
	 3iqCsww2Jaa3C4jO9q2RxPa+6iH/4rbu7OMn20xLJwbA24jWfRuH+nBdL1wZMfMaXRaNs
	 ZVFhZvTWqoWRVta8xmWV1P+WTgFZ/e7ywL6LARfYvJD7qKTvt0HNrH0cVl0eLgB1frg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129689;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xby9zMsHSo44dGvvLoEabaeFQuAcKZKCfCN2j7KdF2Q=;
	b=WcrroJ34Gp4nCJxCEq+5zQaQ/bu3rlXB+3Pub+25VczDqcJ4IwakAAkQlYp44St0OEOZ
	 EBQZ86gLLeNMj6B3gHk3d1ZP2ZQozCKrHQ/tXJY6tqcsC5Te5Ns4C8Bp2tqzNcwcQE5c6
	 F4Pa3+/tkJ1gjdmcgsITjS8gFKm8QsgVFiZVJXqJ6F9t6FFj/Yrq/mqwrC9DE3Emf+4gw
	 WZQA2LNzeLvECPjm/lFnqvz/tIMp5CGvDPwdIy3+/AKr19i0NznLdRBOFxSTu5IAP1X+A
	 748SZJXy+WncrZ9ahLBPQhAW83zixuvRg14ailtwFsB88gDPmRA9HhcGJPXTL20oSZg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129689;
	bh=xby9zMsHSo44dGvvLoEabaeFQuAcKZKCfCN2j7KdF2Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ewTC1yyBwJNHbYh5jVkKwWwettKxv+ZKlr05JZ7+gnv1IrJutRMLG4OzS5x/uqNvP
	 g3X1hDZoTuKvGeWcmH2tiuSBO+WY4AsCzFz5ishwVXVcJwskz1kjPOlcdUZ1MeXsrW
	 BgsSi6cdF7ZYENraXzbb4G4ibGgn01L9xC7QZKWBLdNwT9VZ/rWyjljwCWIO4HboQa
	 sc0q6fR2ylAlJz1I3+eUfz2rswqSl9Fj2//a0AIGHh3l2QkhjMw3sZQYinMQZaWk8r
	 /OozpSB5+PVDGrtSrbyXt+QQzKKhcRm03CEEwP/0KJc7tk/PFJC6JXLCVWLtYdEJzB
	 rrbn5nPV41zlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004F480D83;
	Sun,  4 Oct 2026 16:01:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 916C332F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7707880D83
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W34u5QoZqBLa for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:01:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9535680D5C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129686;
 b=U9bLUupGOial3zO1fvR5ehmiQgHU5HhjuumJ17PK8MB3kq/tnpKW1A+Qb/Ppz2I4K7J9
 SvbqbByIcIE4wUJwt+UhwX+G3+RCPTlfDHv7rLh0Q3DZ6kwC8Qu3XKqu0cGjVo7oGxzC2
 ps3DkKcpfWw/53z7PvUdAqQUT8vXjV5FIeBFC76cs0e5M5aMgHfvnsXS6v7AQCevwTmbp
 +OT8U2T0e1hM/YVN+eEcmx/gjad7BZ4nDUSCXrgNB0q1/UgVRba9N09smJf32hex0RMtx
 PXt3GC2a0psd6Omz5rTIoeLHx8yMX22M+gvbw8a6MmhR9k6Ongdbi2G1EKLb4uLpUFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129686;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=p+W7d9YLtP8yrI9w0a1ji7ifDmrTHWRKoLM9SxmUhSk=;
 b=hctkg3vHkhb7kWEpnQ0teq7845kDWwdEgDntQLu6ozzp+RfSxsxSuNnHY9F3OhKCnFvw
 GTh9rMiIfqhdWasEDauzZ2+vhe3lup0uL5BYCrgBqjpxsxpAWJfFu3z//NQmlFDiLC/Y8
 0bINGyAhFpqgiXEjc3BOBcVAaFBqLliT0lUsKantSNCOYbJxkDinN+hlmSKUb6VxO5JPx
 NUpuj29M0mATKQMcH5H90um7SZ9ioWBf5V8MDD9+cvn37xp3aK90f3+DL1XamPWMN6sEk
 KI3CVWmxlD8FbMRdH2AjSUi/xKqQ5hOxV4oEsLPWd+QWWiXan2fn7sfv7WLjtZrq1rQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=a7OQZfr5; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9535680D5C
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B331C1A1133
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 88EE7604FE;
 Sun,  4 Oct 2026 16:01:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ECEDA1032820F; 
 Sun,  4 Oct 2026 18:01:23 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:01:23 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ4TVR6siLdvgc2@windsurf>
References: <20261003210833.735937-8-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-8-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jaraco-functools: bump
 to version 4.6.0
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

On Sat, Oct 03, 2026 at 03:07:58PM -0600, James Hilliard wrote:
> Update license hash due to the copyright year inserted by
> coherent.licensed:
> https://github.com/coherent-oss/coherent.licensed/commit/3b3a6b658d63ddde59499f8ff45b505abea3eb9f
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
