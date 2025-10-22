Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390D7CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EC0840785;
	Wed, 22 Oct 2025 16:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-a7TPciJ1G8; Wed, 22 Oct 2025 16:42:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4179440BED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4179440BED;
	Wed, 22 Oct 2025 16:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 277FD70A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A04540BED
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6oT3W7u-yAy for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:42:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18D1240785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18D1240785
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18D1240785
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F220B979195; Wed, 22 Oct 2025 18:42:53 +0200 (CEST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:42:52 +0200
Message-ID: <20251022164252.285787-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007210514.3784984-1-bernd@kuhls.net>
References: <20251007210514.3784984-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151374; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=AQgOiqHCg/ovr9QMSah7fRDmdO77NQzgkTcYlgyyGcI=;
 b=WVxxpepbSGYAdU6Y2hpin9/eCE7B1G7GIKFLjxYKkYC4Ohfk3UYDiyy9co24NJzf6QNClE
 eog2PJgaE0mneE3qI9tKsQiJj7qBkjVkcrW32LBXHS6QsDPEmgQ4tFgjJVHEVf5ijRKv7H
 Qf4wg38zilOvYEuY1aub8erGkkq9yY+3cb4TocmpWeXhDVlqk8mP6me/0/EG8KvBe79Ulc
 +pCjbuNl6jBg1MXKQ5wgRszX39dB1Cz1SW+bPMWBgfCXbTUiDfrLhMM/tGzMKo4j3Hxd7G
 dT4Sps904K1dloqHWrabFCNyUmlzODVPzVO+iunYRfm8H3KGr0ootNFs1WR7hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WVxxpepb
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix configure options
 for GnuTLS
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
> Buildroot commit fb5fb06ee5a886df5036c5c5e6c4536f2bc8e1c1 bumped libcurl
> to 8.16.0 which includes commit
> https://github.com/curl/curl/commit/2f6524ce3c3a8231c62d1e0c8af509fe5b0228a0
> to limit the use of the configure option --with-ca-fallback to OpenSSL
> causing build errors with GnuTLS:
> 
> configure: error: --with-ca-fallback only works with OpenSSL
> 
> Fixes: https://autobuild.buildroot.net/results/64f/64fad87dddecda1e8ff6b0a9abc0b827b5136e4f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/libcurl/libcurl.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 0aa88044bd..51b8c4d147 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -68,8 +68,7 @@ LIBCURL_CONF_OPTS += --without-openssl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
> -LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
> -	--with-ca-fallback
> +LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
>  LIBCURL_DEPENDENCIES += gnutls
>  else
>  LIBCURL_CONF_OPTS += --without-gnutls
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
