Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBA7D1BDD4
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 19:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8483A404D5;
	Wed,  3 Dec 2025 19:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MR8jHNfNbgZx; Wed,  3 Dec 2025 19:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE92C404DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764791785;
	bh=Hi+iSJEt5Xcs1AZEcXRu92i+atnlk2uzZ1qFKUCmu8U=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqhwkf2UCzfSU140t0scz/df6Xu3yKYdtg+ZiNKQSvcHMZYN1pkw4d0bhHcCMILuB
	 NW8eKH9qHmB9JfZPU/joW3qL9F83etO8gZtbHoowXaAiU/ZP1oZZ5YdKNWnJSccCTx
	 nxsahs9k48+NelkdBfCkOb1fkvUJjS5REbKJ7IY1Ky/7PBWKbzN90qpL6qDf4yk4aD
	 zTwQTiKmCyuO5vot2npXc7YZKFk6s6Ltri0Ffk65ZyoUdNGZ2bVhyb2UNHsv/yZyHy
	 eO6/zF6GMPFr1uY4NK+b/CTPaK1qLdrtAGQe8CIw8xMXtqXKOpMQ6UbFptuKv/7bcn
	 RnN+LpgPOlKIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE92C404DA;
	Wed,  3 Dec 2025 19:56:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91232D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77B1C404D5
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BdKVrf76qcnh for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 19:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94F5C404D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94F5C404D2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94F5C404D2
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2094440459; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Dec 2025 19:56:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vQsxV-0000000HJ9R-1RlQ;
 Wed, 03 Dec 2025 20:56:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Bernd Kuhls
 <bernd@kuhls.net>
In-Reply-To: <20251120204318.814701-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 20 Nov 2025 21:43:17
 +0100")
References: <20251120204318.814701-1-thomas.petazzoni@bootlin.com>
Date: Wed, 03 Dec 2025 20:56:17 +0100
Message-ID: <87jyz3fify.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=j2WSlCy14FhfvfanoJ3F5YFrKrLcLFtnAIjY41tSeVoP6dJq8jQ66udqg7sLGG6yaBbd6Lnf1D7ZwcF/oTki9Y+d/KzK1RZrLyaOi+Y3491k0nV0ADZaNWkGMP2wp6ZX41gfckCrD1XSsSIdHCY3FPnkfluNpxc6O2ZCbNNaIYfBDHAM+L9jF6WRUDBsxis4iHQiu3VXrik0/pnRdOXs7gttN7DM1YRM/qWNj2NTfnQNvEP1bB52rWimCM4bCuClXCH1YSFHEi0OaSQ8+y6LaEqtTlv0OrkpQYi1XPRSmInR1N1qRfeBrTQXVoJ/OUxEcnjHhhG6ujTdKhpWCQv3Bg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=7NUopXNC7OvZulW55MQYLncdk2xo6ro5fkz2o/jJMnM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=j2WSlCy1
Subject: Re: [Buildroot] [PATCH] package/libcap: fix static builds
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

 > Since libcap has been updated to version 2.77 in Buildroot commit
 > 42f2b480a5a81c7443f177bf541632b0fe501720, the build fails for
 > statically-linked configurations when the host system doesn't have a
 > static version of libc installed:

 > /usr/bin/ld: cannot find -lc: No such file or directory
 > /usr/bin/ld: have you installed the static version of the c library ?

 > This is because the -static flag that is supposed to be used when
 > building target code also gets passed to the host compiler... which is
 > obviously incorrect and leads to the build failure.

 > This issue was introduced by upstream commit
 > c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50, which was reverted right
 > after the 2.77 release in commit
 > 542d7d86ecd2129dd5fe7e5b31ba307304f5b319, which we are simply
 > backporting here.

 > Fixes:

 >   https://autobuild.buildroot.net/results/f6d/f6dc61a9d57e282691b87a3a8fadcb5d5ea8fd8b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > This is IMO an improved version of Bernd's proposal at
 > https://lore.kernel.org/buildroot/20251109080011.481333-1-bernd@kuhls.net/
 > for two reasons:
 > - A clearer/more correct explanation (the issue is not Fedora related)
 > - Backport an upstream commit

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
