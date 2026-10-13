Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294CACC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D11EA60776;
	Tue, 13 Oct 2026 08:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxfBL3FbCZ69; Tue, 13 Oct 2026 08:00:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 758E860769
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878442;
	b=s/Llsz5WMtbjH+3PU3iSnZmdGWdkOLgeYSvnCiOZtXGb80qG4Wp12vM4ndJb5Uv2+hTK
	 oO1PjfZt+X4PeKyHmLs7tK809/cflpNV0u6yGJp4OljnZv/6eCvaUqAFrk2vhfCJH4avO
	 2DOUtdvtJBk+Ldj2yzuWHe+sHBy0DBMwvX/wQHPllDrcQd0KNtSRo9tyMbUv52cLA4qfO
	 aFe1orohON8/4DUTGavDMWVTj3+P5iXlZjffbuWO/n32NkaLtv8Vs4DaBTBYCsSXldZBM
	 sXkp9RwE5/ad15IgNp47Yuan6nNeLudRq+eNkgTzcAFAh45EN/NCEwHzHXcJWPS8+qw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878442;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dtkOISrtanteQiQoyP12jwK7pOxgjK5tvZh2RFGG4ek=;
	b=MgNtf3nW4jKWBlIOlKhfd0mKs3InhcZ+OnuTbifpD60GMXGiffqTY6AaBdy1rb6W2piE
	 UeIo9nXbyJaLd+4y1dSOCfLCf8EFYZ9m+Jx5uZmFLfBBibwnVKeP5l/FiECXNOmEouxTp
	 GZjXmRI9JuvT+vbhIe4zwQweaJgmKv6aNnB7HNqXeyP3GlaNuRKEFrh/TC76HiccpPNsQ
	 IqQX4nxmCu5K87UKxuhL6LPvEHpxQz7vCpxBuT8Gr4lH+lptKMLP/EGBb+LB1CKxx+qvT
	 carBpS7/j2vagzv6AX0yo792lHnCB3r1eX/u6vsMiKQRzHYfIJkKRCHALaP/c9mPQcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878442;
	bh=dtkOISrtanteQiQoyP12jwK7pOxgjK5tvZh2RFGG4ek=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rQ9Ty4KzGkXMXvjgpkbimiSixv9i/OJNuMQQ5qlEZ3GGhmpCDOS2Em5t4NLDGYCrf
	 YrVZ2a8LRbrWK6/oEDr6isG4iQPmx8/VJXD6sbKqvrMDcfKkK0e/K1Fy/6nNLaS5Hm
	 fDOUrD9JNCspsiKj5nSOoyh2LBFi7y4KoZ8xs2W6uM3fVrt59LwN1Ko035iVVApXdO
	 ur6gg2PXnDCUMIOz5HC3tvo1fPEB3+yMF5rOousF4XvxUHzXSAGSNS1Nne4Kzekgxf
	 4elHiIIsK8RRfETeEK47YKbcl6bENMOrfERaNHYWk6XDkx6xJaBo1hV0u4E29L9QhG
	 rsiwCFmzZaCiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 758E860769;
	Tue, 13 Oct 2026 08:00:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77A91A58
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 699E880C70
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMKA8ErycT0p for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:00:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8FE3080BE9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878436;
 b=JvIr0UaU/F/Htvk9qS28c4MJRzZ22HkPfU/PT2iNJcqyenm+dQg0amoeSofZTyz9sJoa
 nMgcpYFox2ywOggYvG4jZm7L6X7ciw3o/ECQ13a4MK1hVqRh0yjBDtNyXKxDzxXrEQnbW
 ZnIGXIU/zBUK3NWRhtntMiLoLvG7qic9bo4HnLLlrqqv0krfvhdZDxF6eFHZ8UnUpmE5m
 7upgqQVygrHyk0fYFn0x0swL/TSfkdqFjeelonQ7T1PJgt08+BFwjnkIhlHVdfjB3b4Jw
 f2vW7aTWxKG5ld9EeZKUtUh3blKwUD6wLxQIq8L4icarYHQrl/CNx0/Vj+5sMa9ZZSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878436;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=eIfq+Q2OHEH4RiMcZ1mKHwWzBoMnbHRuhc9EDjh8f50=;
 b=rAyMXYEYUHUoVodo1u4Zcedvr/5DCSU6Ouxz4DfwdSdPieaW2KXtcRPvfCTP8OuB9Tl5
 CbE7bgunPaY6fXZGbA3viUQQxX9KgGnPCy+g0RllHQfzJjjwvbKBUagcuBo7oZbV8Ocro
 XC1ydQ0MOgi4PCGLDMmEqSl/GAp5GDx/kQNcmRlCfY4APvxKPGQ3jql88fB1M1JapiWa7
 1pVlMuGobCQAYzmur0L2SIM5tus7T8vk9Jlf5C8NVm0I+hdciX95PS7poXNcW6WxH/Plk
 SY+s/SUK+Xp60vXB7X401PLUXVzv/X9iKvt3rU9bxGXFXyMHoZT/HouoUoeBuFVAkOQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TfQkvm3K; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FE3080BE9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:00:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0EA644E411A5;
 Tue, 13 Oct 2026 08:00:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D68DD60362;
 Tue, 13 Oct 2026 08:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2441311D70160; 
 Tue, 13 Oct 2026 10:00:30 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:00:30 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <as3lGkVYTUgCTeOd@windsurf>
References: <20260617161331.141666-1-shirokovalexs@gmail.com>
 <20260617161331.141666-2-shirokovalexs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260617161331.141666-2-shirokovalexs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [v1,
 2/2] DEVELOPERS: move aichat to maintainer entry
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

On Wed, Jun 17, 2026 at 06:13:12PM +0200, Alexander Shirokov wrote:
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

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
