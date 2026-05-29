Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22D0CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C17426151A;
	Fri, 29 May 2026 16:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwFbGS4xtcRB; Fri, 29 May 2026 16:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 604E56150F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071753;
	bh=V5QEhoKeCpU0UNC/9fO8xUj53axrPAZxzwI0JBL2Eek=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jqksSmAhox5yMA0kbRsBMw73Y7AuFXLyoCGkCP9ssBf7y+dhj4HIzjJoiZrcgy01f
	 rQ9AHk4G5CuesqVC1K4BENUUd/JgOfKhIW/XQFYSmSxtorRFToZek/I1D7ed/oZA7E
	 RF6FVp6FEhZVbufVJnhw0JV+oHJMEEwo5UL1RLpXMV4k+nURCVEjEzn2iu8jmzXb8O
	 zaDi2RKSxuuxReSD4WPxUoTO92kb3TIQuWc9+FY0iei9sDC/Et93Ub6I8yV30qWuHY
	 WbGZDkjqIXBs5b/KzVM8C4N11evAp3fENvfABiqqhzN08HX/HO9PE6WexPw1qzydnE
	 bQpUndGI1esuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 604E56150F;
	Fri, 29 May 2026 16:22:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99104288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 792BD42229
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pQEfnHZ7e0h for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EC5B042212
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC5B042212
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC5B042212
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:22:29 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -468126608; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 16:22:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSzya-00000002Svb-3G2x;
 Fri, 29 May 2026 18:22:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org,  Deividas Puplauskas
 <deividas.puplauskas@gmail.com>
In-Reply-To: <af2SKCP2HeKD0y7-@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 8 May 2026 09:35:04 +0200")
References: <af2SKCP2HeKD0y7-@waldemar-brodkorb.de>
Date: Fri, 29 May 2026 18:22:24 +0200
Message-ID: <87bjdyi3sv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QVw+4Q91eg2vvGKadO6Rg8L9U6DAyXVOh4Kkk1ROkLAbERbLymxEb1DNPfoiXpT3X89jrODGcJrZa11qfhVqZ8SjXreh9CTgs2XPC55SZlCzUeBHTL7KwxVDp7W6NzNb9ii7a/JfJykNsnqUAo7VRc5emA1H9kSblg4GgyOa3ONwqwvKsQ9mOCnnQBMbf2snqlXrmr+eXo6q79+fxKWSbh9qknp5JSqe3TLbcXbOXN4cy9LhiaOvykRWk9J5t0l6LLIADKGXE4hjfAo2UD7mavzoAJ1Ag1zMeThAKld3fRhwPHfwzKQWsL+t+OjW2AbYt52wL7GGoAB6hGp/nsN04g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=4wQBLjnXs6in3gHhqF51wiTb0xaE7R6lGi6aKrFcppk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=QVw+4Q91
Subject: Re: [Buildroot] [PATCH] package/perl-cgi: new package
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > From: Deividas Puplauskas <deividas.puplauskas@gmail.com>
 > See here for a description:
 > https://metacpan.org/pod/CGI

 > Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
