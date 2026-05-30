Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2E9CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C52642E31;
	Sat, 30 May 2026 09:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGApZ-jMDWGj; Sat, 30 May 2026 09:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0272342DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131829;
	bh=ckmm2NcIJg9YwfL65f04dAn5412sGBtTnpqvmfFIp04=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flYEbAoAI9GkMLptvYUI5dlmSp89TB1Fk4u0KdoDtpABiVZnHwfqOrJIofxYklwiC
	 UUMeK1ogPL5l6mESg6nxsPVDIFas/nSZHPQC37z+qTI50DShp5xrsbXD2twjGRjLeS
	 o7CB3UQgdh36uCfJtOeoEQ5akBGuPULp7BBeqmJA9xJc2jGs8iE7X3+C/Gj8Bn6hmH
	 zByhkda2NoKY22X6DWKHhecZZJDoiz3YYPMV/0o1qRc1qi/xN3Ak0FqxM7F/xGEuJ0
	 KWZjijArRicnpamMiX4hhDBHb3Ssw7GhWEOZZ8gIjoYzWg1exwSMDaSt8GlR/CmKHO
	 Obe+vwhersgTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0272342DE8;
	Sat, 30 May 2026 09:03:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 244AB12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 058AB40877
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYjtw_Q05pIZ for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:03:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04A5E407EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A5E407EC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04A5E407EC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:03:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -613278297; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 09:03:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTFbb-00000004jj4-0cRd;
 Sat, 30 May 2026 11:03:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Daniel Price
 <daniel.price@gmail.com>,  Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,  Danomi Manchego
 <danomimanchego123@gmail.com>,  Titouan Christophe
 <titouan.christophe@mind.be>,  Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260529094514.178266-7-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 29 May 2026 11:45:14 +0200")
References: <20260529094514.178266-1-thomas.perale@mind.be>
 <20260529094514.178266-7-thomas.perale@mind.be>
Date: Sat, 30 May 2026 11:03:43 +0200
Message-ID: <87tsrp6zgw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=kgf/K4fNROlnBRqo3Nl2YbRH9RPUmwBmW0tgC3eoBlISEC5tGXLIvDEf8wGOjxr+HnLtlYb56aJyHELNe9kEDd6W4LJi7cBb+cX4WFGfZnFK7ahWonK/Cixqz0TmXNz4vq0lWCAfSCT0crJ24KmBS1uSbbBDnshdcPS7AvhADQH7mvIljCH9gwfm56DWA6tFcYIhqMKdSl/5Y1DJzNN0EuEJRY4cum7NVcyadWV1IvDiOXq3OMIwdr50+gPK0lXjdXcAB8TTx4Gun/MBrO2TjhM0Gpq7a58UHc7Ps/n/Y150GEz7BF6rFkN9lx9Fs3uOX6Np+cQxYeu5tyvOtGLwow==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VCxy6LFLLnCOgoFpVz+izSKJ+Ez642ast9VUZ62eroA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=kgf/K4fN
Subject: Re: [Buildroot] [PATCH] package/gstreamer1: update CPE vendor
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The CPE "cpe:2.3:a:gstreamer:gstreamer:*:*:*:*:*:*:*:*" is valid for
 > this package.

 > The previous vendor `gstreamer_project` has no CVE assigned to it except
 > "gstreamer_project:gst-rtsp-server" which target another package.

 > See the CVEs [1][2] ...

 > [1] https://nvd.nist.gov/vuln/detail/CVE-2026-3085
 > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-3086

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
