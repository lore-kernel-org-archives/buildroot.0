Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610ADC5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 06:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E310A60625;
	Mon, 24 Aug 2026 06:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUcYpiU2Ezu3; Mon, 24 Aug 2026 06:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787554721;
	bh=GBaxlTE0LrNjRkknzQOoLFF2AMTcTtF6v2+yrDdYapE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oN7PGjC7wwVydoMLPCEhqfZ/vvw6ZnOfel66dtQBOwAk9GYaeVfGVOuyfBRnZRbUG
	 edAxhe+5lXD1eVBoFElPMlAYiNbOBWYpIHnYV/9NMc+JyOTGqBVfm9wRX4y1kzqL2M
	 gpGE+59WVBmoRvEppyFzu1Yoj8cvK3eVq5R03Fuu+ep2TlacNkbLKJQd+mQXux1Vuj
	 McXj5CjQoEI+/3GiVD25mJjEoTr/ZpZ3KJ7/WKoKz48zrAYdAi8kdPVLSTrlzjRUNp
	 TUiq9IlkLZJ3LvzSxMLVIOPYwS12bbzPK/1+lSvaNLWfXaoRUMRHT/4wmccE8p+qs/
	 w9zM2QcEE/YFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB78F60619;
	Mon, 24 Aug 2026 06:58:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30FD9336
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22DA660619
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNA4JFDb3RMd for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 06:58:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=RR8xMFFp
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58AFE60617
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:58:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=RR8xMFFptIQSw3NPeei9knTAa7P5T4cpaYSDbLqwCl9v7/y6uIUBN2+ZRb/Br6vX0zPGprggG3y5Ys4Ph50Uqj+1cfr2zpwbN6OFmCF841fMqngvbDWLUDahE2kbsVa6EpGMJupU1tQ2yF5hxuldtHnVYeWMhHglYbWNRjH8kq2mcWaQ27BnufB1BEZL7adDpPIzCo/sXiFqO4rUr5YHLziowCalDkTe3IpBgmEH7YKVE55ObV5VgFqhnTk3kOHEp/pUHFQNp3InEBHwbrjczqeJ8qqOi476WN3czdJp7Y4LuRMcJG10WzaT8uti32kaKLpf+AcDW5BtSJI2LZ/kVg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Z2szfmU9/d4wuO6n9gWvSSry0OnZV9ea7ltxp9eH1/8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -827218897; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Aug 2026 06:58:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wyOdc-0000000BbWn-2Y5m;
 Mon, 24 Aug 2026 08:58:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Murat Demirten <mdemirten@yh.com.tr>
In-Reply-To: <20260726212249.155140-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 26 Jul 2026 23:22:47 +0200")
References: <20260726212249.155140-1-bernd@kuhls.net>
Date: Mon, 24 Aug 2026 08:58:32 +0200
Message-ID: <871pbo9f8n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/jpeg-turbo: use configure
 option WITH_{TESTS, TOOLS}
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

 > Buildroot commit c531fe65209defd356e5ee8142896478a20ab371 bumped the
 > package to 3.1.2. This version first included upstream commit
 > https://github.com/libjpeg-turbo/libjpeg-turbo/commit/942ac87e479c48199d48781e9a5b2cda3b910d7b
 > which added configure options to disable the build of command-line
 > tools and tests.

 > This patch replaces the currrent _POST_INSTALL_TARGET_HOOK with the new
 > configure option and disables the build of tests.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
