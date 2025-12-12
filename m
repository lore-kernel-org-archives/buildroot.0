Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC72D4336E
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 06:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D378268B;
	Fri, 12 Dec 2025 06:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMcDguHIDBtx; Fri, 12 Dec 2025 06:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A22D28264C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765522730;
	bh=VFM6gYRAOVyB2Y25ayqTt/VAje7+lUTQ/TsrI7145io=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XbxS40xEBvr9fDZ6lIfpW8YOXbKwaS/5lFHXmXtteyw6Q5RQ29b8stPMpcDj6F58c
	 VJ4ge9viVKwxBNflWN5Mp6i1K+SKsIFLX3NH9inpjZRlw55nUccwiHogQe/pgo7Odr
	 92ukZMA3xDXnQ+V1UcjNAOOXLzMBZJeuZEFSA4qlukUVYDkRCtr7aHUMw1jCEcwlg8
	 Ru6uO/6N2tu0BkD81+L8PPMG8Yop346v8kapUe6h3bJYPmQk9XjwQ1zIswSO8NvTho
	 Pezwz1BKaBSuqLJ/+HPV5kTAY5O1pK2AKS3SXQGbf0qbaYpI2LyHpigvaBKjbxvSOA
	 rCSb8c9ryCrEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A22D28264C;
	Fri, 12 Dec 2025 06:58:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 308172C6
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 06:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D4EA401C2
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 06:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC6QTSJLQ8bv for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 06:58:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33EEE40154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33EEE40154
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33EEE40154
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 06:58:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2121332855; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Dec 2025 06:58:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vTx6p-00000001S7B-1p7W;
 Fri, 12 Dec 2025 07:58:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Trammell Hudson via buildroot <buildroot@buildroot.org>,
 titouan.christophe@mind.be
Cc: Trammell Hudson <hudson@trmm.net>
In-Reply-To: <aP0Xq3WctC6mB2fF@hachi.swcp.com> (Trammell Hudson via
 buildroot's message of "Sat, 25 Oct 2025 12:32:11 -0600")
References: <aP0Xq3WctC6mB2fF@hachi.swcp.com>
Date: Fri, 12 Dec 2025 07:58:35 +0100
Message-ID: <874ipw2nl0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UDGS+CCVAtx/OLdcwjvSCmfsbpIJsQ+wmcjRBcY4KGYigfauUc3FMKHkH/6zyPjCBw+C3mLKbcozUIlEFDxvbwHmi/bZQH7G1RqTzI9gkmUQ+tgQtbzGIoy+ZgO3tvO2fX3XC0w2QfNWyUzdm1E+0fyR+EL9E2OfZ6fX6IFEp0cQmggrdJzy71K1llXdvtO2GtbBIYKNUU2vg7qBXPU7DxSJR3+xCD4IEBw9Fnj8XQOa+FJgRx3+Mei/BC7C+40dvLyCyIIYnr9rXbrpoH+YbwSl28LONpzprNsMD3ZAG86KB/8TCHlKIBOwc1CBV1AB2nlZpK/n49TxA/BdWssMfQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=GrR4/40V/26j6k0YqFOte2aEmAJziQqX8leCYPexzU0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UDGS+CCV
Subject: Re: [Buildroot] package/mosquitto patch problem with gmake < 4.3
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

>>>>> "Trammell" == Trammell Hudson via buildroot <buildroot@buildroot.org> writes:
Hi,

Sorry for the slow response.

 > It looks like the -lanl test was solved in the upstream mosquitto without
 > including any headers, so their upcoming 2.1.0 version does not cause
 > the problem with older gmake:

 > https://github.com/eclipse-mosquitto/mosquitto/commit/9be6f9a409585b579efa4002c7a5da26ae6a996a#diff-02ffa64880a3e0c0e7d284d6e86512af1c93edff5c9fb91d2112a54a1f5bd8d4

Ahh yes, as explained in the pull request there is an implementation of
that in the fixes branch that we should just cherry pick and replace
this patch:

https://github.com/eclipse-mosquitto/mosquitto/pull/3358

Care to give that a test and send a patch doing that to the Buildroot
list?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
