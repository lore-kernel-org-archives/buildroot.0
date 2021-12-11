Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C7EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D4FB60D79;
	Sat, 11 Dec 2021 20:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHW5w8p2iey8; Sat, 11 Dec 2021 20:44:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC81160D75;
	Sat, 11 Dec 2021 20:44:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45A1A1BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3519C42524
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qzHzJa3MEEq for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:44:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BD0742519
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:44:55 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e3so40923994edu.4
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cSxPEWXXjn90xyO0jdUfavHpieHy3ADZK5SvKvYDxJA=;
 b=BkJ233xSSNr35EPjgur3bVsGieEluYkz89dZ4P4MjyA+L9C0Lc+XItA7phV/5RaPXJ
 MZ5ClwQhCVri37pCuT1uQv4y0ZJeUMeska77hB2kqmB2LkUfeobK95Vc5Q5IY3KuftJg
 GsmutdvPFG20+OQ/Sw/MqhE68L1OVdH+X/PWE+yh8P7ax8q2CBlruddxU9wQ28ek6qay
 RsfW+cKPmvhJPUPWdyBFDWHQxJ2WYz4w/jyjcOlwVcAd1uy42YYgM/5anXBps2lvh97A
 wxJh4z9gBEOaRrJnWrGMc5elm6Kb+lXYQ6BHm0aI3wn/ru8/4uexhfgrkUtqxQ3ivoer
 TAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cSxPEWXXjn90xyO0jdUfavHpieHy3ADZK5SvKvYDxJA=;
 b=fPU1UflPVZypCP80H418YY0k+wqUubg2vk5KXgcf9dy0qX8sxy+RWLJC3593rcGPKc
 1YsCUBgYAgw9r3nvLOJoQWaU5chaTiOGZLFxbgsOvPLqyZ5tJ61K7VOWOiu1gmfqRX/e
 nSu0JZewqb5jlSTF503eWXdJf7L6i2zlJx218Ai/r4onBJz624EqvIw0s0qDv9gkOjba
 GuT8xLm52L8vIGX7UDKFs5CK4NU2nU/cxFpQ9RFI+KhWpLB9EQQ9axq6WkU06zV8rDcF
 tVDon5IFuSTxKDpf/whPoPo1VNJfFaKYohe+DhEgZhfbiyazA2fbHrOGRkCkBBZWxlTg
 K5hQ==
X-Gm-Message-State: AOAM532vo07iFPFz14htl9+452Rl4oWdxIehvTJexJDlqcsWs5PQj8Pn
 /otgZcD4JZ0oiSib2BPC/u2q9A==
X-Google-Smtp-Source: ABdhPJwwJ0fsQsLbOqYLKfI+HB/7VQhEVXbMZLgpTXb1B3pUncX2acQBBU68MDVfD9NPO3g05eh3UQ==
X-Received: by 2002:a17:907:3f24:: with SMTP id
 hq36mr32759274ejc.390.1639255493633; 
 Sat, 11 Dec 2021 12:44:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bd12sm3624070edb.11.2021.12.11.12.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:44:53 -0800 (PST)
Message-ID: <257fcd90-bb3e-52fc-569b-7410c7685be8@mind.be>
Date: Sat, 11 Dec 2021 21:44:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Cyril Bur <cyrilbur@gmail.com>, buildroot@buildroot.org
References: <20211124150654.2096bd33@camb691.localdomain>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211124150654.2096bd33@camb691.localdomain>
Subject: Re: [Buildroot] [PATCH] pkg-stats: Ignore make output without '='
 character
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
Cc: luca@lucaceresoli.net, thomas.de_schampheleire@nokia.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Cyril,

  It no longer is "ignore make output ..." so I updated the subject line and 
committed to master, thanks.

  Regards,
  Arnout

On 24/11/2021 16:06, Cyril Bur wrote:
> It is possible that some users of buildroot have put it in a repository
> and call into it from another Makefile such as:
> .DEFAULT:
> 	$(MAKE) O=$(abspath $(O)) -C buildroot $(@)
> 
> This technique works well except that Make tells us that it changes into
> the buildroot directory:
> make[1]: Entering directory 'buildroot'
> 
> Because this line doesn't have an equals within it, python raises a
> ValueError exception within pkg-stats.
> 
> This patch has python tell the invoked make not to print directories
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> Dropped the RFC after feedback from Arnout which I have taken onboard
> 
>   support/scripts/pkg-stats | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 3992c8312a..a435abff3d 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -375,7 +375,8 @@ def get_config_packages():
>   
>   def package_init_make_info():
>       # Fetch all variables at once
> -    variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
> +    variables = subprocess.check_output(["make", "--no-print-directory", "-s",
> +                                         "BR2_HAVE_DOT_CONFIG=y", "printvars",
>                                            "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
>       variable_list = variables.decode().splitlines()
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
