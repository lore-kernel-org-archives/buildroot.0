Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EBDCD6E6B
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C1CA427A4;
	Wed,  3 Jun 2026 18:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAvqnw0_oyjo; Wed,  3 Jun 2026 18:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80FDB427CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512579;
	bh=/LuNi2f53jecGQP2GD5xViH2EItwHzodi+32nFdGawA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OR2xNxCVf6ng4gqJAINAPQ1BEPYeUhMWG950iMbIDX4tySy9+ie26nKS/mwxMGmcG
	 d6Z7RYOK2BncEPLF641JKZ9FhzNwKTz2Phe24scBQddKp6gkxRPUN9amNjhUj85thz
	 l7+cClnIj0ZJYnQZuHZQfPdIepdYg38sQVzcdnheiOLnyYRpcy+BEE8untugzV0mXb
	 zmLhsU3f6UfbLYk4CM2uf3i5PCUzg4Sl8WTWSZFWUxoULOBjXIbDAP0WwmW088/zWh
	 DY3nmiw/sDBYz3ltnFkI3N9D2qQJUlw3uk0tG8Mk5/sWzveREt/nNckrcEo5m9NvvS
	 MvUW4cLVB+tQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80FDB427CB;
	Wed,  3 Jun 2026 18:49:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE1D192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEB5360C01
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGL_NUCfDIGg for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF4576157F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF4576157F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF4576157F
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 238321252; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 18:49:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUqeh-0000000Cfnu-1VKa;
 Wed, 03 Jun 2026 20:49:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260602133156.13676-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Tue, 2 Jun 2026 15:29:15 +0200")
References: <20260602133156.13676-1-nicolas.cavallari@green-communications.fr>
Date: Wed, 03 Jun 2026 20:49:31 +0200
Message-ID: <877bofo3wk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QEpqun19myC7S3J9xlhJIqVLTB0Esq7ZRrTAVo0tXMaEt3XTkDN+/dbcFcsNeQoeA/ljXnmpad9Pq46dcDEp9CGsBdQpDndpBDiqhrgavel0OxdfgShDCKPGDEMbRq7xXlv17Z05pUrVn72wYqYrgChceTjCKJiykV5YFbnrrrIhYtzdYqDQuPERPEV/JnMynfzDdg6DmfXT3uxgVZlfTQVaDOgIqVFDEC+9g/0FYSla4P1bo8gpzYA1yXFzS3PS9wVEfkiBSAnkT47rit00biYbdzTo3DbXMgP92V0qjSvjzF2WZqWDBK9XTkNa9BZMbF2CAJei16YDPJ2+2bTYrA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=4X75P9sickS4JLGWlaL2Yeq7xEC5F/nhMFRrrZkP+8w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=QEpqun19
Subject: Re: [Buildroot] [PATCH next 1/1] package/libgit2: bump version to
 1.9.4
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

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > Release notes:
 > https://github.com/libgit2/libgit2/releases/tag/v1.9.4

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
