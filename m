Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5285C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 20:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D0EF41145;
	Wed,  1 Jul 2026 20:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2yo93_VcQpX; Wed,  1 Jul 2026 20:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C641B411E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782936733;
	bh=ANKiaPp2sSRiZmO8/S23HwiSBl1ANs5FJzQ5naRCoWI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UBarn/6Bq/e9NWScNQEDdH7WDbG5ffVwReV6N2nkMj2YThyjm5oc3fDk7GMIRcTtW
	 e/sDsTsLEr5QRZCTEP4UiPjFV/Hb9AqTZf6j+8UZFS3W4VBuA4Akumj78HAqHRZFUT
	 OIL9orWqDrpBA9j1zbkWCJsHpbpi1NtlzHW+PWX9PpSuv43l95Mre8ndNHMvS7Oyrv
	 nZMbJmBTKQWeLh65z9ec+iuj5nQVd6/Vj/VcNimYwPaV4Y3jMm0yOpbdJpkaAA2PVw
	 FF3E2uKT7BdA2Fjt174Pbz6GgzKDQ1OYx1hGgLaVHVyMBuo/PdwF3EvmYOyiYmq446
	 kVu+fsfdFxX8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C641B411E8;
	Wed,  1 Jul 2026 20:12:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6231316
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC47182BBA
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwlNfsa5Y7pW for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 20:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A144C824E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A144C824E2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A144C824E2
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:12:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1938075988; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 20:12:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wf1Hy-000000033Dh-0ehX;
 Wed, 01 Jul 2026 22:12:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260624184746.1062142-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 24 Jun 2026 20:47:46 +0200")
References: <20260624184746.1062142-1-bernd@kuhls.net>
 <20260624184746.1062142-2-bernd@kuhls.net>
Date: Wed, 01 Jul 2026 22:12:06 +0200
Message-ID: <87ik6ypizt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=S+a196oo5Y4FA4NDn/ICbLR03Kc4Vw3aNAdlbaldy9OJwh+pcibQoqHSgKIhXZl9SsCrE7vDOWlIaEnGFZGgFGzbm74xGkbX+qRDkLNpUDTkiNsn98Fy2T3+XmYjJRTW2jpV8yUFtz2Xtq6b6N5RAbxeIWraODmPqWae9F1H37dwpO8z2sV2iGqhx7/Y43dP3rnejF0ATLIjoJDGbaotoGhWNkXBoz1nEW/Jh7S2OvenPKrZLCQtlv3/pF2HL/Vsz+i0NWQMhi+nTmLydN2dFTgNWtf1zIYQpkOuV2/rqjtU6bzN8vWcEUBVdTq2u4FCCByCzQD0PNaKNOfJJGdD4A==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=KxQauoW6GpDHa3sYucs+krugLolc6VG4CQCBaw2+O4E=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=S+a196oo
Subject: Re: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: bump version
 to 26.2.3
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

 > https://github.com/intel/vpl-gpu-rt/releases/tag/intel-onevpl-26.2.3
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Series passed Gitlab pipeline:
 > https://gitlab.com/bkuhls/buildroot/-/commits/f3c6f26dcce9d0f92511575ab5642189311fcd57

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
