Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E11C43327
	for <buildroot@archiver.kernel.org>; Thu,  2 Jul 2026 06:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AEE860B11;
	Thu,  2 Jul 2026 06:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qt-n25qitwN; Thu,  2 Jul 2026 06:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4D4760B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782974656;
	bh=WqhtJ+RTnzEoFujePayWB5buI28GAEaFCvRNI5sZaHE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJHsgKX7G59hsvrGyfnl1FEGzh8m7pcJQLaMTKYF8+cKPTx7xaTq5YDORD2cxivxH
	 gbnpQVe0L4AZ83MMVyKSl2BUNgrMh1DpYTckd9uuIbZCgL7ReyulJR40L+YAuATwgT
	 U4UCDsz20lwEZf+JRmKiWRqwoVqxgRCip+nahIlJAoU04LEH24CHDlvxu5opTBltll
	 7ptWnAr8uxMmsregXPG8oWhRY0CTYRwhL5TLF6Xk9HHxhiJaSV3lUHlI0eGOovM/se
	 XkbC4Cdp5+XmgIs3+Kf/dFYQY0o9SB6Rs50Vvw8WmyP4ntCoi1ODHV8rPbtyW58Rud
	 QaUfolXtJ0Eqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D4760B76;
	Thu,  2 Jul 2026 06:44:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D61BB316
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4417831F1
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6A8rrQyXpfws for <buildroot@buildroot.org>;
 Thu,  2 Jul 2026 06:44:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 742A682CE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 742A682CE5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 742A682CE5
 for <buildroot@buildroot.org>; Thu,  2 Jul 2026 06:44:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 393579880; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 06:44:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wfB9e-00000003N78-0q0E;
 Thu, 02 Jul 2026 08:44:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Angelo Compagnucci
 <angelo.compagnucci@gmail.com>,  Danomi Manchego
 <danomimanchego123@gmail.com>
In-Reply-To: <20260630201512.283396-2-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Tue, 30 Jun 2026 22:15:07 +0200")
References: <20260630201512.283396-1-thomas.perale@mind.be>
 <20260630201512.283396-2-thomas.perale@mind.be>
Date: Thu, 02 Jul 2026 08:44:10 +0200
Message-ID: <87y0ftopqd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LK9gRT0MVZCO9rLCfv0Ld0so0WZ/Mf5gFIVQP4ETk+e+j+bGI55VNdobQSo4pr/5t/eaX8rwTTcW2tHTM0ojMeSaq35JwXpB7WTrANy2dXZSgMvE+VR7ZxayeWhOLOmCZc45CGgLjf33NPIYmY273zz9ELZ8WlT4clnmplOrhlF+uIA++bmC/qRVwuhs0iDQOuf/FtdiTzlbMaBxjEFwuF8fkaU4slW4oa/GkYQZXnydYF3MHLV7ThxHtrDqkaBQmd4x0cEG+SkYmOFg/TJ4uh7u4uQg6GdYr4E/a6C8cfmJ3HJ3XKLBPkObdC0HVKswpm904uVzSMx1CUgplFiTEw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=L97yaJYg+MeDwGPXIzcqV0kdUP0v2FW29vg/bwK11io=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=LK9gRT0M
Subject: Re: [Buildroot] [PATCH 2/2] package/jq: security bump to v1.8.2
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

 > For more information about the release, see:
 >  - https://github.com/jqlang/jq/releases/tag/jq-1.8.2

 > All the CVEs were addressed by a patch but non-CVEs security fixes such
 > as GHSA-gf4g-95wj-4q4r or GHSA-hj52-j2c9-r8r4 are fixed by this release.

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>

I don't really think it makes a lot of sense to do this in two steps as
you presumably want to backport the 1.8.2 bugfix bump to the stable
series as well?

But anyway, committed series - Thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
