Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F43BC61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB7760681;
	Fri,  4 Sep 2026 12:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ditlLWtJ-Etr; Fri,  4 Sep 2026 12:17:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C7ACC6083C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524232;
	b=mk43h66wxMfeco3YBGWoHdfjOUDn6mFHavUqa27kmSwZ1FJw3Ugfa+yAOD84OEDf4g30
	 QN1VMT53T53dPYsZEF0XoQ6F0oHBadXbTgwFWOVjdgPbAqbNv97D5DShGzUt5wpAZUTvj
	 4Q3n9RqBJhvsu332x1dHHH6wqlWVZfO2qlsrQWFW+AgTa4A7j/jvyU5xgILJEtwnLYCWz
	 pbQLLdbcwzlyC6CMWZ+tWC6SofBob8v6QFSiM48EZ2yfYaOgWIIU3fLO/PiklOQRA75Mw
	 HEJaTVqI9Xn3k/HgLMxFmJi7lypr1C6Iu2mgVP3a9HyyWdxPSl6OJbNuoh9bTT5OnXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524232;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PRzywnlKBo56vEHY5mT8V36hUoDg/oJYc5bub0S7zv0=;
	b=g8Rn1dmhnjuhrhB5ENTpXcno9kUl0HjYqq+dFdm3MM+opyIIKLAPSDStf2IMMPxPZ/SE
	 olFGb1/42OYYxG8qvOXREBGIVZwPjzdXFLnF87wTXCuHR9PWeu9uWMEfq65+b6mKFeGXh
	 UIHPQ6m2cUCxI1SZK4UhaJoeQpItDUwWrY1NBszfjA8GJK0rAVBZ4laRXEemSmMejEtJU
	 ddY/rPdZ6BzFmimxGyMguxq8fkteP9R/A4iqNQa6tW4LeQF+a8q+09l5l5a0HSCbHAUMX
	 zUUh2a66NuPMUDUcMNL5GAudKWKx372TEiMW4nVKQHAC9QlaLvQ5HarzYYmBMMXE0rg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524232;
	bh=PRzywnlKBo56vEHY5mT8V36hUoDg/oJYc5bub0S7zv0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RdFm3jODEsS0IzkCXn6+e463HU9BamoO0/4TQ38LdU9dFVvszw3NrWWwePMmkYnGx
	 Ztz3ow9KWTBjjUoDo+qkLH5fwHNI+aakrzgsqehkm4E8DFcbMjjOGH2ava4vEq6VLs
	 5+Y7LhrxpbLtOWajXrxGfJxapXgVAbPYBL/7HvBXZTbwfNUshMyj6Fr74yp0oNtak4
	 RJHJJFTnjwSAPHMcC21yoLzxJN7nY0CiIZzOPfJpjRTLM51QGsmpVcP/TsgE45TO3p
	 Z/nsyExL/flk2wifG4WJF1QNRt1M7uv72I+2Gy2rvdcRjezLYXlr8gxaETGrKQVVXP
	 8ctEBiP8IRz8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7ACC6083C;
	Fri,  4 Sep 2026 12:17:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D618210E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C730881176
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSMLJtMrr1Cp for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3D07081172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524230;
 b=RujdYKXk9Ai6GkIeYbNOSoJf7H971eVl+0JqGSb/+BcO0peTm5X+LOZgQEgYLdJcsfJO
 7NSglRaJUt4yrceyCQb5NhTc94wldfYevEM2eDxRjJGp9fXUCj5CStMrSjFnpbnX+jhtP
 8SbkSLBqSkriaVCbYaSGKbfP4r+HmiW5CRi+ZyPMFP8W7I8xl8bIHNllsDVMuw++yregB
 WVZLEzgC7PSCBTmlt9b8uFm0+qmSYBPmhk0eMmBwdL5roitUdf/BJ+BEWHHVl4eDFX620
 ReXBiLyL0gwJFGHvdBeebwrhd7pW9iaOo2qlHHf7aTOmvY6MdBV/OnNgma9UaIyh0MA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524230;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=yvRKAevgFuY3k6DhcrE7lv1cyJ/OYsioiHyycFuHg8s=;
 b=aMUwnkwrfcC+AkErAxqvismpF1cWudRUvL4KfJtZlI7udSD7/YuG2t+FlOZrKj/h1I8J
 59gW+iSJdYdn/v5ot5lZz16XaP4GUhUFhVLzb3gsEf5kmQd+eQPYATmb4aSHuVS9dYlAq
 UouxBhXFn4qvYnSjO9Pk+lBg6eM/F7/gpn7T31rhwGCDfv5LHHXZXu5Bnmp77qNEfpVJY
 IlAobk7+OtTAzbY9BkO6jN0AvBjsxwyLpy5TFViiSKskJlOYlFywwxbJxSnjI7xEdHXSt
 fp5F6f9qmbZst7WfqtIYJxZI/+xywmSoYAShGx72VOqVbtLdC8R1PNXc2ZQqwVvN1Tg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hiZWmnFH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D07081172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so8911865e9.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524227; x=1789129027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yvRKAevgFuY3k6DhcrE7lv1cyJ/OYsioiHyycFuHg8s=;
 b=hokdeD34m6JpKzv9UGpMRg+pgx4z4rCcYlCZCm4J/tAqx/++SWqOzwCwFIp7c1tl7D
 Vm5Vs9xf1avmtUepLke/FL0tL/HMV0+NaMTvSWWTe6jqJImJbxGtlXXXRg/pmiN02AWN
 9j7MMTPDWC5iyEQHXef5iz97DvYyd/qvCCWtyUf4aQikQd3j+g/VwkzuJiXhkZzv4ZJ5
 XHm4tdeJSgvWRSn1RyGGnH0UvxKAD/pyqemTaoxEEjspwknv+fIWUEsaTm019FBKSH0N
 O9tQMI61FpOAtuh3DguZUF3IY3NM0ZdxZkrACZgEcMIonXnnulvTET2hEaFJ1gMAj0H9
 cLtg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwtK0f0OmLAxxVIYp7d40bxHyiMx9Bho8Q01bqe8dqUDf234LY8W2z34i7oYlG4x9OOolixLVnNtHc=@buildroot.org
