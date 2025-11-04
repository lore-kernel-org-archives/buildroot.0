Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4339CCFA00
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 07:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88F5081B71;
	Tue,  4 Nov 2025 07:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhLI1nWh0_vf; Tue,  4 Nov 2025 07:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A58DD811A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A58DD811A2;
	Tue,  4 Nov 2025 07:35:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE628222
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A075380E28
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K78mnwOzVCud for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 07:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E78A81200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E78A81200
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E78A81200
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:35:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1313301301; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Nov 2025 07:35:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vGBZb-0037hV-1G;
 Tue, 04 Nov 2025 08:35:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251103203239.213614-1-bernd@kuhls.net>
Date: Tue, 04 Nov 2025 08:35:23 +0100
In-Reply-To: <20251103203239.213614-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 3 Nov 2025 21:32:39 +0100")
Message-ID: <87wm468d38.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YvGpZAaZRhLMm4zlu7g52JaR5PhnXkKG2rBfq8l5aUtBZ01VEmqLStHn6QVzISSSVolhhOkkGIKWaNpZOAh2OhP+jYb3unB7OoAcY/hBUm4VA5WT0otTCuFY9rJK/kgrlwQgxNk4rZWcaylxiZw8ygVIQsq4hCDov1MxuLHiRcBTPU3hw6sKqPfn6WQelJGWewsspu5TdqL3egqCbu9dO8im1jTkWDxznvn2RFQFb8ecI4Lf/dMbDTg6MU9x9fa/3Au6QSDSQsf+JDXBqQzsAcTUYvVsjh5BZKyakHl34SrWWr9ZTlqGMvtSGV8FV39E0XfuN13ePB1W/AgYPGcUsQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Y6mErWyWLe/wzK6bo9LEMcHrc2wn4ytcyvkAc+M82U8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YvGpZAaZ
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.5.2
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

 > Release notes:
 > https://code.videolan.org/videolan/dav1d/-/blob/1.5.2/NEWS

 > Updated license due to copyright year bump:
 > https://code.videolan.org/videolan/dav1d/-/commit/04faac69004ac951b74ac7fea331f3790ec043b8

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
