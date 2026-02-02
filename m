Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26351E7314A
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7550060722;
	Mon,  2 Feb 2026 10:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DqE8HFXg2TP; Mon,  2 Feb 2026 10:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA266064A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770026777;
	bh=AuQyt+n+zhbFGvwD+Ug8zdJI3xWo6ubnJ/VkXuSA8vg=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ewvjaJFNIIwxojYULvEKa6BL5pqsa+GwhFhRAW+N1nxu3Q2NTaJoJw+9aIBu8mzut
	 J1++gobpMTCk9mpwaaXneCwDbh1eH6jDThpySnJ/Pjul0fkrzLiwj03XDEL54TWIMN
	 o14E+c4gQyK2UO/oZLcSmFed7mKz6UFggWRpHVpa9Kgf4z0np6Pxrr1NVXuQ82NYzp
	 0R0PMQM/O/rJi5HJC6gR7jZavIozztX8XFirJJGeWph2zichg71XplIwvWyX9XO2wN
	 JMohnRU/Hf8HT9U8C7FL1wAhRfYj+FMG8OcppJRbZXZjpNF6I8UjqFIZY2dKFKdsA0
	 ApIha7RuX9y8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA266064A;
	Mon,  2 Feb 2026 10:06:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89CCD1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D8A240475
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZdzY7Bsl0PF for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA01A40302
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA01A40302
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA01A40302
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:06:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1525729604; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 10:06:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmqoq-00000005rVA-33cg;
 Mon, 02 Feb 2026 11:06:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260119185747.712783-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Mon, 19 Jan 2026 19:57:47 +0100")
References: <20260119185747.712783-1-ju.o@free.fr>
Date: Mon, 02 Feb 2026 11:06:08 +0100
Message-ID: <87v7gf5ujz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=kOKUMj18QY2S2+iP30QpxVM6Uqnscrn3yUCD7u0oXpVWaErn2LzzDSGUNTjDJ26o8wueHzxnzb4s+FFep8Hj5jGpsGOoUzNlROL/UGADW3HwlPYNaVA1uwyzAw+zB9C2+m/3NmU1Y2Mv53HfIKgqzItcEKNqZpQOytzUffaJVSZliM9szbZJyEDjbU6sC+fHJiXq1F6HdT8Mzqk7O2N7xzaGrwa3TYGmwMNFqHQZx4UkO2s025uw2O2QqoU8MJjCHzFHTh0oi/YhrxCKzu+I9vJD1GAH/vFfKjqm8yaV8UQjeCpTKyg3pxhrl/hjRaiCTEg11Hf5Rb/zKnQG8ZtxPQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=L9iRR7K9JrvbOFbmx6JoZxLzAUnS8V3Eb3qfg3XhNSM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=kOKUMj18
Subject: Re: [Buildroot] [PATCH 1/1] package/acpica: bump to version 20251212
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > For change log since 20250807, see:
 > https://github.com/acpica/acpica/releases/tag/20251212

 > Upstream changed the source archive from a github user attachement
 > to a release asset. This commit updates ACPICA_SITE accordingly.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/12771565841

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
