Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB34FA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24B50404D9;
	Sat,  3 Jan 2026 11:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ey0G8ZSDfFQs; Sat,  3 Jan 2026 11:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 093644041C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440505;
	bh=alpsUcR22xx1o/hyE59zuGuEuci2fYgowncStqmxnbA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TCOmyt6fqYpr+U8UxxNUR2n/olpDSAQSF16ScxvIhHHy6RXgQaS47uJzAUthIKvHk
	 Ney7k0HOV+0MkxQk+CbKkNxklryDHVnDWmlOlZy63ryXo68tYH47kRAmMQKROH4v6e
	 0Ohwv8ftuC5F3tS3pDHGhboHJ4maOuGPY2XcqZdkY2Qyd93X/YBMEYZuozDU473HCB
	 MxVcwKSk3HQeGCpN3/rtQxEj0ha4Sz9iMf+KiZhm0isvzb9mDu51wK6GQctOUfzCCm
	 MHCkPcKsskpDWAF02nU5+1lRo2WA3rzsinxLNuRzxrBdJcq9f1RMowdQjIaPk6kSO5
	 hYWg7t4OE6ozA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 093644041C;
	Sat,  3 Jan 2026 11:41:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FCD1351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 426584041C
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMqzqG_K1lYP for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:41:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FA46403F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FA46403F8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FA46403F8
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:41:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1877B78034E;
 Sat,  3 Jan 2026 12:41:39 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:41:39 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:41:39 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103011257.732068-1-james.hilliard1@gmail.com>
References: <20260103011257.732068-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <2f16c0ca920f8087032818037f04f775@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767440500;
 bh=jJMJdoXlk/vD7voZTE/gEJHkg27zFiGtKNGbKtVlGNU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eyFli1uclHlTQRqtSN7lgW8AgexwpGy2bguac+lOXa97kHr+5x3UPKJUVwnO20xca
 8aJZ0d9lE3khoX7Vx7SvvgHtZCLKAxUf+GiDeh8j4T3JNC+Bp65sd64N6mjKeHqAqG
 1lJBzF8kG8zrdsdUZxu61xEhPV8053/L86AJdelzc6tC0hH/WUc1Qjdt79JkpoX6wW
 TtgzrqrMQegEYAtBKz9SQ5tR1fM7B4n7Lb9W3nlt3lWrnH7EulHALcoiFJMRDkKTuN
 ejvdQQYWMFf+W/c1BvC82HxOXqxtfzi1zbHlr/K2XjC5cxn3beNsEEOIX7ikz0iqBO
 tv6zVKqfJ7M2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eyFli1uc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-engineio: bump to
 version 4.13.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/01/2026 02:12, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
