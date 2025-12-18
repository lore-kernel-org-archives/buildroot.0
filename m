Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37161D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F1DF40E9E;
	Thu, 18 Dec 2025 16:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXPLnWpBDr8Z; Thu, 18 Dec 2025 16:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B195410A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075870;
	bh=ptzBZaU6EZZWIylBNiTWRSuW/M6h4XJZVpS/G6Qiamk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X1qS9vWgijhCCxGlV5hE52NNBV6+pZVKhFfE8uOPAJ2xP0cz9EwYseNwQHdTpF7WD
	 S3jMO2uSEBKLiiB+g7qVHTsx3Vk9O970c1kU4Nx+Q95j4quLb6pSuUPDznWr2xuPYJ
	 QNNIwQRRxMKhhQ4TFkMa6kpkPTm97xOJtKavvAbYTwOYweDm4FGIIYxxi6YOnan9l8
	 aVH1mlpfq5JmpHN7rF0FR1avkZHqqB7Uk3YcEd7E8ze9nJWuRs3b+a68dNk9yfvfyC
	 5Z5RuJ3OIt3hUc28+igf3T3oIX8NBE/lcV+BI2FAGaPhSar3Krlok7gWYah+zEnjfn
	 Ecrtf5H2EX3vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B195410A3;
	Thu, 18 Dec 2025 16:37:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CEA9C1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C10E3410A3
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7rwCCu-wvge for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F75E410A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F75E410A1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F75E410A1
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FB64B97A297; Thu, 18 Dec 2025 17:37:45 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:43 +0100
Message-ID: <20251218163743.379661-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207180325.25243-4-bernd@kuhls.net>
References: <20251207180325.25243-4-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075865; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=pSFrv+kQAvf9OQb4vnIy+gatDxQZFbnwFSvzK16bXnE=;
 b=gNCWwc7EdiWdgRYsY+h5wmjNCeVZcwXAFqtXbeU5rS0bRT28Tmvxcnp6+qyaCHzK4KfmoK
 K2zPOwNp8sBpXNGPhB7bza5L2eqmEETgZ6fQAKzEAdWoFY72HjT5LN8w8KFop3h9c5svb6
 nASu8GZqF3bhGV97ZdLu1gCfGZVax7NCmCept+duZZVLWR7vV9lhuDP3j9oEqIkn7l2slL
 xYZpZ7s7NEILjyzMuPG2t+xiJMCXZBZRnF2bl7Gd2OiaWOSGBBL4v0JvFIdoAdShRDZr+8
 MVfSAMs8ssikLTji15JOIwyhg2c/4PIESF+ps/R0Oy5xza8StYWB9e1vZpQNAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gNCWwc7E
Subject: Re: [Buildroot] [PATCH/next v3 4/4] package/libvncserver: fix cmake
 4 compatibility
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
> v3: no changes
> v2: no changes
> 
>  ...001-CMake-require-at-least-CMake-3.5.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
> 
> diff --git a/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
> new file mode 100644
> index 0000000000..e7b30e3db6
> --- /dev/null
> +++ b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
> @@ -0,0 +1,26 @@
> +From e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@jolla.com>
> +Date: Tue, 13 May 2025 08:37:07 +0300
> +Subject: [PATCH] CMake: require at least CMake 3.5
> +
> +CMake 4 dropped support for version requirements < 3.5.
> +
> +Fixes building with CMake >= 4.
> +
> +Upstream: https://github.com/LibVNC/libvncserver/commit/e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 205f3928..9b8118c8 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required(VERSION 3.4)
> ++cmake_minimum_required(VERSION 3.5)
> + 
> + set(PROJECT_LANGUAGES C)
> + 
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
