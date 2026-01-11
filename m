Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC291D2502D
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77D41812CF;
	Sun, 11 Jan 2026 17:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OyIh2eXvwMho; Sun, 11 Jan 2026 17:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E7F581234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768151917;
	bh=xPrK/6XGHrfX10gG8RhXDtuW7rXk8FI3IoQP5kD8M0A=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3C9ehrsf3NnFE9K/rkr2SAnCTfRxFY87z9m3Pj1UZNpoReNaa+UZTkpncmHbF1dV
	 KZLQYlRJdq5V8KOcADq0bjoJI1sHK7g61sZe72Zf54mEswaWJlJcxJZSiX+GQ/JqBu
	 feIrvgb9zrhaHxVOt1mwrMN8Vwpt6iYsYbBQmjfiZzOARhZp/6ItLPjUwe+UiFhUXP
	 G17rZQ/rzaRbAet2E9xIf/OVYPq2BqZ0S9jyVSZ7JJmY0h/SYXfPLOQsrblVjNpC8I
	 hAd2z6kZhrktbFDG86o4xdeQlFKB18XIuEpZTLASAVrJzm3aIlVvuXMSwcXTS5TCnU
	 1fTy7Cl2oPYUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7F581234;
	Sun, 11 Jan 2026 17:18:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9F231CC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0BF54061E
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifTUUlZ-LRzi for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:18:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2451C405E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2451C405E4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2451C405E4
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:18:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1473931285; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Jan 2026 17:18:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vez5A-00000006sYf-3LWc;
 Sun, 11 Jan 2026 18:18:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260110180604.2187061-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 10 Jan 2026 19:06:04 +0100")
References: <20260110180604.2187061-1-bernd@kuhls.net>
Date: Sun, 11 Jan 2026 18:18:28 +0100
Message-ID: <871pjw1317.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hLpHE17Rvqye3FTqZD8iWGTSc/FcrQasq9Mh46rvXSj57Ne5ewJGtp2n5H9AZALKGofwrBBCUs2WakjX9sI/ohqv/VQMFwJxQtN0xmSnvhrsy/9SJ/hTrLAfL+ugrsTlDcH3L2okoTp0zEfTG80tmI4h5MmWohxLumHS8KtM5RpoDy9v5hiQRYX52mawUQlB6FM/54Ser4SXky+GDkCsvQNkMho31kRx3gVimo4Lkn5ZdT/L6LmdduvzL4237q5OpXP9sHij9fWglueqSbiNzBuguIGMwXwrbO32GSFwjvl6fjUef2q/rLzpbqudhLjlwX0hyPIVJypfDeno5gmWNg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=/huMQBSWWasVuvlpeH0BAj/H6cIjpFmutntvITMgKq4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=hLpHE17R
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.51.2
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://sqlite.org/releaselog/3_51_2.html
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
