Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95294FD9E10
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 638E160723;
	Thu, 26 Feb 2026 20:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_GGHRpe3rg7; Thu, 26 Feb 2026 20:39:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B391360716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138367;
	bh=L1g6gWismIq3wVD5S5bipt5hVucQKRKW7PFqjY1M4iY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fF0rHIDjc+bAuvphDrIer22C141+Xrja0kPR+/bdofKtnLKuakvW2uRFEv2mdW2QE
	 olp3cNU1kAS8DwIDlOnawTRWdCuoRgu20q8zbBAsNnkbyUzYI2IPonUQCOgSrA35uw
	 um5fpS+UPXzNzlBWCXRnRYjVx0AB7IkW8fTotOvHPZPkA9AFIirv5kf5aHtv1w+p/I
	 OucZXeWIHKl9dx+PLWuW+3DOAH3Jmghc9teI9bGjNehmgNMIJgx7byOqjE54V9SWEq
	 /f+Cs3sWE1ZUkD/i0SjC3bDysIdCbkn8E8pg4lW5iVL80f5DD78bb7sBf7ZwHZIGos
	 pkDo498S1fMRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B391360716;
	Thu, 26 Feb 2026 20:39:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D454A1F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9A2E4056D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTjhJY9p6g5f for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8084A4056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8084A4056C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8084A4056C
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:39:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 35D2278035E;
 Thu, 26 Feb 2026 21:39:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Feb 2026 21:39:19 +0100
MIME-Version: 1.0
Date: Thu, 26 Feb 2026 21:39:19 +0100
To: Simon Richter <simon@sinic.eu>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260226073135.64960-1-simon@sinic.eu>
References: <20260226073135.64960-1-simon@sinic.eu>
User-Agent: Webmail Free/1.6.13
Message-ID: <cc7c1d74a572270e82c666d43ddf58ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772138362;
 bh=3p1bxPLrFFXt8zKZ7ab65pS+SFbcrLPQlIFJqYJT6Pw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y4LcbtdHuBdrmOZjTTgwzNlSYtQwGB0oqPrvhn+UUzvC9nqRq1NFShm3vWbzncGBR
 1vYKJ3vsG/KgzMq213dm0/LHGf53qcclpBBIeo+67c0bykNfZ86o0TCKtX9+/cpdO3
 Bg7ao/ZA3+phoa8ZgkOXlmgC6e2AV1gQTUa2a2lIgYAShtWG1A+i2GNXmjl/yMWuX7
 Xh8fF2cahbGsviZEBXJlv/udjyKcRqPYB5/YqJl5JpcGcueekjKDh+AHhpKtKOfbHF
 l73FcsrR/9ek2uIsDSof9gu8BDmnckIWvCjDImquidn+CNvIypbkSgAjeBT1sUk9//
 9hovW7UHDmV0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Y4LcbtdH
Subject: Re: [Buildroot] [PATCH] package/rust: bump to version 1.93.1
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

Hi Simon,

Thanks for the patch.

On 26/02/2026 08:31, Simon Richter via buildroot wrote:
> Changelog:
> https://doc.rust-lang.org/stable/releases.html
> 
> Signed-off-by: Simon Richter <simon@sinic.eu>
> ---
>  package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   4 +-
>  package/rust/rust.mk           |   2 +-
>  4 files changed, 68 insertions(+), 68 deletions(-)
[...]
> diff --git a/package/rust-bin/rust-bin.mk 
> b/package/rust-bin/rust-bin.mk
> index 215bd84ad3..dcb63902a9 100644
> --- a/package/rust-bin/rust-bin.mk
> +++ b/package/rust-bin/rust-bin.mk
> @@ -6,7 +6,7 @@
> 
>  # When updating this version, check whether 
> support/download/cargo-post-process
>  # still generates the same archives.
> -RUST_BIN_VERSION = 1.88.0
> +RUST_BIN_VERSION = 1.93.1

This bump has still the same issue as 1.92.0 proposed in:
https://patchwork.ozlabs.org/project/buildroot/patch/20251218222527.3861751-1-bernd@kuhls.net/

The rust bootstrap sequence has changed in 1.89.0:
https://blog.rust-lang.org/inside-rust/2025/05/29/redesigning-the-initial-bootstrap-sequence/
and is no longer working in Buildroot.

We should find a solution for that before updating to a newer
version. Could you have a look please?

>  RUST_BIN_SITE = https://static.rust-lang.org/dist
>  RUST_BIN_LICENSE = Apache-2.0 or MIT
>  RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
