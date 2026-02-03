Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38848E8305F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38C3409B6;
	Tue,  3 Feb 2026 08:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXPz-h1SpyXi; Tue,  3 Feb 2026 08:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BBF240B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106181;
	bh=TTWGPspuWGRscTBVew5jqXpY+AZ5Qlytr2/emfx1NV0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ppKj4vBhVxJYA77IPOA9gQa9r0roBFVLqGel3qlc1aqV3U5T/wF9GTZPgDG3kvnM3
	 7gld8j+iQnkNdVeu0hulxrTar4Qga8SPbKjScYXgdI0X4pgNJlG8bc1kJ8AgdyVXiX
	 1DwY/US0K/nNJTZQ5KM8paRl7SdbOgML6Mu8FIgLpP9L9epAbPJz6w5Ch4R1K6EHzq
	 BZ49K5Ems3PvQXQL3WfOhWodftIvYVALueOykBSLKVgtQVyxLwyCg/4xWE4bFxGy3y
	 8HJC2QWrfRkgsBIMziIPOBT/fSBhD9q4SQNPtBSb4OoCAsmz5tGB9nxFYkZQS7Waoa
	 Asaq38Ms4mkfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BBF240B13;
	Tue,  3 Feb 2026 08:09:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F660F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FC0A40B13
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4OoaY3Mo_oT for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D0F3409B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0F3409B6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D0F3409B6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:09:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1306615956; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 08:09:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnBTb-00000008AoA-0CxZ;
 Tue, 03 Feb 2026 09:09:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Marcus Hoffmann
 <buildroot@bubu1.eu>
In-Reply-To: <20260202212814.2607588-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 2 Feb 2026 22:28:07 +0100")
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
 <20260202212814.2607588-2-thomas.petazzoni@bootlin.com>
Date: Tue, 03 Feb 2026 09:09:35 +0100
Message-ID: <874inyp7sw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LmJbucipBHsMzd6Ry8mlKF07EUGwNqhDsbH2qDCbAR80DRmEXS7K8zAs0mwac5FTsDvlZ/VaVP8ARJyof7G5RbkSniipA8zU5kvvBTrrE1Tort++i4mX9pExsUc5zBSg7ulP9pibJHDs3XdtgrUi4GgzJaz0afeBSMJrdOZCW6H9FHllInq5F0SMIZMQpJlW2lxTzoJDz2VEy9EZcjEK5sbpfQ+8LdQfKxFJ+Mb/wQ/FpHabrMoUF4xvYvkrj2sjcu4nEoP5Vd/uD6ChG0sCozNC2YggROxKH4a/Fimf80flYWkYvGId/NThH70V6ghSZJODv3/SZAP495xC4/ZdNA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=CNV3KVezN/VTd4ZQgKTEBM6uCgBzzCVcm6TVoT0N2/Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=LmJbucip
Subject: Re: [Buildroot] [PATCH 1/5] support/config-fragments/autobuild:
 drop Buildroot ARC toolchains
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

 > We're already testing the ARC architecture with one Bootlin toolchain,
 > it doesn't make sense to also test with two Buildroot internal
 > toolchains the ARC architecture, which is not a primary architecture
 > for Buildroot.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
