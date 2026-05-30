Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF4FCD6E55
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 12:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEA3440BC1;
	Sat, 30 May 2026 12:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4iSy8iDAGgl; Sat, 30 May 2026 12:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79D4B40CA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780145779;
	bh=exTewBc8v11jzkNOnzCX8F9J60NmkaXWcVvkc7aWqKk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=rulYM9w3dEjCpvcx+RHLPo2K9J6Cw6FUHdaO6ZUoGwvkpWDZbYF5obFPj5/BD5DkI
	 5p+QNO6RlW9YyOgjzsdZQ+Su5m79gP/pACdkw4/HifUKW/qFz+F2B1g0Lno9k/X37l
	 56Eu0RiNClKw6ta1C/h04RFzAiYVoUAJdsHSnjsjgAQZDdC1bqVRCQpRpAmY4oNKxj
	 c0PdHt9ZV9e/bgvbyZPqaKqmWoVfQF9/NQnlaTznEOTkXHo30dR41LVeThBbBRj0gX
	 GYQeJs0w6ZMvh2JTitYz0DwHQcUct9LrvZ+0G2qjfG++PhGq+QdEm0k5GwRQ3rIuN4
	 dAyYwU7a4qHqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79D4B40CA2;
	Sat, 30 May 2026 12:56:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11BCCF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA0526F559
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mmn1G86Di3qe for <buildroot@buildroot.org>;
 Sat, 30 May 2026 12:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDE796F55C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDE796F55C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDE796F55C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 12:56:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D83B2B97C699; Sat, 30 May 2026 10:41:42 +0200 (CEST)
Message-ID: <2d01b554-57fe-45ab-b74d-d88bc892fe89@rnout.be>
Date: Sat, 30 May 2026 10:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260529172103.1359117-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260529172103.1359117-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780130503; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=M5i5e7Ab+fX9XzlpBaXrlGGi4lDMcJVX//EgaKznYAU=;
 b=lBeiBYtx2BWe98ooQ32SsxVG9XNcPtchOe+8Xgzoe5g9bkhdis3Ota3u5T+1sOWyd/7mKH
 JXAqLNfduyKB0AHiPjuf3ZAZnuA9h5RyfR16vuw6vz3HM5MKE7hYYJOJGWW7qmKk+avJJ3
 INqS8cZW3jLfve5b2N9lI9PVrGa042CWXQCXOenRh0sXgnJ3bPJ170ZHD+/u6JFPRUf0qt
 L6cDwChy2H1To3AjJTwQP4yHNQoME80ZoUp7+0ZxWn/i+VONjpZcCLYT2ZbrX8T/G6UsY0
 fIUXH0lCRRqmoN1xh/UOqheWxv5/j31v5lfs4fxyKGCG2FogSJJ8TKtzaX9+HQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lBeiBYtx
Subject: Re: [Buildroot] [PATCH 1/2] package/libdrm: link with libatomic if
 needed
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



On 29/05/2026 19:21, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/ea0/ea085cdea8458768c5f0ddb16f618a572406e65a/
> 
> The oldest build error dates back to May 2024
> https://autobuild.buildroot.net/results/8ff/8ff4e16bb79294c5e289989855b5875851342909/
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master and the other one to next, thanks.

  Regards,
  Arnout

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/74926d1dfa331217066129ca169b3416027dd058
> 
>   package/libdrm/libdrm.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 240c09b8b1..cafff8781e 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -19,6 +19,8 @@ LIBDRM_CONF_OPTS = \
>   	-Dcairo-tests=disabled \
>   	-Dman-pages=disabled
>   
> +LIBDRM_LDFLAGS = $(TARGET_LDFLAGS)
> +
>   ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
>   LIBDRM_DEPENDENCIES += libatomic_ops
>   ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
> @@ -26,6 +28,11 @@ LIBDRM_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
>   endif
>   endif
>   
> +# Uses __atomic_fetch_add_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +LIBDRM_LDFLAGS += -latomic
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
>   LIBDRM_CONF_OPTS += -Dintel=enabled
>   LIBDRM_DEPENDENCIES += libpciaccess

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
