Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FAAD10BF9
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21AAE4056E;
	Sat, 26 Oct 2024 13:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qB9mzCkLDdUK; Sat, 26 Oct 2024 13:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA35C405EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA35C405EB;
	Sat, 26 Oct 2024 13:16:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19E2D5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1559D605E4
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBjN2eM01qQ3 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:16:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04332605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04332605E1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04332605E1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:16:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29D9240002;
 Sat, 26 Oct 2024 13:16:22 +0000 (UTC)
Date: Sat, 26 Oct 2024 15:16:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241026151621.30f8ffc2@windsurf>
In-Reply-To: <CADvTj4rw8hWgkVtz_QafMWcLGrxYi=Mitjm606L57AtXBoAXfA@mail.gmail.com>
References: <20240930223133.1202389-1-james.hilliard1@gmail.com>
 <20240930223133.1202389-2-james.hilliard1@gmail.com>
 <87plojfujn.fsf@dell.be.48ers.dk>
 <CADvTj4rw8hWgkVtz_QafMWcLGrxYi=Mitjm606L57AtXBoAXfA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729948582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzpc3Skf2Ocl5FOqTAYfXqiSvn3Dtkw2EzJvZjqYgOM=;
 b=erRa8gZ2EEJp3/1yKmtGhijFFa9pPjCWxFWWBzYPBWj4JLeNv3ourBOVSX57rnfyVgg6CB
 cB+eBd0226jYvSQiwgMAGtkaFFs7TRd4cWfryvKPX1K1p7Y9Y9DUHUpwtOelHwc488D03A
 HliCvUAf9NryDaeqRWQNnxnoarhTgBxfB9rpEpPeEOuVQ0xew/uvhjI0meNMocnUN6CrxG
 KNGG9iNYtQvWXhPnZFtBCWJVbSP62dK1d+5tS5WMzvHDtiDx0YFITyB/uxgRF2jTwIYH+1
 GHgxza6m6xIM/GwzXgPvYmiyNNWePp+D+HGhjtuLJYiORAURk8kn0bkGa3E9XQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=erRa8gZ2
Subject: Re: [Buildroot] [PATCH 2/4] package/libcupsfilters: new package
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 1 Oct 2024 14:49:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > https://github.com/OpenPrinting/libcupsfilters/security/advisories/GHSA-w63j-6g73-wmg5  
> 
> Maybe best to merge for now and backport if a final release doesn't show up
> soon?

Version 2.1.0 has been released in the mean time. I wanted to integrate
this, but it depends on the qpdf bump, which has issues.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
