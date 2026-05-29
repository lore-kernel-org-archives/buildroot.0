Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C639CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3DBD610EB;
	Fri, 29 May 2026 18:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5VYerPg0Rnf; Fri, 29 May 2026 18:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A13C61630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079079;
	bh=rhkleS+c1NnhtvelDWTcgf3QY8zE73CqGYBSUkFUo1E=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ouN5s2HCF8nlNWE8+J/Wzp48OmePYTZ7BxJjvhlswazaQY5A9X1Py6ZWh8x4LzoCy
	 uQDY35AaaJ3uZzEhQRbmKFr6CFq0YBe5i3O8YRRsytp/bJNmg3o+XeJaC831uTSYv4
	 6dEGmtwxJ1XuDadH8OwtgFyRfq18rAiGtHRmLgOZwU6rK8Y8vVq95H54dQ6/qOlSmC
	 qfL0n1R1FKobxmCmmWciIc2wZUYno2GpW7L5BbHjOSz8YqHaKDJdwfhHkDyzIRhGN7
	 PQH8zZJdbUx5VBeYbg+KWMi56I/fWnx81CM/3pQwkVbH+E82s+XfvDf/jkbbJ8q+NF
	 MYoAKff+glXcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A13C61630;
	Fri, 29 May 2026 18:24:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8552D288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7226480F0F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BemTF-7qQh3K for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:24:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76D8780ED8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76D8780ED8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76D8780ED8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:24:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1278616204; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 18:24:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wT1sm-00000003Acq-3fOS;
 Fri, 29 May 2026 20:24:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <20260529161043.2471088-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Fri, 29 May 2026 18:10:43
 +0200")
References: <20260529161043.2471088-1-titouan.christophe@mind.be>
Date: Fri, 29 May 2026 20:24:32 +0200
Message-ID: <87cxyeaxb3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=oQTusVgFTqD3qqBO/8147DJXESEPYcX1b47DEfsTaRfOlUSzt6q203Pgbl/Ci1yTXuidv+A/C0mYHZArQyQrlLA5ApOh63t3nhamQOlzMU5zKbHUab6HCFYwD4u0bsnjuVdEgKFgLByYWViX5+aKPd8T9iBMGp1GKl83dIT7KFiLFgXDt6u4IsYZJrEg2/GrCF5jlZlA2T8B7CfMTL1zq0HNpWFarhO3osF6NUFH9l8JXyvwSyYmZQEN4wJZiqNiL4ZmkESnf7CZC3VBnn4SsV6m0yzXTJRig83Uasr4WW080jNk4071aeoY9XYRnBiru2oHh3MWDiYkp69J6UYc+w==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=XthxRq3fpa/rMfTxZclf+rzPeoA6zAVbIVXhF5o0N+E=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=oQTusVgF
Subject: Re: [Buildroot] [PATCH] docs: add OpenSSF best practices badge
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

 > As of today, the Buildroot project is now 100% compliant with
 > OpenSSF Best Practices self-assesment. Let's therefore advertise this
 > in our SECURITY.md and in the footer of the website.

Wee!

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
