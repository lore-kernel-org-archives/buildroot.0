Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF07F436B9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B0981A23;
	Fri, 17 Apr 2026 15:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVyBW1MapoCY; Fri, 17 Apr 2026 15:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F14781A33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439511;
	bh=ldf6bTyRWKqELQtUPr4wleMKikKaXmMcPlb/XkSD/lw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JxA8WZhKdfCZC7BJxcUXuDJyUdRT5k6vpFMiYvkzQaKXt6HbPtuN1a3rbCmXfB9md
	 DpE9guaCiPB3hswia/nGI0zOYH+KnbnIdKMgX4znGnijEdLXkQ1EBL2JgcCHy4IVLR
	 DiBmejoWl8gIo6jMjA9kw59tkuvuoKz43vafb5RZdlRH5M3ZGwSFgkmEuSAq+gfGla
	 vz4OM18dn5MquNCYCPW2olaz3UpmNdvMVwxGXHkdtJyi4KGNmi2HJFszMpRXcCK9fR
	 av0tiKM531iW2e7Ik2NrfaAZwtndy2Hb2W99jbX0LYo2HSn9bCWCTKgPBY05zZ1Lq1
	 BWzl+4Za1xPeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F14781A33;
	Fri, 17 Apr 2026 15:25:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F1D1396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21355405F5
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_tOLWyo1SeQ for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C87F405DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C87F405DC
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C87F405DC
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-483487335c2so8077105e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439502; x=1777044302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UoykUPfTYSOBsIvcMDXCMk3Cwfeg3iLc6EEhPnX2b08=;
 b=s4rMJCLxMdE5zIK0WuxhTbszudhHnjmn+vhZKucy77yWx3ElFCfg0F3+S8xMfxGK/3
 M0RI6GfKs/PsgjtNta1ioXZ2NuCxqSAgBZmfpN2a7TSTxOOGRZeX3XU5c5OjwBK0Irwy
 9kvYJu4hbqKkHFIG6mwFJ+4nI4eKslVwtJAANhMEWdHyilHDqihfh1TuQfKXLjUcWCId
 E8HDURXvZK0ARNu3JSknAF4G419SX8pKYhEb4SPsGnQkTMEaE+L+F9Oi8D6xAQMpHA5P
 8XxkJds5D+aJLEJZiBeRNVxDHRZ7fkOg3YoXmFG8ymY0BXRE0F96xoiwEbdMBIKUtXdk
 zSMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ80G4HlfrYIq6XA1mOfv2XQnse0khM10CDDLt1KtSZfenPTDJMixKJb7vXcTZHqbFFaIls9X2i6PnU=@buildroot.org
X-Gm-Message-State: AOJu0YyMSJKT4rK02Zn6oUp+Hg8IVA/zMg6DjuOYuYnCGqbst8N7YXql
 nn47HI7an7EHCYyrqGrDYHvAvRCMJkFgQBZtAlNrEM2j2htBH0ftjOpSbqCoqD8t/SCliVLQTyY
 24rNN
X-Gm-Gg: AeBDies9gQ2EUBaIldpvf1qdDzkEObSrPWCzCQQ3UWYUd1blj8gCbgRw8JlkLp5CygN
 7dXwkSaLqH5kAWx0Mo5t2aI1SREhXZWw/NzIfTkivciLApmg2ik8R3ihTW5ATTgRgY0ZdjPVuy+
 zcdBxJ1y+4NUJAEtYqfZ8Ju7awGMQHNDIX0tQrjlSTzFKCDPWYaxbSxdLXok2AfBfFkn05fse3T
 ZZHXV/80TBVEsm6iW6SDNwX4dzAA2ttNIIffps/BEd5U72286BIxK9O52Ph2kk5JigI/18Sc7rc
 6cPe6L7fki37b8So5cYdnR79tfNLVU+lg8xujZsKWnIJlIRi7iypp2gqkn4CPr2OHCpBmS66CM/
 PTRSRlVzM64rj/iI6t41qhT7adNL0crGXl463KYxlO/GZrxwcs9Tae+atnfT8Xn0ziUDWL1hs1S
 Y5DDSHwHvPRCTuhurXHoQKUV9kfkc=
