Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE32CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 677E54129D;
	Mon, 17 Nov 2025 19:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KNLgZ7Y9pU9; Mon, 17 Nov 2025 19:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90EEC41301
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90EEC41301;
	Mon, 17 Nov 2025 19:55:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E61071BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8275813CC
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1eotro0cHln for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CBD8D81165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBD8D81165
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBD8D81165
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:55:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BBECCB9796C0; Mon, 17 Nov 2025 20:55:46 +0100 (CET)
Message-ID: <53826b92-f543-456a-8ec2-fd2c4d67bd46@rnout.be>
Date: Mon, 17 Nov 2025 20:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jarkko Sakkinen <jarkko@kernel.org>, buildroot@buildroot.org
References: <20251027014158.865598-1-jarkko@kernel.org>
 <20251027014158.865598-2-jarkko@kernel.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251027014158.865598-2-jarkko@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409346; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=JVLNYA4f2eaIanqgfRrzeqRKl9RSNhk4DSY96UKukoQ=;
 b=cai6ymz8xA5YWatEOUxBkuqBIbUpQAe9nc0fL87uQXVSBjK1k9VQuc+TjAP4RYe+SRui1O
 rvYjMeMxxgL7xzKeXc/Tp5xAmJIEX1PLizuyDhf4lE+RDyxt9MfkF+8wDWgL0R7L2H3q1L
 dafczS9u10XZicqejqo66rCzGa6rKQJRTOqRcCh7qTZMVy0C5p6uGPhz9BbqTJWtfJ8O7V
 HeyWxGPbhjKFPxhFP8J7A+SsAkL7jOya5RCmV36quR5pVGyLWItb4sC7RWzZQo7Svq1Iyn
 Y4B6g0Kv+L0W9MQBcyP8+ovrZ1PBQwfOdjCCFYSKqbI/9UskfmC17G5GWmpf5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=cai6ymz8
Subject: Re: [Buildroot] [PATCH 1/2] package/libtpms: bump version to 0.10.1
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



On 27/10/2025 02:41, Jarkko Sakkinen via buildroot wrote:
> Release notes:
> https://github.com/stefanberger/swtpm/releases/tag/v0.10.1
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

  Applied to 2025.02.x and 2025.08.x, thanks. It contains a CVE fix.

  Regards,
  Arnout

> ---
>   package/libtpms/libtpms.hash | 1 +
>   package/libtpms/libtpms.mk   | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
> index 1026aaa4f4..66f3131e47 100644
> --- a/package/libtpms/libtpms.hash
> +++ b/package/libtpms/libtpms.hash
> @@ -1,2 +1,3 @@
>   sha256  2807466f1563ebe45fdd12dd26e501e8a0c4fbb99c7c428fbb508789efd221c0  libtpms-0.9.6.tar.gz
> +sha256  ebc24f3191d90f6cf0b4d4200cd876db4bd224b3c565708bbea0a82ee275e0fb  libtpms-0.10.1.tar.gz
>   sha256  82f1e6bae374bb6a9d4f4596767fd33e499718d560de140fd9f3d402cc5e41fb  LICENSE
> diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
> index 19d7cef89f..6e5708202e 100644
> --- a/package/libtpms/libtpms.mk
> +++ b/package/libtpms/libtpms.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBTPMS_VERSION = 0.9.6
> +LIBTPMS_VERSION = 0.10.1
>   LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
>   LIBTPMS_LICENSE = BSD-4-Clause
>   LIBTPMS_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
