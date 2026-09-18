Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E05C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5923C60EE4;
	Fri, 18 Sep 2026 19:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skBcuPE34jaN; Fri, 18 Sep 2026 19:55:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AA25660ED7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789761320;
	b=krh0LGrrjUip6yHCQYHr4nXcgudCMpWJ9oecE5IQO0kBT0RbDkkvMFd0TPXsQxn6B99+
	 2dDw2C0mErEnYhu1t8c4w8pr0HK3//i8a2ur5EJJxCfBf7yJj31Q5BU3X7jHF3xbrItxa
	 lCxxEJLq0uW6MV7+DoyhXCPz7s1ZcDGcUx/YSa0BqWYS6ZURx+aGPsbPVtR+zb49x58D7
	 aR3R4EaV3wueoIDn1sTIKdk9rWw8xXbElsEk2OdzW6V6NANR1yR0s3T9cK6Iegmrkw3NO
	 Gn9S6+SSC0ivwUY/ktQ0LCMT6up3qvloKeRJgl9sZSfyWZyVM22cBCIxTJEUMucaU+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789761320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=blz7zsdgpmZ+yBQ9eUD3+4M+Z9ZoaY2ghFxbfuKFatA=;
	b=sMUAlzh1XotVPZ9d3nW9yFQur4L+5fPEQPQxWdq4ohIV0t14yG03DHtdpkFa+XtRDBN+
	 iuoT+1ggnwRAsxJHcFxh5wcpW8yoqMuEgBbu3+dO9hf57xd8M+LPqiqwmeFAW2uU77zMk
	 EmD4ieoxXyK5RGT1+sxrlQbmH/cvj/N0EayPlYES99ehndwMpO+qfIDDTkZMXPc6Onuqx
	 W8Ja4Z+uc2Zws7sAYmj8djFE2w4z0nSkG2LeHu4/EghlH+FXjbovBy/VyCrPZwuQhPF2P
	 7PA2KOiyemjN9he89Ib/wd4/3IMB6brexGnNF5HT+lmtWuYZOx++qSHWUsJYOI/7XHg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789761320;
	bh=blz7zsdgpmZ+yBQ9eUD3+4M+Z9ZoaY2ghFxbfuKFatA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hV4VxeZaXttLgq6Kk9YgS92NJHWiyGd7rOJ07swHsXFoU93haOEUoYxBU+9x7WWl/
	 uZBfZd60WNygTiWD8Oes6ha8hW2IWf79LCcWOzBsm5wii7PGgysFi6DLeOC3D5n0Je
	 5DrL+juhVSra6nQP4IszDeG3HuAGN1fEew7331fktdMJchSje0TL8CJvID07YubO5r
	 ucYvbIUOqUz7jMdSgv2JKQi5VOO1Up5s+sWGtl1RyUwir1QN4/bb2XJa1kLQTD68zf
	 Qqtn0F1Is+HTEqcOz3Jgz1ySX3PKe32UYkfIAPL3TOS7xw0R8Pnabxt9m/aV1BVzJ7
	 Y/MwFx81F8/fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA25660ED7;
	Fri, 18 Sep 2026 19:55:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FDF613D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 267AF400FC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRcb-dbG4YNn for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:55:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A3B214006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789761317;
 b=g3mR/O9udRxnWayx4WscjfTcl68oOes/gWGLfR19dtO2r+2wijs+EtbiMS0kBNYxqubi
 DNT9BA1KNfEtYYT0m44sjDWecBzv2SwDoChumxIYukGb7iJ/C74t4jdCxcngfckFEIHCJ
 +NBKfONAtltoCxynnkkgcsl1/xofJcmL2aZmfp9cZ4uknh7kzBP52n4PlnONkn6ArGYX2
 /xp8P43tO0Sa8KSoa0xRsBtftCxhGumuWBunvaAMq7jdldNRum66P1uUh88hv4RCVybUu
 MmQWz5kxYqzYeaqUOv5CCbUCsKw6rLAMHZZkL1EjVYYV2OVpknWCMut7xHK9BIApoeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789761317;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1S3kjNTzUrLxOwab8A98NjJvrpAW8wylRhhZzlJgjQo=;
 b=rww854XGzoR9J6MMkI6mvDoGb/YGYC7yuBo1B7DXax0A2wLQcV34Ge+3GbTOKe8sGoaq
 FuwQquhyc0yoUvjEwhA7nVvs5AeB8x5fB9MjOyZDTbC6ruFtcYeUxZJhS3ZrZWav7PXGE
 JCyykLHs/eNc/xo2Levnh3QCX2+aovXwcRPcAfVzLejIp+UzCU01AktfXEC9l2PWAdNR2
 Bql/+lp0Cadvl7faoASTm69eHQMusW9VhvF39lSuLh0HUoksic+ehwr8yr/yT8sy9q719
 GtMJjcVGX1u78A0va4EO9oYbRRBRlL+CRGxuQ4LUVt9ng3IzNDldLAXLvmPDcufmb+g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wr7dSQJd; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3B214006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:55:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 08B53C5846F;
 Fri, 18 Sep 2026 19:56:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1203E60649;
 Fri, 18 Sep 2026 19:55:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88B7010329075; 
 Fri, 18 Sep 2026 21:55:08 +0200 (CEST)
Date: Fri, 18 Sep 2026 21:55:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Antoine Tenart <atenart@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
 Daniel Sangue <daniel.sangue@sangue.ch>,
 James Hilliard <james.hilliard1@gmail.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>
Message-ID: <aq2XFK-4lZE5YlQm@windsurf>
References: <20260905122040.2054789-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905122040.2054789-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/7] package/{,
 lib}apparmor: bump to version 4.1.8
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

On Sat, Sep 05, 2026 at 02:20:33PM +0200, Bernd Kuhls wrote:
> https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.8
> https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.7
> https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.6
> https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.5
> https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.4
> https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.3
> https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.1.2
> 
> Switched tarballs to bz2.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks!

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
