Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48E8C79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65A1A60DEF;
	Fri,  4 Sep 2026 12:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUtpUirjd9lM; Fri,  4 Sep 2026 12:19:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 168DB60DD0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524334;
	b=VZQkvfTgrH6VijSAWUjFO2MwJ5W4rANb9Htbv/osGtvncSirLf4UtaKZEEeKFPF4GWb3
	 Fn1rG7IECU9D0OgMlxQj+QAlY3rdrSpmGvtqxX/G4yb54l9hMSrRG178TKt89fWioqjW/
	 R3SWZrgHxzljA8GfYXPcnSGleB4fpoNpZHewZSD2qLhs+C+WF0Pf46vhpuHXOjhPSURhM
	 KBE3Hd2uyczT4VgMeJAFwfwgE2tUF36kSkHuQmipaSBeGifES2VD/wVokx6ohFObi4MHe
	 8XCdtfM8U3Zrm/F8N0oNrTZekdfkV4V4nVbSE/s+tdZAUSWKju/Tby4bb3Anvnk0Tzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524334;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FEAlz0Z7H0iMSVou6TO7e31wwhXv4yXQRRagdSCepIY=;
	b=g3vtacBUBK2JQgT1RDXyHZv65jTRPMLxWB4M75Z1+4zuEZEsWX8Z3ee0Xmmv8APSzka4
	 Fjm2BAEAsU5qQcRf6Tn8RVL8CenFooOb86gM01UEjr6b1ye6cnNeqGHrupzJaOPIOZtEw
	 cRqsOk0aoa73T8JonREAi+CPeOUrWPHTdt10Us9rdXRXyV/yCphXbPxC42Qbe/MsrmCk5
	 iWpppx6EQT12Uz+NHw4Op1UafSTREHYZ0Re3Hl/Y2/syfqh9+LkyaDrBb/ZtWyjE0TrIT
	 sVFuszcZxepltmKmD4RbBWOuXgFEfaZbV0obvEVQdwbh07UEueeHZC9Zs3bYiUfGesw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524334;
	bh=FEAlz0Z7H0iMSVou6TO7e31wwhXv4yXQRRagdSCepIY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kPGe3Kk/S7rk7VocU5t03w58TkVa4zDHYEIq5dLOQfow/QaEzz3XVr+tksZrn6jIk
	 dF/d/fRZGXb42k+tomeUaRTd0YuOjDMul206Qs/Qk8nEUOCB7eYasgokUypXS4Puvy
	 wwVWUzggGvTK8WJ2TuyyRHNUdBHzxmsUGIf/Zov46u+ZObUQGzplsJ0qWVR3Ou4GB2
	 KNhK6CN30FibrWJgUByNnXmvqF/0w5pFXdZiY19/LWPnzTfkWjcIqG2oJHDtct1OMj
	 vJmQ8XqQ5AQiwXNK4VZHJyllNlzyxpCz2TxGEcdqDzashDTvW5dutQ530I1troWjlv
	 ljsNGpn7HGVBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 168DB60DD0;
	Fri,  4 Sep 2026 12:18:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E213D10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3E9481174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eOkz1wbmny9t for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ABB2681172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524328;
 b=c9YZsaoTIVg7ZfHOIYf4PiNRIzFpL60UMpWuZKemV0aRzI6sPy4vkG6HXzpRnFTV3oQn
 w0TWo0krCUS3fBwrZv4PUxPxUHfRMa/SAanF2vV6jNFAqooMRO7DWlO1nEmOS9Fth6hzw
 N6g85zuSOpDvs6NOGKWE7reyTrOMeVYA1pYSfeDu68ZqywINtZs2bgvDa0oAV27vo2X1Y
 +Cnqw1HZS3l9BOdA+nw3DMBKKkfMKo4J4XXNHvrTdoaQNOwvjxCOu/u9+l7UvkZslBT8B
 aJpEWHJ7qt7/DgQyMBQfoyLtNoHGbc0nczDN21rFY93TpkcSCxktLggTIZ+BP1OgXuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524328;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=XflncVUkGCLaTeu5LaLRm8nWcAhXmMyNyx5dPXeJCYY=;
 b=Qe6AcNYG4hswCRPnw9RHJs+vnld/0LFWhEzKKaScbDexv/VxbcSb7peRfjdeEiu+6FHD
 OFpDcsVzN73aYxhoUVlba5t1wwHfWsECgL877LGcWaq70I8bjOAOZEt1rsLvwuJFZJHCX
 FZnchVM4G2mvzV2G48bbk9wUgWjYEgicxQcXei6TEXeedDsqWxbsRO6B9lEUWO2f2u1OE
 K4wIVX7Bw+G7atgkwfnK1naXK5mtr2H64lzbv8BOxzCZWEswaAyp7hej/WEzaYGzVnbVy
 mubrid9QJpH4SwfTkFDsE1j6EyTk0R0frS9jcHk8Mdy4pAfUGOwJf9t6crShn+3h71Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JofM3+ZH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABB2681172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49ccfae359fso7479375e9.3
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524325; x=1789129125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XflncVUkGCLaTeu5LaLRm8nWcAhXmMyNyx5dPXeJCYY=;
 b=L+v15RQ5YK5P04LtRLGj2+6Dkc1RRQiqTyA62tOG+d5D1OcJIItQEqwCPTZnLWIyAR
 1tD4nUIJvXAfsGrSSKTP3AK8rIjehJMmwIl9RAUAc2xo9RVQCiVZoE6taTmkHx9RqPTS
 maswjijY5gxtuRMEekUmpRF4Wi13vy96oA5RJNtHzGlCs83YQ+J7sWF9wzdQ9EIo+zfV
 x2jKylYaxSmborkxKq4+sTqDOo7qI1deNdkgr2/dgbOBB8ZlwDI1d2cOc0Yf4Jpbr9ae
 qYnY8SWPAfMYHB7tvCkZQG+E4fRgBEBR7uk10hc8/+PY3v4ogetAJd+3K0cFgm0GkZbI
 m6Cg==
