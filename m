Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B27C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D6240AFA;
	Fri, 17 Jul 2026 15:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLHqAetZC_af; Fri, 17 Jul 2026 15:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284EE40B4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303234;
	bh=Is+Z6Ohm7i/wpOEFaIFiYElxTC9jqbJyok9bPOGHWEQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WukMmPoEv905awnWjtj4FeqQ/hclmRqdi1Z5UE+CEFmpqHCQXKNhCpm8XOb/pjPUp
	 0olqmAjEgaqkXQ7agE1eu/tTE73X+Jk88kaAdc1aUv+eqFRh4MyDGqbRvRMVtWjNUv
	 BeFl4KCaZQlCV+xMRiThtd1gQnGD+oa5k1bvN0d9sfAJ83czm6lJC0gQunApKV4P3l
	 D1a0tT2I0WBhdb1bx11JXZf3YaD2sxlmhvNk6LbLgdZvuOZGcLd+wl/+IHyUaQcMFn
	 XAr7cwaNV16PMUBboCmIQaoqK5J5yhISNtYmpNodQ4l4Aa7QCGJ0rj2fP+HebEzGLp
	 Rps0TuMtkihJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284EE40B4D;
	Fri, 17 Jul 2026 15:47:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 984451F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E71D8115F
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfY6GrjxgB2m for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6827181179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6827181179
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6827181179
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49545ba3d4eso8457985e9.3
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303229; x=1784908029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RFCIUz/7+lvFueHd+Ji9MSBMow8JCUSaeKiRZ6n8HZo=;
 b=Gni7y+cKHaYv1KQoLhJxARDeGpEA7H4vrOhJed3pK3HprdAQfsem0l8Q4xiMQKyH4i
 AkZdqX2Ww+EyDKWOLYE/vjYIMOEzeyilqSpL//oX8WxGwG3AjlLASHqbOqP19EAoYPJX
 p77hmv+aMaMWYs9BzkmwtGD+hqgMNkhabjeG3vkiujezc4sm+egT0DyYcTQApg0oVJzk
 Q+0l/V6BcENAiSYFfVRsNts8diSwQYWcTtUstoKvKqFzrv8Tds+HGU1A4W0mZnSoPYUy
 sSTN1S4JL1vlmanP5uMnD6UFS8UcOoO6wgMtKxwWguL7R4HkF8JHa07xNG1uin0EpOZR
 9c3A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqSNWbpa/a1M4M4S3IKnacHEiiWlRjrjG9d0a9dB3HQZHCnigRe36sUSmF8OHhubLzYIq5jrgUS64I=@buildroot.org
X-Gm-Message-State: AOJu0Yw1a7Ab4KlzS0baLlyBJW3QsFVJBrAcWPorTiKbRjhn+opolxat
 QvRShAitHP5Z1TT5LmbV3pa03QWSQykKoaTbpO+thzoxN6PGIr/i9AQFwm1mQqnjKJMHOgA9QU8
 DpW3s
X-Gm-Gg: AfdE7cmB8X/F3MWxrN1bNw+YAUQc3xeqlT9HXMLYelCi9uvn7SZW3FgSWZYlNrkNbxi
 lu6YSDD+jyNs2871HXb5UfYOzzdyJeJw8IfB+yDE2eADcRiFHM1D/7psKrcc5kXTvq16J4apwV3
 YiA2JPYHiTIZxiuxL/w/WaXBI5uWELXi8afA101Z0XzP/zhkQy8gl4kWdBVr/FH4AbWh+mobpph
 eCDxbuvmv842yc/r0nPrYu8rfmdNTujFRRRcAS+Pd0bjkTmSBoJWLYfec8U5s7eUGNcIoYiRFG/
 70uX128+bb8tXvjctF28hsV4uQC4TAae2M4j8m0cVi5tE4kDodqWvhk5f73pnigQS/B0IAJdZ8z
 kYQP4M8Q0eQaAOceW6InlJIaZU76N88BTjVniCAexyNNhnQ+EW96AUFPZeLQkJDBHdOGBudU=
X-Received: by 2002:a05:600c:524b:b0:495:4df3:5187 with SMTP id
 5b1f17b1804b1-4954df351c3mr12124405e9.4.1784303228919; 
 Fri, 17 Jul 2026 08:47:08 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2a2504sm62191755e9.2.2026.07.17.08.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:07 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:07 +0200
