Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5182DCA0EE4
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 09:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 122B86173C;
	Sun, 17 Aug 2025 09:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u684MSyJ9ObA; Sun, 17 Aug 2025 09:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 334CC616DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 334CC616DD;
	Sun, 17 Aug 2025 09:35:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3E7E2
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 09:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0051561739
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 09:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9hpMwsOmDQ1 for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 09:35:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E81DC6141B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81DC6141B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E81DC6141B
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 09:34:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9e4147690so2194860f8f.2
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 02:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755423298; x=1756028098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VZVed+ihpXTQ0H0KTot+NizwedsVjZyDY32Orgp94sQ=;
 b=TjHbDHHn6Oh2KLmEmVWlX/NJ12g8dXqdMCUfDKPEn6UJum1r0HUXDCAx015w5a4YhG
 d9KPwXbGi1Z39iPT9Nyiypyb3X5FLYcS4tpGyHnzpfN9m0CexrSv95Vz6j47j1CNca6w
 X5RF5qTXsrBaqNR4VhbhVbwOa/9o7DaxqHIRqhq68hv+4Y/l7HX/O5spC+VkPThjd2CH
 SE35ZQ0ohAQSMU62Sc3OF3nAiLC8CWCpL4yMgl1TrrZ/ayq0W7jMiwcXqK3tOA1I6nFu
 w4T0Zmp1nInsIAwnuuG51ODFxcAVSJqRkXMWG0F6E1eG6oFN1ezYthghJQ9cdEhMt7bP
 sB8w==
X-Gm-Message-State: AOJu0Yz7UY86GcKcck6cDbfFzq51uFPp16jEXSquMtAms4C8Ik48he3x
 6UQgS9hJ+SbxNq7drmrrilQs7OD0E0TMJVskffJM7Jp2mJcJWcTqvl58MI7FwXIAEDQ=
X-Gm-Gg: ASbGnctAyD/ponuxG+8fWALr08FyKgXBOP74oV+WPgzLRCFr1so0T/0wdaLe8h2mRC/
 kUKB096nuY/0wnbihU1N4Rk2peawx193R+lpuVnTvVP/V0ksK3qdLGJd1iPO0TADbVIPVgPzGmb
 q3+8z7W10W1MiCAczcwx6Av3iSCnZWpXcfRUadZq1QJm+A4zmIrRnJaBM0yR5JHbiFPwvAaSu81
 jPgdTw71DcFkcLENJraPVhWVpxFWAcVvHjgB5b5VlQ5l0eoqAbOcENCMSMUz63LXnm1wl+dQo0i
 QaGoB/Q3XlnQNgBF+RH/VEP9M8mS3q3H3ZcRtsFYswZBb3rKdG+4dGC2rEj+FjOWvFijRz3vR44
 7Hl8ollHLWJIDbg==
X-Google-Smtp-Source: AGHT+IG/qRMYS39UTSb74bXmvyKwPoYx4G59c9xRFbUiEyKAis18ZerXMMHXxSrkaVuQf9/cKgBzMw==
X-Received: by 2002:a05:600c:4f91:b0:450:d37d:7c with SMTP id
 5b1f17b1804b1-45a2678420fmr32244005e9.21.1755423297436; 
 Sun, 17 Aug 2025 02:34:57 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a22211395sm84492495e9.4.2025.08.17.02.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 02:34:57 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 17 Aug 2025 11:34:56 +0200
Message-ID: <20250817093456.3457238-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250817093118.3455688-1-thomas.perale@mind.be>
References: <20250817093118.3455688-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755423298; x=1756028098; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZVed+ihpXTQ0H0KTot+NizwedsVjZyDY32Orgp94sQ=;
 b=MT6CIlIFczMg+vu6kqMinyHE7gcTx00WjQeoV+DmqcRUN/XhhdQpdDmMN1tVQL3wqN
 CnTMLL3lO8SlceKNmDGRJBGDq5WneeMYw0Df2mPLUdpDpwmie79fNc+MJ/5aOjRyHuQI
 Pzkv3J99sCA2CeJeE5+zpUAYzZp7vFLY/1ePGf/6p0YRfmRKjs3+ybt858Ey9/G+Nol3
 TGPs++NiB86Hq6RmX7wAigH6x8mmnf4judOEHyL3CVEXQ7Nv+CvKmmY5kryqJkDCJP1o
 O92a0zDHYzxEfTFANgeO5qUDxOveBsv9e8sFJzSgNdOjLB9eKU6TzOA2tGeHlvuBj2M7
 mX+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MT6CIlIF
Subject: Re: [Buildroot] [PATCH v2] python-yarl: bump to v1.20.1
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
> Since the python-cython bump to v3.1.2 (see [1]), python-yarl has been
> failing on the autobuilder with the following error message:
> 
> ```
> ERROR Missing dependencies:
> 	Cython~=3.0.0; python_version >= "3.12"
> make: *** [package/pkg-generic.mk:273: /home/buildroot/instance-0/output-1/build/python-yarl-1.18.3/.stamp_built] Error 1
> ```
> 
> The cython dependency has been addressed in python-yarl v1.20.1, for
> more information see the github issue [2].
> 
> For more information on the release, see:
> 
>   - https://github.com/aio-libs/yarl/releases/tag/v1.19.0
>   - https://github.com/aio-libs/yarl/releases/tag/v1.20.0
>   - https://github.com/aio-libs/yarl/releases/tag/v1.20.1
> 
> [1] b536caaec0 package/python-cython: bump to version 3.1.2
> [2] https://github.com/aio-libs/yarl/pull/1514
> 
> Fixes: https://autobuild.buildroot.org/results/d36/d367b69b85a65fa94e923ecff3ba03723b2a6e88
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

v1->v2: I just dropped the missing select patch (see https://lore.kernel.org/r/<20250816195207.5f8136a3@windsurf>)

> ---
>  package/python-yarl/python-yarl.hash | 4 ++--
>  package/python-yarl/python-yarl.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
> index ca2d42bf58..43ba31f81f 100644
> --- a/package/python-yarl/python-yarl.hash
> +++ b/package/python-yarl/python-yarl.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/yarl/json
> -md5  80b89d2b28be7345a38f099b2f839d7d  yarl-1.18.3.tar.gz
> -sha256  ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1  yarl-1.18.3.tar.gz
> +md5  23352fbc2b165825d4a33682c91788bc  yarl-1.20.1.tar.gz
> +sha256  d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac  yarl-1.20.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
> index 160dec8a1b..4f25394c8b 100644
> --- a/package/python-yarl/python-yarl.mk
> +++ b/package/python-yarl/python-yarl.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_YARL_VERSION = 1.18.3
> +PYTHON_YARL_VERSION = 1.20.1
>  PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
> -PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/b7/9d/4b94a8e6d2b51b599516a5cb88e5bc99b4d8d4583e468057eaa29d5f0918
> +PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/3c/fb/efaa23fa4e45537b827620f04cf8f3cd658b76642205162e072703a5b963
>  PYTHON_YARL_LICENSE = Apache-2.0
>  PYTHON_YARL_LICENSE_FILES = LICENSE
>  PYTHON_YARL_SETUP_TYPE = setuptools
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
