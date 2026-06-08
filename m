Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454F9CD8CA4
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 20:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB78083A72;
	Mon,  8 Jun 2026 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ikpJoF0YOgh; Mon,  8 Jun 2026 20:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DBF583A79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780950379;
	bh=zZDGOpCCKu23gWaphqCMYcCDzS34FJcx9a6kpb91Jro=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hIaYoAiolXWg3C0c2I5V8VI6BVTECObZ5dw5LxU9bRX9ktuSryhKy9hCmNw+DtsOg
	 Xv9wGHyBowaXI4iStl8xXwO+c0EaY3QEkOFUmgo79horgnILWj0eRan4zU7K0F/Q7E
	 BGaVbRTySuyDBSyb4JD+dw84KSj9erl+TnSJcvJwr4uO0/mgU5GAwih6E/sezqYcRL
	 LPKrByRyMoOuQHVE2n3cSt1fK6rFtgS448x6qmlCoLWQ+GhIoz+h1+hNOXVsPkNpIt
	 GC/T/xkmz8+98YkJIru4LMJOeYWGpUISoLkBGgYh4jmcSWswP9yeQAEbqeEv1Td2Lc
	 +J3hpU0hRI8GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DBF583A79;
	Mon,  8 Jun 2026 20:26:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A991BEC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B53C40735
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cij0zEyWZem1 for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 20:26:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AD10406D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AD10406D9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AD10406D9
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 20:26:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -199637705; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 08 Jun 2026 20:26:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wWgXz-00000009Noq-3KMW;
 Mon, 08 Jun 2026 22:26:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>,  Christian Stewart
 <christian@aperture.us>,  thomas.perale@mind.be
In-Reply-To: <20260608095745.737902-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Mon, 8 Jun 2026 11:57:45
 +0200")
References: <20260608095745.737902-1-titouan.christophe@mind.be>
Date: Mon, 08 Jun 2026 22:26:11 +0200
Message-ID: <87jys8pyn0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=MF9sVFApFQ+PF2uX0IEuKh7j8s3PaiijX6HJTK60dRCtGbj7wMRzjEwmR4Pvd3wo/dCAFqjDK5MvVsm66hvp21c0tVCipKFCQUIR8nAGpVCe4hdTU/AEPgCj1q47j2oY3tECcArJ9jBdyIRlSV/8J1DkZStSgnbG4KGyHcOzvU9ZyuwpX8D+3cmao+kg+p0nZ3xlhpYWjMANillnySDnYrjUjRCJneBqM1EZQMcH3gg5ibCeHn6HhZCn5bB19VEaW3S8xxFVUlMMowCX0p/qqhwQh2C3uoukY0dtY20DOl/4mfNdnPCs7yYwQxolWadZBrr3cHdngIkhqgvYauCAHQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=uJJEn4w5ZrbE3n99FuWt0yNISamsgXMc1ngQSe+GODw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=MF9sVFAp
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/runc: security bump
 to v1.2.9
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > Fixes the following security issues (in v1.2.8):
 > - CVE-2025-31133: container escape via "masked path" abuse due to mount race
 >   conditions
 >   https://github.com/opencontainers/runc/security/advisories/GHSA-9493-h29p-rfm2

 > - CVE-2025-52565: container escape with malicious config due to /dev/console
 >   mount and related races
 >   https://github.com/opencontainers/runc/security/advisories/GHSA-qw9x-cqr3-wc7r

 > - CVE-2025-52881: container escape and denial of service due to arbitrary
 >   write gadgets and procfs write redirects
 >   https://github.com/opencontainers/runc/security/advisories/GHSA-cgrx-mc8f-2prm

 > There are also numerous bugfixes.

 > See the releases notes:

 > - https://github.com/opencontainers/runc/releases/v1.2.5
 > - https://github.com/opencontainers/runc/releases/v1.2.6
 > - https://github.com/opencontainers/runc/releases/v1.2.7
 > - https://github.com/opencontainers/runc/releases/v1.2.8
 > - https://github.com/opencontainers/runc/releases/v1.2.9

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

LGTM, but maybe check if it breaks setups without CONFIG_USER_NS=y like
the 1.3.5 bump did on master (test_oci.py is a good test).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
