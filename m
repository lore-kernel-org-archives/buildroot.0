Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE37CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE67616AA;
	Thu, 11 Sep 2025 19:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4o9h8DG_dQj; Thu, 11 Sep 2025 19:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A27B86F482
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A27B86F482;
	Thu, 11 Sep 2025 19:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91AE9E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 831B284AC6
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ouyPIrXAyWui for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A404E84ABA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A404E84ABA
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A404E84ABA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:21:20 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b0787fc3008so156587266b.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618478; x=1758223278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ADe2Ptzk8DTh6/4tg4P5XpIeEVYFlLHWYkEh8TOMeU=;
 b=SflsO1udhAeVvIB9z2BWH/f1nM641depPWo3ZnaKQMxiRQZs6A3xVghJDfbdHuGGY8
 AhPagOUrRgHlBdTyuq0Z9e2gTBfeyhxDoVIc5GaA0IXC0X/6KolH24GMZEed/N2lw/Du
 Olie54AZPoJbkGigvC/XZPLlFzA7r10nZp1Hq6lKJGVOExwLv8Y1FF8JKebfLSK50nYf
 Rv0n3TiZs94kEK8zAcbKwYEJU0k1GivhWmIvjrEpf1d3wUB/qljaCohpz3Co8UwB2x2h
 YTUnq2vQ4eEKvcw+s208hTdG/n5aelE7L1pKt4GCxG06vTERYJ9rEpjE8oFCmdru/1GO
 DdbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg4Zh9nk7zyqhPVBXGEPfSq+mzWLtXIY6oxqCFmIjNOPwzU7crSIWBaBBgpvWJsiThABuo+ADQrZQ=@buildroot.org
X-Gm-Message-State: AOJu0YwLN+o/r6x4bGeNTyuZfuu0HOVyDbcz2gfwh++E2grMZl2JmH52
 4HO6N2L9OOZp4YvfobujIjD7RvRLgIjQsOQzG1prV1TVPEbi1zb5G2lgchwRXujURGc=
X-Gm-Gg: ASbGncvFRiDpLufJ1hKtYr426eFo3beGCcS52tUhcoKFUgzeKW6sdkNz4sWEEP0ZOzQ
 8f2xei3mU/f1BFornRDhG+7M7JS1aiSQo9e1mQ6Q3I3BAWE0cL0M5ritjOPrQfmKIU75rE4eU/r
 zbEd3CVVR/dy3ynWpeERHjzE1d6FpntL8efL/EVL7r+zvnM/qqLidF+6XRCXQ2Oik/bgVPCMtdP
 BrNfvk1IPsfmZ1ogJydGXMt2Hi7W/1ueJKozAW1T8vFyAgw5LQY5PgrTcNdfnJFsom5J2I7TdWE
 KBKggk9Lg9/m0SETnJMtop2d8RsUdyKUwQSAYQ6MMt9Oyhn6uiP3PP6uk/1q8/mu6TGCghI/mQX
 m9+kNIozaKufyqj3S4YS5wQPkMeBZW2aYzBl5CuKt1YLchA0=
X-Google-Smtp-Source: AGHT+IGELstUw+4OQteqFlmXSDBpp3z/eIWP5IzAmhqTRZfUVf2ZB7irf9u86d6XVpGD4VcHnKdJ7A==
X-Received: by 2002:a17:907:7287:b0:b04:70f8:d454 with SMTP id
 a640c23a62f3a-b07c3878bc3mr27659466b.51.1757618478485; 
 Thu, 11 Sep 2025 12:21:18 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f2098sm195402566b.74.2025.09.11.12.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:21:18 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:20:55 +0200
Message-Id: <20250911192055.2671448-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829124017.2910174-1-peter@korsgaard.com>
References: <20250829124017.2910174-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618478; x=1758223278; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ADe2Ptzk8DTh6/4tg4P5XpIeEVYFlLHWYkEh8TOMeU=;
 b=WK/S52eeE9IAyubhnrMqb9rOM4OcflGTX3gVr/2+qXixcacKFAR4rYw3RafaozEEkV
 rS+JHRrykrJ3R91FXe21I+vypLhQ4+C+6mP72yvh3CA6a9Gv+ujwKYNoAFq+wKKnu4Z5
 SziGTMDB0n3udSQQFxglvQZtYgcP8s29AJZUdW0hycU2znQWK3EaeWn4xJO+R5kSpYD2
 Co8j2iPDLX316ZqUKElFp7axaceD8o93snVdLbqkDufwWV9FbdXigJK3zggRj24MbpAO
 z7F4Y9rgRbIkvKZEoSIBnzO4ALe0Ry3HFvYSMSYZQ6yIY6dJ4XXJaaDQKp0PnQje7rg3
 ikCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WK/S52ee
Subject: Re: [Buildroot] [PATCH] package/ecryptfs-utils: ssl support needs
 engines support in openssl
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
> Fixes https://autobuild.buildroot.net/results/f32ae62961aac7e8344f4be109040e7de2eb415e/
> 
> The openssl logic in ecryptfs uses the openssl engines API, which is always
> available in libressl, but only available in libopenssl when
> BR2_PACKAGE_LIBOPENSSL_ENGINES is enabled, leading to build failures when it
> is not:
> 
> ecryptfs_key_mod_openssl.c: In function 'ecryptfs_openssl_read_key':
> ecryptfs_key_mod_openssl.c:305:9: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
>   305 |         ENGINE_load_builtin_engines();
> 
> Fix it by only passing --enable-openssl if libressl or (libopenssl + engines
> support) is enabled.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/ecryptfs-utils/ecryptfs-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
> index 6eb3add98b..03e7f3e34f 100644
> --- a/package/ecryptfs-utils/ecryptfs-utils.mk
> +++ b/package/ecryptfs-utils/ecryptfs-utils.mk
> @@ -32,7 +32,7 @@ else
>  ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +ifeq ($(BR2_PACKAGE_LIBRESSL)$(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
>  ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
>  ECRYPTFS_UTILS_DEPENDENCIES += openssl
>  
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
