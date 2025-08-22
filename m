Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC88CA0EED
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 592E960FD6;
	Fri, 22 Aug 2025 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rhRM2fhe-ui; Fri, 22 Aug 2025 20:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CECD60E27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CECD60E27;
	Fri, 22 Aug 2025 20:13:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BFFB1C7
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0222083C4F
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncfk8XEdt5wS for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 20:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 216CC83C03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 216CC83C03
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 216CC83C03
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:13:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2E2131A0D52
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 20:13:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E647E604AD;
 Fri, 22 Aug 2025 20:13:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FC481C22D036; 
 Fri, 22 Aug 2025 22:13:45 +0200 (CEST)
Date: Fri, 22 Aug 2025 22:13:42 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <20250822221342.046ad796@windsurf>
In-Reply-To: <20250821114800.3834308-1-peter@korsgaard.com>
References: <20250821114800.3834308-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755893628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kalUFE5BTCHAfIZ3g8hz0y4yZExmdsVpNe9pSpuF9qE=;
 b=XSSebbI6uMRr0XA/Bgo3UQpdnvxapv9rXCUDmyCjLWtctK0oZBix2IqBC3PxLAYAqlqAHC
 WWmh1L+Oj6LrssP4TpNeNxeGzUFfBXQx4B0roFem0U+d902EVGuvwWBXRx+qvz1L9GTpGA
 uCRBzZ4A8gE6PBFtP2IISwGGMFA45LZQLV1SLc/Q9fyVYSrMHYwZmaGKE/5r/KpjE/dpVQ
 yuOJnsLuzdpdx985XOrwQCYlSQlDxiJdkT1Jv9yBm+fW+5HOuF7AyQAT79z7qj4rnkPL7u
 qqfq1Jo1uwiLf8k9wExPk3xdPq7Yj6omGojsLb3fUD726BsRqGsOZPAo+w73JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XSSebbI6
Subject: Re: [Buildroot] [PATCH] package/dump1090: fix build w/ gcc-15
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

On Thu, 21 Aug 2025 13:48:00 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes https://autobuild.buildroot.org/results/dbf55d0fd8d779f408e7ccca4c2a9083e7a11f6a/
> 
> GCC-15 has gained a new warning about non-NUL terminated strings and
> dump1090 is built with -Werror leading to build errors like:
> 
> interactive.c:143:23: error: initializer-string for array of 'char' truncates
>  NUL terminator but destination lacks 'nonstring' attribute (5 chars into 4
>  available) [-Werror=unterminated-string-initialization]
>   143 |     char spinner[4] = "|/-\\";
> 
> Add a patch from an upstream pull request to fix this by zero terminating
> the strings.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../0002-Fix-compilation-with-GCC15.patch     | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/dump1090/0002-Fix-compilation-with-GCC15.patch

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
