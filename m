Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48915CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15E904053D;
	Thu, 27 Nov 2025 20:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szDFeINcj8hA; Thu, 27 Nov 2025 20:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 439D6413F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 439D6413F4;
	Thu, 27 Nov 2025 20:05:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C9082A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E4560A5D
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3U44TWU5rGON for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCF33616DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF33616DF
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCF33616DF
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:05:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8EE8B979CA9; Thu, 27 Nov 2025 21:05:48 +0100 (CET)
Message-ID: <1d86e2f6-f016-43e2-bb93-b8b5431115de@rnout.be>
Date: Thu, 27 Nov 2025 21:05:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251104214250.3738188-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251104214250.3738188-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273949; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=7UQ3Wra8kwubqP0kJHOHArk8xACCGJ8shqYlDN8WBNs=;
 b=ng75MpRr+QaO2rDd3HMM1xaoDFC9UetEH0Xk5z9v/sX6hE4XRNII5SmijJnmScqZe4NUlc
 /LC/DV/wVW3MPQLhQTgo4MNLgdFdztD1zQG3mYqfCeNb5H7Uiv8aFT57iCl5jOkKSvCLDX
 MwZRHJjiku6sjHz9D29vHT6KvqZdgx2hdJ7fX1r6qxLZDOvW+secOzSk+muabSTfH6jvQW
 IHIqNEyLNY0nJiFHqcg83pKH2Fkrd3UsgRzxkbRx4DdfmoR8ispj/71hbGMfLd17PHOQbG
 y8IBH95VYhhe5S3rkg72dGeKe+N8DfxQN9w/QQMWzXbYR+9nq/7j23wEqJ72iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ng75MpRr
Subject: Re: [Buildroot] [PATCH 1/1] package/sane-backends: fix build with
 gcc >= 15.x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2025 22:42, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/296/2961e7aa23d66e7cf364c2caeafc1c226ccd48d9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   ...sm3600.h-Fix-build-with-standard-C23.patch | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
> 
> diff --git a/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch b/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
> new file mode 100644
> index 0000000000..287de48285
> --- /dev/null
> +++ b/package/sane-backends/0002-sm3600.h-Fix-build-with-standard-C23.patch
> @@ -0,0 +1,38 @@
> +From 90815a9f2576c2428287a500cab6caeddb80f9a8 Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Wed, 5 Feb 2025 13:19:11 +0100
> +Subject: [PATCH] sm3600.h: Fix build with standard C23
> +
> +bool, true and false are keywords in the standard C23 - the sm3600
> +backend defines them on its own, which is forbidden with the new
> +standard.
> +
> +The patch adds ifdef guards for the affected typedef - the old code
> +will be used for older standards, C23 will define TBool as bool.
> +
> +Upstream: https://gitlab.com/sane-project/backends/-/commit/90815a9f2576c2428287a500cab6caeddb80f9a8
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + backend/sm3600.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/backend/sm3600.h b/backend/sm3600.h
> +index 2ecbeb236..5d8a8d809 100644
> +--- a/backend/sm3600.h
> ++++ b/backend/sm3600.h
> +@@ -77,7 +77,11 @@ Start: 2.4.2001
> +
> + /* ====================================================================== */
> +
> ++#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
> + typedef enum { false, true } TBool;
> ++#else
> ++typedef bool TBool;
> ++#endif /* GCC < 15 */
> +
> + typedef SANE_Status TState;
> +
> +--
> +GitLab
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
