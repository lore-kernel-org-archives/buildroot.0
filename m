Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75620C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BEDB80DDE;
	Thu,  7 Aug 2025 18:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xsx6x617ktE4; Thu,  7 Aug 2025 18:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF60080D98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF60080D98;
	Thu,  7 Aug 2025 18:24:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89A9D4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE1640087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfCf6Ho-csNt for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 909D740057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 909D740057
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 909D740057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so990729f8f.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591057; x=1755195857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMxy95fFIwx+Uu5x+x7z6V41Ys0AYBGXdRWNZWvaLWU=;
 b=IXQ5rPwU+QujbI9IZl67QWk8DHOHyJmxJ20jxK4pay4U4uOpJOj0FoFmUFU3UuBnuE
 JI7iC5tK5pGw158oOkPdBw88w/jnhzAcNWeF/4U8VKvqs9Kbsc/ErG5oTCRa5Ordizao
 +OwiPIa7BBs8uYaITg2aWmfJ8fUXye7TI0VnUn/Zu+jm5mm+5lCHm8UU6LmFkeA2hmPR
 FWNWTvb4FpYQagkBo4Pf3fwJjhyRs59/RkGU2WiyITKBbdkUhUA45t/Ou7815CvFTC9m
 u6OnZqLZCYgyv1s//c7DHyiWviw/3lh/Tc+vtQe4+NIefjN/B33O2dALFXdSAm8PZRqT
 hcmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNuG4ykHpJLufiqFyJs4thRv94WHdexTAI8Fkye6vzIYLt5t73Oij93c/3bpasi++G+TQLDLWVrhA=@buildroot.org
X-Gm-Message-State: AOJu0YwGzRsWxzH5JBPt2jSojknYLFgvtnFujMG4132PDEbzw9Eqh0oR
 6+y7oNP6glSbAcvNQILtb19JBX+X4eFu8uGrWC+yj23p/dGBYEyHt9fZ9z0nV2+45ZZ6oo/z/Yb
 fu6b+
X-Gm-Gg: ASbGncugB+POb3vsWtq6I+LOUHap5033iFNVX0vdxQ+XIiF4MDGFvYLMO+kdmsR6QiJ
 UT9U4Dulp0g3SJzp9ldpjNOi704OKufX+4I4U7bDUyzi1JsSR/jy3NkuDllnvviazNNZU33qt1a
 m9p7E9LhX64bI/51J9SwHOua6PMWM8rJLOIeS8yGdwP3GLKO2xO3k+VL7ow2RKusUiLhq7lfiGX
 feK7CSM5PBCr+PDrVpwVyIzZ6oxnP6hsChtuLC8wx/scvHiALstO7R7sN/AbFqyVuiDIgAHbAcW
 /xjrkOFfT5SVfBOunI0rShzTiE+6oGASnqyXtk379YX7r2mqnrYoSk7IbC7ArJCQFe0Kv6NjbfY
 eFR7+vrxL1yqCyQ==
X-Google-Smtp-Source: AGHT+IEkdXv9cxCeZIKni3C7ZpUnhHH+pKOLWdTf0cQhv90FNZ3mRYdO9uyYPem3L05R5HK64ihrXA==
X-Received: by 2002:a05:6000:2905:b0:3b7:7563:9d59 with SMTP id
 ffacd0b85a97d-3b900b81105mr153342f8f.57.1754591056673; 
 Thu, 07 Aug 2025 11:24:16 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453333sm28616655f8f.45.2025.08.07.11.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:16 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:16 +0200
Message-ID: <20250807182416.724823-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719004652.3087009-1-james.hilliard1@gmail.com>
References: <20250719004652.3087009-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591057; x=1755195857; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMxy95fFIwx+Uu5x+x7z6V41Ys0AYBGXdRWNZWvaLWU=;
 b=f5DWO3LI+smR7V5tbLt8j4fFRxhd5/syyF7/nfdqsaoDJmhMqEE5vZ3Lak8zOXQ83f
 LKXATJ/yboe53mGERDJbAwU/E6oCCTSN/YdiUlsNSGT6WRBMpjG1NOhCQeHXxPQ+fStL
 /hLG+umP+c1c195lTONzPDvITUpUmq2eSEuCSQQEOr13N0jDCuGLS4GJUOkICEGCy4iY
 s+AL/PrMbOSAAlfe8CX2MpkjDiOZdNkpi+BTtBz2Sg2xXXGpAh9OMJstCo0PfEKNb48n
 qIEjD0SXB8LmfnL4DeAO4IYEk4R2oBgLOu6sbWYr1ELXc07qh5ZYWHLPBsMnMCMMBghM
 4hLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f5DWO3LI
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: fix cython
 3.1.x compatibility
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
> Set --skip-dependency-check as dbus-fast specifies an unnecessarily
> strict maximum cython version.
> 
> Fixes:
> ERROR Missing dependencies:
> 	Cython<3.1.0,>=3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-dbus-fast/python-dbus-fast.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
> index 854ce2068b..fe17674708 100644
> --- a/package/python-dbus-fast/python-dbus-fast.mk
> +++ b/package/python-dbus-fast/python-dbus-fast.mk
> @@ -11,6 +11,7 @@ PYTHON_DBUS_FAST_SETUP_TYPE = poetry
>  PYTHON_DBUS_FAST_LICENSE = MIT
>  PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
>  PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
> +PYTHON_DBUS_FAST_BUILD_OPTS = --skip-dependency-check
>  PYTHON_DBUS_FAST_DEPENDENCIES = \
>  	host-python-cython \
>  	host-python-setuptools
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
