Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A996CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10F5D607E8;
	Thu, 14 Aug 2025 20:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWFTePHqAEwp; Thu, 14 Aug 2025 20:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CBFD607CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CBFD607CE;
	Thu, 14 Aug 2025 20:32:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E708228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A1526077F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_dAifY0f8vD for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A17260785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A17260785
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A17260785
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:00 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b9e415a68fso1259462f8f.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203518; x=1755808318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WeygxBObiQNTQ72IQl3YxQSrqKkFqctcYaER5tq6UWA=;
 b=K2ZzSn5STGGIl8YeeXcNWOLTz7DCiGtEA/fagIno+qvWXNo3pVcbu8+8XlDJPddIy5
 ZBLG3Z6vIT0wxqslmLA3BSWLu9b/LMFAOqyu37Xh374MllsqQ/QaBAB7LyKNcEDu8am4
 WwmDWInccw/NWZUTpgeEm8V4aNWBdJKy5spquQEINVaxbm2pWPsCJ6VxVu+LmJnWcC8D
 i/LeLKFlKJllRdphdjr+5LEFsoUDb7EnXsEJKWO3CEKbvx69eB/4s6+yYxxJ+3qrs6+v
 zre9pHDb0zVK1IujYeNv+eKojfRy47omLb87P2p9+FLJ9JKdbR2mDHfMxpDxS3felt4E
 8wNw==
X-Gm-Message-State: AOJu0YxtO1jx3kqV0FifuFEH+CcvajoCNxK+bIiAQn6TQYW7Ap9Af8nv
 +jUGX8jdLYHGuWueAIO3iq4OipvWu4u0LexyN6DZtQnNzofVlvTkueClG1li01E781w=
X-Gm-Gg: ASbGncuaMxvcBMFUBOxb3CWpoV2iHkCND9IfTZlD9ieIpSM/ieds2t1Wpv/TQVNXlso
 Zw2NbtjegtErT4SNnGGDUqdoK0EDqKRoCObefmlughZpW9D8WaCKRFmldVxap/DhDCyYdG5cc4P
 PXxh0242KfRjwAa7YL7fjYD5hS5ekrEWU4jrFSt0aT1NAtvPR/XhQryJEk2t8gX61esgoOGq9wq
 llB8Ys+Jv7xKh736hyPi6mVW51LRzoIWAi/AZkievdUVBtR12gNVMe0jonKyuZc0Zc2am/+bOwC
 uYv1FchnK6a+iTlrl6s+R02vL+5HM3hldtYiIaWp6VnSV+6V5l8koiUfZ21LHOVc5D6oZsmZrOR
 JMYS3ldOwE9c4uQ==
X-Google-Smtp-Source: AGHT+IEB/cBQp7R1gr4YRNTF5NpPi/ydrEUJATO84NsKqehPanVxhdUH2jY8qx+WHGqCoWEjWw+GNg==
X-Received: by 2002:a05:6000:4285:b0:3b7:8146:4642 with SMTP id
 ffacd0b85a97d-3bb2483c9f9mr76474f8f.20.1755203518391; 
 Thu, 14 Aug 2025 13:31:58 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4530a8sm51622462f8f.38.2025.08.14.13.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:58 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:57 +0200
Message-ID: <20250814203157.2816100-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804210132.3249620-1-thomas.perale@mind.be>
References: <20250804210132.3249620-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203518; x=1755808318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeygxBObiQNTQ72IQl3YxQSrqKkFqctcYaER5tq6UWA=;
 b=S2e+odCUDFSyXeSQTtppS9ixUndwFKOazW5FKFNcv+Wmm247i6cveh+gVNWtgUY0/a
 0wv71DnVcVk70CqwFoqsWhX8+bKkTmvWN5fRU8L3DCvyg97fSTeHYtlSMjwHwLPsEVoF
 5pPbRJWvCi2tIE3KVyYK2KYGxAEsZexelqoDFP1htluy6u8QRZf69PcLtPEWX0YMD6Cv
 xwK/B5dSJvQZOEGLLrpGePgkb1epXR/+t/PEu/0Gzj9t5jXlKau3w+eo2O3oob7YV2S2
 X6O2TQX/SHqLUqiinFF9kNR6slWtXqTQkqOdOEpVeskQCK+G5/RLbHk8tMSruE+1uE41
 gjLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S2e+odCU
Subject: Re: [Buildroot] [PATCH] package/apache: update mirror url
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
> While the 2.4.65 release of this package is available on
> https://dlcdn.apache.org/httpd older version are removed from this
> location in favour of https://archive.apache.org/dist/httpd.
> 
> In 2025.02.x branch the apache package hasn't been bumped to the latest
> version yet so the following error started appearing on the autobuilder:
> 
> ```
> >>> apache 2.4.64 Downloading
> wget -nd -t 3 --no-check-certificate -O '/workdir/instance-0/output-1/build/.httpd-2.4.64.tar.bz2.hfXgDB/output' 'https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2'
> WARNING: The certificate is NOT trusted. The certificate issuer is unknown.
> [0] Downloading 'https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2' ...
> HTTP ERROR response 404  [https://dlcdn.apache.org/httpd/httpd-2.4.64.tar.bz2]
> make: *** [package/pkg-generic.mk:179: /workdir/instance-0/output-1/build/apache-2.4.64/.stamp_downloaded] Error 1
> make: Leaving directory '/workdir/instance-0/buildroot'
> ```
> 
> To avoid running in the same error once the next package version is
> released this patch update the site to the archive mirror with all the
> releases.
> 
> Fixes: https://autobuild.buildroot.org/results/7a0/7a0982bcf9db4dcbcf4f6cf31b9f19571c061ee4/build-end.log
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/apache/apache.hash | 2 +-
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index ca9d1580ad..5b0aab0af2 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.apache.org/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
> +# From https://archive.apache.org/dist/httpd/httpd-2.4.65.tar.bz2.{sha256,sha512}
>  sha256  58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3  httpd-2.4.65.tar.bz2
>  sha512  202f8bfe2aafcfbcd7315191d466e9c10b9a8c0abafb7864510b6e1abe4cb660aaacc2456aa77d43e48ef7a49e591d0b54170d3daf67abc3e06c3da1c63fdffc  httpd-2.4.65.tar.bz2
>  # Locally computed
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index cb029274c5..23332f3e85 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -6,7 +6,7 @@
>  
>  APACHE_VERSION = 2.4.65
>  APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
> -APACHE_SITE = https://dlcdn.apache.org/httpd
> +APACHE_SITE = https://archive.apache.org/dist/httpd
>  APACHE_LICENSE = Apache-2.0
>  APACHE_LICENSE_FILES = LICENSE
>  APACHE_CPE_ID_VENDOR = apache
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
