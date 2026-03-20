Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1884B1098797
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0A7061B8D;
	Fri, 20 Mar 2026 15:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jaYrI0mgEoc; Fri, 20 Mar 2026 15:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0209E61B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022132;
	bh=8101dOZDQBrL/rW0jsEbsk9AWUN2meiKaUjEiIQQYdc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rzrlScbFeT/44UizgNu5Emi9AZf02Ewu33FEBQZsDhf3y3syo6b4IxSFado6ICu8Y
	 l+5J8phZxXWHuA9FLMtseO1MaKLGtZTiS/U94FXSBT9iI3x+iQeOYtWvWNb5fckwO6
	 DuV3vPu2lBeic6r8G9LDQEuIvqhX39EJNDWrGl5N4vTUnfZ3flKsjU+eRqwryvzAZH
	 6FFTSsiDU36jEsXWrEoojpurkSxOWlqJ1+VtCb+D9PHXS1FEG6/ORvtXuOZNu1WXbh
	 68JJgvEdMJqcYmSDkqFjOf5sPOS5IogqRXkT8ADHwwKjW5hiwDXhbQFBTQCUTYOKMS
	 N8yeNFvC3fXIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0209E61B7B;
	Fri, 20 Mar 2026 15:55:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 429531B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3288D61B9C
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7JwGTiAMLSqJ for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0956361B89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0956361B89
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0956361B89
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48700b1ba53so6702435e9.1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022117; x=1774626917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AqULAnhTFLJQf/RTJLBYyrnZawhRmDiP2aH1I5YxnPQ=;
 b=gv7qfeqPvSOtk70d1K7FR7N+8i9FW1tTFRD1r6sAoM1gHyPbJ6zMqBUfNSTDxQSyaV
 eifgdnN5iB9RYqwPnBPtiqD7j1AktbXaB2xoAkFfi3/+qo03ZWBOSSLMUPIX3ZSQ2IKD
 iFa8UBWaozydc5jk/Crod+NKwmbLV7u/OWYRBU9KkTxC1oDVxfQXMQBXOcfXXR3XylcO
 xQ9RQnppcQyXQ+9g18gpe+zDEcv6YZ2zGi0geiIiN5P3Es4WrscZ2pZM1JyJ4x68+yxu
 UUWDu8+ubpNUn+oiBS9qWi/oOpwIE+cUPzyxJWp3dxk8Kd65XgeRY/HzJdMsK97Bu47U
 Jg4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4i6bHq/i7OxV0Qovec0PomkJeKrcaLu7/+JOgb9VBjrDIlx+0wwNqBzuItD2GVMVD07fBt23k6aU=@buildroot.org
X-Gm-Message-State: AOJu0YwJWl96HdOpM7gD0jmT6Z38aTYbulSj1apg4aDroUSiAS33mqR2
 vcIxmPDIPWccdhdBQ1RA9NvRYcdRXIZALfWno5c/w877udJpUpnDmvbw3F7zVkvwUeI=
X-Gm-Gg: ATEYQzwnUZG7w5uQeWtHIeXuQXegKVFxscUrjJR/MZSEDnRksE6CB6hUD4GHndI3sgX
 kD1wWT8/kBiqSkET2NmwErBPPZdE+STikeazEyztYniw9hRGlvyPlfj9j9RZ8kbTsEkfhURVWsf
 eEyIiiSddR6fll7+wQ2ts7WPMmsU4v69h8ZVga5QslvDdd0EafO3EXN406qmx4tlWqSiyyWU7q3
 SsRP70dLed85H/QNHVm7PwXhlx3wmYUPO89hDsZ+J8EEK+azI1W6KNifQzn3QWsYzISgvHC9i5t
 XJKk026EM8Yv2bR26L6HCfvVvQl8el3ALqD+PPnh1ltTBuXmtfiDP8q74zoLfKg2kFIMnxINl4L
 P2nA9y+i2F9ulgc8LIE/LcbL4DNsjdH2w8SAb6B1RBZxqqNKy4+qnbcx/D0nvaNUSEILkmUtm8v
 jE3xtURRCp0qcQfM71
X-Received: by 2002:a05:600c:3d90:b0:485:3c8f:e4d9 with SMTP id
 5b1f17b1804b1-486fee1d9e6mr48046275e9.26.1774022116981; 
 Fri, 20 Mar 2026 08:55:16 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b646b0b0csm6912317f8f.15.2026.03.20.08.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:16 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:16 +0100
Message-ID: <20260320155516.177167-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314140633.2967249-55-bernd@kuhls.net>
References: <20260314140633.2967249-55-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022117; x=1774626917; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AqULAnhTFLJQf/RTJLBYyrnZawhRmDiP2aH1I5YxnPQ=;
 b=ZqrtRXPAMHaYIJU99GTBjupofCeW4CxTaCkBeKwgIs4T1mI2PMrxnuRB5VahOPf5w2
 FAwAvjC+6XhHdIKeMG/6nX4J6HYMXtaCYPjKMQ4nMWEG1GRcckjhLRTLBF5yLHb/xOug
 6dQBlehBI16p+Wy6OFIEyHpjpHFY04hctwGzZA6l0YjgNb8hGKw9yanO/zRDVhfITjuH
 RfwKjl/bYO7jwjSRxpnXOmm8vPyT9pWyklnI0bn6FfJomkdbYM6zCykVLgsGFyXOejaC
 cw6syBGvSFowLh0FVv2v8n6ZNVHyCdflkzTJzL52NYFcUtejQUKQITgGm11OFzCD1sve
 4d4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZqrtRXPA
Subject: Re: [Buildroot] [PATCH 55/96] package/python-pyjwt: security bump
 version to 2.12.1
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
> https://github.com/jpadilla/pyjwt/blob/2.12.1/CHANGELOG.rst
> 
> Fixes CVE-2026-32597:
> https://github.com/jpadilla/pyjwt/security/advisories/GHSA-752w-5fwx-jx9f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/python-pyjwt/python-pyjwt.hash | 4 ++--
>  package/python-pyjwt/python-pyjwt.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
> index 5128285fec..92de436de8 100644
> --- a/package/python-pyjwt/python-pyjwt.hash
> +++ b/package/python-pyjwt/python-pyjwt.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pyjwt/json
> -md5  f3273aaf736c24795e78ac48adbab111  pyjwt-2.10.1.tar.gz
> -sha256  3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953  pyjwt-2.10.1.tar.gz
> +md5  12623a5898f60c4c86ad4ad8d92da216  pyjwt-2.12.1.tar.gz
> +sha256  c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b  pyjwt-2.12.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
> diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
> index 18e84b7838..268d83a487 100644
> --- a/package/python-pyjwt/python-pyjwt.mk
> +++ b/package/python-pyjwt/python-pyjwt.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYJWT_VERSION = 2.10.1
> +PYTHON_PYJWT_VERSION = 2.12.1
>  PYTHON_PYJWT_SOURCE = pyjwt-$(PYTHON_PYJWT_VERSION).tar.gz
> -PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/e7/46/bd74733ff231675599650d3e47f361794b22ef3e3770998dda30d3b63726
> +PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/c2/27/a3b6e5bf6ff856d2509292e95c8f57f0df7017cf5394921fc4e4ef40308a
>  PYTHON_PYJWT_SETUP_TYPE = setuptools
>  PYTHON_PYJWT_LICENSE = MIT
>  PYTHON_PYJWT_LICENSE_FILES = LICENSE
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
