Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1D9C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:32:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD8CB60E0B
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 15:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD8CB60E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 841B2605FC;
	Sat, 28 Aug 2021 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fkKdcFpK0f6F; Sat, 28 Aug 2021 15:31:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D581660604;
	Sat, 28 Aug 2021 15:31:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10ACF1BF33B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F08784012B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 15:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SzrRvubYKp_v for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 15:31:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF88340155
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 15:31:49 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g18so7758869wrc.11
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DgnNnuoV/IOXYeM9lqkHTf4SqG2GTODIVvVPYmSSN/0=;
 b=BJ+WIm0FPZUtLf2axCHmbt07r1LrlLcIPJP62bkOhCX8Skcc1X7BVo/oH5D/havKAx
 blePTU4yPqcoNAk/qCwHplYPqiKULI81ytWVNvGgCZE4DczpZuAF62d0VgKuxw9Mwc5a
 zBLISJieiLqkIbSO50gVXta6FUCOrSO3Rk8DLz1krsD+5AylSUYRBucE+NL4jxaxcQwW
 ibJUd1+iKC/v0bZXtWVCAktgmem/XkhP2LU7pwIrG8TfVRzS26LBySmidnZZGvsKSoxs
 2E0FjDUH4JnHKh6L9Ht4o4I17CP7DFtyn4TVcOLj99mr+XHj7/OMMVPh0/A8S7lV386g
 A6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DgnNnuoV/IOXYeM9lqkHTf4SqG2GTODIVvVPYmSSN/0=;
 b=VHhVbntEPeoGa0RMIt6dzxgT5NyhqkZ4EiiAvgU9rvo3If8qmcoMSqK0Ir903lsgLX
 6QC1UWM2e5gTPCHL41n0rCv2UOMf5RP7zp2wpaSdUDH1U+JYOCkkXOVjoQk5PGxv13Ja
 h8V9w5oL1Vffmk7/7RNIToTcokU50IyMFvmpINlSojQ9hBA6X0Pt48aGoZ0WjHR1k8qd
 cbr7Y3klPBeRZbf9IkucWRpPo10DjwXwMmw3Y5E+CiFPjj+ZH04glilPHNZjb7EFlp+I
 mtHxapM+U6aBWNuZ8+ZFpsN6C6p04uGUuR8qMmbFgeU4yu4JtMR/rCAw09JO3isGIFVj
 kw8A==
X-Gm-Message-State: AOAM531dqcVO3Hh5MB8vMY4xs/Hyc2gUA4PeFNl5kXccDKCwG4Jv2tjL
 jzUZ5LdR7uExVZdNlZDnjtHPew==
X-Google-Smtp-Source: ABdhPJyCDhkfuSy/EvJBEg6RGNdShsbX94W8ve2sorUXaUNAkeDsjQW5YqpEkPkaG0y99GHKl3r3bQ==
X-Received: by 2002:adf:c149:: with SMTP id w9mr7975220wre.126.1630164708119; 
 Sat, 28 Aug 2021 08:31:48 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id o21sm8325037wms.32.2021.08.28.08.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 08:31:47 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210821134646.1163359-1-romain.naour@gmail.com>
 <20210821134646.1163359-2-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a651ab5f-f83f-e9f7-1a8d-d2b5586fb2e4@mind.be>
Date: Sat, 28 Aug 2021 17:31:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821134646.1163359-2-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v6 for-next 2/2] utils/test-pkg: add
 gitlab-ci support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 21/08/2021 15:46, Romain Naour wrote:
[snip]
> +.test_pkg:
> +    stage: build
> +    before_script:

 The same is done in the rest of this file, so OK, but I was wondering: why is
this done in before_script and not in variables?

> +        - OUTPUT_DIR=${CI_JOB_NAME}
> +    script:
> +        - echo "Configure Buildroot for ${OUTPUT_DIR}"
> +        - make O=${OUTPUT_DIR} syncconfig
> +        - make O=${OUTPUT_DIR} savedefconfig
> +        - echo 'Build buildroot'
> +        - *run_make
> +    needs:
> +        - pipeline: $PARENT_PIPELINE_ID
> +          job: generate-gitlab-ci-yml
> +    artifacts:
> +        when: always
> +        expire_in: 2 weeks
> +        paths:
> +            - build.log
> +            - br-test-pkg/*/.config

 We could use ${OUTPUT_DIR}/.config here, I think. Well, if we used variables
rather than before_script :-)

 I've anyway committed it as is because this works.

 Regards,
 Arnout

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
