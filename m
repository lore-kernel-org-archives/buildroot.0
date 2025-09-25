Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB1BCAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E4A9411E9;
	Thu, 25 Sep 2025 20:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrbMru_HSdln; Thu, 25 Sep 2025 20:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C90441505
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C90441505;
	Thu, 25 Sep 2025 20:17:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D34F12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67A6341209
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0fIS6SjOwDc for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60E5E411E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60E5E411E9
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60E5E411E9
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3f2ae6fae12so745163f8f.1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831408; x=1759436208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ut1x0B3x9K1hKPWGUsw9PhkCq08vyGnl95VNwIs6PHU=;
 b=Dc39kOPMF15iGqZ1SbcQrxZkIs4xceFIF6mUe4eL/bFqVMfjIVBgOJ2Jf/qCO4W/Wv
 YhjUTr1wPnDivUTVfIIZc42RuPkiBqDd1yMNJvEwbUVbsRq/TjKxgTb2LP7YHLe13wcy
 ByiL2VoDgQCcXONCG06henfX+KXg5x45acEunuzxsNWl+xOsXr1ymTbg2B3svFyTdcKV
 wq7KCW0oeIHhMEHJsYhuswLJBECHyzN7myYLMXXdZ1FEf9m5DDX8csQdqxiYvEajUjP5
 M9eoQt6shMtteDOcSH+/aC0hOldcBEHh4YFS1TBD6bZCmdH8R3JTMBU4A0dOGcOzL3sX
 Yxxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFiMr2uKJ4FD97//Ar02MKx7OnEWj0EyPMHZy56qEosiowwqdrtz42mINQnAAGl6HxtrP61bnyNzk=@buildroot.org
X-Gm-Message-State: AOJu0Yx7mluxPu5j7/DlgzgGDUlBU/vxRHPkQEIMaOtv1Gz3A7PKlHfJ
 hl51JnbPuGhk6M51ndgi9pBVJkkvyxvqbl96X4GfnDxE/kIDZs9cb4YRef2MjegB7gfBA8kATuy
 6ZZAONH4=
X-Gm-Gg: ASbGncsdhbQAwYSe+8KGyli8i/YEAdOBu4B3obCZLqrBKNrztdq+I8tJx1pJENdanKq
 h8kQ8erYfXzC7dd22Ea915d2U22nG8VGxd1RIZ7E0jnAI8+/nWndwG12V9c50J8aa9boYuH5c6c
 4GZzXjh1FBCd+8ioz2+zB+owPGOG3YatMoYAfPIQ+Rqe/iJyA18tbArnZ7ewmYJWChbuFni7SxZ
 tX386ytDCQ2CdPQvESSrWpxvvTG2eVxSlo8cnRKdJ+tBDpbL1hE+0wkTE7bYFZZG3uCsQ5W/E6k
 UREWr0Td19DEXcgelyH1nW23hAOV45TrQecGraJwsbrCgcR7RzhZ1uIDZHOAqG3Ji7DgyAG1z3/
 lWmsCQSeX4f1EFQs=
X-Google-Smtp-Source: AGHT+IEBkKeWxr/zglUYOj7p0IijYQml2dda+jcV1+c9PtMRupXhbNEtokhor+oKfd7sHorF22wegA==
X-Received: by 2002:a05:6000:240a:b0:3e2:ac0:8c55 with SMTP id
 ffacd0b85a97d-40e50f5651fmr4401707f8f.55.1758831408394; 
 Thu, 25 Sep 2025 13:16:48 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb9e1b665sm4098866f8f.27.2025.09.25.13.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:48 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:47 +0200
Message-ID: <20250925201647.43603-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916004619.2528015-1-james.hilliard1@gmail.com>
References: <20250916004619.2528015-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831408; x=1759436208; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ut1x0B3x9K1hKPWGUsw9PhkCq08vyGnl95VNwIs6PHU=;
 b=UHpKqpYgvpZp+/FAqisVAZy6utFOZz3v/tpEiT142eV4If611Z2EeWVZzC7atBGq7J
 ykPc789tFW7DfuohTNu9x3bscsI0PMA40yH8IfYkdJT7BQIov0+KevZN0h9++qpwriez
 WX+pj5BWsLEw2n7CJiYDYUSpVnMArR53SeDiO05loTEv0jayDHg4HN2Do7svtcwTHFfV
 20CzYlXTilJRhURNQoCIF8i5Jxg1ikv6EFqNTX7rhPG62W/GV+WuzvtjJlJnHpRd6IOT
 WFvYqdP5Safs3ku7zZ1Tx+1WmHRgyI3c9T+R5731DaB8DPrMDgTDNA+CwEn/ngS/Wdnb
 QWRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UHpKqpYg
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version
 2025.2
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/python-pytz/python-pytz.hash | 4 ++--
>  package/python-pytz/python-pytz.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
> index ca64cb7d79..2779cebed4 100644
> --- a/package/python-pytz/python-pytz.hash
> +++ b/package/python-pytz/python-pytz.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pytz/json
> -md5  efcb554763a36b3e18acee074f44d1a5  pytz-2024.2.tar.gz
> -sha256  2aa355083c50a0f93fa581709deac0c9ad65cca8a9e9beac660adcbd493c798a  pytz-2024.2.tar.gz
> +md5  6a7760c71e38b6c75577b34b18b89d5b  pytz-2025.2.tar.gz
> +sha256  360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3  pytz-2025.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
> diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
> index 1d37d09ab1..4ad946cd65 100644
> --- a/package/python-pytz/python-pytz.mk
> +++ b/package/python-pytz/python-pytz.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYTZ_VERSION = 2024.2
> +PYTHON_PYTZ_VERSION = 2025.2
>  PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
> -PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/3a/31/3c70bf7603cc2dca0f19bdc53b4537a797747a58875b552c8c413d963a3f
> +PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/f8/bf/abbd3cdfb8fbc7fb3d4d38d320f2441b1e7cbe29be4f23797b4a2b5d8aac
>  PYTHON_PYTZ_SETUP_TYPE = setuptools
>  PYTHON_PYTZ_LICENSE = MIT
>  PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
