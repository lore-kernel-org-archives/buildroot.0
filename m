Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05519CD8CAD
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 21:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC0146F9AB;
	Tue,  9 Jun 2026 21:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBogLo8f_pkA; Tue,  9 Jun 2026 21:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 489AD6F9A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781039573;
	bh=eZPjHZSXPd67aaKEsrj/sR857+xUTAsWPPG0RblY6fI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hyQtrxFhJVjd499rOuheAMflGXlJL8TPRDDfa8l2I3HT6zDLBm6pItKkmbDofc02n
	 xmMK/cwpNxMla49YD4DpeMZCVbhebe3Nn9vxVnbxfxlXEbKFaR5fnHgXzcnBhDLMcU
	 Hl66RLgO44jf6i6KO9NIlBTC2E2U9R4dQqzshulV+DBsGf0jEBHxzW7cyX7G8qIc7e
	 CScuaEt1ywwe2tgFaBISZoZB20Zm37c9NobjtcUwH0K/V/JHDnaltRMCMYlC5MAJKL
	 bTQXdd/O/2SmRjzvsRR9AH0xaHHVouCMREr+l6zSwdeLoMUK2wHDgOAKsWH/wH1zQz
	 w3/xxUSml44VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 489AD6F9A5;
	Tue,  9 Jun 2026 21:12:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0321225F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00C8A85C63
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMtPJmRa1OMr for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 21:12:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34D1E85C60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34D1E85C60
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34D1E85C60
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:12:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D4F6819F5BE;
 Tue,  9 Jun 2026 23:12:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Jun 2026 23:12:45 +0200
MIME-Version: 1.0
Date: Tue, 09 Jun 2026 23:12:45 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260609150410.2888215-1-peter@korsgaard.com>
References: <20260609150410.2888215-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <9b020e6ea97f0d1704f1cb239aae624a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781039568;
 bh=XTiXXCDQmODRiBNbdxDmLU4WS7jNpdS1ZWO6xbaaX2U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gpLrzVNlOE4ctL0C8EJ55yjhn/5srTLpQUf2aJ6d4F8HD2sPAgWBwl9YY6FenenOQ
 anhPn0/VVJEZFrprHSFo5BLEGc8E9wdYmSSY1WKKv/kZtF2qYyTbAL9qEeQKq6rXfo
 wRb8UaWHoAR65AvF+6K4W/cfsH/Z7/9v7/P6I8LMLI7FNWpOT1qbcUhwUP9zFNnUZX
 lTK0B19eXDHmQ7mWoUN7V9ZOX5NnThDHR+m/tRpI/ScLSWjNpi12/T5Plg5cep0bTv
 aw5B7hsnJy6bbs8u/W2usC+yWLKGTjOTRb6NQuRJe61e49gsKnQqr3CDXBQg5Yh6+o
 cUSQ99YcZWj0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gpLrzVNl
Subject: Re: [Buildroot] [PATCH] package/rsync: bump version to 3.4.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/06/2026 17:04, Peter Korsgaard wrote:
> Bugfix release containing a number of fixes for regressions introduced 
> in
> the 3.4.3 release.
> 
> For details, see:
> https://download.samba.org/pub/rsync/NEWS#3.4.4
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
