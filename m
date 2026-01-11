Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C416DD2502D
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9628D8126D;
	Sun, 11 Jan 2026 17:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swCGOAO7ypEM; Sun, 11 Jan 2026 17:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06C85810A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152194;
	bh=CYUXe5W6H5ty1uM4/lbwiArJxH6v/ZhaD8r4aMOpONk=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kETyekfdaMxQVgNCE0YNIrVFogXqqBi7NI9uBMf7nv1skCy7ooCbr0TS7NGm6wY8G
	 f9wI/Ioj3Ynuz+rxHACqBE6I1z9D7uloDCMXLo49Tc612ds0cAk44pyQ4D133lYfuJ
	 VmImDbung+20nWSfCmCKsVsQ39A0HqFgMDbWwCOjUWVKIfFH0RoL3MLM7Vz2GH+Rch
	 6YlstIwWqWtbZAvI42iHJ61D6xseXtKrdSpP2DcyCRUMg0EJAMWEfDsk5ki7tCLK/g
	 55N+fa73need+FewP3GTuaZnInYX4nGdYNA2BE21HGp5DEOb35LigFXmQM7WqqkoE7
	 L3NMl7Z1tRLoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C85810A2;
	Sun, 11 Jan 2026 17:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD4E18D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D4876085B
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QeCErMts-Dv for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C16660781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C16660781
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C16660781
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:23:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 524055004; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Jan 2026 17:23:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vez9e-00000006srT-3ZeP;
 Sun, 11 Jan 2026 18:23:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260110180807.2254994-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 10 Jan 2026 19:08:07 +0100")
References: <20260110180807.2254994-1-bernd@kuhls.net>
Date: Sun, 11 Jan 2026 18:23:06 +0100
Message-ID: <87jyxoysg5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EJBlHq7mRMw9h3w48P4NTQdPXvjLadKAXDrlZB1rTHIpP1/4nH87CyArn8a++xCvRbmOgNTyMOmQFdHmK9PAE6d4Rnn9RjxyEX4bTXLP6IWxsYxkN2OgDzI/GzW+v3O4DFlij28R1ebkJLh9eII/n5/bWKvJgIPBFpuIpCX6trIAR7ZBusOdMg0na6vusU/c8bbFv6ydqdHUDg98SxoxLbFsc38ScLuPOii+40rxmKJ6G9qVubCRrGFoRXJ+XypZmzfuJFRSxmr1eG+dVHcLJA2X0oGBl9NkGd/VmAsgjTuLLFPDAsU84LzV4mMFSio/iEEP4eyjhdh6jhBaKzd+6w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=24e2B339Q2g6DtaeecGhSXzeivRubu526lUUvP2pQh8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=EJBlHq7m
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.403
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

 > https://github.com/vcrhonek/hwdata/releases/tag/v0.403
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
