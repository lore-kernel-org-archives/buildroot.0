Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355D0CD5BA4
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F272683F11;
	Wed, 20 May 2026 19:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCuUIuT2TG2r; Wed, 20 May 2026 19:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E3A83F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779306439;
	bh=ySlB+bjEB+TFGZd1fUpQK6vFJ5QaVCIWtsndnJpKqOk=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=TGmy13Xxbb3dZkWPDPaoUJ22D/LQt/TYpP3Y+gSpXnN4FPw8iB7JjEPdstfB0uQbM
	 46E2BCLPPtyrZQcjwNRjTitLfP2aGv8ZFoyFIDFjjaOY5rc2RU/T/3a/dZYwsI8NMr
	 ZPmV4vyOqxAeKA66/9Jx8m+imEfUFm7zk6zWPYXJsO8Bac4uL6mO2yN+k/DXYImbOZ
	 1NcJ7t2c5rD09ZOD1RF0CmOdgsjAaPgA84hbdP2+IYPvEStwichAfLuxF6raEFqU36
	 6ZIrHBiq46Tf4GdF9oYEM3UU+rjgZQTe4RMPCJDkKK/LFURvbh9qfZ2vFkLagoS6pR
	 RLu6GItda0/ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E3A83F12;
	Wed, 20 May 2026 19:47:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5DEC1B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BBAC83F12
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRDSJB1ymMJZ for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96CAD83F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CAD83F11
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96CAD83F11
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:47:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44157B97C531; Wed, 20 May 2026 21:47:15 +0200 (CEST)
Message-ID: <a9d2a4ee-2181-4033-bd2c-bc504d3aac44@rnout.be>
Date: Wed, 20 May 2026 21:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260519205106.1059607-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260519205106.1059607-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779306435; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=NxJP4LVNqYKSohfhtYN+aYHaGJaqIb7xfJNDq0L23xs=;
 b=Dv9uF0C5Rcn1ETEPTJzq97Vk8MarO1D0kNQw2v2qXlsb+Gk1ZcrbPwdzY3WykddPYguvjM
 urkA5tyLyXlpJh+wiewkyIadK17YW3PKdYlbbg54CrPJZ20E9GQH6V/sHv28/71e6c/KTZ
 66WsNbKMLVaGXQsEqSu+IO1Swu1xoqHGk3NryOwF046DQhVyh2x17l4WzaQQ5B52PSdvtd
 TJ7IdKxZFzHPmts1oBmDwN4S5ZQpiIO0iET1YIet2sGMuKOVC2GfIA5uZGd/oWlj/IYh4m
 hgbKZ5viZHndca8rzvauAe7cV6WYc4VSGplJLYH8xv/iQMH7qOAJ4O9k4WyWuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Dv9uF0C5
Subject: Re: [Buildroot] [PATCH 1/1] package/memcached: security bump
 version to 1.6.42
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



On 19/05/2026 22:51, Bernd Kuhls wrote:
> https://github.com/memcached/memcached/wiki/ReleaseNotes1642
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/memcached/memcached.hash | 6 +++---
>   package/memcached/memcached.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
> index fc6ad5eb88..f241723111 100644
> --- a/package/memcached/memcached.hash
> +++ b/package/memcached/memcached.hash
> @@ -1,6 +1,6 @@
> -# From http://www.memcached.org/files/memcached-1.6.40.tar.gz.sha1
> -sha1  f2513db7079ee4c6558eb11fabb55e1adf1fdf38  memcached-1.6.40.tar.gz
> +# From http://www.memcached.org/files/memcached-1.6.42.tar.gz.sha1
> +sha1  de453f58745238c70091fe243549c406aabdc3c5  memcached-1.6.42.tar.gz
>   
>   # Locally computed
> -sha256  a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd  memcached-1.6.40.tar.gz
> +sha256  50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7  memcached-1.6.42.tar.gz
>   sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
> diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
> index d3ec9d36d7..a164e82a51 100644
> --- a/package/memcached/memcached.mk
> +++ b/package/memcached/memcached.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MEMCACHED_VERSION = 1.6.40
> +MEMCACHED_VERSION = 1.6.42
>   MEMCACHED_SITE = http://www.memcached.org/files
>   MEMCACHED_DEPENDENCIES = libevent
>   MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
