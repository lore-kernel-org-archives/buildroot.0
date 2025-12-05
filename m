Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACAFD374A3
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F6E86F4B1;
	Fri,  5 Dec 2025 20:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxKIHZQOvviY; Fri,  5 Dec 2025 20:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E73B3606EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764968262;
	bh=3HU3PkA0r1XeATlyXlu4aQ/krK6cmLWRl60FoGx/L8U=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ng499HJnkyqxg3WI12zCRcd+CzeW68e1AQgtAIGFBfBoC97xl3I/cuGjNST0Kp4Ey
	 cMkhofCDU+tkcLpCL+4AJ4gBhNks6d+BssbxlFXxyEPAE74MGbizEJVyTyc+qsjhOU
	 ek+Om+DW0OC/Fhxloy4DSGdehO8gzhoDLlj2b/ti/EPXbXYVpQ8OiSc4VJHHhQqSH3
	 lO9N5W41PgPavkgtsR9KsmLxmkUpEgAZkS8hiAcpEJAtxx6quVApLc3TpJ91h2nmM8
	 LPWM9HF2oVkzMbL4ATfhf92D8DCqKHvyDode46M5/MnTmPsGPp8jEDwkIDqV8kFvKm
	 mQUy6c2u7pdmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E73B3606EF;
	Fri,  5 Dec 2025 20:57:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D31DFE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C43B840417
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kf-TdUSEfZ0O for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A138F40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A138F40010
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A138F40010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:57:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 162349616; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Dec 2025 20:57:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vRcrt-00000002AzF-19ju;
 Fri, 05 Dec 2025 21:57:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251205171705.21591-1-raphael.pavlidis@gmail.com> (Raphael
 Pavlidis's message of "Fri, 5 Dec 2025 17:17:05 +0000")
References: <20251205171705.21591-1-raphael.pavlidis@gmail.com>
Date: Fri, 05 Dec 2025 21:57:33 +0100
Message-ID: <871pl8ejeq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nliaa2be6n6Xa4C12bQ4M9q2byKquXxMmO0lMkGiOZ0iwfQ+9LmC3ut4RkAAO89BsMENnKELfFAGcPYcc4SplitrZH8zthhVCAXRb33eBgRFbgu8fm/yu81cWShPtk5Za1j6CNz0q7Pg1fJQ4sL5iHnVdQTmWGNQ0GS8+nWKTjRFBR5L2P7TS88K/LBaRtoep14fZIwiLqT1T/IM654fuO9W2YvHSTICo8ovcK8IxlxItHbg7/nF3hTyQpEuPLytkFM0/HbikTP/HgTJRwVRNRbrGTkoNUOlPM9325ZQxgNpseZb2Ps0wYGer4Wx/p1LiLlYUUJ4mT0d41r1xpAS2A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=fxwAZs25/BJyYYRu5tWADvS/n8VcrpWZxfmp7rpr+Z0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=nliaa2be
Subject: Re: [Buildroot] [PATCH v1 1/1] package/x11r7/xserver_xorg-server:
 security bump to version 21.1.20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Raphael" == Raphael Pavlidis <raphael.pavlidis@gmail.com> writes:

 > Changelog:
 > https://lists.x.org/archives/xorg/2025-October/062147.html
 > https://lists.x.org/archives/xorg/2025-October/062150.html
 > Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

It would be good to add some more details, E.G. the CVE information (and
link) from the advisory:

https://lists.x.org/archives/xorg-announce/2025-October/003635.html

And also explain what happened to the 21.1.19 release. Finally you
forgot to run 'xserver_xorg-server-legal-info' and update the sha256sum
of the COPYING file after the change of copyright year.

Committed after fixing those issues, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
