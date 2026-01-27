Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78861D2FEF9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 22:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC9781E9D;
	Tue, 27 Jan 2026 22:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynwt-oE4zInl; Tue, 27 Jan 2026 22:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54F1681E6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769553455;
	bh=uJQ+eIZ97YBsj3Hi9O0qe2ww/Ro6QRLlmyOjM6WdhF4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKr1FePCFg1KKHDm4Fb50iP3zNqiDFrmtFwFC/MqsJPREioHD5erPI9vZXxrsxDBn
	 zZrZwTrJUVKIJh/IykOGL8/RQ9+oTAkaS7kYbb5ibXaX468Y6pb66b3pU6INfm8tII
	 Rm3Q1PLLxG3zZD37NImVISVSD7nN0vuGkY1ZWjGadAFl5Nfjkks3gQqgbicqPpkHnm
	 QrriolkYdynaWivNLvokdqfCcI03zczQgzBfzo23iZa6f67D5SQrw2Dj4d5I5u/mFH
	 ONlmCfyBGi4pw5VnBo+Jgw6rFPcB1u7Y/TpFf7YZO9ELOQpTNj06g9NIzdqYFzYJZ+
	 ttl8icuDi6IWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54F1681E6B;
	Tue, 27 Jan 2026 22:37:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3090B118
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 22:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 287624097B
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 22:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWgPrTulpSzZ for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 22:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 609AA407C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 609AA407C9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 609AA407C9
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 22:37:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1897761137; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 27 Jan 2026 22:37:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vkrgY-00000003rb9-1Y3j;
 Tue, 27 Jan 2026 23:37:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Chris Packham <judge.packham@gmail.com>
In-Reply-To: <20260125122113.2531851-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 25 Jan 2026 13:21:13 +0100")
References: <20260125122113.2531851-1-bernd@kuhls.net>
Date: Tue, 27 Jan 2026 23:37:22 +0100
Message-ID: <87a4xy1y3h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=svkrON5v260n8/WKeOnlMfdjcrBj6UsJOsazPG+SbDIlHS9ITUV2WpS02Ea+5anDIzKvmN3hNT5xr9D8Nl3XQiomBOosVR4KpeJAZlaHJDGsckOIsI0/XpK2CHEjKL0Dnw8EYebocSwDIgMKhVEpv1MG9gIshv+aRAQ0Ukst1uR9W4ApuSDsPBpqlk7X11fnZNdHCN4HevrkKHuxddjbt/Ayh9FgxLOHgBss6ZKdHG/FuzlrlKJNe91cCy2dw5C1DXM5IjEPu8RQs1FrV/W0uluzMkJI6GW6ae35owpWkqFcm9gu9+dIfEbJQGsmfsPBP2Kd/SGlQaXD3ONK+sv1tw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=3xbgGTCgLGsxvqh+yShe5XZOpkkMcPdBmxGl72oB1z0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=svkrON5v
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: fix non-c++ build
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

 > Buildroot commit 18630db8e822120d0d4b9f37fa7c0d901f55d8e9 bumped the
 > package from 4.7.1 to 4.8.1. Upstream version 4.8.0 includes commit
 > https://github.com/syslog-ng/syslog-ng/commit/163c894563c9f5536c5e91222c9efda64031b08c
 > which causes build errors with non-c++ toolchains:
 > https://github.com/syslog-ng/syslog-ng/issues/5040

 > Fixes:
 > https://autobuild.buildroot.net/results/70c/70ca3364da15383a8270d180cd2bf67977d9cb56/

 > The earliest build error recorded by the autobuilders dates back to
 > 2025-04-23 so a backport should be considered:
 > https://autobuild.buildroot.net/results/dd2/dd2b1dedbd92280dac01ae4d6454ef7eb08cc539/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