Message-ID: <20260717154707.191369-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706173349.2555859-1-bernd@kuhls.net>
References: <20260706173349.2555859-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303229; x=1784908029; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RFCIUz/7+lvFueHd+Ji9MSBMow8JCUSaeKiRZ6n8HZo=;
 b=eUx1avfv3OatEBr6SnkFAYmKkNJkRBq8aXoCSAxF+CceN9/c1PzrZtKEtdJlSN7WdJ
 nWTbaTY/X5FAm8xD0tP9M4mFAlCcLvswIOtb4l2yldJCe9nva6iGPQw595crzkGtboKn
 PkABVeC/KG6RsbNSvZpTJ53ETcml+Qr4lbNwTWv4uSlexMDC0Wiw5oGVwbsUL+nmFJwj
 A4KewRWu8Wvs4byZrlVu/Iwdk5Asea4uw6UG8853JcjBI+lBgYwEPgrJDTA9MdrFpKc4
 oCrtQC9Gle5XNgJM6Mirl60W+F2rGpiIi190xCX5owWULLlubYtO6GZvzPqizsHuRlH9
 wflA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eUx1avfv
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: security bump to
 version 10.4p1
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
> https://www.openssh.org/releasenotes.html#10.4p1
> 
> Changes since OpenSSH 10.3
> ==========================
> 
> This release contains a number of security fixes as well as general
> bugfixes and a couple of new features.
> 
> Security
> ========
> 
>  * sftp(1): when downloading files on the command-line using
>    "sftp host:/path .", a malicious server could cause the file to
>    be downloaded to an unexpected location. This issue was identified
>    by the Swival Security Scanner.
> 
>  * scp(1): when copying files between two remote destinations, do
>    not allow a malicious server to write files to the parent
>    directory of the intended target directory.  This issue was
>    identified by the Swival Security Scanner.
> 
>  * sshd(8): when using the "internal-sftp" SFTP server implementation
>    (this is not the default), long command lines were previously
>    truncated silently after the 9th argument. If a security-relevant
>    option was in the 10th or later position, it would be discarded.
>    Reported by Steve Caffrey.
> 
>  * sshd(8): add a documentation note to mention that the
>    GSSAPIStrictAcceptorCheck option is ineffective when the server
>    is joined to a Windows Active Directory. Reported by Yarin Aharoni
>    of Safebreach.
> 
>  * sshd(8): DisableForwarding=yes didn't override PermitTunnel=yes
>    as it was documented to do. Note that PermitTunnel is not enabled
>    by default. Reported independently by Huzaifa Sidhpurwala of
>    Redhat and Marko Jevtic.
> 
>  * sshd(8): avoid a potential pre-authentication denial of service
>    when GSSAPIAuthentication was enabled (this feature is off by
>    default). This was not mitigated by MaxAuthTries, but would be
>    penalised by PerSourcePenalties. This was reported by Manfred
>    Kaiser of the milCERT AT (Austrian Ministry of Defence).
> 
>  * sshd(8): fix a number of cases where the minimum authentication
>    delay was not being enforced. Reported by the Orange Cyberdefense
>    Vulnerability Team.
> 
>  * ssh(1): fix a possible client-side use-after-free if the server
>    changes its host key during a key reexchange. This was reported by
>    Zhenpeng (Leo) Lin of Depthfirst.
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines show no new errors introduced by this bump:
> https://gitlab.com/bkuhls/buildroot/-/commits/1a2823463ec674dc95d73cb0469e49ab218912fe
> 
> bootlin-powerpc64le-power8-glibc which was broken before:
> https://autobuild.buildroot.net/results/507/507cb5458e29499ad1ab0f07b2401dd707954c2d/
> 
>  package/openssh/openssh.hash | 4 ++--
>  package/openssh/openssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index 2d242b4a99..297e1c95a1 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,4 +1,4 @@
> -# From https://www.openssh.com/txt/release-10.3
> -sha256  56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4  openssh-10.3p1.tar.gz
> +# From https://www.openssh.com/txt/release-10.4
> +sha256  ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238  openssh-10.4p1.tar.gz
>  # Locally calculated
>  sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 8f46d886dc..2f3088defe 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENSSH_VERSION_MAJOR = 10.3
> +OPENSSH_VERSION_MAJOR = 10.4
>  OPENSSH_VERSION_MINOR = p1
>  OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
>  OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
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
