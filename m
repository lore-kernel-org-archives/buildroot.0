Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE49BC53216
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 06:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2613883CBE;
	Fri, 20 Feb 2026 06:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuvtaqQ3m1Go; Fri, 20 Feb 2026 06:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8992383B63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771570427;
	bh=y8R1mOKvwxeFgazQ2lc+lAd7vwGrS+pgFEtJOziOjSY=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L9v69ryd1AzZ927iWo8Gzggbq0hwXbB7qHswtwj+EKptTfAvjAzOQJKwgF4AUcHO1
	 yZPIsf+s6YkC7oqQJfXmXU3S8mJQO1AtKc0uEWuZmCt0Ao1dUxXh5gX/QwKLlcgk/T
	 n+o2vL7qu6OGI63x0q/CHW+plWNLy0u7bJkFe3Id/vVZnkBPa5tByaxcg79hXER4cJ
	 B+UBUGINZLeCLvDCdXQO/CGrRmz3PO6qfpnQJEgFEI25vb0yp/jVJLf0cCGisfD7er
	 Lj61mS/3+I0iN4PR/Kx//Rog26J1Q+7ZGRrMRCdvIYzDPjEjIQ7k27Q68+Nf6zx+4e
	 A11SF9MVesBIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8992383B63;
	Fri, 20 Feb 2026 06:53:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FF991CE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D798400CB
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBirI_q9kZTj for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 06:53:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 439A340052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 439A340052
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 439A340052
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 06:53:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1541918044; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Feb 2026 06:53:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vtKOT-0000000Emul-1bPF;
 Fri, 20 Feb 2026 07:53:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  Norbert Lange
 <nolange79@gmail.com>,  Sen Hastings <sen@hastings.org>
In-Reply-To: <20260219093348.2147559-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Thu, 19 Feb 2026 10:33:47 +0100")
References: <20260219093348.2147559-1-buildroot@bubu1.eu>
Date: Fri, 20 Feb 2026 07:53:41 +0100
Message-ID: <87zf53hpmy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=G/6lvPdbDTdisSX4E+mlrRZ7SF7jdFfhNr9PGl2/wULiU4vdcc5qYwmiBhO38lywOllHE/UF3thUJovw/MDS67MK6TvzbB1QEDXQ1hDAAnf3nLz1f234SrbBy2bZrpJS0GjqytP1AeAytK9Qqsjk3947jGhNfgRa7cNf/G6ZWlexQrQoZ0r12+yX43ln35QKiM/M9hmFdrbdsexXsLIi+dgHuZsFKz5QFlVCzi6h3dMmA1USBzWGiIHwaT9HG27OxVQEVml9NuewERPHAwLYaUiGdTwkf8Aghoofcb5p7MUeoZliE5qxE9FBNWODcD56QFZrZFdWL4Y29qGE5Difaw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=V9NXrdAk8TVW6rQCFpUoxhUp20J8xiFj/yni0FYvaxc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=G/6lvPdb
Subject: Re: [Buildroot] [PATCH] package/systemd: bump to 258.4
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Changes: https://github.com/systemd/systemd/compare/v258.3...v258.4
 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
