Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824F1CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3744560F2F;
	Sat, 30 May 2026 14:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOKIZ7hQ6_Uu; Sat, 30 May 2026 14:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7444460F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780150648;
	bh=4R4g97t1ox7IeyjNjAM6mamsf8p5ZHoRj6egYBavo38=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lbkx9Zx//fiEhaUoaZqJx0lIijJA85CSgi8gpm54ZAePelnS8vIer/g2Z63MBWJEk
	 5iZYVeySqxq1XD3H8WexcCXtNfn7B2kxkv9Z2RMvixg1pc8ofH0CvBuRvNccOBxUeI
	 7B05RQg2seW0Lh0xiWxp60ugsKqvP1AoNVJHzWCAqMDO6ymJVODjIYQnfOUy5p9LCM
	 Mdlp3RDr7GWJX9cAH7ENLo/FqH7dua7zP0WOqVTgySNZ9J6JpjR0toPiuBywHbMGTN
	 uI+7C3eV+yuLTEPWKFQZ84kQLNxvxRbSnLcILVqOWdhXak3sVoKshvMHYkKFeGTDz6
	 5ZipBluRcR7TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7444460F36;
	Sat, 30 May 2026 14:17:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 038A6F4;
 Sat, 30 May 2026 14:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDD2D42ADA;
 Sat, 30 May 2026 14:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4nkvccIY2od; Sat, 30 May 2026 14:17:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28E3942AD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28E3942AD8
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28E3942AD8;
 Sat, 30 May 2026 14:17:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 31849B97C654; Sat, 30 May 2026 16:17:24 +0200 (CEST)
Message-ID: <54dbbc89-59d2-43d1-a60f-77b1d48f828e@rnout.be>
Date: Sat, 30 May 2026 16:17:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, fr-BE
To: Buildroot Mailing List <buildroot@buildroot.org>,
 ML_BuildrootUsers <buildroot-users@buildroot.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780150644; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language;
 bh=boEvEueO8my1he29bwZ8FmaUjWPXAupGq/tKSEJWv4I=;
 b=j7jzUDn29hKjzV1QajTKS218ZwY1aLtwW2dsq1NjD23Afu+B7iGqAqP7ivahh5odDhZPiL
 MqMG/RYuLO6Y8vX0XF0csCBjnjKm6W61xXBFLP3pJMhSgGrR65sfjwra5vK3VKLALZvFWJ
 0uvnduO0XfHCNvOmOfXCo0Z8OcmotAboa9f88X8PdRtsIUu4RXmbCUjn2xPxCJJfiUnXSl
 5KEccoAbFN/UTVbjXqLEa+0fiNEeQmGb1+EsYPJa67KjoQBudKCDpIld8U6MmE29SWViSC
 TMEkKSUnjxPHZ1ZW5WpCNWROIWBMQCSNOvNh5GKX5SH+82g/rEZsue0GUHU0uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=j7jzUDn2
Subject: [Buildroot] PSA: old 20aa.bb.x branches removed from git server
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi all,

  We performed some cleanup activity and removed all old stable branches from 
the git server. Their commits are still reachable through the release tags.

  Some of these branches didn't have a tag at their tip (i.e. we added some 
commits to it but never made a release for it). For those, we added a tag 
following the normal pattern, but a non-annotated tag and without release 
announcement and download etc. So also those commits are still reachable.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
