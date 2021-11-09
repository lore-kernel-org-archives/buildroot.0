Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5BAC43219
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58CB9619E0
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58CB9619E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A638176A;
	Tue,  9 Nov 2021 22:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFtTP5pEp_1W; Tue,  9 Nov 2021 22:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87ADB81754;
	Tue,  9 Nov 2021 22:18:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCA4C1BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C96B14045D
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UlXTbql4LRLM for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:17:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CEBD4045B
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:17:36 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id f8so2435722edy.4
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xD2KTNeBwkE76oToeL8oGiUpQAvKqn+O84BzgSF5LIY=;
 b=LaJICPpGVu539XcM+riDR1p2DzoUthqjMFFR7pO5/KWSpDd4Y5ggqkUGhQybL/jRTN
 gQ9bcbT1inmqLA3HmujiXITfwaJnKjkpDJ4PipoOzuN/0LBGB04OytyuSNWWJD1Kcw6R
 yiDF14ypckfRyMgO+BMX0CxB648yUKkL8pfS1R6dx7+P8HttULVjltdzX1seOKUlCfMw
 2TuPjzTYvJU8tcn2LgUimkhjko9o8d3sRGR2fPFkr8/WIIO+VPd/PY803fA79DRrkA05
 fP2VfIKX7rS3UPIA3bnM+m8EeLnRI2hUjD82yKNPJtBb5UdEAJvXVke3NaJsi9AGh9yY
 NEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xD2KTNeBwkE76oToeL8oGiUpQAvKqn+O84BzgSF5LIY=;
 b=0KrutFoESfkkvk4N/TiTEoL6Ty+Bw6CYN6RaEtO4wPD91kyx0LybSg8OexdCT6DnHb
 Pkf7y8DfGMn8cS8uKn+OEMcp2DW9Vxg6Jrv2rnMw8JI4jSj1DiNYPIuiCBDLG0OoEG5f
 pkROVJmjQttzTCieMHK8yM2LJMiLjxv97hxvWX963gh/2oV5wdbSK7BqCO/x/pZVP9Dx
 Fm7nUnescFSnApmkVsY7T209ucfbvMFwiilcldTK7LYCExOSPYvRvazT/i8qOQjYKCqX
 6WGrxZwn0HMfqKalBmO4MAyzyJ08RmdkZzwFJOvrn3BdIa/5Jz653g6ZccqQHJ6t3mMW
 YgaQ==
X-Gm-Message-State: AOAM531o8T4iBKqZnc01zKB3tVQcwgBPZWi5hPuY/thFW7AOEoQ2NlAc
 SGG/C5gtNwsGv9zgISzoZRFNbQ==
X-Google-Smtp-Source: ABdhPJx+OwRMk/TKzTeij5pOQyX0mNRRMBxcmL+7L4FChC9jPaTfLq5BxObZaN3igXvZh6jrhgGxRw==
X-Received: by 2002:aa7:c693:: with SMTP id n19mr14665192edq.101.1636496254495; 
 Tue, 09 Nov 2021 14:17:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gn26sm7100235ejc.14.2021.11.09.14.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:17:34 -0800 (PST)
Message-ID: <489b1058-ffb9-e9d4-f2f9-9de2c8c65de4@mind.be>
Date: Tue, 9 Nov 2021 23:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211027210914.528339-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211027210914.528339-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qhull: force Release build
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
Cc: Davide Viti <zinosat@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/10/2021 23:09, Fabrice Fontaine wrote:
> Force Release mode to always build qhull_r library instead of qhull_rd
> and avoid the following build failure with python-matplotlib raised
> since bump to version 3.4.3 in commit
> 23ca2efef1528c73f04b5db8aff66a826fab1b9e and
> https://github.com/matplotlib/matplotlib/commit/2dacb1c9090eda4b3c202db80f5e3ce340850760:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/9.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lqhull_r
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c2b/c2ba407275863bafe42faa4b335a20c6fa9e1d55/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qhull/qhull.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
> index c11bed0373..72f6270434 100644
> --- a/package/qhull/qhull.mk
> +++ b/package/qhull/qhull.mk
> @@ -11,6 +11,9 @@ QHULL_INSTALL_STAGING = YES
>   QHULL_LICENSE = BSD-Style
>   QHULL_LICENSE_FILES = COPYING.txt
>   
> +# Force Release mode to always build qhull_r instead of qhull_rd
> +QHULL_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
> +
>   # BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
>   # although BUILD_STATIC_LIBS=ON is default, make it explicit,
>   # cmake and static/shared libs is confusing enough already.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
