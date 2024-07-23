Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA33C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 12:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A86880B33;
	Tue, 23 Jul 2024 12:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdtPsjmQI-xV; Tue, 23 Jul 2024 12:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 276B780B67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 276B780B67;
	Tue, 23 Jul 2024 12:30:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 451A91BF83C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F2DE40374
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0VgTHrNw39m for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 12:30:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7B6A4035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7B6A4035D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7B6A4035D
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 12:30:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D33861BF205;
 Tue, 23 Jul 2024 12:30:44 +0000 (UTC)
Date: Tue, 23 Jul 2024 14:30:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723143044.17d3d613@windsurf>
In-Reply-To: <20240723104841.9239-1-fontaine.fabrice@gmail.com>
References: <20240723104841.9239-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721737845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L/Pb9elbAx5VPza3wKfKRj9CIsi2SS4WOAyV2DapUjI=;
 b=kye8ac+iP+msagVn9UhUkUAs7T0V0X2EXrIHVTuDNhTYGIpoImY2iAQmFKKnJJUo4s3+uA
 cqdcwV8bXfW1VhNay0eWJv63ryYESsvkFJwkbM9hR1ks/g0mz+ZwJ8KrvBfA7ohKNUCQ5O
 1rPkAGw79NcEX9s7G1e7Tn3y/q8nMAvR7Wlf1nmaomRNRMbZ5w3zVQn4E6l4SBnun3rUNg
 u5vz5SPoB4G1HkDyWeOeqqtpN4g2oYIuEvyL8/lTCChZvS514e1XMxN9p7xKavyWwF4udx
 vzELLfy57DRQ44efgH6KRT6x1y6jx20YX0OK0wEOHhiTSsizXjoz6PUucYaLfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kye8ac+i
Subject: Re: [Buildroot] [PATCH 1/1] package/gamin: drop package
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 12:48:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As advocated by Thomas Petazzoni [1], drop gamin as package is not
> maintained anymore.
> 
> This will also avoid the following build failure with gcc 14:
> 
> gam_api.c: In function 'gamin_get_user_name':
> gam_api.c:123:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
>   123 |         strncpy(user_name, pw->pw_name, 99);
>       |         ^~~~~~~
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20240723085645.732060-1-fontaine.fabrice@gmail.com/
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b267f53ba6035d256c013dbbbbd1bcdfe0ef111f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  3 -
>  Config.in.legacy                              |  7 +++
>  package/gamin/0001-no-abstract-sockets.patch  | 61 -------------------
>  package/gamin/0002-no-const-return.patch      | 57 -----------------
>  ...x-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch | 39 ------------
>  package/gamin/Config.in                       | 14 -----
>  package/gamin/gamin.hash                      |  3 -
>  package/gamin/gamin.mk                        | 21 -------
>  package/samba4/samba4.mk                      |  8 +--
>  9 files changed, 8 insertions(+), 205 deletions(-)
>  delete mode 100644 package/gamin/0001-no-abstract-sockets.patch
>  delete mode 100644 package/gamin/0002-no-const-return.patch
>  delete mode 100644 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
>  delete mode 100644 package/gamin/Config.in
>  delete mode 100644 package/gamin/gamin.hash
>  delete mode 100644 package/gamin/gamin.mk

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
