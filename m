Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B54CC44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A58740B8A;
	Fri, 17 Jul 2026 15:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUqT7GGQkMVc; Fri, 17 Jul 2026 15:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41DCC40B7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303259;
	bh=68JGEZ06BmuXEZoGdjiE0jCsIGebElHviBf37x1p5rk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=svUg1ogHLC7DL56ECWwO+K9s0jPxVH4hVnmTx851OCP9NjS8Y9mqkdqjwyagBeCwk
	 6YR2JPCW46pVb802SpXcTb3nW3yp8+jNfi+yeFA/pcNelxaPyRloFS5WW6TmSDjeFt
	 kfIRlA5ocB733SCI7euftufjsgPHU0YuTgNAOtGpjbNhKaOfI1YqcOCBJ150Hf1Cyn
	 3WwnG6qLufIbEG5uehdnQE79Al4laYsf5CAO9vACa+CZcUM2p+W2TFpNdcorhs/Rtw
	 NECzYH5O3WjNscHt/Q0+sXvCE4cU7XQQVCtw7l1fYScIJz3QTPEQWIkhw9cyVsg8A+
	 67Kcwmfs9JWoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41DCC40B7E;
	Fri, 17 Jul 2026 15:47:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C84CA1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA19581209
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgmCYQDZUGlc for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90F93811D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90F93811D7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90F93811D7
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so54591015e9.1
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303253; x=1784908053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hMlBXGB5B6WLK2771f+AnFD3EOaDfk7G3tqrek4ZSfQ=;
 b=jwiI1+/as0EnTzdVcTvbrb6CYxJw5o90pNIajDv33w9AsoFZJWJiImDVgkeqKL07iz
 0v4RJv7PUrEQUyjJj+UiTmT+dWw24crk3WTPUEr3tuOJbdh5N9y56Xy0egFfsQKUPZwa
 L1k1VfJd1n5rdRTxq7N6BPOF2Q3VhJlqP+PdbQ/nxyNIA0MwpLV2e6mf6LRBAeBJkSQ9
 +r+uiHWbOUN2AjlQnBanaVGnsaHsFmujjtig3qqHOryS14w87TjW+hr4IG3xh9NJKdKL
 sGHDwsdSDF4iaR94kKte0ktO+QBBUGqJS9k46zq0hvldtc0RrqcfzhBsmq2qaTsJEHbr
 01+A==
X-Gm-Message-State: AOJu0Yx8NkARC1/esxxRMLGVgVctZM5RRfb9xcMn06FHJh5igjGyv7fu
 sw90lRvGQM7VqzuybOawIGDa2CVC3OzBVt3/9C1PNKnAJ7s3xKvvuQ6saBAmYC+a90Fl+dLzrgz
 bbPCR
X-Gm-Gg: AfdE7clSBn20adxwaAYzY8EKUrD+jst+NEJpjVR8VJRBJBvoFlmEHWfg+snF75JNK/M
 FPop31TE+u0FS+KikjtMczLWwiC0wD/x8q3coXuhVTIlKSs21S8lVJpzutGvtqtsLW8d986IRW5
 hj/bJcQcHfGMRb+jctp20owyUgyETuEXe/20IDUWR2Y+bJ5ScmXqOfYAM2YQHGveaDHe3qLpi6f
 +0SwAQHMG1cul2EFY0grHzuzCUkKBd/fwfwEiQqHiRYpj7c2zK3XM8xkfm2tJ+WcVXdpxzyqZLi
 Cn36wx6bhZnVaFF5NqePZn/wyAcdzM/lvqopZ9++H5kUFkxOpxL3odXQJ2J4EKqVia4i9UJ+QHz
 WVW8ODcGLN6qHaI4rY94Jok4D7v06VC/+twPyEuyOe9km23k8tkwLC54s3Q+Wwq/oLm7joAk=
X-Received: by 2002:a05:600c:1c1b:b0:495:4b24:1b64 with SMTP id
 5b1f17b1804b1-4954b241d02mr37273005e9.0.1784303253411; 
 Fri, 17 Jul 2026 08:47:33 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e52f81sm5119502f8f.9.2026.07.17.08.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:32 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:31 +0200
Message-ID: <20260717154731.191992-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706100301.60854-1-thomas.perale@mind.be>
References: <20260706100301.60854-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303253; x=1784908053; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hMlBXGB5B6WLK2771f+AnFD3EOaDfk7G3tqrek4ZSfQ=;
 b=ajrp6nwLPCCYmZDE//PcatA9hloNQL3mThblU7wp6cZKCEB2rXwjDSojAuefZoL0Ko
 mcls+JVPNaYcT/LV7Ob0uImm1pd/fNYDOuq7262a2BRTH+P/pxxURpd2bqurbdjqGzS5
 e42OxsTnXnF0GxY+bLBdneqZNl/QB3tWy8P59GdpP6ClJNdRAzEeqp/IsgRoQAuhQEHh
 +aKQ6ejUiT3okhOJMqD+unJERL5KW0C3a0e2PMwRLCRjks1SReQ9be02zlHRMug6LwgX
 PHETiyStHPJdOP8ewt5nB87zikqgrhn0rZkXJ6mFKrySf/3xg4Z+xRRikfQNvRRyQTMM
 gsjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ajrp6nwL
Subject: Re: [Buildroot] [PATCH 1/3] package/ogre: add CPE
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
> Vulnerabilities such as [1][2] are assigned to the ogre package with the
> cpe: ogre3d:ogre.
> 
> To correctly match against those vulnerabilities the CPE_ID_VERSION uses
> the version without the 'v' prepended.
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-11014
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-11017
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/ogre/ogre.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
> index f3e3fc1d8e..4f19b285be 100644
> --- a/package/ogre/ogre.mk
> +++ b/package/ogre/ogre.mk
> @@ -4,12 +4,15 @@
>  #
>  ################################################################################
>  
> -OGRE_VERSION = v14.4.1
> +OGRE_VERSION_UPSTREAM = 14.4.1
> +OGRE_VERSION = v$(OGRE_VERSION_UPSTREAM)
>  OGRE_SITE = https://github.com/OGRECave/ogre
>  OGRE_SITE_METHOD = git
>  OGRE_LICENSE = MIT (main library, DeferredShadingMedia samples), Public Domain (samples and plugins)
>  OGRE_LICENSE_FILES = LICENSE
>  OGRE_INSTALL_STAGING = YES
> +OGRE_CPE_ID_VENDOR = ogre3d
> +OGRE_CPE_ID_VERSION = $(OGRE_VERSION_UPSTREAM)
>  
>  # Download with imgui submodule (https://github.com/ocornut/imgui
>  OGRE_GIT_SUBMODULES = YES
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
