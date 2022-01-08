Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA1BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F2624012A;
	Sat,  8 Jan 2022 15:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcZgQVtDeY6h; Sat,  8 Jan 2022 15:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A2EC40105;
	Sat,  8 Jan 2022 15:12:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80BE91BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FE2E4030C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfZ4egxbo5sf for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:12:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87F5E4024F
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:12:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c66so5834272wma.5
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TrlLh008cfsMvKVgwcNiLX2HcoijIodllQaFcPNbCg0=;
 b=h5nZrb6bH62MmgLhH8ugcz6IURIqGKInHLpvhIKTgDIUj6qS/FMy/Hu3Gii5C9LtxO
 WghJhHQ8krdhzHZ7y2VhHd+9x0+PyHLvlx6tcfTLoNF9918GaIQCxCVrFgYdhONxW6eb
 BWSGlGJCNO8s5C5VAsONtR3RfJttZaCUwqqOFyvZijJ+rhjquq8xy8/dGKspOB47Zx6F
 ROYBaxbQayzCVrrAdA6RLmfDdQKTvGwU8pgoReEhfiqWzFfj9DfL6HItb316Ej6ByKh1
 FKG+SWD0gtWk/loQq0mBUnIQ7N6MAPt9p0YioypP04ZWpiTyXxqy0iqTNthrOXNH8ZYc
 himQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TrlLh008cfsMvKVgwcNiLX2HcoijIodllQaFcPNbCg0=;
 b=KS7J3/ZxlflbsgvMq6DXxxfBpUpzVJmuEDvzaYyqPteDQwHR9WlGY+D3V4vUCYM4M7
 BUpPV58FU6sqetGgRPJkjYRDHQSnnHSIG+cPLEnb8+gqq1ZJYt5DvneqZjvokeQyh8fb
 FP6YuZKxQ/CJbUIykMHhYl5HfASRnwFRchJWCiTnkhWkPSJBSO5BiGmfcVM3Dcq+YUkP
 6Lmda6TFpcAsMNNO/UGaIok+e0JJw4ge3MD+XxOceOSbTZeuAMOBW4wOMkALgL5HoERL
 OaiKmwrFL11yg/tA3+KLC36oQqZ4yB7JnHPzHEC0hVLKXIrzirtXplR3q8PnC7gwJ5lM
 5ekA==
X-Gm-Message-State: AOAM533/x8U5KdqOxWVfD1IUFtgBahJMGqg4a6VXG8M0qcz4j1ohz3+F
 Fh2NNk4kGZewEJA7GYpYaKNkHpan1COl/hM+
X-Google-Smtp-Source: ABdhPJyLrMPcKcZJ88MnNzpv/LAFxF/iYy9Nyi2B33NULMe2i4Anl1D0boOYJR1w5Sy6aohNLQnkGw==
X-Received: by 2002:a05:600c:5025:: with SMTP id
 n37mr15087247wmr.18.1641654752724; 
 Sat, 08 Jan 2022 07:12:32 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id h14sm1765446wrz.31.2022.01.08.07.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 07:12:32 -0800 (PST)
Message-ID: <f81c93d5-ec85-544b-6172-93ee41b607c8@mind.be>
Date: Sat, 8 Jan 2022 16:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20220107223955.148266-1-romain.naour@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220107223955.148266-1-romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH] support/scripts/generate-gitlab-ci-yml:
 ignore branch name prefix <foo> containing a single hyphen
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



On 07/01/2022 23:39, Romain Naour wrote:
> The commit [1] added a sed command used to retreive a pattern
> to keep only defconfigs whose name start with the pattern.
> 
> "<foo>-defconfigs-<pattern>"
> 
> The sed command doesn't work as expected if <foo> contains a
> single hyphen [2]:
> 
> "qemu-6.2.0-defconfigs-qemu"
> 
> Update the sed command to ignore completely the part before
> "-defconfigs-".
> 
> [1] 65d2f04c012af492a9b9da04dfa3b3cbd20347f1
> [2] http://lists.busybox.net/pipermail/buildroot/2022-January/632507.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/scripts/generate-gitlab-ci-yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index 3e0c68091b..bd79807914 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -66,8 +66,8 @@ gen_tests() {
>             (*-defconfigs)
>               do_defconfigs=base
>               ;;
> -	  (*-defconfigs-*)
> -            pattern=$(echo ${CI_COMMIT_REF_NAME} | sed 's%[^\-]*-defconfigs-\(.*\)%\1%')
> +          (*-defconfigs-*)
> +            pattern=$(echo ${CI_COMMIT_REF_NAME} | sed 's%^.*-defconfigs-\(.*\)%\1%')
>               defconfigs=( $(cd configs; LC_ALL=C ls -1 | grep ^${pattern}) )
>               do_defconfigs=base
>               ;;
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
