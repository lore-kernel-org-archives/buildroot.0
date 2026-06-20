Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE772CD98E4
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6534C4EE22;
	Sat, 20 Jun 2026 09:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biR9BVCBJ9sB; Sat, 20 Jun 2026 09:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E4364EE24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946620;
	bh=G5lnoYQ0KVh10lLqTxDOp30M932i3Hj22e185E1jByw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GPKdUfrIN4UpWHH/kJ6W8l+9IgfBhOkpcMvyqVyCNzD2Y5qc9uz7oYUjIdFkJh1SE
	 P2jmAlOdKEt4GrYdgXJ442kHkkl8B2UOJvP5XA7WH5QFr262xsLWgLJ90mHGCKD8Q3
	 mGJDglwDjklF64kqsUllSSbs2oGl0Aadw2Lg1TE5aW27wfiBrbJLI8usoQlf6mtYdl
	 FFPppBEENE0BrSKDwGT8Jcw6NdXedYjJjGLhaJYL//3VIPv14dpJp6L5/bSEw/+wtZ
	 sF2mPL/Evm4f1H7vEGMUM4qUFkuu9lkbXZnu/llyddt/5Vj1lp7nPRV+SlqC0BIaD+
	 Ar73bk/vzTLvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E4364EE24;
	Sat, 20 Jun 2026 09:10:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97DAA367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 897A34EE24
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7FGnXyMXmOU for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:10:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E81254ED87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E81254ED87
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E81254ED87
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:17 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so23432915e9.3
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781946615; x=1782551415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pRzA70A4pK4ja2kGV0U+StuoVzhtTsj9Do38FxCc738=;
 b=LHEOWTkQm11f9QykMmcdsEROsYvhDSbANo6+Io0TrQ7qMYxrh+1Fu8WtsVPox7MHZ+
 2JMPpwskogBtyjGPerdc0dXVPB4tMo/rHfurWNPBxyCo7eGfmrPSN9qH1LOSEjfZB4kM
 Q3XrWI1ArnCGqyAvTWGk2H+vqiu/hLb1Vyqzn8dJrHdbVB1NZuhGt7n3uTTuamgCqotE
 UOhXdPNzamaGWcODhODpdRY/Hbuw0DYkMr1KF9w0OFE1IyhwQzfS8+S8bDE6T1hb87M/
 qKtYAcd/qV+tLUce/2WxYvW7s65g5iw98jPGcNQu4GcNYRmuhZqNPS9Jpe7gt8+vDApw
 subw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/60Lwx76V7AGUo3tQc7teJotXEWhwqZBOSuEFoun2i2Ufsck++qC3JZzcbsHznij0Huau/7cj9UsI=@buildroot.org
X-Gm-Message-State: AOJu0Yxso8zwOae3QX+TSd/NDTPAUddvH5gZhJNgeRaiQGvWqtaXcloD
 AHiZaXEPdN2svcXtfxSbX9X+Nw6zLIpqIOmwx9f4vRaS1qP9nPIofKzHRZ8EWreld1w=
X-Gm-Gg: AfdE7cmr6YdlSNtrKEedt4IJ8F47wUfUsXvRVOWynhiOOn6s7nSk1B3wM85lLuDKLwD
 O1USK0YMT/WBugVVRqcNAR0C7XoA98pq7ehVnZsuBPgdDKJgSbwxm3knsjqWhtlMYXjPpLk4vnf
 XlcyhSkD8wJF2hlRF50bzBtYd8uSEY/T9OJx8+AfQtqW8bZRYlpw8Mdr70Vu2t5RpW7x7Poqb7b
 IaAfDvCwMf66TCvlh+hA1EJMztLryqY6r7nK3Hk+jgPoUds75NXVTSkPA0NIuMOUkRRKLttYx2y
 O3KbIwl2gXBrM9YZScwdq3WzQ3XGjBC3XOM5nyDPWCLEMkfTfCasAStd0C68NHPes3XI+K8MU2n
 ihnmD76FVL+edmul7tpkQbgat1iAtskL5n/SHn1RGhh6Yv6tvhWb5YJTVdD4BE/46NMbcqDZ43r
 HQFV7Z
