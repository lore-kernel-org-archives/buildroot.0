Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D917DCD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A131961AD1;
	Wed,  3 Jun 2026 18:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hRrG37ZZrC2; Wed,  3 Jun 2026 18:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EBED61ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512046;
	bh=ytfkJWJk/FrIzgF+ha1lQWAhaBwliZNSb9nV9DLQq+U=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K5+yvxmnTYJUqZd1bjWwSoTic/Sv/BGNHQtgRrcpSN54R2/Ehlf5rf1ppGnb66job
	 0epPlA8qvmUj/rWNnW789MkVAGGJJkyAwv4Bi1IsM+G7Cnmv91JCDfVnlmdGPfRE7z
	 4X59swUhGeDRimLBDt0hC4A3Zm86oaWMarac83ocDrN2qSDFnaRPLQjfz2XJ0QEy5L
	 u8oFMOHQnAz38Gghm0FvtUM4qA53jI1Z8R3xp8qsKZVB0FEOf9ETFbhZIAEs/1Ud9S
	 skr5XI/IS7bk2ELG3XG2h5vKU2YeVGEaPq/VATdpQQBUWgB5gsxbAICLeZmK+ifXg7
	 uq6ZjCx2EGgUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EBED61ACC;
	Wed,  3 Jun 2026 18:40:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5E14192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B68E4228A
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y617xgl650Pp for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86FBB42289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86FBB42289
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86FBB42289
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:40:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1730111984; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:40:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqW7-0000000Cexo-0VsT;
 Wed, 03 Jun 2026 20:40:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260603070627.720726-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 3 Jun 2026 09:06:27 +0200")
References: <20260603070627.720726-1-giulio.benetti@benettiengineering.com>
Date: Wed, 03 Jun 2026 20:40:39 +0200
Message-ID: <871penpivs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=HpOBMkesxvXPPrvRSsF80NdHRA5WH4q7ecwRSDtdFsGkz3J8WuPuLYrSm3tNo3qJMR+LcvQfHdxK31bDSrO+/MFLlIBtx0xnmAg4qhd/6m7vEs42P5RS93F0NRs+ECXNtoUECq97wQ5M2/fhXQZVb5vO/tSXiVxGJwfNgFichrp4EfaOH0rzWV3+0OuUXwTxWbKaRMFe/gvJrDNj93BLhKN7HRyrgN04SiG7qcTHr2iEvZq9qFju5FpPdjAgdX59vG6vxrTOKCkFemNkGQeLSBcd/n0iu99LzKUM8KWIgQ7LOwwSjCe418N5p6wyCuxLujX5vfcpMM4jIQTDLlP6vQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=/iCnocC89EVS8hP8yhg9hE22UDngu9QBEhvyr4/PvCc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=HpOBMkes
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.2.1
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

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > https://github.com/harfbuzz/harfbuzz/blob/14.2.1/NEWS
 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
