Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E82AE8305F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B482817D3;
	Tue,  3 Feb 2026 08:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6-KjYwOJGgu; Tue,  3 Feb 2026 08:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A8B28183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106279;
	bh=5X9X3GIghl8CYkZD3cn7sAZaN/GtyKP/tSmQwg7uxa8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nnwruFrD22HuvVeDRIoZ73e95kMHQRZhJoipgOydKvq2nuUd3Q9FQDLy5IyyRLONr
	 pbrZ9JEBieENTfGR2AyorhODS3wks1l9xoGSErI1cU0U2rp+dRiKjYPVmmRGW/XQGZ
	 wrVm9nGdkyl+ztN2ZzfCtCFd1Uprz1psbUJ5kyGmJ9+io5L5Y2X/qI6PsD/2tK9Fvr
	 FsZ8KE3C8Vw8TuVgOLlgL77ljbWk7MECI6QwsfQwhgsN+JXcHXp5uhGKvvjyWkUwzf
	 XSYysH1cWe15l3S95Fj2OZUWkzVEkx74W1D3YfgWqzyIKb47E5MWfou+NSykdLT3or
	 f6E4FWy8wl4vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A8B28183D;
	Tue,  3 Feb 2026 08:11:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B344F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 176A5607D8
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4doSjnhYowMN for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:11:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F074360633
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F074360633
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F074360633
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:11:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1915481659; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 08:11:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnBVB-00000008B0D-3HZh;
 Tue, 03 Feb 2026 09:11:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Marcus Hoffmann
 <buildroot@bubu1.eu>
In-Reply-To: <20260202212814.2607588-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 2 Feb 2026 22:28:08 +0100")
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
 <20260202212814.2607588-3-thomas.petazzoni@bootlin.com>
Date: Tue, 03 Feb 2026 09:11:13 +0100
Message-ID: <87zf5qnt5q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=BXxRDfD97IRM9qU8AL9Z7eVjkay3e4acY7ahhJAS35gz0ZYlNOhdQf72Xtu54yzmGLGgn53nnaIIIbgX5v9XduUWIlStdUvtPAXpavli1/+CebjhFN418adCXwW+THO3Vt28MUfsYSPZLfK1j5dCOfg0lR+2xPmIRoiwmcBUnVAAnhxqkcOD3qqrxRU7UiLyoZTh5iBpIWrmmNsxS36LVJ+9GpqYcXaqKLXD24YsBF+UC00qut9UZdZxLvyTSL8Qz9BPPw9nDbbLltMMSMKzhK8yUZpGOoXSMhBhkTrfbJHw7GEmFAGTVfrvIykRklV3zWAJfkiwKf4QycExIJEk1g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=YXj0lIAbZpXCAKT+m7swRT3OH8UjHFRfJyB2ciLrf7I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=BXxRDfD9
Subject: Re: [Buildroot] [PATCH 2/5] support/config-fragments/autobuild:
 reduce ARM internal toolchain
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

 > Building internal toolchains takes a long time, and since the
 > differences between the 3 internal ARM toolchains is just the libc,
 > and we're already testing uclibc/musl with external toolchains, it
 > doesn't make much sense to build 3 different ARM internal toolchains.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
