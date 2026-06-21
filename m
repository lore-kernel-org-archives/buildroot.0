Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADD8CD98F2
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 19:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F97B4EC23;
	Sun, 21 Jun 2026 19:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NUmbokGlnhQ; Sun, 21 Jun 2026 19:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DA824EC31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782070492;
	bh=nhTYtfhh5m84LkWqqB2xF3lTUdG25aRtlCHGeEt9Y08=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GzVSF5++5xwxMCRpPrAhcDGgFC7aWwa4TmYlCg4nLlrLDKm+h24H94Q4IWC3UUwEZ
	 ptG81Ki6RaFdk3jGKa9Ul9DRVr3aJD7kDpunmNK52uV2mpYAJjJyrHoHaIIwT24HfO
	 mAWGCtvA7H+pJmoBBcDNph1IqLjdp0e85H37baweSg5TU8sUjxDokN8ysCU/1nBsex
	 qYwnaz6TX39dTIopoPgZ2lqUZ7RNTNJfUAVqLTdmD6ibzJyZzjWFFu9lQ7NnGGTc7Z
	 M/xnW1EE3WVcy0cTp3LbLkOrl/C5IE1UB3Z5QuWkNAahA7KmoTtDh/cqnsSazfQIy8
	 BqD+UO1M4U66A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA824EC31;
	Sun, 21 Jun 2026 19:34:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5409224D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D5836F770
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sy7u-9-9ksLP for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 19:34:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A70096E822
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A70096E822
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A70096E822
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:34:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 847202266; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 21 Jun 2026 19:34:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wbNwK-0000000EBAx-0lgg;
 Sun, 21 Jun 2026 21:34:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>,  "Yann E. MORIN"
 <yann.morin@orange.com>
In-Reply-To: <20260621165109.2425496-1-romain.naour@smile.fr> (Romain Naour
 via buildroot's message of "Sun, 21 Jun 2026 18:51:09 +0200")
References: <20260621165109.2425496-1-romain.naour@smile.fr>
Date: Sun, 21 Jun 2026 21:34:44 +0200
Message-ID: <87pl1jadrf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FRfULpiVhfTvywwuVIX9alQ7nRFjWSuBVjqN8ZMP8tY7zKjk0toDXIYxVGsrT+cOgs8GYmjcdndS78frfYaFdZnuINR9b54ozl8ErRne/rXb/gaWV5C61EDMSa5Xnldsq1clJ7fNz4D+ugNZ0za5+grW+tdONPs1oluoEbt7WrYXqV85CJaiPv/059tgnklRKbpgDIBUP3jtbXRox/Y3o/DSBG7zZNZ2yuJUgCvReF73nUmvRJAbOfhX3t2N2KH+kGHVG7ZUi+XmcF9ysQiaTL5QC+hw0XEFjJLSUUmg/EazcfQazpkrzbIv+cJksOd8SA4p0C2FRsqDPZecu1F7qA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=cqOgDdqBDOPuGw1EtAvgEu20RaekOf7QAON7FHkGZns=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=FRfULpiV
Subject: Re: [Buildroot] [PATCH] package/passt: needs headers >= 5.9
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > Upstream passt only documents runtime dependencies; and they advertise
 > being able to run on kernel 3.8 or later. However, they do not document
 > the build dependencies.

 > Since 2025_06_11.0293c6f, upstream requires kernel headers >= 5.9, as
 > they make use of linux/close_range.h, only introduced in 5.9.

 > Add a dependency to kernel headers, and propagate it to podman's passt
 > backend.

 > Fixes: 6a192b0d282cb85ff4272e26df082f5eacd8e3a6

 > Cc: Yann E. MORIN <yann.morin@orange.com>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 > Commit log from ed99b77e5d276d62c2f4c9959b5c558a4f3c9e36

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
