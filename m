Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A9C53219
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 13:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBB1409FA;
	Tue, 28 Jul 2026 13:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdxKKZB-JxXv; Tue, 28 Jul 2026 13:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7101D4098C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785247075;
	bh=BW8EeUzAwRdCydwH8D28IvEJ/qUK6q9VPNGnXPi/DvM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U24JvH03vxgHfw0boHDLtOWJ+6rbFmeIfxqj8ceMgCmgLftu69iW8llTa8vvbKWaM
	 tpFeUVAVYs5z3fg0/fSZxf3CSNnZLTenV9enMQ0MB2r8EWOBcy649Z1Au/9Xm6DbGg
	 nBnWJcvfZ2NFFJNGblD/gqfA5104XRvvJleRTaXKpJ2nx+k91axRHVciAXmiBLRnPc
	 PINRjYGBH7XI+AxCDYlLuYA/H0e/V3ZO/+P/ACke/enCHM9cNzirACr6sbaODkSiwx
	 fqeVgm2uWTntqgXqWk5eaEZa4Uyob3w2JutHvTp4lU3CNQOca62+DsKmRQxuQDi2g7
	 5AvYyn23fkRMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7101D4098C;
	Tue, 28 Jul 2026 13:57:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9262E788
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7827C813A6
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n92w-KMUdQBk for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 13:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7102C81231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7102C81231
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7102C81231
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 13:57:52 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 697019368; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Jul 2026 13:57:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1woiJY-00000000F8g-0uTV;
 Tue, 28 Jul 2026 15:57:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260727181311.90940-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 27 Jul 2026 20:13:11 +0200")
References: <20260727181311.90940-1-bernd@kuhls.net>
Date: Tue, 28 Jul 2026 15:57:48 +0200
Message-ID: <87o6frqkrn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=lWES7hoMSCDQuLpb7dmMGhADQFLUW+xZKPolVMvLA3w1Kb9E+fjZyUjHkmgfA9VcHP0bu0cFXVnatdw9VAnpX65P65jNWb5B2Wbrh20jT4ULfQQgpX249JH2njszSyDniJffJZ84iu/wtOQIS6VVsouEckcEh54j93LP18g29YJS8iLDiMz0ocH9M9KuZGYXx2G4GSdMaQ9BQKeA96vg931igS+ez7KWWHHhcGZMdPI5yFe8MtfGxJWY8vuun6hk9iAJqOD3TSnZA2TNqn41QykDwd1kli+ar3TclYjn0hB4ED69pXQtJenLLFGZS2ZnwOrEeJl2CdSCYDjoo+lyww==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=vc52xgePV2aILbSqQkbFO2A4N7Bje4B5JmjswmfqSiU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=lWES7hoM
Subject: Re: [Buildroot] [PATCH 1/1] package/pango: bump version to 1.58.0
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

 > https://download.gnome.org/sources/pango/1.57/pango-1.57.0.news
 > https://download.gnome.org/sources/pango/1.57/pango-1.57.1.news
 > https://download.gnome.org/sources/pango/1.58/pango-1.58.0.news

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