X-Forwarded-Encrypted: i=1;
 AKwUvByfvCBPwau0+QzN03iKsTDr03JHoCN3n3ctQ4MWHwfuRbVZqD3Kb6p+p1GN3wFlMSQ6bmjbPUZ9pxg=@buildroot.org
X-Gm-Message-State: AFuF++kTqEiZFR5q1cM8XfdAVut4yBdpfiJt4+GngdDPT49cnH+EJGSH
 Ar5NjDFui1DWS4PjSW9LhrULRq3E2K/EvJCoxh2uh3BVKOrq0f/Uvr3eVmYF/nhel7Q=
X-Gm-Gg: AYBFou3fi8MoHVDNq8HsLXlx90tmCgwHwaMosmegJs0KDIkoCt/lFxZQK/0HdvPKhsZ
 u/ww9AS+VmpIlzLwbn/zI3gYJywHaTukgQeC1EOTL46CP1EeJGp+XtDW937ixv8/kxsKrRIAnT+
 VeYAdeV4DIXE0NJ38nORIbNZJdIgDMryedd7XIbhIUhnAdMXcteElLlQofwUmeAjMdADMl45jWU
 vtmt0tIFXZ61aVdRMH/cgRVF3bEn392wZ5Y9GnY8rqpiDyHUU19kXFRbywuf04qDdRRZatt7lU5
 WvW3kh3g+AOROE5vNoO8PpjqFVQpAwlfAvKA9ujXB1QFdS8gUVY7KAFgWH0WCOxrQ+lFfY4zu/P
 COlBJvq/WNzqOMZkabxkf6pmSQ/xhT+iYl/cEDwiTCb9tFc5QjW/rvIynineQfnOUU3glFADKMu
 flPRp7G4pKIQaOE+n2TzN/NWlAIEGTynkUfuVxDSHqu8Xuzmexnu90DA==
X-Received: by 2002:a05:600c:138c:b0:499:51f0:a9b2 with SMTP id
 5b1f17b1804b1-49cf820b36dmr59093595e9.1.1788524325244; 
 Fri, 04 Sep 2026 05:18:45 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cff81c9b5sm3621785e9.4.2026.09.04.05.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:44 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:43 +0200