X-Received: by 2002:a05:600c:4595:b0:492:409d:b7c3 with SMTP id
 5b1f17b1804b1-4924233ef28mr84446355e9.13.1781946614983; 
 Sat, 20 Jun 2026 02:10:14 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666c57902sm6437305f8f.25.2026.06.20.02.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:10:14 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:10:14 +0200
Message-ID: <20260620091014.21698-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608223810.957196-1-titouan.christophe@mind.be>
References: <20260608223810.957196-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781946615; x=1782551415; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRzA70A4pK4ja2kGV0U+StuoVzhtTsj9Do38FxCc738=;
 b=Oj8DKEqV+s2gclH8KV3kzeeUVulOBsf2wBEwnqqeb8S2YqYBANWqivbMrC3U1f5SWe
 mnK8+HfDO30y1namhNR1MJXkyPTkoMZoZIR+ssK92a6LoG3LY3CgDsWpSqUUNm4ktYnO
 1gsieYYosp2s381qnB+MDEg8fqn/IKAnxUL360qFVHxzHcaUuyiRfXrMaxiJFIjd1nUo
 ZGIW7goCosqeI/yrYzuia3GRevtxfK/eLRAf9m3GTvRevrxl6TvxLCSvpS7A0YsXKU7D
 Nk7GZ2AwWqk0xxbtRp9d4N3vQG5qBM7vFXqMPbUN4PrgyGpq72bujMSSiYMhdPU8GJCS
 0FVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Oj8DKEqV
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump
 to v7.2.14
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> See the release notes:
> https://github.com/redis/redis/blob/7.2.14/00-RELEASENOTES
> 
> This fixes the following vulnerabilites:
> - CVE-2026-23479:
>     Redis is an in-memory data structure store. In redis-server from 7.2.0
>     until 8.6.3, the unblock client flow does not handle an error return
>     from `processCommandAndResetClient` when re-executing a blocked
>     command. If a blocked client is evicted during this flow, an
>     authenticated attacker can trigger a use-after-free that may lead to
>     remote code execution. This has been patched in version 8.6.3.
>     https://www.cve.org/CVERecord?id=CVE-2026-23479
> 
> - CVE-2026-23631:
>     Redis is an in-memory data structure store. In all versions of redis-
>     server with Lua scripting, an authenticated attacker can exploit the
>     master-replica synchronization mechanism to trigger a use-after-free
>     on replicas where replica-read-only is disabled or can be disabled,
>     which may lead to remote code execution. A workaround is to prevent
>     users from executing Lua scripts or avoid using replicas where
>     replica-read-only is disabled. This is patched in version 8.6.3.
>     https://www.cve.org/CVERecord?id=CVE-2026-23631
> 
> - CVE-2026-25243:
>     Redis is an in-memory data structure store. In versions of redis-
>     server up to 8.6.3, the RESTORE command does not properly validate
>     serialized values. An authenticated attacker with permission to
>     execute RESTORE can supply a crafted serialized payload that triggers
>     invalid memory access and may lead to remote code execution. A
>     workaround is to restrict access to the RESTORE command with ACL
>     rules. This is patched in version 8.6.3.
>     https://www.cve.org/CVERecord?id=CVE-2026-25243
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index 9e5be53969..055276a270 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  b3eeef15ea90a41c568f1f97a78d3370400baad55566869bbbf1af9f9106d85c  redis-7.2.13.tar.gz
> +sha256  21326da3f66c0aead4c8204c0ac52ff905337a77cadd169f75ac22835ea30025  redis-7.2.14.tar.gz
>  
>  # Locally calculated
>  sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index b9702eb6e0..62f70b352b 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 7.2.13
> +REDIS_VERSION = 7.2.14
>  REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>  REDIS_LICENSE_FILES = COPYING
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
