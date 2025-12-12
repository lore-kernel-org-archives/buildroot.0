Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A227D4337F
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 08:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4073380B78;
	Fri, 12 Dec 2025 08:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKDjsTGSF4rc; Fri, 12 Dec 2025 08:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8113180652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526661;
	bh=7AXwcxZIyvoc2kzKIo6N/5dCO2/a/qu15/ddH/4xSl0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R5BRRxWo4jdzTc43uj2XdGS8QYGUVBK017naMzKY260bdQhXyLN/NfPTT1JRV2Owp
	 r+qsIFSfmhAprGt/mYlrLtOSIfZB3tyjJFLHqSoQS47bon7z4cK6EGflIMfzVKRIv0
	 Ke7dtV2VTXLL9xDM22SfSjWY0v7k+Wks5QOyauSaqt9VVUmKi73fefagl5TajpLkif
	 dIoaSUdoCXy+p+6qu695GEoI2MwLDnr4ZTSRL7hq6a8P3JTIShGF+viVfUuCtsf2ya
	 kiNB9IGb0GYMgLW1SXGI/6sF7h3v/ppyNMxr03CdPdUs3G5htggTpSv6QnAxqzPe1F
	 WyFKCF7S7c5Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8113180652;
	Fri, 12 Dec 2025 08:04:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EED822C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4D598466C
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MV0XmhOOyzN for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 08:04:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B34F8466B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B34F8466B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B34F8466B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 08:04:18 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1756741258; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Dec 2025 08:04:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vTy8I-00000001Yb6-1nvH;
 Fri, 12 Dec 2025 09:04:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251211083052.432926-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 11 Dec 2025 09:30:51
 +0100")
References: <20251211083052.432926-1-thomas.petazzoni@bootlin.com>
Date: Fri, 12 Dec 2025 09:04:10 +0100
Message-ID: <87v7ic15z9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QnE+YSMke/2nUXw2eppi5VMb6g8o8vAjaKTrCb6lC9LR5O+rXHvHGnzZvmyJrmmGjtm2z0+B0vHmAlqbn9ph2pObTHNmGf94/2f4cCC7+gQivCLvjymAQtZyEH+4gx3j9i76ADrglLOX4w55ILSYTfd3QhYnZLXkuukO5vXWK0pjn3MDlsV5po4L2h8JkqoiRuVhe6PtM0vzLbIaD4L2Hucy1yeylDoaV+TppO/RMitVWbn6C7GS++WLTpg5ebhZuxLIJda9LFaE4GTpaz6MtzJOj2OXzMb+lRSXZyTworeDQidOKGkVy8hhYpjBbimcUNGqGQ4AbVnhXhY9Cx7/+A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=qR6gQXDaS0uyz2CnLZoyFO9TTcptVf3m94UbSeaJ6ZM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=QnE+YSMk
Subject: Re: [Buildroot] [PATCH] support/dependencies: improve error message
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > "Fix you PATH" not only has a typo, but isn't very clear. Turn it into
 > "Fix your PATH environment variable".

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/151
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
