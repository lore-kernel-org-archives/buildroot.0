Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E172CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37B2060664;
	Sun,  4 Oct 2026 16:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9rIiLTBEXih; Sun,  4 Oct 2026 16:01:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4DD2F60614
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129707;
	b=XRTTmiJIY5zX3oBBN04f7HxotlknyCbDio5MxARbOK3Ht/GZuS1y/w+6UiaJPfXtBByz
	 HBEXhEllTBSUTEod4JxZ/brt4xZabU5njUYomUKcC8Vqlt9KPhZU9QUl24fyO/r3Gwdgk
	 xwnXkGd7X9IcxXAWUE0Y9MCT6p+Cc0+FSOGdbU/J0kYbD4YCTJHZlHDDSHvfhzOePxQ6N
	 JY4XEnvkg5RAZoUiAELjzY+VHcz0UCIgPLaXrKSwXSLVeVhoUfuiuRBodgj5QgsAwTDGe
	 Gu7BvFn+uSB3o9hRmMAggNVSGhODtJR2Mnff3JdsrevIi3W3dk2lYNJGrB15nPBUBGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129707;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wnDIx9K2XM9dxVMAONFH9KxW7Fpk/oLutFOfSA5gPjA=;
	b=U9WfITdI70uEd5cr7LroAYQDgaP+rVe8UH6JBbjBq87WMc1UmGKE4CbHc31pM8TROFJX
	 a5XZqfjTYMSOMAn+3NWE0LfRrEjJ3CAaAhJGCb3Po3SAfjbEKEbv6nlDopijtc2Fil/4M
	 WQx5bGPDPpcR1vmBQ/iwoeJdf9lnZ9RKwm6/gus6Heck/OtJTKDrFhj4GB+ZpzsZDCrff
	 +9yvY7EBDqpjLaM4mfUW1O6Mh7IaAXK3SR7Kt8Y8TY1VVP2OCqqW2qZ3/uByDbIU/3e9I
	 myCUCBChhfmzt0goRThx/Nsujd1XkqhG2JRJepVRR5EReym+hDsAmllas/vrWcWl1Cg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129707;
	bh=wnDIx9K2XM9dxVMAONFH9KxW7Fpk/oLutFOfSA5gPjA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i4GjZxeGtrqD/ltPpm1rr2eWSHua3g4JHF2PuWJKUsMp5EIhgcLtNQdknPTdV41Hf
	 7p2JebAhX5wXDOfpIjfCkQCW/9kQsbLBlEb0rc/82F7I0ikFi1TkeUHOZminIWgJWY
	 o6prZEi5an2ZhZTtNBQfrQ+qOdf49Fy7vGGKT6+MqT4XMI84q7wDAN5YpqCirbUjP5
	 gHlDaS8Y2sa8myJ55d1Tl9l+VqQRAo6W05URldd9taMUwsgLm4sejZ8nTZDx0hfl7z
	 HWbyEgecFoEbLmVyFO4wYo4Jk+zqiZZG9nNXo3o/jCsoFHnBx110P/IuLAv78gho9+
	 L/IpVe4SbLICg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD2F60614;
	Sun,  4 Oct 2026 16:01:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED21232F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF40780D50
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8QnB_XKgqEd for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:01:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2A37C80AEA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129701;
 b=IY4j90z6XLbg6cGMYibzn4PO/pYDiPAyr3zFVu0FBoQ1YTGnxiDW/YqovAaQqL407+4Y
 JbwqaMRq0ahL+Y3yu83gRvIdExTebj2MTuIw7XYI3cB8CmE1ujZvnhuFf5DnWMWUINN8M
 2/6ThNSJJAP20AwaLk1FQvpcbRppa5d6cjFRopqj0PJE5eOIwMrDrfnWvYDox8JUUuFF9
 r9mXFg8WpeGGNJnHs8kE7VBjAkt0nLTi9uk1fo4quOcwUjf3bRjeZJnNHFPUCo2n6eouK
 8mightuMgXmpWakQnLQkZTaSWimyAP6hWz+pNeiyELFsQjZmuplmsJYIxgqYZzut2sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129701;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=4y1rZShsCqOLEG6kyirXY1mO5TxQN3F2JQIGq8YqIUY=;
 b=BPJ8Fp22M+dSmH6huywtv5O8LgHM1IDH2ldyPPa03twhegSU1EJJ1qHI0us6qkpCRCzY
 1hw+UoXeJRBNPImigQij+L1sob6rR0y1JXO5Ob0zrrgpFSFWdLlmPbI2ZTmuTiPJK46iM
 9QzN8Vj8nyI8lpR7EcWWpM620nJnOMuTA0smVi//EPAOnWdc4M0YmmSyPgOaWyIDwK4Eb
 hoMZBqj73zB0LG8ZAV4pCdqmzfBFWXd/+QCd12rZfzrs83GlZ0qQO4U7qQXQWN8U6gwGI
 1AnMTPOjnGZFvW9y0buiR3dYVtoXIbXs98IHxOl+LoqkUfcSu5Y8dds0Yl/4pbfjCHQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lniqN5Va; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A37C80AEA
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:01:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B7C3A1A1133;
 Sun,  4 Oct 2026 16:01:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8DE3C604FE;
 Sun,  4 Oct 2026 16:01:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC7D0103281F4; 
 Sun,  4 Oct 2026 18:01:37 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:01:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ4XGMDm4jGCL4k@windsurf>
References: <20261003210833.735937-9-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-9-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-librt: bump to version
 0.16.0
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

On Sat, Oct 03, 2026 at 03:07:59PM -0600, James Hilliard wrote:
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
