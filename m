Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6805D72371
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD8E160B04;
	Sun, 25 Jan 2026 21:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mS6hAV-OHl6; Sun, 25 Jan 2026 21:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D181360A87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377701;
	bh=Ylc/oN3k6L623tJG/HFX88cbz7zDew14iDJnv6l9zVE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RCbQWT6cO0tvx0/JBUhqe8aIHhXsu84ldcufCEOWLkcQwBalY2Dnm+mKgt5NAsOG2
	 IK5vxFpElQq42WK6Htdn5hYd8dffIniFHxqRsQKMicy2oyorIAIslTSGeoM2LmyelE
	 lLT5buQtkw5GQJJMpP/zsQJyIoQ7IuTqRXpSyJQuBI7U4RmCmhCfHQKKF5SVcaG4eg
	 2KXeblvB9SF7jg569B4RA1rOFrQvx3ll/9iXCGFYIE9UWeK4CMQCfHZ/Fk/U0e4zyg
	 A0atLWejvjv5nTA7WgVewSFrj8XdrR4NzADCgZEjIcGhvrnG52MYa3LQ9sdf+vtreM
	 ylDmEi1z2w14A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D181360A87;
	Sun, 25 Jan 2026 21:48:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D36C935C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4D4B60A87
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Q27zLAG24QN for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1BA6560A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BA6560A6E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BA6560A6E
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:48:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8B76013F899;
 Sun, 25 Jan 2026 22:48:14 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 22:48:14 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 22:48:14 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bryan Brattlof <bb@ti.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20260124152941.902168-1-dario.binacchi@amarulasolutions.com>
References: <20260124152941.902168-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <ef4c2e4f35db9ad9980c6df407c86432@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769377698;
 bh=hazTcO44yEQ/7Q0Z/+LgAgqS5Yui8wBqpYQZPETmykY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DdcHiIXfp67f3trAu7ECwuHTPwS8ACgnZUnpIDHhOKOs59EHp9sp571WQs2GYRAEP
 mJVGb5wvGYYKyEcMyfxNb0hinCQWJUd6XEmduRFRXHFir56j2+6WVy5PbfNl6xEVFf
 w/X8MJDGSTF+yAD4bPmc690CL3RclcAlUqwdewElQtOyXxCaXClPQqkYFKv/D3Q2FQ
 /KFJHCgNipOK+50rUUg9PzJR1Vc0xy1opqsOfWvNF2r8jDO//dz7kHxuwqiLX65YmQ
 nvsQuyK0x/nNIYDNLF42VqWxg/RDgO+eJbK+Z2/KWnBsa3nmz+uNqR8CrG9G0Dggca
 w7bOu1ivMyNIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DdcHiIXf
Subject: Re: [Buildroot] [PATCH 1/2] board/ti/common/am6xx: remove debug
 flag from post-build script
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

On 24/01/2026 16:29, Dario Binacchi wrote:
> Remove the '-x' option from the shebang, which was a leftover from the
> debugging phase and not intended for the final submission.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
