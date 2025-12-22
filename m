Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4D9E674B5
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 14:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DB3F407F9;
	Mon, 22 Dec 2025 14:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AG4ueXNFIQ0; Mon, 22 Dec 2025 14:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CABB4406D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766414640;
	bh=yJbu47c2aCKvutbgXlEKiKrTMO/W7+0LLTFk038p7Gw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBI9iHZZdA67DnM7ZGQB3/MIfpzSrpMACsZqBTac5C8I5uxyai1b0rB33LNa0QbS4
	 3csczH0wE+n6wtwHEW/eFF4qkJDzHCZyUYWhU2OkERoFqrpyCJG/5fPzfIIAiz5CGe
	 P9s21e7vDFEHJCTDJQb9kO9pkFklDx5/VXXj98fwEmg0ohkfC8QRvAcjB3eeNAcnRx
	 rtbGK9SVpVxxStGlrBC6U5RKqvxEis7bsFKKKoqEoiGdoK4uHw2Wj6A2CTwRS9/5rm
	 82ZrexNw04sTbob2EO+DxdH7Gne4n8V5stwnVcF06tDVOwr20U96jrea83MmrxzbUV
	 C5PZieHPenD4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CABB4406D4;
	Mon, 22 Dec 2025 14:44:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF6F6BC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC98D60740
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqVPZIuuxaS6 for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 14:43:57 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D69D860629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D69D860629
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D69D860629
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:43:56 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id D7F4BBDE561A;
 Mon, 22 Dec 2025 15:43:49 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 14:43:49 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
In-Reply-To: <20251219224140.1318253-18-bernd@kuhls.net>
References: <20251219224140.1318253-1-bernd@kuhls.net>
 <20251219224140.1318253-18-bernd@kuhls.net>
Message-ID: <e3a4cafd5f42c9d07307a60d059e4786@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1766414629; bh=Be9mmyuCEeYuT7iXLaswpc5W7Ttm+f/XY4AoqIo20Xo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=i1Zh4IcjG3ATP+kgdY59jgiACescgxegsaIP3X/xdAHYPJBl+hlPdGj7/5/ZPF7ku
 jPodLx9SyMhVNUnpFqLu91FA3s7tBrzCqk3gr0VIk1gOU0omaOdeSA4OJaN0KuM81O
 odOcO9rNufH0BtkaTchWbWKqL95nIaX7AojrvFYw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=i1Zh4Icj
Subject: Re: [Buildroot] [PATCH v5 17/20] package/musepack: remove package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

No objections.

On 2025-12-19 22:41, Bernd Kuhls wrote:
> Last release 2011: https://www.musepack.net/index.php?pg=src
> 
> The package is broken with cmake 4 and no other package depends on it.
> 
> No autobuilder issues, as this problem was hidden by the libcuefile
> CMake 4 build issue.
> 

Acked-by: Andreas Ziegler <br025@umbiko.net>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  5 --
>  Config.in.legacy                              | 18 +++++++
>  package/Config.in                             |  1 -
>  package/gstreamer1/gst1-plugins-bad/Config.in |  4 --
>  .../gst1-plugins-bad/gst1-plugins-bad.mk      |  8 +---
>  package/mpd/Config.in                         |  9 ----
>  package/mpd/mpd.mk                            |  8 +---
>  package/musepack/0001-shared.patch            | 24 ----------
>  ...andard-CMake-flag-to-drive-the-share.patch | 43 -----------------
>  ...-include-fpu-control-with-glibc-only.patch | 26 ----------
>  .../musepack/0004-missing-sys-select.patch    | 21 ---------
>  .../musepack/0005-fix-build-with-gcc-10.patch | 30 ------------
>  .../musepack/0006-incompatible-pointers.patch | 47 -------------------
>  package/musepack/Config.in                    | 12 -----
>  package/musepack/musepack.hash                |  7 ---
>  package/musepack/musepack.mk                  | 16 -------
>  package/vlc/vlc.mk                            |  8 +---
>  17 files changed, 21 insertions(+), 266 deletions(-)
>  delete mode 100644 package/musepack/0001-shared.patch
>  delete mode 100644 
> package/musepack/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
>  delete mode 100644 
> package/musepack/0003-include-fpu-control-with-glibc-only.patch
>  delete mode 100644 package/musepack/0004-missing-sys-select.patch
>  delete mode 100644 package/musepack/0005-fix-build-with-gcc-10.patch
>  delete mode 100644 package/musepack/0006-incompatible-pointers.patch
>  delete mode 100644 package/musepack/Config.in
>  delete mode 100644 package/musepack/musepack.hash
>  delete mode 100644 package/musepack/musepack.mk

...

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
