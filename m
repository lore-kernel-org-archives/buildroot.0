Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050ACC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA8E811DA;
	Tue,  2 Jul 2024 07:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnXtVIJmM_rg; Tue,  2 Jul 2024 07:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2F18811F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2F18811F5;
	Tue,  2 Jul 2024 07:44:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC0971BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A48A9404D7
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCa_jTTsnGXI for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DFC340460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DFC340460
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DFC340460
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:44:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso1463929a12.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906269; x=1720511069;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I/ko83L8bgIiKvqR1alGexkXoxmo7bLdpBlBDetAvS0=;
 b=VYza9e0h3epUIpIkenT3xCfXS1D8huBwYs8FOzzVApVCedESrL7EpxEz5svAMYHdIW
 dvEVR1+OigSkq9lwQeuxYPCeD4XVOa6evCHZPswcdcii3wYbx+U6rrIypnXkVRbhBPrw
 3TQ3ow1PfAd5Yf7IK74IRiBQmbVDRXFQXlSTIF05QSHA/iTVvbmslGph7HonXcCQl3nB
 34lTEMNg+2Rec6nzyqHGU1I7zAOFf3I+AqFojsKpLzoDEuF05K9/fVg4RU662vwNPHm5
 byUSlvSEL4oNQrAAtVuRwQahTIdcR6kh9jwGQa6Y/tk8XFTw6fLcExFJ3WzzIEnEm7UC
 ssAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM2DpjssauJ9QfxDtoIqg/8J/K5kjskIWdNmov6ucbuCMkGdu60OuVqbtutCaFx3KCu+86A/K4YdQylnssstMDzYZ/FWaBnA==
X-Gm-Message-State: AOJu0Yw7Fc/gdsu96Gd4wwboMjIJ7QvIleb1TyVDsyo1FAh9t6jqkcEX
 y7x8gVeR5l0kbY1OwmxaNzCcuPohThJCKb4jTTkX/U80pX64a0fB0y5Q+MO8UtQ=
X-Google-Smtp-Source: AGHT+IEAp2nsY1VE2zXTiC6D1kycUxMNI6NgkNXdOLb8j28uG7RqOqW8NJ9E5Ff9N8JTH8adtSisBw==
X-Received: by 2002:a05:6402:2113:b0:57c:fda3:b669 with SMTP id
 4fb4d7f45d1cf-5879f59a5c9mr5548314a12.17.1719906269235; 
 Tue, 02 Jul 2024 00:44:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58612c8371dsm5333453a12.9.2024.07.02.00.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:44:28 -0700 (PDT)
Message-ID: <d2c00cd7-9212-4e00-9b46-76b95cdca437@mind.be>
Date: Tue, 2 Jul 2024 09:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701185449.1755932-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701185449.1755932-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906269; x=1720511069; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I/ko83L8bgIiKvqR1alGexkXoxmo7bLdpBlBDetAvS0=;
 b=iB88KbX2RmMLQrX5IceIOzjwcvnBari15pJyY9NC7yqrGONrqXl34XJxJS/fC1hgq2
 /NNj2YAO7qLAh5t/eeD6eTZs9JrahJeGBlf41E5Sy70dW2gifzl4Kl/vy6MiW21lmbZw
 EYyBidhzRxJlm8/YEcOCf09qvqV9RCoDU6hKEWPqRp5VkkvyXGdIuNgrfs40eru/QxgC
 Sbk5U5NGe2aLkeuNn0TdgEShFuAwRp7zPqQrBflHDwt2hshhkw8g4D8mwmWkiBcJzmsS
 /ROF7hBqAoy8q26a7pefc2nDc5gFOT2XYAx6AgVrhwPjc+oPst5Fa318Q69MUYaa80g5
 FshQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iB88KbX2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-markupsafe: bump to
 version 2.1.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 20:54, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-markupsafe/python-markupsafe.hash | 4 ++--
>   package/python-markupsafe/python-markupsafe.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
> index ec357a83ce..c6f9cd4702 100644
> --- a/package/python-markupsafe/python-markupsafe.hash
> +++ b/package/python-markupsafe/python-markupsafe.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/markupsafe/json
> -md5  ca33f119bd0551ce15837f58bb180214  MarkupSafe-2.1.3.tar.gz
> -sha256  af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad  MarkupSafe-2.1.3.tar.gz
> +md5  8fe7227653f2fb9b1ffe7f9f2058998a  MarkupSafe-2.1.5.tar.gz
> +sha256  d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b  MarkupSafe-2.1.5.tar.gz
>   # Locally computed sha256 checksums
>   sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
> diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
> index 0dca997f87..b54a77365f 100644
> --- a/package/python-markupsafe/python-markupsafe.mk
> +++ b/package/python-markupsafe/python-markupsafe.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_MARKUPSAFE_VERSION = 2.1.3
> +PYTHON_MARKUPSAFE_VERSION = 2.1.5
>   PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
> -PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/6d/7c/59a3248f411813f8ccba92a55feaac4bf360d29e2ff05ee7d8e1ef2d7dbf
> +PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/87/5b/aae44c6655f3801e81aa3eef09dbbf012431987ba564d7231722f68df02d
>   PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
>   PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
>   PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
