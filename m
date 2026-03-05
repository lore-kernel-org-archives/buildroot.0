Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F1F30946
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 11:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B28560BBF;
	Thu,  5 Mar 2026 11:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RjgtYnpuRbh2; Thu,  5 Mar 2026 11:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A626E60B27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772709801;
	bh=mguKfqm279vxt4sjTsaTfyo988iwjt61AWEwQi0kEF0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+6htdmmz0HrTGPZP/8R5tLelmdpJKyUU3idbsr/WTXEe+5dstb0kZ3kDi9g0x9qv
	 cekAy7YDPd+wKgsaBYwfGJk9QGm481JaRQZLKy690U704yv10yBhasQfCIyn3Fvnjb
	 yjXAz4YXQYSciY1dME1q9QMeUe7Vo4SFgBfVCElkIop8FECj8IyDuM9uRNMMkL4E73
	 CkTUOhc64032b23ifsXb06ka5QKKOTJ/+0Rq+hwbEZdmVZWDAO7+M/V9JRQM5Sx+1r
	 PT33rF1DtGilwO6zs/qmY6aiai+5WSjdkPsMQu4E91fEUQIeZ+tHYqK2K1PYJVSXKJ
	 bPdadMLfslfgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A626E60B27;
	Thu,  5 Mar 2026 11:23:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB69223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8958540707
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wBrYHuBc151 for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 11:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C609406EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C609406EB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C609406EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 11:23:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 281189486; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Mar 2026 11:23:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vy6nK-00000000ntI-3sJq;
 Thu, 05 Mar 2026 12:23:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260305002951.3614234-1-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Thu, 5 Mar 2026 01:29:51 +0100")
References: <20260305002951.3614234-1-fiona.klute@gmx.de>
Date: Thu, 05 Mar 2026 12:23:06 +0100
Message-ID: <874imuikpx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ihrevpElCvzc4ZDmE1h7qRog+U/lCmKQ3zte27IweV+wAhc9Sbf17ht/6yw36Bo+oIALiFR1UNljtwe50BVwZPl0Fe4QnT11AqsJH3mY3ZaVbjuahEMie4Cd0wCFWeid5DkoPbe4lFL3A82H8VgZO0HZEqbNQ11tfugtseQqvKukks/5/GRw+TGGqTvIdAACG9/pxRkJS4bIOrdaVuLBt8pvRNIWMdr3w51BblNz1qVasBofCIp298RUydKPcLUTQl1uTcqWCoOVwxTXxdCxxRN4uDUvs2cbXuOOv+C3gRBrXoS57Hj356mc1eBHwrHywEeZOht6CCbxktVrcvxW0Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=fspWj216un9G6fyySwvT86oeLj1Q3Y37e9P3dVzr95g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ihrevpEl
Subject: Re: [Buildroot] [PATCH 1/1] package/squashfs: bump to version 4.7.5
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

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > Upstream changelog:
 > https://github.com/plougher/squashfs-tools/blob/4.7.5/CHANGES.md

 > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
 > ---
 > The issues in 4.7.4 should be fixed, hopefully we can get 4.7.x into
 > Buildroot now. :-)

Committed, thanks.

I see that there are now some options for reproducible file systems.
Maybe we should use those in fs/squashfs/ if BR2_REPRODUCIBLE is
enabled?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
