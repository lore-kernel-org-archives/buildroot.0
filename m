Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282B3E73153
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDBF240A6D;
	Mon,  2 Feb 2026 10:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvXP-Sk85qNt; Mon,  2 Feb 2026 10:27:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2377140A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770028035;
	bh=WcLGBPqykpBvq/nyMkH3tU/K3EXLSvx5hzLY2/pgciY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWu3gzHGaI3/Xi7cSMSE0wjtJYdcEboQRLHxIItuMv2UxHJLOy41nERyT3gh9IHSE
	 RvSHdRQSar2m55wlGkswzQ3GdAW6upAEEMWViRS16eaVltSD3/NSPbS/9PzPUAqSSD
	 qOPrgkKF1aRslz1o5ygqydxJCwECsEH7B6uTibIznyf26LPlSbvU104Eg4x7neuIr+
	 dPIORvtq5NLkRHOjA73MerPpbBhzFzA9eLRic7AzdMwjQP58Jtjcnp9omUYWKTFh9C
	 2zvDlwn/LaYc/H320DOdtJV6sHVbZ0cs5Fnfl90w+HnOgtQ9x30HgwxQea8FmeR0CI
	 3Lcoc8kcxF1Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2377140A48;
	Mon,  2 Feb 2026 10:27:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC8A91E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC6DB60667
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waFtMJj8kiLu for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9215605DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9215605DE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9215605DE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 730105380; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 10:27:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmr99-00000005sXs-3B1X;
 Mon, 02 Feb 2026 11:27:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260120204514.21040-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Tue, 20 Jan 2026 21:45:14 +0100")
References: <20260120204514.21040-1-ju.o@free.fr>
Date: Mon, 02 Feb 2026 11:27:07 +0100
Message-ID: <878qdb5tl0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FfGGa8Ttet5VGzV3G3A63ii9lYrpGPnKImW42EyJeT1u3d/y8SK/JEIzzr8FIkzYTlXKkQaJJ9HKX3TDoMO4tJyGS/xSXkuOSdn/287LmVTMWCSl97/5TkVx26Ucyb3naR4+nDYrz7ZdBkWuMvgPY35vdHuHSuGEF1VGEnD38v3MaqX8BD/AphMol/IZ7FRGJ4dUchySfyBg7i7VgqY9USXgH4Qn9gZlbMkogINYpIQQS+MZH+0mwkgW2Y9hL0u/VDTerwmcZifkU5gGKKAtx/zV68RaLHwHXb+yr1u+dmY3TGGSNko7BNMYPCDZHhBIUDi+Llb1aiyi5tc2C6jciQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=9wfZ6eJoKlYD3Tg02UlqZNSIOUk9q/Yfzs43zxJP0Pc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=FfGGa8Tt
Subject: Re: [Buildroot] [PATCH 1/1] package/pv: bump to version 1.10.3
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > For change log since 1.9.0, see:
 > https://codeberg.org/ivarch/pv/src/tag/v1.10.3/docs/NEWS.md

 > Upstream commit [1], included in version 1.9.42, introduced a use
 > of fork(). This commit adds this new dependency.

 > The pgp key ID used to sign the source archive changed. This commit
 > updates the comment in the hash file.

 > [1] https://codeberg.org/ivarch/pv/commit/fb7c05c2629cfa9770b44b7bf71e0faced60b55d

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/12788190798
 > https://gitlab.com/jolivain/buildroot/-/pipelines/2274708990

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
