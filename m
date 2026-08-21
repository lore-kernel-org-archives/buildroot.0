Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702A0C5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 297DE81B48;
	Fri, 21 Aug 2026 15:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BT3Svtl5Vdv; Fri, 21 Aug 2026 15:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325948;
	bh=wxj7ZcHdJvfazf+cgrBO3kEO56B6YRenA6MX2H+iDLI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BGp3tSIP1+SK9MzWGCeG7SFf4w1K5bUlTYvMaGhOcBEuezwdBnSuGh+05lsqOnQxl
	 p9XMKevQPA4WvYIaXCi34Ukb2mdEarFK0t/4SjSnXBu+8wiQgi0Hq8+TlgJTrh6WSW
	 z3NQguHK1ALjPyRKprjwzfzX97JRI53XQTjTD/ZU0SV2rzsUgBcpHQuBonuId2nTWZ
	 uvJaErGGQ45p+5mHWu+sFohspwQZ1mQZnEkKBAdTKOtktKzTyAbiPOtjXaiCBlHFje
	 5jUK2OIYf8j9y3XzfSj2DPQYvfleAPjO0iOSzOFdXBjpOTjTtdXQc+M36r6jdFqYaP
	 Pv5H5vC32zoCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FFA815CC;
	Fri, 21 Aug 2026 15:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C20D9EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF47A4004E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bl0Bh5vtg-V4 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:25:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=OP5j/N3I
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45A7040026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:25:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=OP5j/N3IcHOF+2/o51fqkw3fmPUb8ShMvNW50aJFdYwx4SF12Az436OK6c3nSMZUdcfwgj1zE41qbqR0apwfXoF/9PEzNVRJCmPcW3opP3QDTK4DKEybClNNP7k4hp6hUecK/T4qABCKopohw/+jqNlbIPmQhB08m8OYiTcyWX7fpaa/cd7/qG+XyzYUzE7AFCcFxf5GEkyucqMT0dKUt2yU09ccW5weZjdgWd01bxhIeDeLUQjjzienwcG24laOCsPcmKL/uSBwsylQ45Jq/DVY+ORCuBbGuScYcOBX07nPDqEzhIDPfepEJhUcZMayxgOMwsyJprjsnwr3WVCbQQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Wa4Z96kjcDghCwnXUAoYZF1fseBIaXkXdS9xpmgzlNw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 287573153; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 21 Aug 2026 15:25:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wxR7i-00000006aH2-2ggb;
 Fri, 21 Aug 2026 17:25:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  <buildroot@buildroot.org>
In-Reply-To: <an6ZiFqeluAkBNbH@yd-6wlzhs3> (yann morin's message of "Fri, 14
 Aug 2026 06:28:56 +0200")
References: <81e1623bc37fdedb5cd3e4b9268fa03b45af65a6.1784526170.git.yann.morin@orange.com>
 <20260731122151.155473-1-thomas.perale@mind.be>
 <an6ZiFqeluAkBNbH@yd-6wlzhs3>
Date: Fri, 21 Aug 2026 17:25:38 +0200
Message-ID: <87bjav7ax9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/docker-credential-gcr: needs NPTL
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

>>>>> "yann" == yann morin <yann.morin@orange.com> writes:

Hi Yann,

 > This should also be backported to 2026.02, to fix the following build
 > failure:
 >     https://autobuild.buildroot.org/results/aa5754a547f6dea3165e598f8e22b6cbe3b38f5b/

 > Similarly, the following commits, related to the other docker credential
 > helpers, should also be backported :

 >     882c35f7388a  package/docker-credential-acr-env: needs NPTL
 >     7a7b0522b34c  package/amazon-ecr-credential-helper: needs NPTL

 > Either that, or the 2026.02 branch should no longer be built in the
 > autobuilder is it is no longer maintained...

Indeed, 2026.02.x is now EOL. I fixed the autobuilder config earlier
this week:

commit e1d90c57b65a2b37db8f4aaa0ce3068f1db957b7 (HEAD -> master, origin/master, origin/HEAD)
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Tue Aug 18 23:37:45 2026 +0200

    web/branches: test next instead of 2026.02.x

    Now that 2026.02.x is EOL.

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
