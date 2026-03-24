Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BA9FEC119
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 21:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3504E83438;
	Tue, 24 Mar 2026 21:27:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vlM-a5OgVSzu; Tue, 24 Mar 2026 21:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648BB833A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774387635;
	bh=4Log7RF98feoY+KM9X/M1bhRX9V6v8ocP62NLqHugT8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HXcxzN8b8SjrMXQuAIBYkJqFS92lOHx+5y4mjG6TdJLayRDhwMUZ1adyvdMpPuzRY
	 SBvu7q6DUK2ps6r19XtyjCiorzwL8rZMefgAhAjU/bFp3PRZPRxWpJ1/qvwbho/h+f
	 JED8PaR38o3OJCf3M3C+LymmRBU9Gr1jXld82uGTtggWDWXONutf8adJT8LxiWtCCB
	 LHYy5hTIhiYz9PK8+Ho/vohvdI/ohE5Qzeg3WaMlTseegWnttKqHFOBfEdR2RR/bSM
	 KhbV6u4TejAX+izfCCbcfGJbUSpf5knFaf/LtpnUmrogLE4vRmu2rq+B16SpcAcsqK
	 s/ExYBplce1uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648BB833A0;
	Tue, 24 Mar 2026 21:27:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE1141D3
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3B59408FF
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8w62lRFK3P4 for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 21:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8835F408D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8835F408D7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8835F408D7
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 21:27:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 17780B00548;
 Tue, 24 Mar 2026 22:27:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 24 Mar 2026 22:27:08 +0100
MIME-Version: 1.0
Date: Tue, 24 Mar 2026 22:27:08 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260319150246.10937-1-thomas.perale@mind.be>
References: <20260319150246.10937-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <70855a978c2bf9c568f6bc6cdb033c3b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774387630;
 bh=Kn/leZa20RNC1/ohIW8qbxalqVHUDwaYvqKHuhEQzrI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r6YJXWXuzOhYaZKsUQHHScm+e6pFRRpUkGFFFJ1f9d4IcaF0XP7sRxVKfY/+DWQ1v
 Hfrh9Nse+nI+GCSnaTNRsbRdl3VDKvJOpAq13EHPnS8RUWQXP1nTcfoYUob7GOK7SE
 oF1HeEjWpGdWHov3wZIENhMFeAgef+AYwurwjmsOINDUYzclesVziqUzDuWvyKYLof
 PMPxUDX0rDoPCQQ+Ck9t+gHkZcYSAm6/K2Zt+AIc7jm/al5Heod5H/OYVbh39W+LOh
 hOTuXcuK/h+Wux3RX0gUblzOL4WFHkOOg3d0aiLaBABtcuR+VBRIIF3rJPmUogE3Fk
 mpRD5uxWua5og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r6YJXWXu
Subject: Re: [Buildroot] [PATCH 1/6] website/sponsors.html: remove sense
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

Hi Thomas,

Thanks for the patches.
I applied all "website/lts" patches (#3 to #6) to master.

On 19/03/2026 16:02, Thomas Perale via buildroot wrote:
> Sense is no longer sponsoring LTS for the year 2026.

Regarding the website/sponsors.html updates:

Instead of removing the sponsor, could you instead move it
to the "Past Sponsors" section, and add the mention it was
a LTS sponsor?

Alternatively, if you think this "Past Sponsor" section is
too long, maybe you could create a new "past-sponsors.html"
page, and move all the past sponsors into it, and add a link
to it at the bottom of the "sponsors.html" page.

> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
