Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CA5CA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 19:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F376040EBB;
	Sun, 31 Aug 2025 19:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eqz0OSvPsx5R; Sun, 31 Aug 2025 19:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4395E40EDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4395E40EDF;
	Sun, 31 Aug 2025 19:18:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B491CD2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 19:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A699140EDF
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 19:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ppoy0-z5WO3S for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 19:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 669B640EBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 669B640EBB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 669B640EBB
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 19:18:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 168970236; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 31 Aug 2025 19:18:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1usnZD-000CSK-1K;
 Sun, 31 Aug 2025 21:18:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org,  Floris Bos <bos@je-eigen-domein.nl>,  Heiko
 Thiery <heiko.thiery@gmail.com>
References: <20250828215927.2281857-1-peter@korsgaard.com>
 <7fd3dee0-3950-4dfd-81a5-3d9d6f5d6fb4@rnout.be>
 <87ecsugely.fsf@dell.be.48ers.dk>
 <0a982244-5af3-4c8d-a472-0bda9c8e880b@rnout.be>
Date: Sun, 31 Aug 2025 21:18:19 +0200
In-Reply-To: <0a982244-5af3-4c8d-a472-0bda9c8e880b@rnout.be> (Arnout
 Vandecappelle's message of "Sun, 31 Aug 2025 16:58:46 +0200")
Message-ID: <87bjnvfgg4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=i2JudDdw5rxBL4z6Bsv2qn7Se2qSqIPnwNgfbzSwAYBmeL25otJ6NcxDbUekR8//UmaIbc8DXFrhBWxErsgVNEnatChT4rUBkpyAjT4sDyfHusMR0fnOJD/b9jp5cWzi/jF3y5ZAGb7vrLs+8gnv6mGcDoplf1mqdlyHYdKv/oNIo5X763H22OKtDxzb3nPjyJvWdJJUW9P1y3gtnWRAE86TOr7pMHfC1EGQAFapn9RTIHlEzdL+MVrazY4nrFlbK+F5Z5b9sETO6rkjIh4S0XRbXML2aZXhz27bxxsWkMd1GAzp4/4nnJZnc7rkGDAzPm7Uj0gYn/fUb+14bLmCFQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=rOsaoERtwA4FY5oHIN2clr8Fo9O58Qfbvp4JSAzBxSs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=i2JudDdw
Subject: Re: [Buildroot] [PATCH] package/ipmitool: move to codeberg
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

>>>>> "Arnout" == Arnout Vandecappelle <arnout@rnout.be> writes:

Hi,

 >> >  remove CPE_ID_IS_VALID, or we have to set the CPE version.
 >> >  We really should fix that VERSION/DL_VERSION mess.
 >> >  Marked as Changes Requested.
 >> I guess the most sensible short term solution is to to just drop
 >> _CPE_ID_VALID then. Do you want me to resend a version doing that?

 >  Actually, it's as simple as setting IPMITOOL_CPE_ID_VERSION. Stupid of me.

 >  Feel free to apply directly after fixing that.

Committed after fixing that, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
