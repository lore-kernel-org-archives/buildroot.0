Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499D4C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C7D81183;
	Fri, 10 Jul 2026 13:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAbSXlOuwCEz; Fri, 10 Jul 2026 13:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB5681184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691520;
	bh=yWrYEs88XWX+nGOT4aBEKEcZPRvlgNcLhRQJ7vkcfMg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PaPYMVuHyl6xNbMj5xRZId7An0bx+bGxn7OX+DEz/f47LnNLu/Eq7pefe5BsqtM4R
	 wDShUCB5Vtj42FDTp2SJPMEyr0CWy5qGSI3UKwDcZxVUBtnA1r1aLRApr2XLWewFM7
	 140RwPvuE4NZosiX4bE6fqcS6RKLU3FlyCmwziIPQFmJNd+fr7dZbK6HUqt30FcWHY
	 qZDdixL/0FHDB8FsURt1YZI07KTYV/OfzUt8dCI7qvxwq0zP0EJYyfV8sRB/czzDLs
	 pEIuvSXmEQYn5nyMhF6Y/fTtc+X/KDbOw9cnAKegp8nY91o6Q4oFHZlAQZcJJJLaaV
	 ys7rwoEYfwCaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB5681184;
	Fri, 10 Jul 2026 13:52:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 409BD2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32E4740120
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIKuh3pap-x9 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E393400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E393400D1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E393400D1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493e8d4f4dcso8036005e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691514; x=1784296314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OY1Kt6za5xMYFy3TGWPzV8dllVPdyGJrLBXYqtLmPOE=;
 b=Om9NsbV9BYKgsRRg26mZQOBfAQCcqLXrbN/wfw8pLQI8zhHDQNpus7jiXtLfg/Ikpu
 1qZq9NkQ8g3xxIDuImXzv/NToWRVL5vj5ejHwxAhYlmclipBR7tvjVdqmF/3NqxH6/od
 rfYuJjYv+kips1uQAIizaZGWDSPM/zMX/qiA/CrN8I8MxW3OT5LGmIqGLzN4aD8hFZ2S
 oeWzfDMkbz71gHe3Nz5qL73by9QHfxAy5PUzd2uqmVS7XK510pHSaWzZNnkeKFGtu0nQ
 1IqKi/wSii8icPkDaDe7i2ZMnpp7Gr289t1SEdCtyawnNyQgmpf80ZFDcHOEEHDYALCd
 gf7g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrhZULT04pqSPVWtSYkMZEpMcn6LJxWrk57mz90ejejyeVIgPw6MBBUU1R/pwZVUpCn0uYbVPVM4oQ=@buildroot.org
X-Gm-Message-State: AOJu0YztxKYlppVAh+ufnkP2wMQiNMEaNGn6ym1xYLUp8aYyzOsD0hEr
 pGhvatNxEeVH4RKBl0UQerx/GN8VyG40RBR5T4RkkuzN/dGTMRuGd4T2+y0hXB6qfnk=
X-Gm-Gg: AfdE7cl4IOi/eFe0WdWP5L9Aki8HY6Chpz5X5SQkUsCPxCglyo6pd3UisJsMU2BWwW6
 hRxJv0Rl1TslYNrGc+jRoPWApgoU5rNiaNMerX/0NtxjzAKMIdM1xyN0LeWtz92ZrpaAkl0VKC1
 tYS1o87sSC9lCP3c6XuwnVELilCpPYmcjuv+5CVrmeFdrwYaIfi767UiMoOeJqpYNHd2pwgxTJI
 P7hGaT1Nid0NnSRxsYuvqGATCPDXUZsVdHv0wPXcqJZ9d7XYLG8IA02xFMjDUOzT7n1T84iiAdb
 DgihEKtEX7xuyoQXfGxhT3RZz+TKPKmdX9EJqIk/H0pA6bi8srdc8P6gFAMcBc6IkGjDh82YJTL
 suLv2pBTD1L1WzLt/Pw/+yjKQC7Skm8KsyvrcNqp6IBCXBlMqyqy2XxUDaNYIwR+dN/naIJ7Y0A
 jEtaqWYLCbKV+9Sic6
X-Received: by 2002:a05:600c:628d:b0:493:bcef:5646 with SMTP id
 5b1f17b1804b1-493e6862b68mr111003985e9.12.1783691514234; 
 Fri, 10 Jul 2026 06:51:54 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2e6607fsm47221945e9.1.2026.07.10.06.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:54 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:53 +0200
Message-ID: <20260710135153.759703-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260627113541.779625-1-fiona.klute@gmx.de>
References: <20260627113541.779625-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691514; x=1784296314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OY1Kt6za5xMYFy3TGWPzV8dllVPdyGJrLBXYqtLmPOE=;
 b=OjdMzC8HKoyuaCMa4az4U4c6JRSxqC0IGorUHmVfsgPoLnzOdWlIWQ3/6G2ZdU/Ypz
 KiGFk3FVWSdKH6mZ6aiXFXIrKwS/c6ffhKBXpRaUnoMpgUeSRyVJ7PxSlCPOeHcmfAmy
 +tuCUsckJK7+Ueunx6DSLMBltlcBkBKHJNUZHpWERZYJTb4bk+pXU3/U64wK3hjHwB9M
 fCzleNv/WSR9n58/xkma3AVVRKwlLRwQ5DJMR3TKrMUBzDbAC1pZB3JICvl/UX1433k6
 b8Z/RvuxecXcm7qMW1ZqkbPu6hVpMiJbWAVZiZU+hJbMBx0ATYcTg2WpIxEJxtQk1JOF
 f2ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OjdMzC8H
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2/libglib2-bootstrap: do
 not install to target
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
> Libglib2-bootstrap is only used as dependency to build
> gobject-introspection and then libglib2 with GOI support. It should
> not be installed to target, even if in practice libglib2 should
> overwrite anything it has installed.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
> index 72a32bd825..665f320684 100644
> --- a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
> +++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
> @@ -24,6 +24,7 @@ LIBGLIB2_BOOTSTRAP_LICENSE = $(LIBGLIB2_LICENSE)
>  LIBGLIB2_BOOTSTRAP_LICENSE_FILES = $(LIBGLIB2_LICENSE_FILES)
>  LIBGLIB2_BOOTSTRAP_CPE_ID_VENDOR = $(LIBGLIB2_CPE_ID_VENDOR)
>  LIBGLIB2_BOOTSTRAP_CPE_ID_PRODUCT = $(LIBGLIB2_CPE_ID_PRODUCT)
> +LIBGLIB2_BOOTSTRAP_INSTALL_TARGET = NO
>  LIBGLIB2_BOOTSTRAP_INSTALL_STAGING = YES
>  LIBGLIB2_BOOTSTRAP_DL_SUBDIR = libglib2
>  
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