X-Gm-Message-State: AFuF++nREPrsudvM+eivMh9AsQkkaHd5s2jKOpgWlE98jWXQzyJAvns1
 NM4TBR7IwMSke9CtwbDAHdAIsxewJcxQEQGWloO+F5S8WiF35+ZPqTgOjMPWW8zHYgk=
X-Gm-Gg: AYBFou1WuMsoWt758uyH45rGHXUhepXzpzgBjRAdMEXL6wiOonhxBJvqbbaOslGP9zV
 PP7pmsbKdK3jz42uyEwM+aMgNfGg3U7XQHP+a7RjzrU4kSADO31R1JVccc0s+eh8CYGQFShK3mr
 7qMDYuJXyGo4+d1C/7uF0XprYcOk22qazJH7ht/ksapiLPBvajQYYaYILBMDqW4zmLtjUpwIiZM
 uFWAlnRWykqoWSY+8A4Z3HtQpbfLnTEtFstnVFaiXn2+rcLYtWQxUPcheBFa6gTwyL98q7hWs7s
 lA8eZtZT47nCHGdF/ZGCiapY1jS+q7rdnfchP+wqLYjrSmE2Ji39cpfJNZ6BRQMoWy1tUG71ijW
 pLsgwbYH+g3H9uiG/7pWCxCE1H9P6zBldxO1fUoehh9mk6dZJSPd0QVVhXHWl4DroapBTZVsknb
 ucyBWPjhOuFSbPFdrszsmqqpHGUcx2VMYbiz4odRk38pSwzbzI6si+Ng==
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id
 5b1f17b1804b1-49cf825a75dmr59110765e9.15.1788524227050; 
 Fri, 04 Sep 2026 05:17:07 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cc7sm69255525e9.4.2026.09.04.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:06 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:06 +0200
