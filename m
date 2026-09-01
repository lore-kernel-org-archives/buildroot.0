Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C8AC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 18:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57C58407B2;
	Tue,  1 Sep 2026 18:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVvHwVhYJzRR; Tue,  1 Sep 2026 18:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788286639;
	bh=UcP6tAFGJ89G3k8HuyyNjXfKgVQ6jYD11HbLBKsmMhQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bTbELCsSOLuY2z6ScD/C0MiWBaOZ9nAnoRAHyk2IaKi0NDfi+TIt3d0UsYtfx0jbp
	 hTiVehHcHCNFwYcp6TihsPW/WBz+zBuAcqxzMyARm/MIUyZNPWngR70YHsZhj5HPpZ
	 FwUVtc+85N4gL1ZY3U63Go8pGl3yjFHb4tBFBu8VeIAkArx3bGmYV6u4yQoqA8s92t
	 115uvNZ3QsqAhuq7/LNCMPKPpPr7KR/5pkqxLhr5sF6z/tJxVSDX7/687CGUw9aAxo
	 oLcSxceZpZVtKFlP+KUtn1B1DyYI+0dc8ni8j+s+NVsYcb0AN+RJoa1v6ndcANe3fU
	 VqyyR3Htzgw+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118364076F;
	Tue,  1 Sep 2026 18:17:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC7CE1D9
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 18:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA37340265
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 18:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQwRj93Xpfar for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 18:17:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=emIl3+W7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A89B40249
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 18:17:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=emIl3+W7CcU5g7l5g4FYmbbnRRc67HJdzMgPJoc9nTbnLm9swQYKJD+/0VcvuziPgintpLPJvvr5DgV1IYQXMrgvJRi2kKCwveJnJOB1JfWZo2bfWxzzkUMSEthtsbHk2XzL5qsk7AM56Va+2ROGh1mR/9JJfUaI0V3TMdygb7WozrJm1nGTyb/t+ged97hMN1PP9GeC0AU0Pfne6l8IpshJ/u74fryqYajOwbxO2Brgab6hbJStIBBuydaf/wSn1nQQxq13VE4qNDDpyYWWyIMACmxG00yIpK18+ukNu79yNgAiu/R7Sbe25m49KVGAsCbXYqN/N3kVWR3rLKMTbg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=TImbfGUxbttAnPx30Hm0CbYjddiwcLA2+Tj+OgGdeZA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 121258517; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 18:17:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x1T2i-00000003ihi-1aPb;
 Tue, 01 Sep 2026 20:17:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
Cc: <buildroot@buildroot.org>,  <arnout@rnout.be>,
 <luca.ceresoli@bootlin.com>,  <thomas.petazzoni@bootlin.com>,
 <michal.simek@amd.com>,  <ju.o@free.fr>,  <brandon.maier@collins.com>,
 <romain.naour@smile.fr>,  <romain.naour@gmail.com>,
 <ibai.erkiaga-elorza@amd.com>
In-Reply-To: <20260901084443.584247-1-neal.frager@amd.com> (Neal Frager's
 message of "Tue, 1 Sep 2026 09:44:38 +0100")
References: <20260901084443.584247-1-neal.frager@amd.com>
Date: Tue, 01 Sep 2026 20:17:08 +0200
Message-ID: <87o6egzviz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/6] board/xilinx: add Linux 6.18.40 hash
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

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Add the hash for the Xilinx Linux 6.18.40 release tag.
 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed series to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
