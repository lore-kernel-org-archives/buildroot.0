Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E622C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 19:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B83C960E5A;
	Wed, 24 Apr 2024 19:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgomOe9fqYzn; Wed, 24 Apr 2024 19:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAC8060E69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC8060E69;
	Wed, 24 Apr 2024 19:57:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 948071BF34A
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CA9B414C2
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2fbV3MMRN_b for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 19:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F90C414A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F90C414A1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F90C414A1
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 19:57:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E7ADA13F89C;
 Wed, 24 Apr 2024 21:57:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 Apr 2024 21:57:04 +0200
Date: Wed, 24 Apr 2024 21:57:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <ZilkEG6eEZ0DXztV@landeda>
References: <20240424175359.37025-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424175359.37025-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713988628;
 bh=j8G56ucMRPRWwOCrXzSVFprLJwejYLPlL8zXVXmKvV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bcz5EjgzBhptZjHah4MQVflMP41bmq70MoXIr1w6KIdik5vtfRO2+1rfYwwiBABQF
 KSwvFGlcFX+izBN0vGvRYGNAiPSC0qcnnhQTDADnIaV8RBXYkihyMB0h37gLRC8VIh
 aD+BWHWJNjw3kK4owORx0guRlPqUvCIJe2e2F+0G0ixomXo3zPqAp77E/LBDIAeQU7
 AU2yh1IKAZ7N5b7mIlyFmsX5xm7EJPMMLnJhLBeTSghJd6nW+lyOvAh0FD4yK7x+PA
 bxKygVM7FRY3eryG5j+xXS21caqSMfYrFZU80UG+KlyZy6D/1ZDVFyH5dAxmRFjLNL
 haI8sV+Eho+gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Bcz5Ejgz
Subject: Re: [Buildroot] [PATCH v1] .github: add a pull request warning that
 explains the mailing list workflow
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-24 19:53 +0200, Thomas Devoogdt spake thusly:
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.

Do you think you could follow up with the suggestion in the last comment
in that thread:

    https://github.com/buildroot/buildroot/pull/134#issuecomment-1718506664

    For example https://github.com/marketplace/actions/close-pull-request to
    automatically close PR and add comment advising users how to contribute

Regards,
Yann E. MORIN.

> ---
>  .github/pull_request_template.md | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 .github/pull_request_template.md
> 
> diff --git a/.github/pull_request_template.md b/.github/pull_request_template.md
> new file mode 100644
> index 0000000000..319e67d861
> --- /dev/null
> +++ b/.github/pull_request_template.md
> @@ -0,0 +1,6 @@
> +Please do not submit a Pull Request via GitHub. Buildroot makes use of a
> +[mailing list](http://lists.buildroot.org/mailman/listinfo/buildroot) for patch submission and review.
> +See [submitting your own patches](http://buildroot.org/manual.html#submitting-patches) for more info.
> +
> +Thanks for your help!
> +
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