Message-ID: <20260904121706.403294-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20251209193951.1000100-16-bernd@kuhls.net>
References: <20251209193951.1000100-16-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 16/31] package/{avro-c,
 python-avro}: bump to version 1.12.1
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
> https://avro.apache.org/blog/2025/10/16/avro-1.12.1/
> 
> Updated help text URL.
> 
> Upstream does not provide hashes anymore for avro-c.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/avro-c/Config.in             | 2 +-
>  package/avro-c/avro-c.hash           | 6 ++----
>  package/avro-c/avro-c.mk             | 2 +-
>  package/python-avro/Config.in        | 2 +-
>  package/python-avro/python-avro.hash | 4 ++--
>  package/python-avro/python-avro.mk   | 4 ++--
>  6 files changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/package/avro-c/Config.in b/package/avro-c/Config.in
> index 76d9123a4e..2789e12ad8 100644
> --- a/package/avro-c/Config.in
> +++ b/package/avro-c/Config.in
> @@ -24,4 +24,4 @@ config BR2_PACKAGE_AVRO_C
>  	  - Code generation as an optional optimization,
>  	    only worth implementing for statically typed languages.
>  
> -	  http://avro.apache.org/
> +	  https://avro.apache.org/
> diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
> index 8c6b4b625c..9a53346cd1 100644
> --- a/package/avro-c/avro-c.hash
> +++ b/package/avro-c/avro-c.hash
> @@ -1,5 +1,3 @@
> -# From https://downloads.apache.org/avro/avro-1.12.0/c/avro-c-1.12.0.tar.gz.sha512
> -sha512  71f0a8b63e212a12d38c05ef0c8e17822af7eb38698e07550a15f49d3f976f015f31cd804784df76c16e6cf7129c0d1a5028cb78032ad0259b4d151dcf022099  avro-c-1.12.0.tar.gz
> -
> -# License files
> +# Locally computed
> +sha256  b64e31b94719499549622aa92f1d96d1742967ced261a0931b63be3bbe907f2c  avro-c-1.12.1.tar.gz
>  sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
> diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
> index 0f1ada72f8..3e41716836 100644
> --- a/package/avro-c/avro-c.mk
> +++ b/package/avro-c/avro-c.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version, please also update python-avro
> -AVRO_C_VERSION = 1.12.0
> +AVRO_C_VERSION = 1.12.1
>  AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
>  AVRO_C_LICENSE = Apache-2.0
>  AVRO_C_LICENSE_FILES = LICENSE
> diff --git a/package/python-avro/Config.in b/package/python-avro/Config.in
> index 1f67732ce0..6a76c60f2d 100644
> --- a/package/python-avro/Config.in
> +++ b/package/python-avro/Config.in
> @@ -16,4 +16,4 @@ config BR2_PACKAGE_PYTHON_AVRO
>  	  - Code generation as an optional optimization,
>  	    only worth implementing for statically typed languages.
>  
> -	  http://avro.apache.org/
> +	  https://avro.apache.org/
> diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
> index 3556692398..f7a241b14d 100644
> --- a/package/python-avro/python-avro.hash
> +++ b/package/python-avro/python-avro.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/avro/json
> -md5  03dbb66d68ad18a332a4f4bce0700ca9  avro-1.12.0.tar.gz
> -sha256  cad9c53b23ceed699c7af6bddced42e2c572fd6b408c257a7d4fc4e8cf2e2d6b  avro-1.12.0.tar.gz
> +md5  e2debe491ace30e479944ac4e8e832d9  avro-1.12.1.tar.gz
> +sha256  c5b8dd2dd4c10816f0dc127cc29cfd43b5e405cf7e6840e89460a024bf3d098d  avro-1.12.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
> diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
> index e1cbea8971..f13ea9d2ca 100644
> --- a/package/python-avro/python-avro.mk
> +++ b/package/python-avro/python-avro.mk
> @@ -5,9 +5,9 @@
>  ################################################################################
>  
>  # When updating the version, please also update avro-c
> -PYTHON_AVRO_VERSION = 1.12.0
> +PYTHON_AVRO_VERSION = 1.12.1
>  PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
> -PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/e6/73/48668732bbc8ae1e79b237f84e761204c8dd266c5e16e7601000aba471d3
> +PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/60/00/af1eec633637e12d0945a97f05a429eed83ac45865af60cb453db4689d95
>  PYTHON_AVRO_LICENSE = Apache-2.0
>  PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
>  PYTHON_AVRO_SETUP_TYPE = setuptools
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
