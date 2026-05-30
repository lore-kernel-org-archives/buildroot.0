Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7EECD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 980E26F579;
	Sat, 30 May 2026 21:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qOwAcG0gxe5; Sat, 30 May 2026 21:28:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BB6B60ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176500;
	bh=GuW9t3qhcKG5z4YHUo4jOqQPIBKiwu62oHKqcwyKR40=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AAgcnPMW0B+D43dv+3EkMc5PKBdIBH2gRtZ63V1jMYrtRlEvZLfUdfixhOqtb8y5w
	 SSXqCXX2O+0f81CGcVGeVphZqs17tJmxBs1fJ2xlI5OraQdGEH4jKdg01YQUBtNczg
	 BltPlIpxBJduagq4V/pElqOLgKZNPuUEnHKxYvraWn9lcc+U7DqlsdvuG+34D5HWPy
	 n+B5eXhye3bgMhKn2Jt6LCgGRtV68gUxC8finfnRZa69pkPMl+7dUmzQYnn3oZJvMp
	 tzjS9zEfWWu2MFsgSgS3LZ/p/8JCks4TYXxZg2IiaJv0Jm4DJsKom7CJPOeTOBxLUp
	 2rirGEbyDqvfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB6B60ED9;
	Sat, 30 May 2026 21:28:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E724512F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C709C85460
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvBqSPj82AKw for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:28:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C25BC85456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C25BC85456
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C25BC85456
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:28:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1B3941A3755;
 Sat, 30 May 2026 21:28:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E51B46073B;
 Sat, 30 May 2026 21:28:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B47D310888CC7; 
 Sat, 30 May 2026 23:28:14 +0200 (CEST)
Date: Sat, 30 May 2026 23:28:14 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <ahtWYD6Oxw0b9KFv@windsurf>
References: <20260508205303.1367063-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508205303.1367063-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780176495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=EWeBx6DOjOOC6J1QZJjYwimDlV5jZm9xdar7VbazIlo=;
 b=Vp5fx2JxU0BzRL5KsscsUZrCQX6GZOO+7/9LMot1sSx/f42zH5S9jnfP7mxdqLWlybLeGQ
 ItAmVOa076/l3tTBZ8oWWzh+qydrBv6z6ZXnRTWrXMpsl5ldHicq5oof78Avclo5WU+EPz
 p+D+/XCSxVZ5Vs+HNMA7LVc4exFKPh1kQDL94rLAKvPAMzkV5QTTc31x/Dt4WhVoh9Sfpu
 1xeI4/c9oPKJjLw0CpWKPktvThdlf1hcXNC08MmOHGot86uE3Zr08mpYS2gwF70q33HJ5w
 RQueu/CrFX5TSzIfNnoGWNfE/JsS4d4gJZPFbB2GQS9UaIj08xP/gSfT1QiPrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Vp5fx2Jx
Subject: Re: [Buildroot] [PATCH 1/2] package/libcamera: bump to v0.7.1
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

On Fri, May 08, 2026 at 10:53:02PM +0200, Julien Olivain via buildroot wrote:
> Changelog:
> https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.1
> 
> libcamera is now using C++20. This minimal gcc version is increased
> to gcc-10. This commit also removes the gcc >= 5 requirement for
> the lc-compliance sub-option and the CXXFLAGS condition in the .mk
> file. Those are no longer needed. The Config.in comments about the
> required gcc version are also updated.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks, series applied to next!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
