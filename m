Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD80CF07C0
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 08:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E17981456;
	Thu, 10 Oct 2024 08:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NtPl85wYuoPI; Thu, 10 Oct 2024 08:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9759A8136C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9759A8136C;
	Thu, 10 Oct 2024 08:08:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21CE41BF3CD
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 08:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 106444087B
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 08:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOME_LRtOuh3 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 08:08:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5F82405FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5F82405FB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5F82405FB
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 08:08:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF62520003;
 Thu, 10 Oct 2024 08:08:15 +0000 (UTC)
Date: Thu, 10 Oct 2024 10:08:14 +0200
To: Brandon Maier <brandon.maier@gmail.com>
Message-ID: <20241010100814.6a3e9100@windsurf>
In-Reply-To: <20241009-git-2-47-0-wchar-v1-1-23c261a5fdc7@gmail.com>
References: <20241009-git-2-47-0-wchar-v1-1-23c261a5fdc7@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728547696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HldoHqhs9Ilq2Zm7jBwFJqShVbYDGCxAENiBt58/jlU=;
 b=NVLlji1ZRFYcI5vyrED/M/XGwoLEe0nmMOPgzH4/lBw1umTPif4bI9tLohDorN73ryPj2/
 h/HqYy4r/URnYlpWJcwASzKWUp076PcznxD+b46zepCMJzDu3Aaf0IGx8/3ObqdWdbc6b6
 7lkN0RHTPURZom0QczKmQppus5az2D/R4VAus6gbSjli/J1Fos5q9J681RChcl0w9TqWw1
 5gGd9yNg/ocXg7BGKe1+zoBzOkKulWjJIO41kLX7Qdwz7sWxF6rgtfnU56s+hCb1y+i+fb
 wKkyMS1PyStac8vUSwNH3Q8jY9FZLCgAMdZBlvSoySzZ1FXL8LafOb1OkGU5gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NVLlji1Z
Subject: Re: [Buildroot] [PATCH] package/git: require wchar
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

On Wed, 09 Oct 2024 20:44:24 -0500
Brandon Maier <brandon.maier@gmail.com> wrote:

> The latest release of git ported its unit-testing framework to a new
> library that uses wchar.
> 
> Commit that added wchar: https://github.com/git/git/commit/9b7caa2809cba618f2af702d35b12bc99535f2b9
> Fixes: http://autobuild.buildroot.org/results/15e/15e2f470ae6ba0c9c4bf40f306955aaa317bf87e//
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
> ---
>  package/git/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Thanks for the fix! But it needs some improvements:

- You need to update the Config.in comment in package/git/Config.in to
  mention this wchar dependency

- You need to look at reverse dependencies that "select
  BR2_PACKAGE_GIT" and propagate this wchar dependency. For example
  package/git-crypt/ will need it. And also the reverse dependencies of
  the reverse dependencies, if any;

Did you look at a way of disabling building the test suite? I very
quickly glanced through the git Makefile, and it didn't seem like there
was such a possibility. But if there was such a possibility, it would
be an alternative solution to the addition of the wchar dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
