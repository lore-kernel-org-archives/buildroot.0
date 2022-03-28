Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F88C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 817DD40AAD;
	Mon, 28 Mar 2022 19:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c83fXngTTc3s; Mon, 28 Mar 2022 19:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5996740AAB;
	Mon, 28 Mar 2022 19:54:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 213D41BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DC7D813A0
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u7r4yTPIrhgH for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:54:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A884E8139E
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:54:48 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id bi12so30944049ejb.3
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OeuP1Hwqu4ZG5CPIhZzSTr9eS9nFwZvCg0CfLsmEk+w=;
 b=KPQqcyKwcHZPHTVyTP1pFDlbTr5gzMmcdjVV2tGR/54Tf4McM9ZSUNUKBIL45nkYLm
 +fZX7xe6/I0z75y4hJI90v3fxB2tL2K0X8PQRfMwtZ1Srkc7wj3SO9Yspn5uZliUxqRS
 3dTGwgl7S6NzVYNgr5Qxd+9IfBCe3noaCqi+vrSwgUNzGOYTkB8ik9DzJD4Jxy+pROKL
 UQyCSACO1hmgKmB6saVfgNpzBeM6hyHO0cL3t4gmUY/jJMnWYKjNW8tdft9IpReta35u
 ar6CmpzPouhIqGey2bIwyg3fp9oO1wqtWI2ngWCP/sjfO7z4BRLNkhb2WPjy+YMHcPLB
 LjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OeuP1Hwqu4ZG5CPIhZzSTr9eS9nFwZvCg0CfLsmEk+w=;
 b=w4tYlPUVEOifyH0sHyEZtLvPBa0gZITJcJ9tTsGPHLQRlOQXEI6iSalMDcRyJOb9pP
 p0hNxO+7UJC0KT/cPlAipOjkYuvClrTQn5zOdObaB6VOD9CY8btybzY92gkCtWNeNkWi
 HnI3W7dRtXOP04dz6fb753/mSMVPYkNPMXAs+VI4KhqCdNakZvhTSMvVBrfhfzQJ1VsI
 BNGDLJl8OIeJPbXxih+E9H3tsw/l+hgTXkaGLS10uyoTqF9DM1PIb6fGupswEKTPqmBp
 1McUnd6UwsetCYo7sG+sDo6k02Aoh/LCR9q5wSVkfKMe08z2o6WGM8cXuJGlBEYS1nVj
 6mgg==
X-Gm-Message-State: AOAM533ZzvdkRIfZmX2OUNmcE5BuSEk6rXgVtyq6V5KVIMfk1tifaAw6
 6Jc35D6cIAC6OiUNh48zkc/lJA==
X-Google-Smtp-Source: ABdhPJyAZDHay4Et9n2GNSL6eC8M4t6IWcXgKB360X7dwxFLqhu8dkiSCbIhr+3F8O0FP3JYjl6x5Q==
X-Received: by 2002:a17:907:8a06:b0:6df:e099:536 with SMTP id
 sc6-20020a1709078a0600b006dfe0990536mr30532914ejc.351.1648497286896; 
 Mon, 28 Mar 2022 12:54:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170906778f00b006df84c19995sm6329345ejm.224.2022.03.28.12.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:54:46 -0700 (PDT)
Message-ID: <c2d601dd-aa86-e6e6-bb96-a155924941ce@mind.be>
Date: Mon, 28 Mar 2022 21:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220328101751.1606988-1-foss+buildroot@0leil.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220328101751.1606988-1-foss+buildroot@0leil.net>
Subject: Re: [Buildroot] [PATCH v3 1/2] package/qt5/qt5base: security bump
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/03/2022 12:17, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> This fixes CVE-2022-25255 and CVE-2022-25634.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
> 
> v3: rebased on top of master branch
> v2: http://lists.busybox.net/pipermail/buildroot/2022-March/638898.html
>   - point to newer commit in KDE branch instead of including Qt diff
> v1: http://lists.busybox.net/pipermail/buildroot/2022-March/638184.html
> 
>   package/qt5/qt5base/qt5base.hash | 2 +-
>   package/qt5/qt5base/qt5base.mk   | 6 +++++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
> index 1b9ff43ab2..c031f71c77 100644
> --- a/package/qt5/qt5base/qt5base.hash
> +++ b/package/qt5/qt5base/qt5base.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  96b1c96041ae7b5186c94f231979217bd50e3c0a4caeba32982faa8054a6d113  qtbase-d16bf02a11953dcac01dca73e6f3778f293adefe.tar.bz2
> +sha256  18c17d441fbefa9dd13d1d6bfb5f542c986ba86cc37930247f9e4d782df2244b  qtbase-f31e001a9399e4e620847ea2c3e90749350140ae.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 4418f0d3ba..5f158bd6f2 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5BASE_VERSION = d16bf02a11953dcac01dca73e6f3778f293adefe
> +QT5BASE_VERSION = f31e001a9399e4e620847ea2c3e90749350140ae
>   QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
>   QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
>   
> @@ -14,6 +14,10 @@ QT5BASE_SYNC_QT_HEADERS = YES
>   
>   # 0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
>   QT5BASE_IGNORE_CVES += CVE-2021-38593
> +# From commit 2766b2cba6ca4b1c430304df5437e2a6c874b107 "QProcess/Unix: ensure we don't accidentally execute something from CWD"
> +QT5BASE_IGNORE_CVES += CVE-2022-25255
> +# From commit e68ca8e51375d963b2391715f70b42707992dbd8 "Windows: use QSystemLibrary instead of LoadLibrary directly"
> +QT5BASE_IGNORE_CVES += CVE-2022-25634
>   
>   # A few comments:
>   #  * -no-pch to workaround the issue described at
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
