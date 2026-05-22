Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7E4CD5BB1
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 12:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77BCD85034;
	Fri, 22 May 2026 12:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbb6j6USYDZS; Fri, 22 May 2026 12:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B35085023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779452948;
	bh=VOBW/pT2utKZdy6Axii2IzCDFSjQ6BmxesCFsxLr1ws=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OrbwaTsAwdEq6c2SoqTlu/209rud1jPwfa5vQbTbQnwUNn0plLKIuZTVkTg3TXeRC
	 jIGIFwpv3P6KDUTCZjaz/zG6CgfW+/iN0Le5qkFsEIB+NNzK4AqIlBLXfZ/EyY2Iv8
	 7O7Hg0OLN4PXK6cfGrzxKoyBis/UYCPdYU3o6vODoQQDW9GcvUHB12sIDvEGOMixpo
	 BMhetZSAeW6aFwA85/Gn9c8oohkHMGFRpbzC4ho/FucBU5nXsepMFt77Mrzpk+g0Ud
	 eXBQnh0p5WDe7no693iRV5cekqZPIqo+Tk5MLdUMad/pUTZNh51fuRJ7+nvL7gT0vg
	 M/k0N/BXhOLEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B35085023;
	Fri, 22 May 2026 12:29:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B21A3B9
 for <buildroot@buildroot.org>; Fri, 22 May 2026 12:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 086AA6F6C9
 for <buildroot@buildroot.org>; Fri, 22 May 2026 12:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guFfu11bAqAX for <buildroot@buildroot.org>;
 Fri, 22 May 2026 12:29:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F25E6F55E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F25E6F55E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F25E6F55E
 for <buildroot@buildroot.org>; Fri, 22 May 2026 12:29:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 154561384; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 12:28:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wQOzk-0000000Cf7y-335q;
 Fri, 22 May 2026 14:28:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260515132816.DE2738634F@busybox.osuosl.org> (Thomas Perale via
 buildroot's message of "Wed, 13 May 2026 15:18:09 +0200")
References: <20260515132816.DE2738634F@busybox.osuosl.org>
Date: Fri, 22 May 2026 14:28:52 +0200
Message-ID: <87qzn3aarf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=P3vpAcI1SCdlf31dG0T1F3hDhPr9rUw4jqHkmAbEi81QfDLrxup9lM515ojTVdtmHMJdG9mk9nDpcbRAk2ZbTGQbncqE1gwBBEBR08DxvfHtcSHfJ4rOpVEm7vBqJB2egKZDowdGrA6ZgqTxzFpW/6OsyCwDYV9gQEpTFJ9ETOFbt9zqb8tHboPkvG5aLSdjc/DwIqao66DZ25Hle9IAA3lDYxfdKEcLAfIYQmd2MSsR1gTrz+Wf0RGk8W/s7ErOfIG5JMEM15CjGQWGest0bLOe8aLHGpaQYuF3lz3UKA7cPtnLFrj+kU1WkkeegJLwGRqjSavYqa5KtC/lYwztoQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=XdZlYbHM9LTj9UxV6B4QTYh2MQeH7j8gNTLqIMPwPlk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=P3vpAcI1
Subject: Re: [Buildroot] [git commit branch/2025.02.x] package/dropbear:
 patch CVE-2019-6111 CVE-2026-35385
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

Hi,

 > commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30d1791eb26a8ef46a952d1ef66e163de1eade07
 > branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

 > While CVE-2019-6111 was already fixed in 2025.89, the version 2026.90
 > provided a follow up of that fix.

What was the reason for cherry pick those commits over moving to
2026.91?

I see this triggers the same reallocarray() build issues that 2026.90
did:

https://autobuild.buildroot.org/results/275/275c521bbbe6466649209069318e45a9e4de666e/build-end.log

Which were then fixed in 2026.91.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
