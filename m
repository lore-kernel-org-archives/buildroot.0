Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B911CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09ADB6F5E7;
	Sat, 30 May 2026 21:15:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pq_Oy7a3bBdo; Sat, 30 May 2026 21:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBB486F576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780175750;
	bh=Zqsl6ozaAHsU550YRnUBiRAPbdvCLEVMP1jEc1BudQ4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A663nijkqzYR8eaHyrG9UkTxeZN6M50m85SV9UIrfoW3ybZsWysXxqtLV38DXCGGh
	 xM740yPQlGu0zZarhzRISq7ut7+9HY/lFzQ+93wJfIWblEw3SyjFe7NM1uTI7mnVQQ
	 wOG0Ux2AtJPjodzywxXrkqOtkNPPcTO0304VGi+OJC2Yjuyrz8YnAwqsPrBrPbVNto
	 IqRWBs8lKKBvVvl+ohoKtMenADzvxYo9PbchqdSc4DjR47lPPgb5iKSe1JiQ6uJB3H
	 qFF/7yzNkMBbqeUAoVwcIQRAMMZQyrMxhZGrtxBo8mabdoxaxAJC9opqSE5Ib7sLVn
	 R5erxNw0geCYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB486F576;
	Sat, 30 May 2026 21:15:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D74EF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7322442F21
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5KpP-UKF-ux for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70BAC42F19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70BAC42F19
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70BAC42F19
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:15:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B20D81A3755;
 Sat, 30 May 2026 21:15:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 86CF06073B;
 Sat, 30 May 2026 21:15:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7830610888CC7; 
 Sat, 30 May 2026 23:15:45 +0200 (CEST)
Date: Sat, 30 May 2026 23:15:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ahtTaGT0ErOItqKZ@windsurf>
References: <20260530155718.657095-1-bernd@kuhls.net>
 <20260530155718.657095-4-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260530155718.657095-4-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780175746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=2V+3sKdMCOwVFH3t88YiCmdtw90zIh+672LY+RFVF9U=;
 b=ykgss6XfznAihFIaIH6VQLDQanM4wuQHzrVPxZZ9p5TjgkWOS2gBlKapfTK3gplGN3xPW5
 V+SKVXU5fszPNmFhTu4psPlJNtNbifyXBn29UwsE8Jq5xrVwqBvEgE1AJky74ZbrUpvTQW
 QvlfTHG0F5j844CTObPET2JEHQ+pxfct4C806ztqNRYMczT5b72+gYd/X5Qd6w78i2BtxD
 0MNuTvMtqas0Y+qE/cOPHKD2U81yghxtM/O9ZYC3br1CihNa7LfOE9hPrgxR0afprhnFiG
 CcwjESe1m+P2mQjDDLLiS3FQrK/rEtzMonIteJRbpqyNJ9BiL/BM2OKEojRjtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ykgss6Xf
Subject: Re: [Buildroot] [PATCH v2 4/5] package/qt6/qt6positioning: new
 package
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

Hello,

On Sat, May 30, 2026 at 05:57:17PM +0200, Bernd Kuhls wrote:
> diff --git a/package/qt6/qt6positioning/Config.in b/package/qt6/qt6positioning/Config.in
> new file mode 100644
> index 0000000000..a083dcffb3
> --- /dev/null
> +++ b/package/qt6/qt6positioning/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_QT6POSITIONING
> +	bool "qt6positioning"
> +	select BR2_PACKAGE_QT6BASE_GUI

This dependency was not needed, so I dropped it.

Applied to next with this change, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
