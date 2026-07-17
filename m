Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A8FC4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51FE381208;
	Fri, 17 Jul 2026 15:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBV41qDekFoG; Fri, 17 Jul 2026 15:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB3C81213
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303260;
	bh=EwDRumYPosgqsmezHrJhjsWwTixc7HlBuNUa4MDONN4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AX01Z5qvYq/XHfRZrI8GJz9KgcKbju/9gpY4fL0XBmPwoOo/9OyN6o5CBeoQ0RQLJ
	 Akmcv8GO8C6nlAMEsUg9uqSGmu4qFUUQNvCxu3MpwT1rc76V4Vwz16OpD3GRz+nrYq
	 mbyElPQfTGqci8IC6vh8FhpBMD5UaGcaoH4LwYPX0DJkclA4KGupjnE1YNTcvOqdE7
	 eLrvg1eNlDvVoW/+PXWqlQcR1x00GdtYVhlPZdrNQ9MnksPLiGfvkxtqksEYW/J+uV
	 OHqrPT5MXGv8eKXdqCAEfiol6CTAHX0uoWEsDcFgYMIGT2mrSofMqiBAfQRnJiZcBy
	 yeJwm8vGvkBoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB3C81213;
	Fri, 17 Jul 2026 15:47:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1DB836E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3D4E40056
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZnmAlx4S2r4 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C384740291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C384740291
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C384740291
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-493f25d47dcso29881245e9.1
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303255; x=1784908055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=V5sxCfC9d/tgYNvXlSOS/BqKz9GQJarmimM2wcHlhM0=;
 b=ms6RiUD5SK5q2ec1qtROgVgcrBU0bXHwdOvGxXZdaXAkwf6KZh4TCII1rfbLSgtsT+
 QorrIdZlyQtWKJW0o8+7Jub55ylK0G94AyM44mRkOEHCl1t00I9rR7noSmPWU1FcpcZy
 WC+GrW6nps4gCWjPk7b1ogZDG62f0kx4kuS5bw7SImUVd5afPXH1Yu33OKewhxKjnNMo
 A63CRqlFCXXPM2o3bnGsXWYCj8e+Z2nSUhDlRWGTgkGYLLuDejqXTFBAzdkzWZyfzisp
 E9SAW9R5+8xBng88hiFtoWHCMbcyxpnuwBQd5+xfDHYzxH6idqhwGwkLvU8sRRWS4j+b
 iyOw==
X-Gm-Message-State: AOJu0Yygwizjky4Pp5HWzyZiE7PjWGxriXnERFPZs0qfrq2x8WEvQ5e7
 Ck4TGAG5Ka/tEe1XlYf/4CMxL0KjiR8aLKanpGNzhApEIDNJtqg9RrO88TYC2pwztX4nidXwe7z
 Mzvgd
X-Gm-Gg: AfdE7cnMtlPXAdZ6DdHembmv9KIgpo8eD7hBbQKgyfZbDZu9a92JnA87UL/vQFXh1lG
 6ViZvTg56u9VMWSNm0SGRrkINxDE4P4Lkg/UndQsmCx59TG1FCARYaS83iBemv4lKf1GvHDL43s
 z2TbDw0g+X4eqsNEQVZbCMr2WmMz1MWU9irGrcu5dQ4NzmlVf8SJewljgsRhCyvCrPx9yM8mz1o
 l/0hByIyGTo3b9E5Vq+GSKnPCxz80Z47awr5//w2JiThzihYqXbWni7Ic1ojATeozcAWBm/Og3W
 3bmjWlPCWoIlmy7VYuzynglX9+X2eUXRUAYcIWNkGDHh0jLiEFBmiaMCqSyDxnxrNrIXyQ0jLq/
 MlkI38gLfkDnJeS56J0Phs3DHY5xGpjeygV2h4TavhmPYpt40HqVJqzK29DJGAxx2GPepqL1XgV
 NQbZDTVA==
X-Received: by 2002:a05:600c:35cb:b0:495:50c:259c with SMTP id
 5b1f17b1804b1-4954a3cffa9mr37274695e9.7.1784303254568; 
 Fri, 17 Jul 2026 08:47:34 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49549a359a6sm60382785e9.1.2026.07.17.08.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:34 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:33 +0200
Message-ID: <20260717154733.192043-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706100301.60854-2-thomas.perale@mind.be>
References: <20260706100301.60854-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303255; x=1784908055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V5sxCfC9d/tgYNvXlSOS/BqKz9GQJarmimM2wcHlhM0=;
 b=YE2iJ0BC2E0W2X7TmLqcOIWbMy4bInrmgmZw4es81wNuGUs/Kk6vVMpZaxGkL5FaYp
 RBTVAJG8jgZBb/Ig3sI2a7vsws2R3UMIWpyuxZOC4NwsH38UPhGQ/YMblJHjRZWX+/ER
 BgjKQc6n99BHo1h5T5Onri9AN79v4qd1EHxYxOhZYK+gKsoxNuObA8W2KRDVZ4BFbSBr
 SCX3xXtRpqGedfaGU90TbH6ETYVZ24Eoy64Hn06ZNxLPamFs+SfaVsvmYBZTjXeKAL70
 2svqH1drzL9Jx4JaAlrwhwmcuOhOAqHZHTswmHxR5pF+BRZu01b+An+P+i8ackZf4tM4
 54gQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YE2iJ0BC
Subject: Re: [Buildroot] [PATCH 2/3] package/open62541: fix CPE_ID_VERSION
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
> Remove the prepended 'v' coming from the git version to correctly match
> with vulnerability such as [1]
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2022-25761
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/open62541/open62541.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index 0d1abf724a..8d9c5e44bf 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -4,7 +4,8 @@
>  #
>  ################################################################################
>  
> -OPEN62541_VERSION = v1.3.15
> +OPEN62541_VERSION_UPSTREAM = 1.3.15
> +OPEN62541_VERSION = v$(OPEN62541_VERSION_UPSTREAM)
>  OPEN62541_SITE_METHOD = git
>  OPEN62541_SITE = https://github.com/open62541/open62541.git
>  OPEN62541_GIT_SUBMODULES = YES
> @@ -12,6 +13,7 @@ OPEN62541_INSTALL_STAGING = YES
>  OPEN62541_LICENSE = MPL-2.0
>  OPEN62541_LICENSE_FILES = LICENSE
>  OPEN62541_CPE_ID_VENDOR = open62541
> +OPEN62541_CPE_ID_VERSION = $(OPEN62541_VERSION_UPSTREAM)
>  
>  # Force Release build to remove -Werror.
>  # Don't use git describe to get the version number.
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
