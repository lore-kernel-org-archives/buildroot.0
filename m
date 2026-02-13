Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E676EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 201686144D;
	Fri, 13 Feb 2026 19:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BCyLe6J91C1; Fri, 13 Feb 2026 19:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 414096146C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011687;
	bh=G0Xa47cvrIK6yw3k5dajy0mNCXgTnyMnO5j6gO7hQbo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CHjM/c/5f+cdePE1BYjlBUCD0QQsZkEVu6IdQbpFX/BElRHqyslm9kkyJV8tOy2XR
	 xK5ySSQStfhyDbiHJioNd8HUZvZAZVYBSzLTBp6s/hKH8pgcqinhnRe+2Gqe4T6JwL
	 GaKAlOYmAtWypMgH+fqznUJXxMHt3BuHeGdWHjJ4R+9S1umsP66cDHyMUpO7lOHzGH
	 3hMGY227K9c+bgnSAq8PX4VaylgM6HIqUz2bZS6PsRhFLpfnQveSMSY/r21nAeRm8P
	 3aynLjrK5fOgKhxr/WagjtnvQtCW5RcUt4Q9t1huuMWb77VsOzvB5wS4xkHCXy9Lzu
	 VkcRm68rlLLNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 414096146C;
	Fri, 13 Feb 2026 19:41:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A0ECEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EE8A849FB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1EWQ2F3pqoe for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CE5A849F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE5A849F8
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CE5A849F8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-436309f1ad7so1051646f8f.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011678; x=1771616478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dyASy6HMwETTf48dcN9DNArVESTmwlNm6i9yT/PDxrM=;
 b=AEUvkQVp6n/0NKzKpS04EAkzh0iMo5Icvr3vjJ1ahW2xAqoIFz6BEBMd/68U/NpRCV
 HuQUfuO9422vn7I9y4p3pCjLarmwUsknFOsZ1Br8uzwWiMqtYyoABgj8jhMl2CnJ0qM/
 t3DF23/LHNtQ3KKG12P6d0NbVlun6O6PY7W1wHp5xiEyYFzjHHqls5WtRXGXZepb4M8k
 qu99xoEebg8TWozXgZM8ED1JRcGlVE9CMkddbgiMwUY8+BVZvetdLfGni7sHhj9UZiYH
 p3UXWcsczxGSC65hWyty0Jw6uQezhe8+w2VtAkU3cNFKo/oJ8RAlj3n3Ru9uEdVJkPLk
 jtIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv8xSVMuR+idp5Sd3bWRmypaEgMLdUGvQQa0dhB6TXBBt9LTFDMaQg+9Puv11jrfILVJHVLL0NEC0=@buildroot.org
X-Gm-Message-State: AOJu0Yyuj0nDir9Ah0m/qrNna8GLru2I3p502/FZE8CUzA5yzK/MyKPf
 2BxlUhjTS8vVLuJipgGxE6CHEEKesXlJnhU5+JwyvjmTWUP0/ai6aBV7KzD60VofdPBCB9aWpfH
 YuGFQ
X-Gm-Gg: AZuq6aLP1KO1tT7MVemqiFlhOe5P/T5oCXK/wrJuVn1vhxnqLYOnbHT2a76BkAUKzGV
 8OJ1RY9N2QCM2TIu7aRxCqhRCq1DVt/cOiTOfszUYaBTLqr4CeR/6JAyaSFKMw+QLa6ZQzCXT5M
 6QudQTH3gyTTkIs8KGGy4Vg2BCC1n7r0FhWevjeAMWeR6Hox7Ga/C8xs+2JiiZWXPZuSUSRK3/t
 g4eCtAT/10Ymi+opoUaUjbEAQGD+r7JO4koRM81lkccZjVp0WtQy734/B8ob5Uj+eNXCctQcwqI
 8s1c6sh6gilf1WU0v/+ih1Xkv5Fliq/xkG3XEhref8QyK9sZRPlto09cpUDvG8d7KLFoX4RKrIM
 t+GDLbcrxFzaEwfqM6cWJOwmdg+8824M079ykSNt5PAmRDGpENwTNdU80uA4wiznAAFAmFehmgZ
 F73rWuyNfBVlcp2m4=
X-Received: by 2002:a05:600c:4ed1:b0:483:71f7:2796 with SMTP id
 5b1f17b1804b1-48379b9898cmr7601465e9.10.1771011678243; 
 Fri, 13 Feb 2026 11:41:18 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a36443sm22878005e9.21.2026.02.13.11.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:17 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:41:17 +0100
Message-ID: <20260213194117.49044-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204162412.159086-1-thomas.petazzoni@bootlin.com>
References: <20260204162412.159086-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011678; x=1771616478; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyASy6HMwETTf48dcN9DNArVESTmwlNm6i9yT/PDxrM=;
 b=CoUJNjgxjDUgWiKLVWOebN82tQy/5Qnt5TA9QpFKd0vd5pQoRCV/4UfKEwGU8DU2wf
 fD6ZsQ0um6d4kpGQ61M0MUP29WB+o1+iPlcblIaqEkYvudMVgSdV3kwnkMBMuwaslvzF
 rGD11UPNqlAyg6NiihCay+Gy9UsOqHx5qm+xDf0jBV4Q8koY3p5sqbr+zpsXd2KMq5b7
 XSYpfTMOlTNQL2UZUY9lLzA1GqU6zq8ATVdzRLx9pbu3GRHCmDLl3ny5efOtF708JVtQ
 sZGBmo10ZnF1aeG+rrXEjPqLBsWK42Vim3YQgOUJGAT6BF/K/wfNjtekwFALcXjRiYyp
 NWqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CoUJNjgx
Subject: Re: [Buildroot] [PATCH 1/2] package/uclibc: rename
 UCLIBC_INSTALL_UTILS_STAGING to UCLIBC_INSTALL_HOST_UTILS
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
> The UCLIBC_INSTALL_UTILS_STAGING is really badly named, as it doesn't
> install anything to STAGING_DIR. Instead, it installs the host variant
> of ldd and ldconfig into $(HOST_DIR)/bin. Therefore, rename it to
> UCLIBC_INSTALL_HOST_UTILS.
> 
> This is important as a follow-up commit will re-introduce a
> UCLIBC_INSTALL_UTILS_STAGING variable which really installs things
> into STAGING_DIR.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/uclibc/uclibc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index e1cf12fa68..dea5445b16 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -463,7 +463,7 @@ endef
>  
>  # STATIC has no ld* tools, only getconf
>  ifeq ($(BR2_STATIC_LIBS),)
> -define UCLIBC_INSTALL_UTILS_STAGING
> +define UCLIBC_INSTALL_HOST_UTILS
>  	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/bin/ldd
>  	ln -sf ldd $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ldd
>  	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/bin/ldconfig
> @@ -478,7 +478,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
>  		DEVEL_PREFIX=/usr/ \
>  		RUNTIME_PREFIX=/ \
>  		install_runtime install_dev
> -	$(UCLIBC_INSTALL_UTILS_STAGING)
> +	$(UCLIBC_INSTALL_HOST_UTILS)
>  endef
>  
>  # Checks to give errors that the user can understand
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
