Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE687C87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 19:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E0B82333;
	Mon,  4 Aug 2025 19:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id js1xFBhXkQjX; Mon,  4 Aug 2025 19:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B567982329
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B567982329;
	Mon,  4 Aug 2025 19:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF7FE1A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 962F640D32
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-skCNhHd6as for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 19:38:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E4CC40D2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E4CC40D2B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E4CC40D2B
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:38:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 874964166; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Aug 2025 19:38:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uj116-00BJdP-1F;
 Mon, 04 Aug 2025 21:38:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
References: <20250803170427.273284-1-angelo.compagnucci@gmail.com>
Date: Mon, 04 Aug 2025 21:38:40 +0200
In-Reply-To: <20250803170427.273284-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Sun, 3 Aug 2025 19:04:27 +0200")
Message-ID: <87tt2mlvwf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Q2f1B/nqyrTAcR2PxJAZkV7QAfE1WsVN+ChQOH+DZNJHWfJWIlMnZm9Nfy9sxDAKHuEtZ5U/Xs55fG6ovDiel0KVKt22nyzd3DGfW2j46HgLNDP+UhRa6ULqYDDAPdJFB/tVT0ux24DAKfhJ4Jp8mQqRNGMNCf53HwRA6gpyq++KW2KXaw9z8RfP8/jUHoDYJgn/sH3E3XD13pdYs/WrLJPnXVVmqn8d4V9y2m1sTikR8BKwocCiDapB9VpLv9a1lkwjxztC7WvQT0pTkJFsnN44riFytC2HEE+TDfvOT6f08tVCVg97fPw45Y1YFoUNl3fz3h1QJrKk3txHa3ZrjQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=2wp1tVTLKdmvSSqmuHorURk9Ni9uzbAiTYgHeKa5XcU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Q2f1B/nq
Subject: Re: [Buildroot] [PATCH] package/python-pillow: security bump to
 version 11.3.0
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

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > Changelog:
 > https://pillow.readthedocs.io/en/stable/releasenotes/11.3.0.html

 > Fixes the following security issues:
 > CVE 2025-48379

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
