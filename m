Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BE3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:44:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22BB960EE5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22BB960EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEF4C403B3;
	Sun, 26 Sep 2021 21:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKkML8OPwA3Z; Sun, 26 Sep 2021 21:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C48A7403B2;
	Sun, 26 Sep 2021 21:44:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 613891BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 513716071C
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j3ckucJza55g for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:44:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AAF06071B
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:44:01 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id s17so42099251edd.8
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S1tx5pjM7F6I2K5TgSDYHGpEq8ikHWFiuEmlQQ2D9o4=;
 b=cFL/zEq98+nSUWhDEJ83L2Q/ebxeMbfvGTVPAqA0wWT0jNWr9TNapaf/lDY/nynnxp
 cmEc7F1m6QiaLDBsovYOftMTjEWj9/XxcVoQLFH9OOnxZpONo72wgm7gm4DU9O/O2vHb
 xt8OtmN76qsJdKfMhADYYTwYvxB+KShDggE//KbazX06IW80DkBjylIN7Nm0laohkXQN
 1+8WE9W0QIV+Ui6htk5UMDw2LgjnSUf9H62jvRZiSlzaJZ8Vq52Za4+KpG+Zyh2bB6rh
 042bSQn4thPa+WmUKggTsNDGVo9Bq7axB1Xdb1OS9ZYgH7wg92/OrfylXCht49iRApCc
 ENfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S1tx5pjM7F6I2K5TgSDYHGpEq8ikHWFiuEmlQQ2D9o4=;
 b=aSwYJSSzjg1cMvlwcOnmlIiIEOlazDqkxCP7cPl2bY9G7e6oj5CWfMQTpQ5DBBac/8
 JBn5QWpLh+Y0tc4Oip0/bBCBRth7J0oaor0iVnXqfg/HAv6R7Xs4uyPk7a5PheiODu4e
 hgtVhwH9VOTGPajzBGjn+Sk+4wHeBCtcyUH4NosA2eHAsQRdfca6aWVf1X7aJV1Omunq
 zJ3uux5haHt7pwW11vg5sCb6EZOO8Sa8oPQSRdO7d9GcFis2CXRsPWGRVb7hoKtehLPK
 DmRqkecNIA1whXoQegCVoT+AwDFIBY/CKf4NUDoG50mzmHsLRrIuBcgrmzqC3RwVtiVs
 c/6Q==
X-Gm-Message-State: AOAM533gbc7bdlDhtiS7WI6HZwh+3zr97qK5I3YNMQMZY7JXF1kNyFdJ
 cnoiqAr04T3d2RfM9KXnNZzeAA==
X-Google-Smtp-Source: ABdhPJzSVCgRQhy2Q67c94YzVldw4Gn6WXhb74fSjZ1agTb/tO9rrgU7mrJN0n67k/vMbF1kiQrrQw==
X-Received: by 2002:a05:6402:289b:: with SMTP id
 eg27mr20053248edb.25.1632692639535; 
 Sun, 26 Sep 2021 14:43:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f22sm7761791ejz.122.2021.09.26.14.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 14:43:59 -0700 (PDT)
Message-ID: <bc2513db-4f7f-7e0f-22f7-b68046d0d7ea@mind.be>
Date: Sun, 26 Sep 2021 23:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210920084105.4b8fea91@windsurf>
 <20210920191223.760496-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920191223.760496-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.0.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/09/2021 21:12, Giulio Benetti wrote:
> This major version introduces 16 new APIs[1] and remove 20 of them
> considered unstable[2]. All packages that depends on harfbuzz build
> correctly with this new version because they don't use the "old unstable"
> APIs.
> 
> [1]: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS#L11-L27
> [2]: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS#L29-L49
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks. Let's see if the autobuilders complain :-)

  Regards,
  Arnout

> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index c00195cba6..97fc5a2c5f 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  0edcc980f526a338452180e701d6aba6323aef457b6686976a7d17ccbddc51cf  harfbuzz-2.9.1.tar.xz
> +sha256  036b0ee118451539783ec7864148bb4106be42a2eb964df4e83e6703ec46f3d9  harfbuzz-3.0.0.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 70c1e1f7e6..4534d166ef 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 2.9.1
> +HARFBUZZ_VERSION = 3.0.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