Message-ID: <20260904121843.406093-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826073716.32029-1-titouan.christophe@mind.be>
References: <20260826073716.32029-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/{avro-c,
 python-avro}: security bump to v1.12.2
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
> This release includes a broad round of hardening against malformed and
> adversarial input across the Python SDK (bounding allocations and enforcing
> decompression limits before trusting size fields read from the input).
> 
> See the release notes https://avro.apache.org/blog/2026/08/12/avro-1.12.2/
> 
> Also update the download url, because www-eu.apache.org/dist/...
> is a redirection to downloads.apache.org/...
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/avro-c/avro-c.hash           | 4 ++--
>  package/avro-c/avro-c.mk             | 4 ++--
>  package/python-avro/python-avro.hash | 4 ++--
>  package/python-avro/python-avro.mk   | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
> index 9a53346cd1..4e34c27c23 100644
> --- a/package/avro-c/avro-c.hash
> +++ b/package/avro-c/avro-c.hash
> @@ -1,3 +1,3 @@
> -# Locally computed
> -sha256  b64e31b94719499549622aa92f1d96d1742967ced261a0931b63be3bbe907f2c  avro-c-1.12.1.tar.gz
> +# From https://downloads.apache.org/avro/avro-1.12.2/c/avro-c-1.12.2.tar.gz.sha512
> +sha512  bed6a7e324e7cac52d2bdfe0a596ab90c32c0f99ffecb517a72e465dad5fcfddc49dbfde0efa33e4c8ad73f2e97ad2c90d52f31a51f55b05576a9b36b2c3546b  avro-c-1.12.2.tar.gz
>  sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
> diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
> index 3e41716836..8d18f78cdf 100644
> --- a/package/avro-c/avro-c.mk
> +++ b/package/avro-c/avro-c.mk
> @@ -5,8 +5,8 @@
>  ################################################################################
>  
>  # When updating the version, please also update python-avro
> -AVRO_C_VERSION = 1.12.1
> -AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
> +AVRO_C_VERSION = 1.12.2
> +AVRO_C_SITE = https://downloads.apache.org/avro/avro-$(AVRO_C_VERSION)/c
>  AVRO_C_LICENSE = Apache-2.0
>  AVRO_C_LICENSE_FILES = LICENSE
>  AVRO_C_INSTALL_STAGING = YES
> diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
> index f7a241b14d..2941240053 100644
> --- a/package/python-avro/python-avro.hash
> +++ b/package/python-avro/python-avro.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/avro/json
> -md5  e2debe491ace30e479944ac4e8e832d9  avro-1.12.1.tar.gz
> -sha256  c5b8dd2dd4c10816f0dc127cc29cfd43b5e405cf7e6840e89460a024bf3d098d  avro-1.12.1.tar.gz
> +md5  0ff774ab3e45a2d48e5b68cd688cba66  avro-1.12.2.tar.gz
> +sha256  e900e7b59a4781f63d9e935e88f6ec50c4d60be3f4adf9c63b51ed39d578fe08  avro-1.12.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
> diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
> index f13ea9d2ca..37fcf76c90 100644
> --- a/package/python-avro/python-avro.mk
> +++ b/package/python-avro/python-avro.mk
> @@ -5,9 +5,9 @@
>  ################################################################################
>  
>  # When updating the version, please also update avro-c
> -PYTHON_AVRO_VERSION = 1.12.1
> +PYTHON_AVRO_VERSION = 1.12.2
>  PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
> -PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/60/00/af1eec633637e12d0945a97f05a429eed83ac45865af60cb453db4689d95
> +PYTHON_AVRO_SITE = https://files.pythonhosted.org/packages/5f/68/973b9c682aa2c3cf2b05fc4c961af11b9be1d9b46604f65aed23cd4fd1e6
>  PYTHON_AVRO_LICENSE = Apache-2.0
>  PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
>  PYTHON_AVRO_SETUP_TYPE = setuptools
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
