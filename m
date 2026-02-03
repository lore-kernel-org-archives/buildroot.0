Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D337BE8305F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AEED40BF6;
	Tue,  3 Feb 2026 08:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6rF2Be0-apC; Tue,  3 Feb 2026 08:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9607040B30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106445;
	bh=5v2gR6O8AQ/ZfhEc7Q/3r9a/JcwkDzMBoLTQpksZgQs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CHtiku4E2yhwP/RfqpafkeOUCxoGdO3iUvKGC6bZOXStmhs6yybBvV/0NQKL4QZCC
	 JVfmqUALdWFZZNO/V181kKam3Mfu5CPrPC2sREP8irapdJTjImpSILZrWRzJF6HKyw
	 e+8Vgw8ppPnuJvJTdXpgHEq9jwLdr/L7+SUBSZVIA2NGM8f7yBe1q7hCFaO3jsEcc2
	 cdZcJbKLpYYMsYCZ/GCuZmVgv6AcNFXX7n0ACgtWdA/OCnIUiqwF3KFQGCFd9m3k+L
	 L6ZrH2PeU6esyWzn18/awWtIbDIBnfKdurUS/3gqu6Ur8Wq948yNHQ9HVUfvaZ4svS
	 koplXOHVmfqyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9607040B30;
	Tue,  3 Feb 2026 08:14:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C891F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF56F40B30
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:14:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-0rGRDgUbak for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:14:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D8C5B40B2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8C5B40B2B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8C5B40B2B
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:14:02 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1132574265; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 08:14:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnBXs-00000008B8B-1ZZP;
 Tue, 03 Feb 2026 09:14:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Marcus Hoffmann
 <buildroot@bubu1.eu>
In-Reply-To: <20260202212814.2607588-5-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 2 Feb 2026 22:28:10 +0100")
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
 <20260202212814.2607588-5-thomas.petazzoni@bootlin.com>
Date: Tue, 03 Feb 2026 09:14:00 +0100
Message-ID: <87qzr2nt13.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=B0h27DqP25RO+qAJic7ZEQsIYpfqQeMUuxfe9GuNWzqILwoEnF2CSU7qnVjGnhC1T80c6jD6F05IornLV2Ebq77SR3V6XxSB1Fhq/auU1dtMh2ghjdMCQsFyj/H2BFkMRKseOzoz82s/UCcNqWiJmRy/qRVpMlBAk/t/3sWpnq4gPt3Js1yhtarNpf4WkS84D1yNG4fmRf+n+HCNpO8oCvldcJWmfGVeceeEkArQsElAJkEJKOLMivnR5i2qMtO8ZV+Qq4iAoKhStzwN+WeYKgJ/pOxjxLuyq4NcgcV7xeXSude/29PF38MPoiwBe2MzInKh45PJPl9OI6L3vi1BAA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=RQ+xM7e4fyLn5f9wE3xBsISQX4Wkdd4qxqagfiyOa7M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=B0h27DqP
Subject: Re: [Buildroot] [PATCH 4/5] support/config-fragments/autobuild:
 replace MIPS64 toolchains
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

 > The prebuilt MIPS64 toolchains are very old, causing build issues (for
 > example recently with the systemd v258 update). Replace them both a
 > single toolchain configuration that uses one of the mips64el Bootlin
 > toolchains.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
