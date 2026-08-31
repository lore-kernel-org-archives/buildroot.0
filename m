Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5907FC61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 20:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB09280A87;
	Mon, 31 Aug 2026 20:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83R1tD5CBZg3; Mon, 31 Aug 2026 20:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788208672;
	bh=MDcYBVtTN9v7XRwxCRTsePiGdqwzCYkKPa/iPkPy9lI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kwKgrsXmjDCzj4jX+h0MEEtzUzBgONugTccOPvtbaBckXdGKEhn2GvNiCI28dTsC3
	 NmdClamlriNuJQVSipaC2+HKTo0Gbjibag6NhS7btFSe+43spsTN3heB09+zEBA5TL
	 8QDFHUpmDmuvIOXawDOrxhE0cAfa3GuVRaTBF7Bg4JdkA0I7vzF154btBw04P/SoHB
	 IkmM0pgYIwJvKf5H314REeqF15t7vus8t3UF4iU7m5jDf2n0lQBRzM5vNPNoVu9oBP
	 iUBpy/LqryZ5BQFqr3ea339hIc7ITnHiSE2JOneNAxeroPLPIubAcZ3l4cosUi/rxj
	 p+PnpH91811IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1AA380A5A;
	Mon, 31 Aug 2026 20:37:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51DC434D
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38372403B3
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QppNpmsykTsr for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 20:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=mKHTvfIt
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86AD140387
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:37:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=mKHTvfItzBMXRea49TWS0gBhWIJPqRpASx3CpO1j0eMQ1J4Zaup+qQpypJDtDf0o931pGFfac3jKFtXArrV/1aAY1k+bpRtWAgK+mLIMil4HstodiCo8drdO3Kvau0p8G4AfT9hdQbFuDtbzBaTXFHE8jKy/1ke8LA5hBKduLRs6yPPHCZ2XvHzAF/2xFQu3aTtl6HrrqIC3UNRCftyka2RE0iDJE2l5wZWVDLgjP/XOHxANVs1PMyfHg3RWnUePsoeFBZc/W68z9PrBOJ2n9A7wTY7+uUsVkamhgQMV9KF8wdEXan5A6/k3YdnyYWO3JE8kpRFwQTJAiieAeqVxJA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=6hDN6aLIDPWzHzmmlAKlkFA9rLPGBoGfM+sjFJocAOw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 278279148; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 31 Aug 2026 20:37:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x18lD-00000002RWU-3HjL;
 Mon, 31 Aug 2026 22:37:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Andreas Ziegler
 <br025@umbiko.net>
In-Reply-To: <20260828194058.2405217-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Fri, 28 Aug 2026 21:40:56
 +0200")
References: <20260828194058.2405217-1-thomas.petazzoni@bootlin.com>
 <20260828194058.2405217-2-thomas.petazzoni@bootlin.com>
Date: Mon, 31 Aug 2026 22:37:43 +0200
Message-ID: <87qzjegh60.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/2] package/libnfs: fix gnutls support
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

 > In Buildroot commit a035a0f99fa3bbeca776d741bbdeb6c04b3b35c8, libnfs
 > was bumped from 5.0.3 to 6.0.2, and 6.0.2 brought optional gnutls
 > support.

 > Unfortunately, the gnutls support was a bit buggy, as the libnfs
 > library ends up using gnutls symbols without being linked to
 > libgnutls, causing build failures down the road when other packages
 > try to link against libnfs.

 > We backport 3 commits from upstream 6.0.2..7.0.0 to address this
 > issue.

 > Fixes:

 >   https://autobuild.buildroot.net/results/b070248b2bceaceaaed8e826b1247ccfba1ba9fb
 >   https://autobuild.buildroot.net/results/e1461b76121addd8f04f08819b2e3e453a12c679
 >   https://autobuild.buildroot.net/results/87c79193d2ea86f47e36232fe514837ad99c5f30

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
