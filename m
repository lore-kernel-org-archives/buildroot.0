Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9A0CE7B1A
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 13:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF6180BD5;
	Fri,  6 Sep 2024 13:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03p_6CKCgZ-A; Fri,  6 Sep 2024 13:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42236804C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42236804C3;
	Fri,  6 Sep 2024 13:58:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 468B61BF341
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 13:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4196E606A3
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 13:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaPCndPaJ2Qj for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 13:58:38 +0000 (UTC)
X-Greylist: delayed 370 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 06 Sep 2024 13:58:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C54E960670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C54E960670
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C54E960670
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 13:58:37 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 9BC6EC2AF8
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 15:52:24 +0200 (CEST)
Message-ID: <569359e8-5062-4535-bb82-3c167e3a01ca@grenoble.cnrs.fr>
Date: Fri, 6 Sep 2024 15:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <87frqcj3nw.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <87frqcj3nw.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1725630744;
 bh=b13eWTFCVoFbsl1Mg5+8XDZRNat6GYVl4mz1pQX3tJQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=g+6N3EvDV5bBwhVijFB9uGk9UvVu90abpCAYT1zDl9knickCSlIdai6aK4xCA3oq1
 oQ34DdlqvDXaoQg3Z+lvaKzRz3Yiyzv6B0NkeGSgFJjJOjtj5H3BXdUT6DUvhXVo7T
 BFOpf+9UiOA2fgHVfxbkWQecTLKdp6yEsZ1GF8jpddT+t8ElKsB52twUygO18M8+pX
 cL9Kxkb2SKr8ck9dQkBfGA2Yo0kQCgS6xFW/zlPZsFAEZwLC4DQxX2ZSSqFUGkUcIT
 GlzJTGiuSkY+BgSzySIxNuxmMKP5l3BfmgFeXTM3rjRJneZ2k+6IA8HypxAL4bcJto
 XiOoc+6scmTsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=g+6N3EvD
Subject: Re: [Buildroot] Buildroot 2024.08 released
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hello!

Peter Korsgaard wrote:
> Buildroot 2024.08 is released [...]

It seems the release is still lacking a tag in the git repo.

Regards,

Edgar Bonet.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
