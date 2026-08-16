Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC9CC5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F17A80DA6;
	Sun, 16 Aug 2026 22:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfUvbhxlNLU0; Sun, 16 Aug 2026 22:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3994C80DA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918567;
	bh=IQPXGCHA3yOAVW1odFZYdS3BUXH487Ihk5AHqb1JTVI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+u4uWb3WqywbCld66DxNgaXwphBZx/b5mqrNkFCS5YbZuOHZZ6VL/DY86AUu93Hn
	 aQyYPYC1Z/MtfwJF7rWNywtYWYjp4ZICR2jk7s+XNi4XQYfW86726gzTSlICxBZu9l
	 /donxQFVhaMyCkYN6Z3n8B1Ky7Iwe9jTBc3SlznkjFS16DVqcz83XCCyOvploUa5xp
	 J8tmU0fx2QAMe7EmzfVjS52ckPkh/xVPKwugbh9Bb0niC4uNw4SMaGrVcLugBw7Gzd
	 /EiH2mOgQWSyCFaQBC2es5X6m1gE+747iga8tYs/aF+39OqCFhRjofae4i3AkGBD3X
	 nO+2Uy7Hnktfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3994C80DA4;
	Sun, 16 Aug 2026 22:16:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 222D623F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 141C140666
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxtmSE-qJWnR for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18D1D40660
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18D1D40660
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=pPciMhS/
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18D1D40660
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:16:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=pPciMhS/0Old+N1dnUk1lKaAwREinEpTf6EDbh+Hz3KSTEeqRy1UHopjuFs24TX4nA7BU4IpawtKUu7WAlyg8K0jHRwYHUFYn3hrKDgJlxDRy9NphBinYthiwiO/bdR0tscIiGqhcTC/tbjue8+0KuOwTYflCdUvS6zLKWQ5UoSkSbf8phHCPwvBR6KVbz7POPJ7UE3a+WQ4pUTIaotH4kmZgNBGZMWJ/GCa+YUo0phNV7JZbKqw5aS92L2uIhgv2zIhu6+GVwA/7lzxRBGm5S/OirvcHZ9IA6wK2cQ12ZpJhQizpWUBFkKfEk1jZ9HP1CJNzpoBW7PdfCHfB75MnQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=hEkhK3oy1Z3z49xHAYfushxxJk5GNU6W6ntRz0LLiJE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1021008640; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Aug 2026 22:16:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wvj95-000000021NL-3ZIk;
 Mon, 17 Aug 2026 00:15:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
In-Reply-To: <20260816203207.3980846-4-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 16 Aug 2026 22:32:06 +0200")
References: <20260816203207.3980846-1-bernd@kuhls.net>
 <20260816203207.3980846-4-bernd@kuhls.net>
Date: Mon, 17 Aug 2026 00:15:59 +0200
Message-ID: <87v799btk0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/docker-cli: bump version to
 28.5.2
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

 > For consistency with docker-engine. Release notes:
 > https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.4.0
 > https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.5.1
 > https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.5.2

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
