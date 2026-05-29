Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BAACD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1F8615F4;
	Fri, 29 May 2026 17:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zwo9Zv-g_k6W; Fri, 29 May 2026 17:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11BFC615FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780077380;
	bh=CCdeDiDGXX471Qf5JDaBwiCgRqCv9rKa0u2qGlXDl3Q=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mu0LIGypJfFCufLAhRAF9OdMdrX2rw8vfbUqdStoVBdl/lV6qBpHtubo1cQwhU4zq
	 0nA75igtn3X6n5PdqQWcdv5yA2EoN9wE7hrCkWcrHPCnuzn1PoMg7A6LBkVaTlXWXU
	 aJtAzRGjItztHJ0xhjVyvr4MJmyy1OL62pPjM7HmYIp1geM2InDfpNYDBOwKsHEGgp
	 CNRpZJr2E34bx1yAb/LyAPWj5sRZqcuHYua3RasFpRY5aeUqqQdsAhrs+OFMxNJRj0
	 /LUEmh5M7PEW/moiQKu8we3A6M60XtOxzldqoh01m4aJSzWwXig8BuBpK26zwJN+Ri
	 0ZLhJTZKB34gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11BFC615FC;
	Fri, 29 May 2026 17:56:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19262F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15DE140431
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIBAtGI2sVtG for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FB0440348
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB0440348
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FB0440348
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C2D1B97C44C; Fri, 29 May 2026 19:56:15 +0200 (CEST)
Message-ID: <caf8baa1-eaf9-4e3a-aac2-d7d234d795a1@rnout.be>
Date: Fri, 29 May 2026 19:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260527184641.3533110-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260527184641.3533110-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780077375; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=zZMvshRKdNcdJM+127adZZhfP1DesLBaP+gyrCAsQe8=;
 b=Me4jTXjc6F0E7yMqzwBlyik2gjysGPLWR9K8DGDQWmBxTO/TmTSzcRhszKEihkx2php6jp
 0mIHk96fD0rBPyiyPlby3Oz1mRowwjKq8iDZgKe+3FH7Z2dgLXMzbTehqQp4cKaNP5E9Lx
 rCWzlPv2Y+Dz+URpwU8dXEeA/nEnG3WSS9HJerV79QJenRYGKkA7rt07QDezZDVE8fZaBH
 wjDxKeBsb9hzkCxdXEKA5b7jaKcmgpidJk4rMVCGhMfdWLwv/vfs1maCx0A1rL+5wK9VoH
 tbgXjvEAbj6rwgybcHQCZK0cVhVHdcAaIZXBFLj22ttwQ4rSn3XTy9EnmoE0qQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Me4jTXjc
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ustream-ssl: needs OpenSSL
 ssl-trace
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



On 27/05/2026 20:46, Bernd Kuhls wrote:
> Buildroot commit e1050a3a50886c72d3ff2416dd8db2fe3c389973 bumped the
> package which includes upstream commit
> https://git.openwrt.org/?p=project/ustream-ssl.git;a=commit;h=956fba242ac0a4bcfe3db103d4d1f41545c924fb
> that adds the usage of SSL_trace causing a build error when OpenSSL was
> built without ssl-trace support:
> 
> /home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:
>   In function '__ustream_ssl_set_debug':
> /home/autobuild/autobuild/instance-10/output-1/build/ustream-ssl-5a81c108d20e24724ed847cc4be033f2a74e6635/ustream-openssl.c:490:44:
>   error: 'SSL_trace' undeclared (first use in this function); did you mean 'SSL_write'?
>    490 |         SSL_CTX_set_msg_callback(ctx->ssl, SSL_trace);
> 
> Fixes:
> https://autobuild.buildroot.net/results/17c/17c88282c32f2edfa0991e0e10cb45013c947be9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: added result of Gitlab pipeline
>      https://gitlab.com/bkuhls/buildroot/-/pipelines/2556948372
> 
>   package/ustream-ssl/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
> index c328a6ea12..6fc54f3bef 100644
> --- a/package/ustream-ssl/Config.in
> +++ b/package/ustream-ssl/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_USTREAM_SSL
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
>   	select BR2_PACKAGE_LIBUBOX
>   	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE if BR2_PACKAGE_LIBOPENSSL
>   	help
>   	  ustream SSL wrapper
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
