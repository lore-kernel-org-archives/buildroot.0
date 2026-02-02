Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3E8E7DEF7
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098EE60640;
	Mon,  2 Feb 2026 16:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NC4PIWZQGitP; Mon,  2 Feb 2026 16:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D3360BBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770050090;
	bh=+qJHdEsbffDRzT1uqntVtLroojrZAFbBpRXBEdQAnpE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dpbTuyPFcmlt+ijB+xEBUcDqcORWb062DwZihIM3iSI6uOn7ApBBa92pSs8BJOu81
	 Ypt69UtkWVrnfkdhyoe4wsqHAsqFzPZ+3Je7CpF/Zf3+61p+9BkP33XB/ZK6NVywLu
	 w77y8GhAdyhEFUV5RPtWpVjy/wSJ3sNeuIxXo1xYL7Lk70bDKNnGori83f5FyuLJee
	 TMgonOXE3g/u7PZazq8gFvZnDgH7DhaUH7GnM9OT5uI3Q37GBEhOti2wIMvQWsMNz3
	 j+rWunsceeoPXsCVkSfdM6ZCU9F+GDjsX6LZW6gfyY9la9jk5VChe/EkMSRgzo47mH
	 mkK8j9woaaeZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D3360BBD;
	Mon,  2 Feb 2026 16:34:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECE0B149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE0C7812B6
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HaFH_RCM9ys1 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5F82812D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5F82812D8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5F82812D8
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:34:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 56323831;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 16:34:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmwsp-00000007EWW-2oRo;
 Mon, 02 Feb 2026 17:34:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260104131718.1613605-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 4 Jan 2026 14:17:17 +0100")
References: <20260104131718.1613605-1-bernd@kuhls.net>
 <20260104131718.1613605-2-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 17:34:39 +0100
Message-ID: <87zf5ryuhs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EJ4Vs7U/DjEy6SRGtu6rj4rrIf7+k2ZC/WHjM0k3Xf7zwdfIgVjahHxYriOwFvUxbnB1FopnEzBRzxE77iQ+mkFr19T49TVdrgevwQm1eGZ3c8RxVk3D4WNOYAJkDcRnguBQ3p638oWKC675YfMlvAaRBO1yVbJU3n1I6EpAClMQQf3r6/2S3LICuKn4X4SaCfHrpgi6PEepc+QjC8Hb54iYOO3gq7M/+izeh5XJZs9jOqd+3FfjP+K+wh1XHZX5+hYvt+aMcuhCbkS+u0udImY1iWJBffQIJWmHWToYXszQpYhpChYZGJMNK2SD10rxIbXwgSNr5uLy6Tc9O0E12g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=vqghe6HlgYvUvwkPtLqFZZ009YEEJgBTZ9AyH0Y+uN0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=EJ4Vs7U/
Subject: Re: [Buildroot] [PATCH 2/2] package/zeek: add various fixes for gcc
 >= 13.x
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

 > Fixes:
 > https://autobuild.buildroot.net/results/906/9061a358d5b37d7674fe5498686cecefda6cf51e/

 > The build error

 >   ripemd_160.hpp:52:23: error: 'uint8_t' was not declared in this scope

 > which is fixed by patch 0002, afaics, first occured on 2024-04-04:
 > https://autobuild.buildroot.net/results/7ff/7ff3d6a09bd4911ff78e01c14f2bfb7da3d43d60/
 > so a backport should be considered.

 > After fixing the build error other build errors occured which are fixed
 > by backporting various upstream commits.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
