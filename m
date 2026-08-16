Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF9BC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B73E80DAB;
	Sun, 16 Aug 2026 22:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l0OPIz_zoA9N; Sun, 16 Aug 2026 22:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE72580DA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918864;
	bh=XPAzLzFz1qhd8uf9U2Gg0VbrxHOnGJgPLzk41+YTGLM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+rr5lBHiTs29Fo/XBw7rmjTc0qOmhuoWGF3DY/VPypLxng4K3YtRYAjcWz7D8iVt
	 7QYPQMDFDTPK15+OaJ8IHTXJRQsr4G7klpsQ7e0XdadxyVoQolvAgd7TrFRPSatr/d
	 KLQW5vjn13gE0dc9iRZbhRxbJlqBARzAJUBcQR8IOBIYsRCWT4m47YIY7iumxVW5x1
	 +jddMGLs2DP8v2241l02PtOYIkHtWQZ218Z7BCj8tZ2Rpd+wBsTixnIlc2ZgyA/SC5
	 0+US9P7F7QTbqNaoJ9J5zPFND/j0HCsgq61WCQx8yL8qqQtGbHifhOYKAaqCgDT1v1
	 yFUQP0Q9IXgzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE72580DA1;
	Sun, 16 Aug 2026 22:21:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DA6223F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2406B80DA1
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLcn-z6p6hrV for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:21:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1CF9380C88
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF9380C88
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Px8awdGd
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CF9380C88
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:21:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Px8awdGd1OOL5KxEc47T6k2lXRN26gaGezhOY3zyHsF6Ch4pqQHrPPPy80Ji9+uLZ4PmHMkTwvqL66fydBO4ZJ1Rvr7wZCk0U4CwIshX94pnXuNL9iQvNq4plKglq8+GRDTlSM/WCTWjlCK+pmibFD+o5MjeZKSf/iBOScZIMDh5VmEvS2cFuOjx3k2ivJsO/W0w5kyrx1OL1vtu7+adaEEXTwC7EhNsRdjdqc+a9sdT33AVF27jT32yYRGi8lTKZ3SF63B4cZYbrvxwKoori+qjcmUwLYSaY5XE1C4lZuA/YAqVzINezijozbe4/lV3Ew/yjCzQ/ewzMIiDNhvhkw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=TpxtRczW8KWK/F+pmNXcwqsjW1HVAn3lXcXrXhoMNGo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1527889860; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Aug 2026 22:20:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wvjDt-000000021kg-0MYa;
 Mon, 17 Aug 2026 00:20:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
In-Reply-To: <20260816203207.3980846-5-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 16 Aug 2026 22:32:07 +0200")
References: <20260816203207.3980846-1-bernd@kuhls.net>
 <20260816203207.3980846-5-bernd@kuhls.net>
Date: Mon, 17 Aug 2026 00:20:57 +0200
Message-ID: <87mrulbtbq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/5] package/runc: security bump version to
 1.3.6
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

 > https://github.com/opencontainers/runc/releases/tag/v1.3.6
 > Fixes CVE-2026-41579.

 > Rebased patch due to upstream commits
 > https://github.com/opencontainers/runc/commit/a8e53f2c6d6d25cb3dd643cc514f118aab44b097
 > https://github.com/opencontainers/runc/commit/42cfcbe4533a094cbffd23d17dc355bbb25938a1

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/99b74ab8c322d7aacf9b9bee370fc273a0dc7fa5

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
