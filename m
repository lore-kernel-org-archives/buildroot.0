Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883F9E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58027812BB;
	Sun, 29 Dec 2024 21:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_Y5V2cxIscf; Sun, 29 Dec 2024 21:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69878812EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69878812EC;
	Sun, 29 Dec 2024 21:12:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47BD5C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 364C1812AE
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bV3VVYFQuthy for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:12:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 16180812BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16180812BB
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16180812BB
 for <buildroot@busybox.net>; Sun, 29 Dec 2024 21:12:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6AE0EC0A3A
 for <buildroot@busybox.net>; Sun, 29 Dec 2024 21:09:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0258E1BF203;
 Sun, 29 Dec 2024 21:09:53 +0000 (UTC)
Date: Sun, 29 Dec 2024 22:09:53 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241229220953.554a3a6e@windsurf>
In-Reply-To: <20241211094639.968420-1-francois.perrad@gadz.org>
References: <20241211094639.968420-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735506594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+z+yJQWesDzwWoP3hNDEL4IL0cHpUYRoq0zvQsqY/c=;
 b=Obguz3sFqaqMbLMTLQOm+h6k+8pJuVY/K9al36Z3n9PunQo4voFaDpxe8YqePgJD62F3Yw
 0pCOp7TTqkjVkaX1+4zAq8eky6I6kCZ+ikdzBrDEE0YP2aWit5NSLTzKjbmLR0PdG3yQDF
 XjmuJ5ngD5QtYfdqa1BaNKQRIraZGTwGSaAEtDcegyWUpXpGwZ3gQjdRipA3ZDKTHYOqBj
 CAR+HtjoABDQM0ddkk0H2ZR7O+hzp1WvP9bxZXEA4EPOqtBmWievJVrrMHgN/yFp8ydtbH
 NQBUeNg2sSkJfRZRKDx7AGH5yW8Ahu+YW609tOtnLS3l9KQGOtcDAy6Km+T+vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Obguz3sF
Subject: Re: [Buildroot] [PATCH 1/3] package/lua-iconv: bump to version 7.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 Dec 2024 10:46:37 +0100
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-iconv/Config.in      | 2 +-
>  package/lua-iconv/lua-iconv.hash | 4 ++--
>  package/lua-iconv/lua-iconv.mk   | 3 ++-
>  3 files changed, 5 insertions(+), 4 deletions(-)

Series of 3 patches applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
