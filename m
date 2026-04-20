Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A76F588C2
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 12:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8381610F4;
	Mon, 20 Apr 2026 12:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsIuW_XJg7oi; Mon, 20 Apr 2026 12:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8402610E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776687748;
	bh=V1Ys9CxwcRLJO3V1NCisMyQUXHQHhs4xEklWGn6kYos=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p/9SQZidkM7smCxFLL8FXNWS2oTQVZ/dY0DG7Z+USupL03jA/gPXooU2B0+xW0Plr
	 K0VxlwBQUqn4WzE9Xz4+ZIqYoLDNYuOYTEOgcQUsADcFaeX5iVHFeOqUPFpdELMt/h
	 tzdG4rc8XJS5pebeNUbj5q99vhLfLsPArBiXhboacvKGCq8sY56xZmyrKYAzYhfBri
	 J4116R+MQvgV7LRmZGGQuObMdoKa9vNhaOfXvLWaLOzJ66qzRPyFfzkdMybV2vRIG8
	 g9VntzsXwyg6C0gOf9skeI4a15zm9KYrQXla7fFfOzi6D6IcyaylotgQSG08pEsd+f
	 v/u4eD2aD4eIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8402610E7;
	Mon, 20 Apr 2026 12:22:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C29D24D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B64040845
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Is-mVezwc9Oe for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 12:22:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFA6C40142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFA6C40142
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFA6C40142
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:22:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -414704017; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 12:22:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wEndi-0000000AxR2-47sQ;
 Mon, 20 Apr 2026 14:22:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <aeYSHz0oMG2Lx3km@windsurf> (Thomas Petazzoni's message of "Mon, 
 20 Apr 2026 13:48:11 +0200")
References: <69e59cd7.050a0220.1ab584.974e@mx.google.com>
 <aeXymikPfNmmnA67@yd-6wlzhs3> <87fr4qhreo.fsf@dell.be.48ers.dk>
 <aeYSHz0oMG2Lx3km@windsurf>
Date: Mon, 20 Apr 2026 14:22:10 +0200
Message-ID: <87bjfdizyl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Z9EamgZb3BssWoRITsCZ1/h8YD+muvAZGBxFmvxDagytG6xrSJ9V8mNw/VwtkS9G4FlhAwq5SsxaesWx1os4gRNlpIMJMForf0VLjrNUeE6zaAKlA2aVhXc3saxI4qJpLUQOJ2F6hyID+w9BrsLwYpvDKnhcCxQvTggLWAeVIBl8rvKSQq5jrdDAT0nEN32kOvrYtXfgzHreaZ1dv9bUdczsB39sNYvwKVAqFLmQHuB6HsgSlo52R5akAxgAL6sFuAHiLIl8caD+PrvEMfNmKwSP0Zvvnj5z0Cg/+tnDOtcw/vcG548jyiyukPksoJpQsqvomd012TNiKM/Iyvhgog==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=IGDUmomvfzqXW6H89mrxl6t8a8abQEqySbwZccceu38=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Z9EamgZb
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2026-04-19
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
Cc: Romain Naour <romain.naour@smile.fr>, yann.morin@orange.com,
 buildroot <buildroot@buildroot.org>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > We figured this out with Titouan earlier today. The "next" branch was
 > still referenced in the list of branches in
 > buildroot-test/web/branches, and the script takes the "next" branch as
 > the baseline when doing this "outdated packages" check. But since next
 > no longer exists on the main Buildroot Git repo, it was using whatever
 > old next branch was there.

 > Immediate fix: drop next from buildroot-test/web/branches (which is
 > the file telling the autobuilders which branches to test).

Ups, I normally update it but must have forgotten when I released
2026.02. Thanks for fixing it!

I have also replaced 2025.11.x with 2026.02.x so it get monitored and
tested by the autobuilders.


 > Long-term fix: somehow automate this.

Hmm, that does not seem trivial to do.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
