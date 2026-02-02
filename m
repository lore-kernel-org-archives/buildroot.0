Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CF7E73146
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B21607DD;
	Mon,  2 Feb 2026 08:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKBA3YK95iy9; Mon,  2 Feb 2026 08:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B8526079F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770021198;
	bh=BnrQm/M0CLHN5Lcx4Er3bY8hrVBT4dk7DAFTcZtNRrg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LR4/0QSIHgy/v6NchCrEjnWRqdCMEOtAB8vukGr4qugS6nTMylT52sh6N0NaJEWYD
	 oDLP9Ydk+WKONTgP6MQ0xhLA8B3w4DIZ5lLxw/IJNi46NON3w+E4K9kneTbQM3X1CJ
	 6qb7o8Ix+sc9jfibW4it70TdBevGuwWvmoBOto7NH7wgEPTz21o01FN/wEHNr2FwWl
	 9bD9EIsh7HELjmKfIvN/x/GWM51JJP7cMOUV9sQpNmj2IHalXIOY0fv0LpFwtf6xHr
	 9OTMwT0P0LUh99q+EUAcYPpj+TRi+v1aM7AnKiVFvIAnFPZ1HV6T9xWckifIF/PNRq
	 EpUZnTw8BTfbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B8526079F;
	Mon,  2 Feb 2026 08:33:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 099281E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E17FF4018B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aabiVmIpuC51 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C26C04017A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C26C04017A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C26C04017A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:33:15 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -723370456; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 08:33:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmpMu-00000005ojo-2hEM;
 Mon, 02 Feb 2026 09:33:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260126130414.59175-2-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Mon, 26 Jan 2026 14:04:12 +0100")
References: <20260126130414.59175-1-thomas.perale@mind.be>
 <20260126130414.59175-2-thomas.perale@mind.be>
Date: Mon, 02 Feb 2026 09:33:12 +0100
Message-ID: <87h5rz7dfb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=BUqsjataCSjkxL3vEFX60cNP9N3K+KyR7MKBlABNr0Qp+IBn58ZFou3aU8e2vAJxSXQCnNCildu/oVwbOPC883c5OMoU+A8b+K14tjyL+bECgZUdpzl7VfxL+4POLOsWRHM5ovZ6aBGfYy0nCdUvgzedWv/Z5O/pdL3MoSyXZg0yaPgxnSqvJmuO94S/pPWdYjHpKpy47F5cJieRl1bo/Ath5GLrWhv22AtrlJS15X47fqAKQiLbxSO0EH+LZ66txTa/0zn+eRPwkreO/p1/3/172H8SQ/wkAWWO0wP3BEcFT75H4E5AOEggCQ8ydxMk6VcJQoz8l37A0T9bmq/DFg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=cFNgYMvULcm4ShCYd3duLtv3Oz72zuK0ULWuKdr8qhU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=BUqsjata
Subject: Re: [Buildroot] [PATCH v2 2/4] utils/generate-cyclonedx: use direct
 dependencies
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

 > Since the introduction of the `generate-cyclonedx` script in [1] the
 > dependencies were 'recursive'. This means that the dependencies of a
 > package dependency were included.

 > The CycloneDX spec [2] states that only direct dependencies needs to be
 > included.

 > This patch drop the recursive dependencies.

 > [1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to
 > generate CycloneDX-style SBOM
 > [2] https://cyclonedx.org/docs/1.6/json/#dependencies

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
