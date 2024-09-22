Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEADDCF9C6D
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7876881393;
	Sun, 22 Sep 2024 10:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPMczFFeDuAP; Sun, 22 Sep 2024 10:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A576813AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A576813AC;
	Sun, 22 Sep 2024 10:33:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A54FE1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D94976062D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLNV7-QUsUDS for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 595A46061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 595A46061F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 595A46061F
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:33:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DE5045FFAA;
 Sun, 22 Sep 2024 12:33:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Sep 2024 12:33:08 +0200
Date: Sun, 22 Sep 2024 12:33:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zu_yZGNPf7OY3Hhh@landeda>
References: <20240922035254.855480-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922035254.855480-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727001192;
 bh=PZcZCfVKeeayIKmcHhuAmg8VqLVB/GQM0yKntYooGYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lTVzXiwQv5arztppbr3h805QWLSuDwg6A19zQQHJEIAQPnPzjMlErGjWHLP7taPY6
 6HYgU9jyh0/aBO85AlaxMIWBtIORSvClKzcoTMbqpkGsdW6oxYvaTS9WnFCs2VMxNJ
 N8svkDmZ4kQQ8MSyk30q2vlE0dg0o2lG6ajZpZJQ6mKNEXFvn9u5G+53zO0s2u9yxe
 GiUg+MiUvx8xBsCgCZaDCnKWoXRSQP6qAjmLj9eUO5mU6LlfgQrry+07iNyPPKM2Eq
 A2UpSjRcxtXZCi8DpWwFwk+j0i5aXGfP85Xhxb1b0vOmqq5XAHc25U3zE1gdkQjUaF
 IPxHNUCFeZBwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lTVzXiwQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.4.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-21 21:52 -0600, James Hilliard spake thusly:
> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch b/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
> deleted file mode 100644
> index 357c6f2f12..0000000000
> --- a/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From ac79778c91bd9a4a92111f7e06d4b12674571113 Mon Sep 17 00:00:00 2001
> -From: Ben Darnell <ben@bendarnell.com>
> -Date: Sat, 13 May 2023 20:58:52 -0400
> -Subject: [PATCH] web: Fix an open redirect in StaticFileHandler
[--SNIP--]
> -Upstream: https://github.com/tornadoweb/tornado/commit/32ad07c54e607839273b4e1819c347f5c8976b2f
> -[Thomas: backported to fix CVE-2023-28370]

This was a backport of a security fix to close off a CVE, so you forgot
to also drop that exclusion in the .mk.

I've done so when applying:

    -# 0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
    -PYTHON_TORNADO_IGNORE_CVES += CVE-2023-28370

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
