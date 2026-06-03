Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833EECD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57AA061ACD;
	Wed,  3 Jun 2026 18:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPdANglsvezf; Wed,  3 Jun 2026 18:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C99961595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512088;
	bh=Nk+wrtsgfDef5tlms7IHf2s14tE+k7AzvRssG3Dpt1E=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jLCKpDZidwKWr/H8wuFkctO7l3Bh63rlMJFOrz+21nLW048CX6iK4j7wYnL0bleVE
	 oKk9sywiw+rUXpI1tOCn8xF4yDQS2x9y3Qqyj5tk25lm/DIx5uQ3m5EGbi9sBKmk35
	 nIaCLI7vnIUMxQHuF61W7qw57PfvkYp511xgqOvxVoJkUN9scV3ROEOf0DUqeuHDzi
	 u0La0N07DiG6XICVH4jOZyhcXDmlwD5OwbsUm/2qFcHsP96cFx41mH57yqyrca71lN
	 lH8KsVwyN+HsEYk5AFLD4L39zYpggF0s4Fd+CnxxZtO1dJmj0Z7wp0B0QlM/dMpXxx
	 +E6jg4lG3fXnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C99961595;
	Wed,  3 Jun 2026 18:41:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBAB9192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D16A883578
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDvCaM7qbQW1 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:41:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2E05810DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E05810DA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2E05810DA
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:41:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -984193838; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:41:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqWl-0000000Cf0d-46VF;
 Wed, 03 Jun 2026 20:41:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Sam Lancia <sam@gpsm.co.uk>
In-Reply-To: <20260602124009.287330-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 2 Jun 2026 14:40:09 +0200")
References: <20260602124009.287330-1-thomas.perale@mind.be>
Date: Wed, 03 Jun 2026 20:41:19 +0200
Message-ID: <87wlwfo4a8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fZVj5z8EGW5oCURTiX2Nid2syNWXV4bimss383/ITE85G03CZFyIgbTKlQnXc6JcDsTNqaF+auch347PbfCwbaikIVsdy6fRU9JYaC4d7LxkS7LUPH4IV9sgTnY0RNQjpC5joNmw/BCWjwGcalt5rkVcUOXWmGoye6v6zLELbQ/vuVKjLcD8zFDce1v2gEdjOerGRw9ghtGsAkCwmEfvFSnLiUnwNEdpUsXhothS49IXrEVrfYlM4V3JGbdPDKNtXiuH95QPelFh1WP41oG0sqM/SxBEzAcEuwha8JRcnrnqA0Yoszl6KVvllHBI35iGN/kI3EJCb+BdrfinhdYZSQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=RvW8Tvi/hxNuIT8qhXTQFd8gQgaeaOP6UeUjaxeFfDk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=fZVj5z8E
Subject: Re: [Buildroot] [PATCH] package/lrzip: update CPE
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

 > The CPE long_range_zip_project:long_range_zip hasn't been used since
 > 2023. While ckolivas:lrzip got 3 CVEs that affect the current Buildroot
 > version [1][2][3].

 > [1] https://nvd.nist.gov/vuln/detail/CVE-2025-9396
 > [2] https://nvd.nist.gov/vuln/detail/CVE-2025-15570
 > [2] https://nvd.nist.gov/vuln/detail/CVE-2025-15571

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 > A follow-up series to fix those CVE will probably come.

Lets hope so ;)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
