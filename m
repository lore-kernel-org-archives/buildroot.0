Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E41AE9D3F9
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 496F18184F;
	Wed,  4 Feb 2026 15:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYnYZDiV2aRs; Wed,  4 Feb 2026 15:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B23A281852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770217603;
	bh=SqJjrr6AQA29MPJitiOUGIYbrVtIonxBBYb6ZLn1fUs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QcCP/avSWoGtbSq/QAjlTVH4B39ns8lH5yMeViP6GGgoXkMH0nMBwNJ3iNwReOZCq
	 67VFQXuojBgakToVrFC+n/pNQnoaQpM9CtMv9bSveLmPDHK4fapkOmg2a4Us3aExOe
	 r2UXeQKdAm7Yeh6ucq26kmOBRtydpE9OsnG1Sg8ySDd61KFREH09FTUGvLmaDZGSjs
	 btHcOp9sz8MikFHMFeT1pIhpeF891a2Be20pKETM3k0VUaNU9DKJwzZma6C3H/geam
	 6L9zdWjVfn7cB1Gc61j5R+MNOdFbotteB8tr8s7X51z+hXn83yqinYnKuQrwXmBhZJ
	 Etfptc9O0/vKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B23A281852;
	Wed,  4 Feb 2026 15:06:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D5E1173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88D5640667
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ou8pszV6V-5u for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:06:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75EF8401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75EF8401DD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75EF8401DD
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:06:41 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -237910899; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Feb 2026 15:06:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vneSh-0000000Cpl6-3YES;
 Wed, 04 Feb 2026 16:06:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260204150049.3057699-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 4 Feb 2026 16:00:48 +0100")
References: <20260204150049.3057699-1-peter@korsgaard.com>
Date: Wed, 04 Feb 2026 16:06:35 +0100
Message-ID: <87ldh85z0k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rb9oTPw7aKA4d7VwZ2132ZnmtzB1WX5FRfEWAA9MwV6mWuN1estQdVcWynViGJtQijYTwiwnKJJNohzMIWgkGtR8NGGTfeu28hjei60Q1blQAbo/1sEvkrVRVnnjEs9kYAuBjvZ/nftnEdFPisFrZTr0x2RCwBJMrYPPKysz0NdA8ridMg11S5I3fIwr+Na3WssljB437NGFmWwBEOQ6URw0uLGeu/qMKg1m3eZQPN+fve4Cok+tybNHrY8vk2KOI0Nxstj7xcRnBVZcN7nDz2qwqjCyUuckJUtHu+/t6FdDueLpLhh/pvknkMeOvDOuuZACEvJ1BHc4CR5DTanZWA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=sJCTbhdORFfMQCoYWEHRLGiryY/M4GH6kX78bauT20Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=rb9oTPw7
Subject: Re: [Buildroot] [PATCH] package/{glibc,
 localedef}: move to sourceware.org git repo
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As described in https://gitlab.com/buildroot.org/buildroot/-/issues/160, the
 > github mirror is getting shut down - So move to the sourceware.org git repo.

 > The github mirror was originally used because of performance and reliability
 > issues with sourceware, but that seems be resolved now after server/RAM
 > upgrades - E.G. from the sourceware news:

 > April 22, 2024
 >     server2.sourceware.org now has 512GB RAM, thanks Red Hat.

 > https://sourceware.org/

 > So change back to fetch glibc (and localedef) from sourceware.org over git.

 > Notice: The git archiving leads to slightly different paths and permissions
 > in the tarball, but the file content is identical:

 > mkdir a && tar -C a -x --strip-components -f \

This should naturally be --strip-components=1 (both lines). Maybe
something that can be fixed when applying.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
