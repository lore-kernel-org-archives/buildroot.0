Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFF9CCD18E
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 06:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D9961509;
	Wed, 15 Oct 2025 06:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrVHiOFoR1kD; Wed, 15 Oct 2025 06:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 691AD61512
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 691AD61512;
	Wed, 15 Oct 2025 06:52:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4894B4C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 06:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A39A83F4D
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 06:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAU70JXebRJF for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 06:52:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3992D83F4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3992D83F4A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3992D83F4A
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 06:52:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -810400537; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Oct 2025 06:52:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8vNK-003VuE-1E;
 Wed, 15 Oct 2025 08:52:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
 <20251014185113.3583315-11-bernd@kuhls.net>
Date: Wed, 15 Oct 2025 08:52:42 +0200
In-Reply-To: <20251014185113.3583315-11-bernd@kuhls.net> (Bernd Kuhls's
 message of "Tue, 14 Oct 2025 20:51:10 +0200")
Message-ID: <87wm4wu05h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EbR7VnApmGBDTNMLLI65x7+rcYTTIMg1WybJrpsqt3n4R0Zx9MgEOSfxOI4I/3F27DTuZwA7QkmnZRMVWXeVJTa152by5kUaK0Fjo99A7ot70LmDy/ia+j6SZO9CrNNbSbpfYmkqG9ScxQvNlSngPoHYy4rgh8diOTeiyyl+uunIiKdXTu0V6BHFao2vOF7amb5FjtzmdXIqu/7gp0RiPfeI010Q4vkKl4oz6p4ibAsL3kw+rnzPDBex0AA82KFEzRZBbgLyHqCrm2aw1I3RwA4PgzfDHzIBDrM/cyagxjE5pkzPRibl0sDPt5BBoNGf4pfGPSVZTcBSCm961Vtm6w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=mvbMtCqNHwxxusACPm50zm2Y1vhN+6n3E4d3RH6t1L0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=EbR7VnAp
Subject: Re: [Buildroot] [PATCH 11/14] package/python-zipstream-ng: bump
 version to 1.9.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
