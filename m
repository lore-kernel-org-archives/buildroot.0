Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4026CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90273809CE;
	Sun,  4 Oct 2026 15:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGXq5dAqoWPa; Sun,  4 Oct 2026 15:56:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B798480C06
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129390;
	b=tbzW5sDqQCic0AoEVfkECY+UVyhY+dA6eJ8u0swgC8i3THByQiu/RIdbPIx32HxQ4sg6
	 +xysZ9CwUSRlReaAvXZUDFDI0ORNNC6U63EJj6ykyypEUh0G1+yxGoQ4+EkZLvE1lK/9q
	 14Ped12vaYMxCQWDIgH+1p0hnWKNPxXBDzQ5ofEYFVZY6Jk/ELZ3KHVMHALhk2wKn/qLp
	 xTELL0IbvgJ8CbbFh3D+yiohq1MuFFLZKvfxS4ZUqrM1cqCPUy4Bt6QIxBJI1JMo3QWKt
	 Cmx1QCH2VoKoImfdd8UhfbLrgmECUwoxie6QE00hT09jWM7Ws2z/JayBxl2vz2NJlhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129390;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BAIWdpklk4zrwRRlWRDfOxH5dUjN4Q57HgR6SO2KqLg=;
	b=IPSgG5S258DvMqLtUbUleo/3jwMEVxooPX8PUArdvkC/KznYBtF79hWd2pkptuc71lOa
	 vGRQjHF8WINL5ZGXsm0tWYZRL2K1UPsLSRisqtEfyLtzM5H4Wy19WytVZRcFJIhYPdPGT
	 VqO61VT0pnc8p2ElQn0pCnItQwt2CJg9YMFbrJ9yRXl/oEfqK0VyhBK8VUkoyeeLjuLX9
	 +/g+pyh36hqUGzG92vBfSBj+9two5UyCijUimvh9hJpildX3hIlqmO1KPn68ApQVcfqej
	 kGOURm4vfJnPuXsWjja5bsehBCTEJwXqtKUHIGT0dng6+SiUFBrpPZf96CiZ5F8ab6g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129390;
	bh=BAIWdpklk4zrwRRlWRDfOxH5dUjN4Q57HgR6SO2KqLg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b0Tqh3DeEiIMHjk4sa1pWGx+olei58GMYumGJgMgjLa82LhaDzP7LwVQXta76l7xt
	 qUk/XqnIX7p0wJ+aI8ec9p6LVX1K6Ik2cJ9xqSdJAxNMTWd7TAxqWV0iZp8GLV0vyf
	 ACAbMsgllNgaN1YFW6Foy5OCdqsGddY0mH+MeO22miNwzOwgSjYwdJM+URoj+aiO+F
	 xzw4Ybkh5eriAWrj2Mn1KZxpBLwweBH+AT89D2JTq4sbAwCrTaDW3b/L4y1hNZEtOw
	 bNHmXgZsNvhVDpTWon7k3C9az6d1jPdMHupGM6XObiWG61ykDFkbDbEUFFPRsRKVKF
	 zR0yAIx5A3KWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B798480C06;
	Sun,  4 Oct 2026 15:56:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 081DC32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05FB8404A1
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQwIn5wD233h for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 76CE6404D0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129387;
 b=eEwM8UezYBHZXehTgSstNbuBvXRfpl6KPORozQwcIE8WGNlMKXWEv46osis7S+jl28uS
 G1u4pgSFUivkewJtyQJHqEP4AMJmjhG6iR/yL8z/RTpNl9wXMpnZhqZogU+9RCoW7Z0k3
 2V3AY0nN/wlWa8mkYBnOfsWB0ygs6ShaqX24VkIGYJDxenwCseyqcNfvmFMZsJVZDEwWg
 epyqnd6gDwheOZzogk/B0h6jJghLVLKbS0JoGUc5jerx0XVrq3BlKKrHWENn1730+C0OD
 52pHUsnCazMuEbklghRQu0RKrV24fz0gZpHf1Fyz5ljOjOhxqL8LfTkw+HyhHrlyplw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129387;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=/wawi6UPdhvvgDmasLxaD5e48+er1Ksl/4A5h/+qbDo=;
 b=ataKvt+mSBv9PodS/wcZrFBpAbaTO4kCtqECM1jHGFSJq2tp7+P47SiUXXutd6zN6a6D
 64OyjInZP+8kXDfdoxKdjgAUgZ6naTnqcFLisLjvMiQrbhSqNlNjluNnUTqJ3/3a4JiV8
 MegUE3uT+66J8EXAC1uLwa7idCyrtCdT+ypkWxVU9qGNaRmn9wmD14EWvagnu0zBw+UWD
 WSXUm/423YxO5/SsEDJAFUrsv8bfjOpX+V/Mu9pT09+zt8nwJQXnmxDZtDYkWby9kIq9u
 EKjNwuLtCE+48DCWWSb736921/Zm62w5+dqdalMzfEBaLYc1K12LUyWmZVXb2Px0DAg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=l7RKeEYF; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76CE6404D0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:56:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 50B151A112F;
 Sun,  4 Oct 2026 15:56:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1E9B9604FE;
 Sun,  4 Oct 2026 15:56:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA71C10328192; 
 Sun,  4 Oct 2026 17:56:23 +0200 (CEST)
Date: Sun, 4 Oct 2026 17:56:22 +0200
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, John Stile <johns@msli.com>, 
 Fiona Klute <fiona.klute@gmx.de>
Message-ID: <asJ3DJ4duNHFUCL8@windsurf>
References: <20261004152104.1403546-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004152104.1403546-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1] package/dhcpcd: update S41dhcpcd (fix
 check-package warnings)
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

On Sun, Oct 04, 2026 at 05:21:04PM +0200, Peter Seiderer via buildroot wrote:
> Update S41dhcpcd:
> 
> - use plain "dhcpcd" for DAEMON (instead of "/sbin/dhcpcd"), adjust
>   PIDFILE accordingly and while at it use quotation marks for variable
>   definitions
> - fix indent (tabs vs. spaces)
> 
> Fixes:
> 
>   $ ./utils/check-package package/dhcpcd/*
>   package/dhcpcd/S41dhcpcd:6: Do not include path in DAEMON (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:8: Incorrect PIDFILE value  (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:13: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:17: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:21: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:25: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
>   package/dhcpcd/S41dhcpcd:30: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

You had forgotten to update .checkpackageignore to no longer ignore
warnings from this file, so I updated that, and applied your patch to
master. Thanks!

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
