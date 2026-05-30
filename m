Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E88DCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6D042E32;
	Sat, 30 May 2026 08:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QL80w6PQDkvE; Sat, 30 May 2026 08:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A025342E2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780131271;
	bh=/PnrUA+lzyh6P21ZMJBMIVJvh0vbIdCR9rA5ork6GBg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iRqLn58OCZeHl7NUAHM1dBp/O9hTJDqJ1OdZbv7BqGq7on0Q51WPBECrju2QKb50A
	 sHRQBN0bC+i0IQW/PBGfFgDNDBMJn+qjljEOhdFvtEsyHaT9JI1f07gA6S4FfkM1Bd
	 f/oul+by9kQZgAISdFbDKQkjEC0U8K+71c4PsGBLsFJ2v8KlSXu+/YyAh9zNzh9b5A
	 BvjlKfyQRWnjjavGeCUpnxd6AVTyp6ctPNJCf/Gdgz9nx0AnAAcgspJZB/CNpuxpHv
	 iK8jdP7s8cr/yG4GZ4NqelyGqDQNBvMUQSXno97moyW09dcMNEELGshVd9kYJE2rml
	 7XkbM6LqpFHhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A025342E2E;
	Sat, 30 May 2026 08:54:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DF88D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F348F42E31
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeibnoiwHQ2c for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6B1D42E2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6B1D42E2E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6B1D42E2E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:54:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -375484141; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 30 May 2026 08:54:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTFSb-00000004j6g-3I8k;
 Sat, 30 May 2026 10:54:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Daniel Price
 <daniel.price@gmail.com>,  Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,  Danomi Manchego
 <danomimanchego123@gmail.com>,  Titouan Christophe
 <titouan.christophe@mind.be>,  Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260529094514.178266-2-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 29 May 2026 11:45:09 +0200")
References: <20260529094514.178266-1-thomas.perale@mind.be>
 <20260529094514.178266-2-thomas.perale@mind.be>
Date: Sat, 30 May 2026 10:54:25 +0200
Message-ID: <87fr398egu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=q1HK8jnTj9CjguGHMKT9cDwfgmZiYnx4GWfUfvNIwWWzqUJb5SQftvUo6j5QHKGm6L1m0e6t9fToch17bQQd9WZZAL97XXXfm6/2vmeAmvJmLPq8JPPMiJ8kAksDBX3K1mHnQzRPbZ3jZKYKknyS0RGz+Y+42oTz/T+jItbesXxeq3jyGrO/KXuZsfFCPz0A0aS7SLuyeh4xp3RsRbx3wVnCuVasB89gdK2RHVzKTrVyguEfChz52DOhcrJDjE68X7ggRYxaGMmrF1PbQ+BQHOfVMq4xc+btWMvnmL9CQz7KTwDZpaPlUHG3LqbS53KfRI1NDsTO8QygdoRm0kFjeQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=rLeDa8Nz6bwXQM+o7ZOzVJHeHyF25Ic2SGH1ogYC3Dg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=q1HK8jnT
Subject: Re: [Buildroot] [PATCH] package/hiredis: update CPE vendor
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

 > The CPE "cpe:2.3:a:redis:hiredis:*:*:*:*:*:*:*:*" is valid for this
 > package.

 > See the GHSA [1] and the associated CVE [2].

 > [1] https://github.com/redis/hiredis/security/advisories/GHSA-hfm9-39pp-55p2
 > [2] https://nvd.nist.gov/vuln/detail/CVE-2021-32765

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
