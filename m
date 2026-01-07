Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB409D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C8E822A9;
	Wed,  7 Jan 2026 17:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7A2_cD0d-kRC; Wed,  7 Jan 2026 17:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 078BA81339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808179;
	bh=BnCS2sFvqLctNKN/2ABfHOyj7p442d/uCdYrqhF9QQ4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qnen5YBfCB4Y+xi3GRJKw3QFUmBS73wq5K1T61s5e1pppukFUZqf3ifB2JeGAN9Ru
	 x25AoOMD82zvpdoSjqw7x3cRQeaIH9yAZlwGF9LOijWE9ZWTBKqJLpVXovNKapuNQy
	 NFQgf5Hi4p288v7QyVFmsPpdrfUjleNuHMY84qpeXea8Mh7zw9gJ3sA0EFt1cfN6qK
	 s35Nc/62QfeBpnXnMJVRRGuZwC8zr7QCc2xK49BWnwPiQ4puHPZIWHk2cdixbMwwgb
	 VC/SBc0/ZHoVsfpick+x0ZAIXjzk0/B49d30SFpjjXyLnly9aMZm6I78oyZtPIrWlh
	 fyznF88hv/Q0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 078BA81339;
	Wed,  7 Jan 2026 17:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F5C69ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30C9681C18
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zSkGK80JcVYX for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9453F80FAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9453F80FAB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9453F80FAB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B6574B97A192; Wed,  7 Jan 2026 18:49:33 +0100 (CET)
To: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:25 +0100
Message-ID: <20260107174931.225263-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217-pixman-aarch64-neon-fix-v2-1-e0889825b157@armadeus.com>
References: <20251217-pixman-aarch64-neon-fix-v2-1-e0889825b157@armadeus.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808173; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Bf/Ni5AL9uU+ra3aTyT/5I43zT3BFG1fiNp5z1b0+e0=;
 b=QJ60R7D7k+1FzG8Y+ea0FzbaJBQKN+Thshrg1XurdMb+l7rJNjvI9Kwca1OpG1fBYYJeBH
 uIzym0pmxVux7A2EkBc9wgP/GayoCY8FK63t5t4Sgjq22kTI4f7KJTGWoXsFCC+RbQ9T2/
 DDd/cNQZqWLfIW5DGPYQzLSWQQgvSTeHsPIilyPUXK6t2M4nUFaDuhZ61nwMuaOeQbjZlF
 E8hGLSCaeWIIqJLz7F5O6H5GRlwYytm1iAy6wSPmAIz54YQq5rW7DX9SYjMXUFh+xh4AAc
 kIkDNCUo9ygvT67hjHpBAuvLce72b+8yjacNpAznwO+cwxj6yD6qL2BFWmrbsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QJ60R7D7
Subject: Re: [Buildroot] [PATCH v2] package/pixman: fix NEON support on
 AArch64
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
Content-Type: multipart/mixed; boundary="===============8104438385064009450=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8104438385064009450==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

In reply of:
> The test to enable NEON on AArch64 is as following:
> 
> ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),yy)
> 
> It cannot be to true as $(BR2_aarch64) and $(BR2_ARM_CPU_HAS_NEON) are
> mutually exclusive. NEON is compulsory on AArch64 so remove
> $(BR2_ARM_CPU_HAS_NEON) from the test.
> 
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> Changes in v2:
> * fix commit title (package/pixman: instead of pixman:)
> * Remove "cherry picked from..." line from the commit log
> * add "Backport to:" note
> * Link to v1: https://lore.kernel.org/r/20251217-pixman-aarch64-neon-fix-v1-1-3a6aa820097e@armadeus.com
> ---
> Backport to: 2025.11.x, 2025.02.x
> ---
>  package/pixman/pixman.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index 1b66b4171925..87d973230f78 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -68,7 +68,7 @@ else
>  PIXMAN_CONF_OPTS += -Dneon=disabled
>  endif
>  
> -ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),yy)
> +ifeq ($(BR2_aarch64),y)
>  PIXMAN_CONF_OPTS += -Da64-neon=enabled
>  else
>  PIXMAN_CONF_OPTS += -Da64-neon=disabled
> 
> ---
> base-commit: 17d83926032bfa69293b994473e599159a0fc8cb
> change-id: 20251217-pixman-aarch64-neon-fix-16fec6b7b0ff
> 
> Best regards,
> -- 
> Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8104438385064009450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8104438385064009450==--
