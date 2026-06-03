Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0764CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 08:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A0BD84241;
	Wed,  3 Jun 2026 08:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JCCkVA2AUMb; Wed,  3 Jun 2026 08:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B44284234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780474102;
	bh=W6BgAtV8JmG/1EaCm9Ipj2T1Co3Pvz6B+h+j//yXVjY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ENWrQAH5iVwlAvyGYFToLEzBb5VE3LFqsvtW3a5Ewl0HcuSSGQUI2JYAyyUobEnOC
	 R9IC9n12aJnUW3JgjinH96caCyUrH14ySSJXwBwx6bncSLbrnZsE/nnhou46AlF99s
	 ZaqzznlNfKdhzCB297gyew5zhu9eJ3QwXJbZYbXLhs5hFN9oV3f244IPeN0xTeqqnN
	 WxQWbsBR0FdC+1RkQbCzR012s9Al2Z+TZwbtkF6ZgnKkInHmQ2MiiFusi5HZwDE6hd
	 LTrGdkoW0OuofJadcATRZqvjBOS7G549F31Crvy7xROvNwNpeny2bof4efN/FxMN+X
	 R9fw1qN11zMyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B44284234;
	Wed,  3 Jun 2026 08:08:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CC94353
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A2F140820
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UnNJ-K72YFw for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 08:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FBB3402DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FBB3402DF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FBB3402DF
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:08:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1029997607; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 08:08:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUge4-0000000CIFO-3d4G;
 Wed, 03 Jun 2026 10:08:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
In-Reply-To: <20260602210756.2837692-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 2 Jun 2026 23:07:55 +0200")
References: <20260602210756.2837692-1-peter@korsgaard.com>
Date: Wed, 03 Jun 2026 10:08:12 +0200
Message-ID: <87ik80oxlf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qpZOxS5iBmJmN5psWtZ1+dUry/q4SpMSwYIDLaQ2E+hf2HNMtsgkRXq4LwRrbzLQylGQHLdiuOfT5tf18sw43SY5i1j8uoWqMDFU21+bVoBs22HjaxvEfmf11C6O5ZTCQYENZavnrYMWmmKV/oQxm27Bo/YS6Mf7t9P+MKrC0rtyhLnrd/IayE/BYp0QIj88xfnQvvpAvbnUmgIvJ/ZVSJgBX/yZJyr5fg3748LImZ4qOja7v8pUbSFaetfXv6nnbRqXcFkhiU6Vam57pjDSIGSAA/Wr18hcDvWTEYmJa/704ZDky+gdyHyUHfmjzjlVtauJkszddftSzC0mY+0cbA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=XNLYGSCfUo1JMsE6r0u+aI5CIVfwKfR6BGTJOgATTC0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=qpZOxS5i
Subject: Re: [Buildroot] [PATCH] package/runc: security bump to version 1.3.5
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

 > Fixes the following security issues (1.3.3):
 > - CVE-2025-31133: container escape via "masked path" abuse due to mount race
 >   conditions
 >   https://github.com/opencontainers/runc/security/advisories/GHSA-9493-h29p-rfm2

 > - CVE-2025-52565: container escape with malicious config due to /dev/console
 >   mount and related races
 >   https://github.com/opencontainers/runc/security/advisories/GHSA-qw9x-cqr3-wc7r

 > - CVE-2025-52881: container escape and denial of service due to arbitrary
 >   write gadgets and procfs write redirects
 >   https://github.com/opencontainers/runc/security/advisories/GHSA-cgrx-mc8f-2prm

 > In addition, 1.3.4 and 1.3.5 fixes a number of regressions.  For details,
 > see the release notes:

 > https://github.com/opencontainers/runc/releases/tag/v1.3.1
 > https://github.com/opencontainers/runc/releases/tag/v1.3.2
 > https://github.com/opencontainers/runc/releases/tag/v1.3.3
 > https://github.com/opencontainers/runc/releases/tag/v1.3.4
 > https://github.com/opencontainers/runc/releases/tag/v1.3.5

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
