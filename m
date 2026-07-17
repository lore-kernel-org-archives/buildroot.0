Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C6AC4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 518ED40B93;
	Fri, 17 Jul 2026 15:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyQ7ji1fDAZ5; Fri, 17 Jul 2026 15:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D28240B97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303262;
	bh=m+bya+f+LkdGDQy9R5KQn1FONeOU2L8tvtTX5dch8sk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o6FREv6EWG3adE/EU0+KzNotRd3sVHJAwC11rtgJ1XZDBTfWUpnxk6idVT9NdiWk1
	 /cyhPOp6XYFnMdwqvG5l22SSeNXm61ZABdhrH87SLdowNd5eVyFtSbYpHp430m7xJU
	 s3ynhESY+3SqG9De8o6q6V2fYiSkqLMBNdptYn02pdUywR3JLGbuVGSwSUbm5e6luM
	 wLij7oGofwjs0C0szRxTqtsRHySkbFEZCh8ITCa3/rGlZ+QXSLcod6Sbwliv5Gp7Bd
	 JkzfxWDHWbyoTd+/YpKniTdFrrZb2MsnLRt9jR4jPrxQ7ebXAJC1rf0whjpgL7s5Qw
	 pbRepGuRU/lzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D28240B97;
	Fri, 17 Jul 2026 15:47:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA4A836E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C065E60AC6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-N5NXr5oAk9 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A78836065E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A78836065E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A78836065E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47f3e6cc44aso4990686f8f.3
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303255; x=1784908055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=a8+a5iP0EUkp+r/d8xtE7bSU8cf0IR1BOpQj/rHgBvc=;
 b=m4uTqMtSsMQi79vPvJXoRN+lmnGW5BgiEk9NyHHgVrnS++FuLlzKLeiMXhuoDBvz4e
 I+MOcm0GeiBPzjY5aObA5e/6Pjh7cX8NaMwguRCfrJZbB37wKyyzmtxJsoL229qwydcq
 /Guxq6vbepu/BAWtoO9Z39COQcdEGfaMVoPXFtz/x3B+4f7IirZkIFtUF5VZMt408frf
 BD48q9iCuvLcxLQhW62zBCh9fTYwlKSmjIuQjAujewfVOqiVzhtst9FFae0mpIMYfkqx
 6X1DSFH1uY9S1VmNf89zjrwr1SqXvmStCJpCr8Ev2JISmP7wEsgHLylv4cCFeDyGoCZI
 UovQ==
X-Gm-Message-State: AOJu0YwD3n8BYaIRZzfOmkmD0n27MaSrRvTdeMuPaeIcex8WhXfEkuRF
 bz1AaK8IKPzgBJja+Luk6AIzsgZojYHYBhvK82ZdC0XPntJZ/kOgVyR2anHtcSedL5bpOdiScIY
 s8uFo
X-Gm-Gg: AfdE7cmCq5P/nqqOZ28tLHj7bvpPMYBQIVCHUIFVFZSOtPxZvwsELkk6KqdjsgIN7Vw
 MRbLRxD29NqXgagdej+FWGK/BYnE9VOtynbKri5QNCx4yXCK5rvCZ1OcKgRFzj1MfURtkyFznAu
 iOpKcEG/bbJId1zxoPhw7dKAr6TwPaiSxNs2Dz2kSMnegb6a5HxHx7XRIjONYg6HhCqBYPbd6xG
 1IFix5g8xJQ3s/Kp+7oyRtzNIExTyFwnAIwHFz9CSBiGnnCzJmie2NkJqsGRd7LbPcPCjYgh+p0
 MD6H7QfJD+KhK271lf+WM3v9QxS/7SJ5pTJ+oDqTcjzh/4ZL6mlX5SPx02dAE77kX+bVsROUrrm
 73r+YFLQvRUJ1QLXtrVHcscRge+ExGHWoXnOXYHbygmNpemHy2xYOrLFoUWqRIcaRKt7C7iN5pt
 AVyDhKFg==
X-Received: by 2002:a05:6000:2484:b0:47e:8e1b:3319 with SMTP id
 ffacd0b85a97d-47f6230e6f3mr4388169f8f.15.1784303255543; 
 Fri, 17 Jul 2026 08:47:35 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edda29sm5081331f8f.32.2026.07.17.08.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:35 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:34 +0200
Message-ID: <20260717154734.192095-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706100301.60854-3-thomas.perale@mind.be>
References: <20260706100301.60854-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303255; x=1784908055; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a8+a5iP0EUkp+r/d8xtE7bSU8cf0IR1BOpQj/rHgBvc=;
 b=iaWsakLoMudk/hYorXzKxIrtyoeyO/dMQVmZZE4lLJBzjrdtt5ispii10P9/xNgLqE
 VwaKbGZ6Qy1PJYxrUVdFTf/JlCoBTuwHMd3R5sPPBEpnxsbd4AD7kL3wyHpz6XSjXRMm
 PgqqWNz+l+TZFvbYTkSn22U2EODulTzHsZRq7Rgp2mRGzxl2BuMbOHszSNsebD+6n9tu
 P9BBzcrYNZrWulUvAX1n1VZncVp4syhpbDpEEHXybfe3kNLyp/hs26I0gXiCS8oKYEKz
 3cDP/Z/dlLtdBvfVlWgqbiD0eV1TaJn/WB2ese7hOZ5yGrZ+7NksJBcFZo7zGDgFuRRw
 AeKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iaWsakLo
Subject: Re: [Buildroot] [PATCH 3/3] package/python-web2py: fix
 CPE_ID_VERSION
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
> with vulnerability such as [1].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2023-45158
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/python-web2py/python-web2py.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
> index 5b473698a6..68847a2385 100644
> --- a/package/python-web2py/python-web2py.mk
> +++ b/package/python-web2py/python-web2py.mk
> @@ -4,7 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_WEB2PY_VERSION = v3.1.1
> +PYTHON_WEB2PY_VERSION_UPSTREAM = 3.1.1
> +PYTHON_WEB2PY_VERSION = v$(PYTHON_WEB2PY_VERSION_UPSTREAM)
>  PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
>  PYTHON_WEB2PY_SITE_METHOD = git
>  PYTHON_WEB2PY_GIT_SUBMODULES = YES
> @@ -12,6 +13,7 @@ PYTHON_WEB2PY_LICENSE = LGPL-3.0
>  PYTHON_WEB2PY_LICENSE_FILES = LICENSE.web2py.txt
>  PYTHON_WEB2PY_CPE_ID_VENDOR = web2py
>  PYTHON_WEB2PY_CPE_ID_PRODUCT = web2py
> +PYTHON_WEB2PY_CPE_ID_VERSION = $(PYTHON_WEB2PY_VERSION_UPSTREAM)
>  PYTHON_WEB2PY_DEPENDENCIES = host-python3 python3 \
>  	host-python-pydal host-python-yatl
>  
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
