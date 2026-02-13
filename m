Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006B9EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64AD61691;
	Fri, 13 Feb 2026 19:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4dLVQ3zFZ61; Fri, 13 Feb 2026 19:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD5C861690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011531;
	bh=4H2WLmNY6Mywl5F7Xae/POUi79M1SQn1n0iXeDbgjZ0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DQnfCmfp6+fx1wQOgI0gzM8sA9oTUUXzx1JcZfJfUygFjPzaAzYWqX1Jx+wLIeQcC
	 HMMLmAcTj9iVhy/lQ5DxEBKSYHbSEiFKq02/ofEFtXDlOp6DFsFVr4FefzObcH1wN0
	 bk5wq08RJjTiUA6+VwRljvpaGhBN2HQz+SDQCerIp/bdytRutBsEcPCEDop7Pfndf+
	 ujRW7XUe811Ce2SCMJCq7EprF9xurbJZtRlYGZcH64P32JObI4H2EWnxDuUpNmBk4T
	 QBdwXE/q+235inPYmvY7F+sgkmjqOPfGSr1Uvya9qyjW2lS+PK5tqsvBSJTqz/g4CF
	 2bpDMyNJSxbxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD5C861690;
	Fri, 13 Feb 2026 19:38:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78AB3EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B04B615F0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dgcxzhmfcb7k for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 471F4615F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 471F4615F9
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 471F4615F9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:48 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so9685395e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011466; x=1771616266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CpldZzada0WVDOqyd48t425fnL3/+K5357oCeU3+xRE=;
 b=iBcsmmGlYr8AY0PPoGkJwv5KjNF0kNyz+GX69HLZlgwHn4BioX20vYr91IWb5k4+aH
 /NLcrVOG8UfpYTWtidTx/uxi0COTdEtoKAkwtJPZWW0SdIsuiEtVuvGSoCCacRiLlOgW
 gAIOKLnHRC3cx0HwuMu+X4d92K6Ym3ydC5TW6XBkTlqP25KvpOOGBz59X1rWyw66PxtN
 SZ3+tqoZTwysxJHwlpfMyj9oCIjTom8iGMwhUM2cs5PTlIwL15XXn3kQUJGrWW4GzFb/
 bao+S3VqtlHlMCQR4jc3+jyh5JCNTfNuEvuXyrzLyhcHQBisWxuuIsYmeindLXeC16lE
 WaZg==
X-Gm-Message-State: AOJu0YyYJxFq2nbG53oPuVr2xWuIgIyxrur3eCt0X2DQuerg4aMnsDpW
 VNIT4tK3fFQXEbS11KTGUN31EJxWNuNsb1Ah+3plZxqv2fA8Sn5kZKJVdeqfUP25UEA=
X-Gm-Gg: AZuq6aJp9egrfSeqMITZLXBOFdCS7bjJ/VeERsOdZ/lUKkQetNC0MQMEJy5qQRVCZZH
 tRdGo/L9MaN7fHoUVNl6x6PuWBGdciYGb6KNnnu+yQYFqDwqrYBKCFDJRJGFN1xGxCg0IUg2RV5
 EtbGc31AZJssB+RtvvM3otcUKQISg2e5ZKBCNgWzlsbWh31gsWr9BASB1fvb2qcsarwszMMYs30
 YNSUBJmRVI3K/1gJHVQ/npXMW1i1He733PeGYJGUcYIej0s0dHXSz+x1yxKib0Xc4Xy1eSxc3Rl
 NNN4JSw2+Omikol8XggD0eZ8v66vi3sWMXXHsuTCR+zfpl0SaN6IYV01RQS+AjpxvJupXG9W6tA
 a++WA0lkyUny6QTd6FaCC0nAjI6VBhKk+0TWJk2+ICYruDoGNYGLpT6qj4GfmgJSMydYNaVjdik
 ZYaNT0QDldUqpegZo=
X-Received: by 2002:a05:600c:4e55:b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-48378d958e9mr26267175e9.11.1771011466340; 
 Fri, 13 Feb 2026 11:37:46 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a1c2sm416524165e9.9.2026.02.13.11.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:45 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:45 +0100
Message-ID: <20260213193745.40575-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-1-thomas.perale@mind.be>
References: <20260120082405.46683-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011466; x=1771616266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CpldZzada0WVDOqyd48t425fnL3/+K5357oCeU3+xRE=;
 b=KVzRE86UKoWCLBHoNyjQqxkyb3KWIqDFxUeTqiA0VJwwzyCNSwpmfaDegu2y5OkArL
 eQ+NjbaOoDWgu5GA08nWbFie7oj9OU60TRF3I8HSc/C2Dz/ILgjtCRsDB5Dd1tEaVnZa
 fBbX+xftZNb1/Qq/JTgLUaS7OAGrwZaX67CiXRuD3CtYhAncs2ubJSZwQRYw6GsB3WhC
 2p8COCD2cY4OaHSXx4jPOG5DALkq3A4XYPEblLlG2UlXwXidV9rpnJYnjLk+2IR0o9Hf
 BHPjCpWNvDCnop/aIyUoTWvfg7YqFT1Nk2OBDjxPh2+IuqdxaIlq2yT5C9oaO3VLos5D
 IBbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KVzRE86U
Subject: Re: [Buildroot] [PATCH 1/6] package/docker-engine: update CPE
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
> While `docker:docker` is not marked as deprecated by NVD after a
> scan through the CVEs the last entry for `docker:docker`
> is CVE-2022-34883 [1]. Replacing this tuple with `mobyproject:moby` that
> is referenced in the upstream project GHSA [2]. The last entry for this
> CPE is CVE-2025-54410 [3].
> 
> [1] https://nvd.nist.gov//vuln/detail/CVE-2023-5166
> [2] https://github.com/moby/moby/security/advisories
> [3] https://nvd.nist.gov//vuln/detail/CVE-2025-54410
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/docker-engine/docker-engine.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 37d42edaea..5fe225fbbc 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -13,8 +13,8 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
>  DOCKER_ENGINE_DEPENDENCIES = host-pkgconf libseccomp
>  DOCKER_ENGINE_GOMOD = github.com/docker/docker
>  
> -DOCKER_ENGINE_CPE_ID_VENDOR = docker
> -DOCKER_ENGINE_CPE_ID_PRODUCT = docker
> +DOCKER_ENGINE_CPE_ID_VENDOR = mobyproject
> +DOCKER_ENGINE_CPE_ID_PRODUCT = moby
>  
>  DOCKER_ENGINE_LDFLAGS = \
>  	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.BuildTime="" \
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