X-Received: by 2002:a05:600c:a416:b0:483:8062:b2f with SMTP id
 5b1f17b1804b1-488fb73b31dmr39006105e9.6.1776439502038; 
 Fri, 17 Apr 2026 08:25:02 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c96b4sm87205845e9.13.2026.04.17.08.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:01 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:01 +0200
Message-ID: <20260417152501.313753-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410145709.271512-2-buildroot@bubu1.eu>
References: <20260410145709.271512-2-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439502; x=1777044302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UoykUPfTYSOBsIvcMDXCMk3Cwfeg3iLc6EEhPnX2b08=;
 b=JWeNENeiXsbgYcT7VyBM534nXredNgN+SsBBWlzAMBi9amlYgTRK/bymerHa4X5ALG
 VzA6m8t00E4PVuv/c9iJ/w2DnbHHyi4CMnDo9ujW861JDUvpSihSx5aaf4YBQcVu0hiW
 Qgt+gM4vchXBjTfuqVk85uj/jjGEQZr23bZgR9uBY/Su++HOs2iqwwWbf91VHHcC+Abq
 +63K6YOS4sFv0UhhK1qcF0en4tWmPYi+csQY+Hzm/F491dp63Y7ACCYFa52J9/wGXn7c
 yUvv8S6IR6lYb6n8t8spLNF6FkExGjCQVO1EmPxthmpu1K08Oy1oN80xHE9QpZT/Ibdz
 gj9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JWeNENei
Subject: Re: [Buildroot] [PATCH 2/2] package/python-gpiod: security bump to
 2.4.2
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
> Update for libgpiod v2.2.4.
> Contains the following security fix:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=c3655b5f641b87656c11da3ac708608d2c0e05ee
> 
> The package now contains a proper LICENSE file in the sdist since:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=51ee19fe1ec8a94b5ecfdc7627b0c574c7874a1b
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2026.02.x. Thanks

> ---
>  package/python-gpiod/python-gpiod.hash | 6 +++---
>  package/python-gpiod/python-gpiod.mk   | 7 +++----
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
> index dfaafd4d4c..d3277c5a20 100644
> --- a/package/python-gpiod/python-gpiod.hash
> +++ b/package/python-gpiod/python-gpiod.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/gpiod/json
> -md5  62cf044aa3214d0ebee6aef78db2aa52  gpiod-2.4.0.tar.gz
> -sha256  9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1  gpiod-2.4.0.tar.gz
> +md5  c9c2fb67d78204896d85a7945314356f  gpiod-2.4.2.tar.gz
> +sha256  602aae17ff365bb8e2a30ce65c6bbf2d8e7a7e64bf016e82e4fd4c730ef69ab7  gpiod-2.4.2.tar.gz
>  # Locally computed sha256 checksums
> -sha256  a2b24e2158144b22a77a6a404fc5a05911612c5b99d7ab6d0e2addcaeb7514a3  pyproject.toml
> +sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
> diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
> index 8ab901972e..6881f0df43 100644
> --- a/package/python-gpiod/python-gpiod.mk
> +++ b/package/python-gpiod/python-gpiod.mk
> @@ -4,13 +4,12 @@
>  #
>  ################################################################################
>  
> -PYTHON_GPIOD_VERSION = 2.4.0
> +PYTHON_GPIOD_VERSION = 2.4.2
>  PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
> -PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/0c/dc/5a6bd309345bd9cfa7e098174ab7e65367e408539b6c1998e4f267c673cd
> +PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/13/ca/b3bd043091b4462d6c5561f86581f553df102d8990c37938ddbff2823016
>  PYTHON_GPIOD_SETUP_TYPE = setuptools
>  PYTHON_GPIOD_LICENSE = LGPL-2.1+
> -# The package license follows libgpiod's license but doesn't include the LICENSE text in the pypi distrobuted package again
> -PYTHON_GPIOD_LICENSE_FILES = pyproject.toml
> +PYTHON_GPIOD_LICENSE_FILES = LICENSE
>  PYTHON_GPIOD_DEPENDENCIES = libgpiod2
>  PYTHON_GPIOD_ENV = LINK_SYSTEM_LIBGPIOD=1
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
