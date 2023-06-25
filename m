Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEF6EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E9766112A;
	Sun, 25 Jun 2023 19:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E9766112A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2Rt9Mh7bDgL; Sun, 25 Jun 2023 19:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FE9460F20;
	Sun, 25 Jun 2023 19:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE9460F20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7471C1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CF3640912
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CF3640912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exskPQYSVpKq for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:14:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08833408F1
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08833408F1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:14:02 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-98d34f1e54fso235828666b.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687720441; x=1690312441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zZVrM1cK0khlCcquWqgyf5SJrlDX37rGPZZwvOZA5Qk=;
 b=FtIZqF//NL5d9EdkMamdX1Cbfjhjt9Fe4QylfdVuUpB7aqYWpQ2I5RvcwUrTgt1bsj
 svd6T2NjYgUsQol8RWGw4GLF5M1f1RMHB+El/3WpAaOzkUXtkZVUZlx3F5yx8ksDkyjb
 ObJsy23Y1ahRXB3VQsPAAaVpEXoiITvoW/c50oLiFKgGUI7nYV+MVStdw4ZYyqFqPD+W
 i17Hg0KOsmUQiJ5irm8LrcYjziaJCEFMrsYGA+HxEeVjsb3G4n4cFJEmuJWvx1+gvEqm
 W08SzyP3iesQt4z1sRrnBPm5/SNfEptKwfDJ+hrCpljs4WaF9QWQZQs+ndY/BIuieKgj
 ZjiQ==
X-Gm-Message-State: AC+VfDz9ziICFhByam2gsmcrxBnf/4+ERalZejdzRNlxrZ2qWK/Njyg8
 6XaEYM05bG9A6r7qjTZem1kLJw==
X-Google-Smtp-Source: ACHHUZ7zk/YEHgayIbVlGj1Ci4e57xLuQYp4kkWljHFUjAGdkFHheVE+lX875cki+JyczLEy7Cu89g==
X-Received: by 2002:a17:907:26cc:b0:987:498a:87f6 with SMTP id
 bp12-20020a17090726cc00b00987498a87f6mr17180706ejc.34.1687720441171; 
 Sun, 25 Jun 2023 12:14:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709063a5200b00988f168811bsm2352302ejf.135.2023.06.25.12.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:14:00 -0700 (PDT)
Message-ID: <55b8b3af-ec9f-a87e-e480-b816e8702212@mind.be>
Date: Sun, 25 Jun 2023 21:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20230622050531.2904810-1-m.niestroj@grinn-global.com>
In-Reply-To: <20230622050531.2904810-1-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687720441; x=1690312441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zZVrM1cK0khlCcquWqgyf5SJrlDX37rGPZZwvOZA5Qk=;
 b=EAWsOYR51M1gb4ex31N6UDE1aQIJoNnjoWNRUcd/VuUxwfCOA2qDN1eAx0IvUufbuW
 ldFuk/ZlnDhpJWdoCkFRr0umM09chfimCaecujcVaRhRAcOaV/gDHltJdI1/m0p59Cfz
 lSXVaNwkgpGdyQU0YnsCJsZOvRdIr6E7Dg6nPLlXnBVyuDal4Sgbsa573sAAKwCtVMJD
 KGFdO5kv/SNuuzrdwm0yRnGZQ1XdwZ4DhGMiDLs0WWDvP3tAoYurNHTtV9C7CwpTsK4c
 HMccEnKZbhMiHwN3Vm7Nq0Jhle4ewR2EwVqcs5Rdlk0oJz9zd6f+rUejZc8yS8uXCTOs
 /eWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EAWsOYR5
Subject: Re: [Buildroot] [PATCH] package/python-xmodem: bump to version 0.4.7
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



On 22/06/2023 07:05, Marcin Niestroj wrote:
> Right now there is a LICENSE file included in the package, so use it for
> license validation.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-xmodem/python-xmodem.hash | 8 ++++----
>   package/python-xmodem/python-xmodem.mk   | 6 +++---
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-xmodem/python-xmodem.hash b/package/python-xmodem/python-xmodem.hash
> index 33ddfeb595..65a9b6afda 100644
> --- a/package/python-xmodem/python-xmodem.hash
> +++ b/package/python-xmodem/python-xmodem.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/xmodem/json
> -md5  f876cb35caf276b61990377710a3b4c4  xmodem-0.4.6.tar.gz
> -sha256  089737298f5738eabc43f2519efdc80b402693768f16383f7013b9e6f8f279d7  xmodem-0.4.6.tar.gz
> -# locally calculated
> -sha256  5ddb38acab95bb77e1e92e22830e358082d879d2dd59ba05577c47791edaa78e  PKG-INFO
> +md5  0a21c269cb4d3995d13a2615c24fed0a  xmodem-0.4.7.tar.gz
> +sha256  2f1068aa8676f0d1d112498b5786c4f8ea4f89d8f25d07d3a0f293cd21db1c35  xmodem-0.4.7.tar.gz
> +# Locally computed sha256 checksums
> +sha256  e317b0ce19724327a41e09def456579b80a7b82f9bceb2ba6933eba406f78d88  LICENSE
> diff --git a/package/python-xmodem/python-xmodem.mk b/package/python-xmodem/python-xmodem.mk
> index 739c6154d7..d7040f7245 100644
> --- a/package/python-xmodem/python-xmodem.mk
> +++ b/package/python-xmodem/python-xmodem.mk
> @@ -4,11 +4,11 @@
>   #
>   ################################################################################
>   
> -PYTHON_XMODEM_VERSION = 0.4.6
> +PYTHON_XMODEM_VERSION = 0.4.7
>   PYTHON_XMODEM_SOURCE = xmodem-$(PYTHON_XMODEM_VERSION).tar.gz
> -PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/29/5d/a20d7957f207fc4c4c143881ca7b9617ab7700c153012372ef0a934c7710
> +PYTHON_XMODEM_SITE = https://files.pythonhosted.org/packages/3d/17/fd6668a09afdc46c22990172b6f65e07dfb5bcf38960d063a7a887ca926d
>   PYTHON_XMODEM_SETUP_TYPE = setuptools
>   PYTHON_XMODEM_LICENSE = MIT
> -PYTHON_XMODEM_LICENSE_FILES = PKG-INFO
> +PYTHON_XMODEM_LICENSE_FILES = LICENSE
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
