Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5396ACD6E56
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 20:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B64E142305;
	Sun, 31 May 2026 20:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9o2h1nHiHEQ; Sun, 31 May 2026 20:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C852420E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780261082;
	bh=XxRfSP5g82PVLoI4sANCXQ9Y4utwfIf6/2nxcr5SmJA=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sgruCRJ/dUAp25jAyv9jiMRE3QC/XnVNa02gRV7tsutWvXF1RPV4VHrxpXk4wZTUc
	 OZJP6nZq7B5OMlRr2UNiWrOrupaRgG6EQ9UGgWrnHdgQCKKO+7/eUuiDx70h68cQ/S
	 lo3q2O4bgqSJ35unv/lWutaCa1Xpaxl2wnLOcvDQuMC7zo6MD3vE5K8BhIZjzc01I7
	 rsMTnQvH8tPU6vjijlhpbMJGGdt10ZsTqMJYdqJrzSF2FE3cNDRdYU2rc8enJsT44o
	 sdquLVyq19iLrKkqgeoKA6xbLAJxx8id9L5ARpj/UN9YSRHfsj4fk8yfbQebHqPiSW
	 kCTU+PwpXUCeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C852420E5;
	Sun, 31 May 2026 20:58:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E036257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 20:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01F22420E8
 for <buildroot@buildroot.org>; Sun, 31 May 2026 20:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiFz5WFJcDnS for <buildroot@buildroot.org>;
 Sun, 31 May 2026 20:57:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23CAB420E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23CAB420E5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23CAB420E5
 for <buildroot@buildroot.org>; Sun, 31 May 2026 20:57:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1672722329; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 31 May 2026 20:57:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wTnEG-00000006nIA-170F;
 Sun, 31 May 2026 22:57:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Mohammad Sharifat <sharifatm904@gmail.com>, buildroot@buildroot.org
In-Reply-To: <CA+sxNS3xTJMWVSEStFTmUfCBQ_QFH62DqoKx9pkQAsga-V5eow@mail.gmail.com>
 (Mohammad Sharifat's message of "Sun, 31 May 2026 17:06:56 +0330")
References: <CA+sxNS3xTJMWVSEStFTmUfCBQ_QFH62DqoKx9pkQAsga-V5eow@mail.gmail.com>
Date: Sun, 31 May 2026 22:57:52 +0200
Message-ID: <87bjdve1pr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=P8FFrRvsQZ8SPxg0K8GOY+/xsNxfPfa7+6WYF6UpmIEUTt58DJIT7Gy9naPUPArfq3pAfO1JxOCu1fAKwrwB+kI4eZFvKf5hJynXA8vHGGI2b+7IQIZsFf5sUv67coOsPMG44ZQM2PBQ5eyQiGQci0BatV8HhOnvI8uFhkIsC1/fF2AJ0LRhR7Q/9ZyErbw8bdamH8Rh8Tr7jNwJfABzp4lIZXvxTzi0Phj267s7iXgcUNcoJpWohYkbXy/0D8Ho6KDBaAnnzVVF7lWRfQdn8/Vn5nISWXpWKx+hSuBWthaYdr7Z9hEPA6ErCG85/WRArjE5ERUq6s/ZbpPLimS5PA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=+nz7PHwBNAF4zZMf8JWRfTkOZ85a3IrrxNXMZc94qSE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=P8FFrRvs
Subject: Re: [Buildroot] Please bump the WireGuard buildroot package
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

>>>>> "Mohammad" == Mohammad Sharifat <sharifatm904@gmail.com> writes:

 > Hey,
 > As a user of your WireGuard buildroot package, I thought I'd let you know
 > that wireguard-tools version 1.0.20260223 has been released. Could you bump
 > your package?

Ehh, this was bumped back in March with:

commit ef12f5bb2c79a533e978cbaaf911b5ba96e97439
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Fri Mar 20 07:53:29 2026 +0100

    package/wireguard-tools: bump version to 1.0.20260223

    For details, see the announcement:
    https://lists.zx2c4.com/pipermail/wireguard/2026-February/009514.html

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
    Signed-off-by: Julien Olivain <ju.o@free.fr>

Please use 2026.05-rcX or wait a few days for the final 2026.05 release.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
