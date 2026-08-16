Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6CFC5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04D8D80D81;
	Sun, 16 Aug 2026 22:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxe7KFBHZ3lW; Sun, 16 Aug 2026 22:16:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EFD280D9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918603;
	bh=NvwI1lTyQaumcbWOooILonRGDt2AWPhZFgBTkApg1rQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bESdn1lRHNlv804O5WB0GGsjyw8qD0bjhdl87pC3vUOSxqmSY7L5Lit8nISfJ9TgZ
	 yK8AfrtFJcQUonJKhmi92kC4ITePuPPNoswZwGGZVx3s8mAkE3MVXpoAa+fzXsjcsk
	 TKrDVxtYUG3/kGc73RY+xW7Ljj2mHt10G5em7OGzzp3y1zt1pLATxKTLO9OeE1VHTA
	 q3onb9PtesJlLhgpnEeFaVUrBjxH8Qm3+MLb0FdWkrZWD0Xhn8aSKdNMI9SCt1Fjyn
	 r3TgyxcpzS1VKzw4t5uHQsod7Jn5/36LxIw6EiwoxCkUgXhHpxfUu6CalpAdnLY4hd
	 AQwPL5pDfuHgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EFD280D9D;
	Sun, 16 Aug 2026 22:16:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61763147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53FA280D96
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzNJnMlqnWpo for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C92D80D81
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C92D80D81
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=o0KsHwWI
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C92D80D81
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:16:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=o0KsHwWIUiXW0ZoJ8QtiT2/oC32Ke/pOI9QFPmyOqErBWh0gN7KDEJDO3r/H+gE3h5YueV2V2/Pqrw0VCSsy5hlEo+URXMeuxhlSLQ05rKzoPyJBkDgz8kJvQ3dRamneuwyy+3V16F1n8tENC/cZWeMDlH2sH+ZpQXzIScTCQHARbf8u6fLSb8vU5hrlJSi+5D6nfDne87te9z8Y21ylRk+w2gPrRiKVNnZ84GtoIOcBcE0LMk31z3RxeI3O33WlJgSbPy1zlJNO24rfx9RqDhZpzkAp6XN4SjU/qsLNXl59oz7nn5ridriy7APhXFQT+G6HXjuWnyTc1TmoG/d8WA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=+ekdZBzUz82jvmLdOBUF4GTZ9UL+W2Ko+SODpR2bPWc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1336848027; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Aug 2026 22:16:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wvj9g-000000021QJ-1cw6;
 Mon, 17 Aug 2026 00:16:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
In-Reply-To: <20260816203207.3980846-3-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 16 Aug 2026 22:32:05 +0200")
References: <20260816203207.3980846-1-bernd@kuhls.net>
 <20260816203207.3980846-3-bernd@kuhls.net>
Date: Mon, 17 Aug 2026 00:16:36 +0200
Message-ID: <87qzjxbtiz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] package/docker-compose: bump to version
 2.40.3
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

 > For release notes since version 2.38.2, see:
 > https://github.com/docker/compose/releases

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
