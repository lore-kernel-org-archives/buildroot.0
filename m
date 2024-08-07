Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC5AC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C2C4049A;
	Wed,  7 Aug 2024 10:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyMgLj5i_5VN; Wed,  7 Aug 2024 10:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEFEB40544
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEFEB40544;
	Wed,  7 Aug 2024 10:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7A3A1BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D18114049A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJgBbExCFoRq for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8189240219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8189240219
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8189240219
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:04:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9710240003;
 Wed,  7 Aug 2024 10:04:27 +0000 (UTC)
Date: Wed, 7 Aug 2024 12:04:26 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240807120426.17d91021@windsurf>
In-Reply-To: <20240806220250.525433-1-ju.o@free.fr>
References: <20240806220250.525433-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723025067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aqeyiste4xdhN8TTsoJNfKYVYE45a4AJA/faRP7bYho=;
 b=YxnVUuQd56fis13I0TsZUR6ydtkMI5F4d/Kqojw8ddt+Q+AsZRDVf5S18I/1xWs8lNGiYZ
 QILXUr7ViFX5M7MpEFWDGgDElX5eCZVGbaHRY4b2hROdPWQc8atK4rQRJO6KFd0v7lUrsC
 uN5C1IdMqwE7tu9CsHuH4LmZ6+7zCPUnubtxSO9DtsRoypvu8IsWIsc3w6+IvhsgTu4ADg
 sYQcHvqKaGSQYMCJn8O//Nof1wiX8labmRMOggO1E3bM2hbZz3/U8B6cxHCytq7GV33tw7
 KoR9crBtkiVZwXNqnrgwPZzSKhvkBsHkQI1WpWAzIGzDwIZTNrHKwCVkX/8o7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YxnVUuQd
Subject: Re: [Buildroot] [PATCH 1/1] package/swipl: host-swipl needs
 host-zlib
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Aug 2024 00:02:50 +0200
Julien Olivain <ju.o@free.fr> wrote:

> host-swipl fails to configure with CMake error message:
> 
>     Could NOT find ZLIB (missing: ZLIB_LIBRARY ZLIB_INCLUDE_DIR)
> 
> This commit fixes the issue by adding the missing host-zlib
> dependency.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7520944006
> ---
>  package/swipl/swipl.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
