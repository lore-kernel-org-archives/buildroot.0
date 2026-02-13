Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E716EEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B547841E60;
	Fri, 13 Feb 2026 19:37:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYlsMsP7h8Mv; Fri, 13 Feb 2026 19:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C771441F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011436;
	bh=fs82dML4dm73FW6OWaHbp7g1ezsaUe0fNeVY/ziyuTg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iJAFoBlr+ZtM5TJ3q21eBwkmCDpSG4171emPlCYjr0NazZ3MYCenkVxmsbCG8JxVf
	 vZx4fvqbCWb36UUUvlMd6CJFZ+fzXRgVnzGK6YbWQDhLRs0HZ2inq0m8CNlQgrz005
	 q1Y6lq5BZTKr6aQkwBv6GI9kfnd/4As0+EAHuSHrMKUnNCtFDFLuF7GHad43hQ+2Ze
	 Jh9XQC/oHf6cbuCrzYe2kUCthAqdlLV5JXVeXSb8F9N60edVAQZxftL1ussknhWeQI
	 EzrY/tMtmJyy6dojFpmQvwjpjg/Y4rdxkJyxFNlSKLD9utEnyJo1ojFbnFfLDa1nzj
	 mz1SG2eTVMwug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C771441F4E;
	Fri, 13 Feb 2026 19:37:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F6B569
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E9E41F02
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NZiRqNV-j2x for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC43041E1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC43041E1D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC43041E1D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4834826e555so12801415e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011403; x=1771616203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f+Ue4vHxUOe8UYjQwksa4Eqh2BaBg6czQlxg/dA9r4Y=;
 b=a3oT3ngbizoFdcklRBGoeu6cW6tW3lNpf/hAeADgSrkdG0m6mBEyCMSOvHLcXLYizQ
 fOKBFLnzvRu23ZgGXG2dchIpRaMM4GOEeps+4gYSkGNZyKZxO+WYSwE9f/bncgyiYX7b
 b64T1FG3XldmA8sh65e9isEuoBVj5L88aUUfrdFAisVetFYSFSsq3VoitdnPfp8mY26v
 4E4lxoANwgWWnt0sp3a40TDN6QtVa04RCXBmO8YOAPLifY9yZSIouq9V/2wblCm8beM7
 WpSkoywjx4Nw9k9iFUary4eBCM+reV3zcJjyB4I9bdt3TunJnz+oVQgBcH0/lt0Uhr1l
 ObdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLcdYDpRnSF8cUKAIt63q3vUMzcCu/0RPO7rziSabQ8mh07wGxcq9qcHkPCDVHTAgyMaOMBSe7a28=@buildroot.org
X-Gm-Message-State: AOJu0Yw8MTfBh45/nWweEur34viY9GgWlKkGJa/X08Cm/bCR4Sp7N6dF
 rcEbBL/YxzCXglhnDKNxSwRdTwBuXdh9B1ecZnLPsl1KLW6vNzkIJ/eGjlHGUWnqLs4=
X-Gm-Gg: AZuq6aJU/2BQ8+OmefCN4Y+awGjx7+DdktOFLz3b/pVgvhDoiGYWO3HbU1GuUcc/Dtm
 5dI7bb7I/yFPiHMG5DUZNO1ZmF+LYkVoNTJlVvdIsdEf1KULqPyZ31hKPJgnENf7XkRjUS58NBi
 PnnhQb/5llld9OaLbZfoqPTMT3stobx5eUNXcyHtzIZXo6IxgjwAk1SKsIVfQYzks1aaq/fKbhj
 jLQrA/F/cpzgzAL2V1cmAIhVqGl6y0UvsNDfeLsEeNFG46iEHyida6jU5B7MVzAgKlJuAqw1SiJ
 dFCOHAVw11bRGiAmFNPr40WUjPf3kvGBzGXIsGVrAcoQkt0N8Y+mJvQeK5DvxEflxNE5Ql/koM1
 7AgKA0nOosH8hqqkavMGa4x31XRbVCKNehDjCWriuYc6mFq9Mdqi1Mhc1GwOqsgOjwsZgXUgWI6
 il9N0rNq+yBQPsHLk=
X-Received: by 2002:a05:600c:5488:b0:477:a219:cdb7 with SMTP id
 5b1f17b1804b1-48379b35657mr7160005e9.0.1771011402544; 
 Fri, 13 Feb 2026 11:36:42 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483709f8812sm49436295e9.0.2026.02.13.11.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:42 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:41 +0100
Message-ID: <20260213193641.37894-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204223855.3571710-1-bernd@kuhls.net>
References: <20251204223855.3571710-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011403; x=1771616203; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+Ue4vHxUOe8UYjQwksa4Eqh2BaBg6czQlxg/dA9r4Y=;
 b=Dz9OgFhlH+Enri1oJTW+8wbugOq5g1Un6sE63twY+WXQoyxM2sgLcAcjY8bZhSbyJL
 MPF0800ZYZzCJGZpDBDYv+7Tc2ATFjABxbjIZastKoRd9OPMWcIC8h9hZKsiSFjRRcId
 FMeKYWGpL8SPAsatPZMKtyy66mHb0Ac6mJ/EzKCzi8TbNhMLOQzhlDLrRoknDSjK7NhR
 P5TNgsxWGvIa3ykaygIIG3OZvU5b5MkSuc0nuIeOwMah9HOLl9VSOr4SLDIxYib+Y3GD
 rS7feHoe5vDRtz2zWYxT9zTsiitRsjClmm58Llws55xJApPmHOHUOFZN6NE+kTyoY/5i
 J+og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Dz9OgFhl
Subject: Re: [Buildroot] [PATCH 1/1] package/vsftpd: fix build with newer gcc
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
> Fixes:
> https://autobuild.buildroot.net/results/661/661edeafc949390df397fd40a8035330238cbe8a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  ...ted-non-prototype-warning-with-clang.patch | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/vsftpd/0004-Fix-Wdeprecated-non-prototype-warning-with-clang.patch
> 
> diff --git a/package/vsftpd/0004-Fix-Wdeprecated-non-prototype-warning-with-clang.patch b/package/vsftpd/0004-Fix-Wdeprecated-non-prototype-warning-with-clang.patch
> new file mode 100644
> index 0000000000..ec305bf6bc
> --- /dev/null
> +++ b/package/vsftpd/0004-Fix-Wdeprecated-non-prototype-warning-with-clang.patch
> @@ -0,0 +1,25 @@
> +From 2bdb7ddbfcf6481ed7662d3d4eb5a3dc83d50224 Mon Sep 17 00:00:00 2001
> +From: Tom Stellard <tstellar@redhat.com>
> +Date: Fri, 28 Oct 2022 05:35:11 +0000
> +Subject: [PATCH] Fix -Wdeprecated-non-prototype warning with clang
> +
> +Upstream: https://github.com/InfrastructureServices/vsftpd/pull/6
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + ssl.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ssl.c b/ssl.c
> +index d401203..8826b05 100644
> +--- a/ssl.c
> ++++ b/ssl.c
> +@@ -36,7 +36,7 @@
> + static char* get_ssl_error();
> + static SSL* get_ssl(struct vsf_session* p_sess, int fd);
> + static int ssl_session_init(struct vsf_session* p_sess);
> +-static void setup_bio_callbacks();
> ++static void setup_bio_callbacks(SSL *p_ssl);
> + static long bio_callback(
> +   BIO* p_bio, int oper, const char* p_arg, int argi, long argl, long retval);
> + static int ssl_verify_callback(int verify_ok, X509_STORE_CTX* p_ctx);
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
