Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA88FD0D178
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 22:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE46980DF1;
	Wed,  7 Jan 2026 22:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOItcWnKJk9U; Wed,  7 Jan 2026 22:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D22380DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767824810;
	bh=2JPmwrLwKIF3WhJFif4Pc0dzJ2+guN+AI//NrKgvhLc=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=KXH3x3c77rHbnrIimw0yi2kHrzVR499H2R26+RaSI/P7jmV0qYEYQRbtbR8P8l6hY
	 Wtgs1d5Pr6av6wWM0wy67wWYcXqIOHJxR4PbDDGvvzf37G3JYdEwYlq0BLY86Phr+t
	 lzP93Jh10L1RyG8iNteOGLnodAlM5oRTWabjCuaUETu3kiW6voEvjjD+BfoJ1abN5F
	 o+1DKMxNY2JuH0ppDHaePXPpRM2Jxw8f1NFTD0AtcEevqcD74DqsC3axEeQU6ITDKZ
	 qkXltGb4Y9OwsVh9DUlG8xYs3voQsupCgNu7E8DBCXoqb9A/udQy/Bq/SXFiblqqQy
	 8J3GNbeNU5FDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D22380DE3;
	Wed,  7 Jan 2026 22:26:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6F0D436
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D50C40510
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7nRAowdZj9x for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 22:26:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 620194023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 620194023C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 620194023C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:26:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2036A1A26E3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:26:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD9A9606F8;
 Wed,  7 Jan 2026 22:26:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 97E0F103C8307; Wed,  7 Jan 2026 23:26:43 +0100 (CET)
Date: Wed, 7 Jan 2026 23:26:42 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20260107232642.7af69605@windsurf>
In-Reply-To: <20260107142018.131972-1-buildroot@heine.tech>
References: <20260107142018.131972-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767824804; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xHwOyD4HWfvhi1kTKaBSm2r6bG7WTL7zYXlFyFFOa2M=;
 b=ztEAaPxK5ZZeo4DNi6noSL+/7R5CpgmBA16+vXbGYpqwPO2sdC8KGz2Lh/IOVFwEfxzSGc
 1ZMBS1YjiAvAsU/CjQgbyYBapiUxIgOr9TdE9zNvI/RTG3m8bKAVniTd8imh/yODe7Y3nJ
 Zu3whaUZCWOca1wQZ6UuWIz6aUowROdL+Epo+eMncZ/s0a/yE4c+XhTQhsZMV5agCcdbMl
 ySsSazF80EUOVhKDpiK71wyRiF3T+ByQZavZYvnstOaqVuflLbfph0BhTlrv4jZos6nG+q
 DBSRcViFF6yZ6PxPoQM5nEGXCxjO2mBw8/18kUWee2183SCFG+FeFl3JUzZ+8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ztEAaPxK
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump to version 1.17.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Jan 2026 15:20:15 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Changelog: https://github.com/gabime/spdlog/releases/tag/v1.17.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/spdlog/spdlog.hash | 2 +-
>  package/spdlog/spdlog.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks for the update, but this patch breaks legal-info for this
package:

ERROR: while checking hashes from package/spdlog/spdlog.hash
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 4ccecab18d1ff0b61174fe3d6c430541625d3ddb865b0d5887db296f883c76e7
ERROR: got     : d678c20826e1392578508e1c78649a1e3c31bda05ef4388d967dbd654461b140
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/spdlog/spdlog.mk:27: spdlog-legal-info] Error 1

Could you check, and send an updated version? (Don't forget to explain
in the commit log why the license file hash has changed)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
