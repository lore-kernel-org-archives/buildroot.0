Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1526BFF887E
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 17:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF04881B36;
	Wed, 29 Apr 2026 17:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEdp8ooTey5W; Wed, 29 Apr 2026 17:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42763810EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777484413;
	bh=pT2KDYh9AiU6cWM93iePMh4LTjS94PlZ1n0ue+l9fws=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkNWTLAI256sxU63E96Q3NBy/4Su+RJQsShZPM0gWlf6Jiy7rRkrGa7DQxximtgDd
	 w5XzasZubPuTCztVE0lt4Og5w2O/9HW5z1UB0uDfObts46wtJdLbU45HWnvftVWy6Y
	 0l/GjZhaPG3sOGVry3Sh3Q4aFrV2dZxb651gMJ7QzbKNnNaCoQVF9Gpaw5ri/wJHGf
	 Qgb+cQj0IxXK+gRjXyC0CgEOhYwRyyNWcDWskmeiCP58CUwTxPvkpOVs7H6mh6oumt
	 HP+PuuDzTO36WBWJ4gyfnft/vAhLK2Kc6kceeiWCIIPaBggRyR3kJGpqtWRXkq7lS+
	 jRRawYhKXP5dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42763810EC;
	Wed, 29 Apr 2026 17:40:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 638BA192
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72742810C6
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3uMdUA_CZBY for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 17:40:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3174F810EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3174F810EC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3174F810EC
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 17:40:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 287986278; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Apr 2026 17:40:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wI8tJ-00000000Ckw-3EWX;
 Wed, 29 Apr 2026 19:40:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Cc: buildroot@busybox.net,  Francois Perrad <francois.perrad@gadz.org>
In-Reply-To: <20260429164108.159388-1-francois.perrad@gadz.org> (Francois
 Perrad via buildroot's message of "Wed, 29 Apr 2026 18:41:07 +0200")
References: <20260429164108.159388-1-francois.perrad@gadz.org>
Date: Wed, 29 Apr 2026 19:40:05 +0200
Message-ID: <87lde5hdhm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KRS25EaIMvUPvsOAIty6kCRXr+Gtnxnrbk0PaeNQLDNN8Pf1dDp4FhijOfpLeftq9k2bR5lb+/tug6yX7uScgOKk0XIS+nT6ft0jMz2JlHAjQCjNPLYMPi6xkx6qANTS2/RNzcKWrZ/E6wYYp6gfQFdmwMjn1n/Dq22qjdIJOTsmDdy93rorl2BneoJNcXcmf4qIX/Xv80p5FU4MG8oZIW01u87+LC7E1p0Y7NAOPF4KRsjHLJOP6MYB0lhx8IUbJHF0P/x1lo/4bRK2PAOGw2iUT++Me197EXbporfgpWCjHfQRZAoxfTWrjuutjNCv/X9M88WsF5Cb3w1oznovIA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=p/q+bCiyQGaruu9jDiRkC2icDKzJMVTI77YAiQaJ3E4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=KRS25EaI
Subject: Re: [Buildroot] [PATCH] package/libpcap: security bump to version
 1.10.6
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

>>>>> "Francois" == Francois Perrad via buildroot <buildroot@buildroot.org> writes:

 > fix CVE-2025-11961: Fix OOBR and OOBW in pcap_ether_aton()
 > For change log, see:
 > https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.6/CHANGES

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
