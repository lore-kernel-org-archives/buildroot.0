Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B74FFD8FCF
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0D2580E59;
	Thu, 26 Feb 2026 15:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxKSXMbp54vD; Thu, 26 Feb 2026 15:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A40780F02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772120812;
	bh=GG55/L7ku0fzcN+Y9rFEayJEUzricDihmqbVSu2Ed9Q=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VC+iZUdbfviPPfF6FROUikDGma+5bJWrWHCVUNqqtiFHjr7fVg+4m0mcr0B3KX5Xb
	 JiIj82+sTxpHzIv7y3Cz91c0gNy0wyKW+mUiLYgq36bWS+uTr9epQCIjXapV1/CtYT
	 RNVDfiax4YEa3+UnQ9ioZZpO0C4A+YRl1MoZvSYxB8s56CnuoNo728aP4iUDFEiEmB
	 9F+xWlPPATpwlAec5OrHrNO+hfndgiKveqMHAwlhSqjf3gbR0tLY45SLUfRo3BHRr4
	 YaiSBoWBlw1VK1c9K/yscApplN4NPe5P51NyxSwlDVsQl9/0hdQ2DtAOq1v/ogaL3a
	 Mjz7vM8K9Cgqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A40780F02;
	Thu, 26 Feb 2026 15:46:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93E1E24E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 857D340784
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPrUdIvFVt4Z for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:46:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BA5F404CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BA5F404CF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BA5F404CF
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:46:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1670037939; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 26 Feb 2026 15:46:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vvdZe-00000005vhI-3dnl;
 Thu, 26 Feb 2026 16:46:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Angelo Compagnucci
 <angelo.compagnucci@gmail.com>,  Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260226084454.59339-1-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Thu, 26 Feb 2026 09:44:54 +0100")
References: <20260226084454.59339-1-thomas.perale@mind.be>
Date: Thu, 26 Feb 2026 16:46:46 +0100
Message-ID: <87a4wvqzh5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KU4xkzYzfz+xowhYOGmF3+JoVxWbifuq3+iucDg7DMS6n8kb6yfvd/RlrRvAVj7a1ZkIso4D5iGSGDGIP9JQ8opRrI97pdG7S4MZwRB+MntCnb4YS1TVAwN7Qkx2brFET2Z7tsc6L3PP3/3Kf1cnjzepa7oWO0uSGsb9GWvHfhKVWVaNvEav6CGkrteMdACWXVww7K2WLRdESXPyXPakKaRwNexU0bb8iqegP6LBG8dCsAbWMWtA0FMm0KjfhgRuaHkS5PWagGo3fSBnvE3YcZbH5mCcekms3duDi51VF9sVkJgK9dr4b7d7pO5NZg1ml2etdZ3VQDQE+lid81y5MA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=gV9ptwsm23QxBsylApjZ2qzgKp2g1Fz2UFyf291qElQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=KU4xkzYz
Subject: Re: [Buildroot] [PATCH] package/cups: security bump to v2.4.16
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > For more information on the version bump, see:
 >   - https://github.com/OpenPrinting/cups/blob/v2.4.16/CHANGES.md
 >   - https://github.com/OpenPrinting/cups/releases/tag/v2.4.16
 >   - https://github.com/OpenPrinting/cups/releases/tag/v2.4.15

 > Fixes the following vulnerabilities:

 > - CVE-2025-58436:
 >     OpenPrinting CUPS is an open source printing system for Linux and
 >     other Unix-like operating systems. Prior to version 2.4.15, a client
 >     that connects to cupsd but sends slow messages, e.g. only one byte per
 >     second, delays cupsd as a whole, such that it becomes unusable by
 >     other clients.

 > For more information, see
 >   - https://www.cve.org/CVERecord?id=CVE-2025-58436
 >   - https://github.com/OpenPrinting/cups/commit/40008d76a001babbb9beb9d9d74b01a86fb6ddb4

 > - CVE-2025-61915:
 >     OpenPrinting CUPS is an open source printing system for Linux and
 >     other Unix-like operating systems. Prior to version 2.4.15, a user in
 >     the lpadmin group can use the cups web ui to change the config and
 >     insert a malicious line. Then the cupsd process which runs as root
 >     will parse the new config and cause an out-of-bound write.

 > For more information, see
 >   - https://www.cve.org/CVERecord?id=CVE-2025-61915
 >   - https://github.com/OpenPrinting/cups/commit/db8d560262c22a21ee1e55dfd62fa98d9359bcb0

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
