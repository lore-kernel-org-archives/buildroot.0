Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A60C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E877860757;
	Mon,  5 Feb 2024 13:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E877860757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JJqF6oRZ3Bd; Mon,  5 Feb 2024 13:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D9760F06;
	Mon,  5 Feb 2024 13:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D9760F06
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D3621BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8B9F60F31
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B9F60F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRXy0zMrJvwR for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:19:02 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8B0B60F2B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8B0B60F2B
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fc654a718so26126705e9.2
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 05:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707139140; x=1707743940;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=95IuUBdiUIoLFKmRdhl2jPkXJlylmyjNCaGuNyWVlMo=;
 b=BbKtBzhTHOigizzqLiXWz37l56ZXLAFgCRlNnOjucT4qLEyH/qGA4/W1BnZc72jphl
 CIcnGYZMT8FQmbXl6qL0WCgmEbbaW1r0hBrOcy38IqIEys8if8YXJDwVV8PyO6JBm4vu
 Dfke4UTrb1vLrha6CytCxeEASRL2fnW2RCdhrmwzirHr7OU5Y6vj4WbS+nMwTP1vytKi
 pWNxsGDLO8G8ODNXv353AakIo9eNbKlKntkvJMJ0VlEzXeQDerFUpqqLA/bfLDxsx0Ka
 bpgpQWuMFHC02+TLsSbJ0eeyZSiHx0R6Ue128tmGmATPZqcYwpv60H3kGf6gUy7G7qX8
 KWmg==
X-Gm-Message-State: AOJu0YwD5F6+3Bln7uK8irJ/0tyOU8nTxvM8yXCTf+ULRTVTkNd7ijYB
 AUkp/h/zcRqm7RQqsVnp5NN82SWRl+hu8PH/Iadhffo8a9VKVBe6dRIzCltfeZs=
X-Google-Smtp-Source: AGHT+IFtwXmWDoecFqOsxkBtbY2/a1d1B34c9bTlB+VOZFfIk8f/q/T6fG5bImwHvnKtjiwPw2qufw==
X-Received: by 2002:adf:ab04:0:b0:33b:198f:4a45 with SMTP id
 q4-20020adfab04000000b0033b198f4a45mr6890672wrc.12.1707139139803; 
 Mon, 05 Feb 2024 05:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUs0c+qcUjAPN+rgWj8faY483dWx2C7Xxg3D4NZERxxEAaFJ7lnxdb2IhKIqchH1bOSnbO1Df4gbEKjtgEn0CetmfXTd+2Ftw==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d4e04000000b0033b3ceda5dbsm2282272wrt.44.2024.02.05.05.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:18:59 -0800 (PST)
Message-ID: <9e5137b9-b1e8-41d9-a8f2-6d1f3a5c3ece@mind.be>
Date: Mon, 5 Feb 2024 14:18:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240108063845.3446790-1-james.hilliard1@gmail.com>
In-Reply-To: <20240108063845.3446790-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707139140; x=1707743940; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=95IuUBdiUIoLFKmRdhl2jPkXJlylmyjNCaGuNyWVlMo=;
 b=YQk0omakqDUHfFpdEVR4C0eH5PMc8UPmqxZUlTIPU0Sddi+yQyK/UhcGP9svaHKibB
 vXapbOACQ1Y0noYqrwU7qZtjwuOf4EtrD3Jmm26Vd6KWNWoIX28zQnklSBBl+UXTM0wE
 b3HqB+/TazL+RaFedCralKWlRjpIYTsP+0KVB65V5x1Tr4RO7b6/UCs3YxU8zoBMoLAV
 f6Mhb56FCvmJNElUrSjEBghnDmEvg/MRkb5/2poy6Mcm3WnjCkcAXBU5KiGEP1zqTAXY
 g8YUV0Gwq9nxlcYqm40qet9/Iv3eF+iEt+wKdpXndcSXyzcH5v9G82fSgO5T6ZMsGTYl
 +5Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YQk0omak
Subject: Re: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.13.1
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



On 08/01/2024 07:38, James Hilliard wrote:
> Add new runtime dependencies:
>   - python-sqlalchemy
>   - python-mako
>   - python-typing-extensions
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-alembic/Config.in           | 3 +++
>   package/python-alembic/python-alembic.hash | 4 ++--
>   package/python-alembic/python-alembic.mk   | 4 ++--
>   3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-alembic/Config.in b/package/python-alembic/Config.in
> index a53dde7f7f..33fe3c3682 100644
> --- a/package/python-alembic/Config.in
> +++ b/package/python-alembic/Config.in
> @@ -1,5 +1,8 @@
>   config BR2_PACKAGE_PYTHON_ALEMBIC
>   	bool "python-alembic"
> +	select BR2_PACKAGE_PYTHON_MAKO # runtime
> +	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
> +	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
>   	help
>   	  Alembic is a database migrations tool written by the author
>   	  of SQLAlchemy.
> diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
> index df1f4fba02..1f752ebc7e 100644
> --- a/package/python-alembic/python-alembic.hash
> +++ b/package/python-alembic/python-alembic.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/alembic/json
> -md5  642d563af853b317f018026f3edd5dba  alembic-1.12.1.tar.gz
> -sha256  bca5877e9678b454706347bc10b97cb7d67f300320fa5c3a94423e8266e2823f  alembic-1.12.1.tar.gz
> +md5  29579d34ea694627280b52a3d3116664  alembic-1.13.1.tar.gz
> +sha256  4932c8558bf68f2ee92b9bbcb8218671c627064d5b08939437af6d77dc05e595  alembic-1.13.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b285268a86f4416eaf4d05b2ae3880c156f7c59a8f935a402bc056eafb33af08  LICENSE
> diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
> index fd41e0df66..52e30e39ba 100644
> --- a/package/python-alembic/python-alembic.mk
> +++ b/package/python-alembic/python-alembic.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ALEMBIC_VERSION = 1.12.1
> +PYTHON_ALEMBIC_VERSION = 1.13.1
>   PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
> -PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/44/b4/253fe31261d9f5d603d89bd9e6fba1625494a6d761d319902dfe4db59016
> +PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/7b/24/ddce068e2ac9b5581bd58602edb2a1be1b0752e1ff2963c696ecdbe0470d
>   PYTHON_ALEMBIC_SETUP_TYPE = setuptools
>   PYTHON_ALEMBIC_LICENSE = MIT
>   PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
