Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD357C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:46:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DAEC60EFD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DAEC60EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BE5240504;
	Tue,  3 Aug 2021 15:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeaXDOvL6HpK; Tue,  3 Aug 2021 15:46:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC91404DD;
	Tue,  3 Aug 2021 15:46:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3182C1BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DBC883806
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00CU_X35FAQX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:46:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61BD4837EC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:46:51 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id c25so351660ejb.3
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8JEzKuThBHycFNcjTYKwfifUMBOpQN8Xbv8P1sF5Hcg=;
 b=E38qLhmzfAic4DlXuMIdLv/QONGP/D0SfGT4aPk0GRebHaywb2KuoLBLxRP6vGznRt
 1Zs82RzTBt/zIc5jIf3M9W9u/o14xkDwLoWitwSqOm0g0RX4QnwHsPBsUouDtNleF4HQ
 WF2PQpCKDWlg7SFfkOXhsaKIVpZ7yFvuI/x2scjNAKjO+02j5jMaTsTl86r3iBop+lGI
 mw5UduGwgk8tvUKolnpEVSqY02wdqzHH8Iz2NjxJKxUw7r0fBt2dhcLdmRVIUtNXxa7X
 Uob1XtPb4N7Gdzn8aMupgiII1ADB5GKb3Fa8eiWaJLA7garPD9AvjWqEUNrlTyIhRqbk
 QJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8JEzKuThBHycFNcjTYKwfifUMBOpQN8Xbv8P1sF5Hcg=;
 b=B/wYmrkw2Tx2zHAQ8DG6lTFb60JDUzSRUfUSnWgQoLhaFE3/rRQEgdS72kGO2FtSuh
 Ih9JaNrp8Nika4fXALN50fB7MxPz2iRGq6lkmAwMaCgz+xo6kr6OUfsw4O0GKKB6Wnp/
 ZQhNHZxDXD8Xd2dskbDkVCETykYdWy/xe7zY0YTPRJAdusOYHRnIc0+h8aO5AYv6K6aR
 FKJQRE9y5jCv2cInCFqkCQC0hlKxx45HCTzaqz2TzMGM5U/C82i/dgFeShad6tEShbLM
 nWKTydB2mKKB2CVv6jNb2yp8icJ/0Q8+IKzD7w+Sovoh+WSpK7GxMUOmgQpPaJpx8gte
 kMvg==
X-Gm-Message-State: AOAM530VyZXGII0Nq65+0pCn/ftsRtfiuFvDoDAtStRRiCfcC5l0Lcr9
 k2OK73FwhQHcD252RjWQOtLtZbZ0ytpL2MbQCX8=
X-Google-Smtp-Source: ABdhPJx2yG3hV4CvHNRuJ5ItcadWLAV0CJloB7MjYG4t7KV6QmxRfwFp0QjH8z5OIrTVqYz5jNl7eg==
X-Received: by 2002:a17:906:4ad5:: with SMTP id
 u21mr4108972ejt.74.1628005609579; 
 Tue, 03 Aug 2021 08:46:49 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id dg20sm8206248edb.13.2021.08.03.08.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 08:46:49 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210801215357.696067-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <b786d7af-acad-aaab-69ac-7f55e283dcde@mind.be>
Date: Tue, 3 Aug 2021 17:46:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801215357.696067-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: do not detect ccache
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 01/08/2021 23:53, Fabrice Fontaine wrote:
> OpenCV-4's buildsystem will try to detect ccache and use it if
> available. This may yield a system-installed ccache.
> 
> However, in Buildroot, ccache is entirely hidden away and handled in the
> toolchain wrapper.
> 
> Forcibly disable detection of ccache.
> 
> Commit 505e7f47715c77d8586444a4fefe4a190b77aaad already applied this
> change to opencv3.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/opencv4/opencv4.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
> index 3cc6c05769..040fc63e4e 100644
> --- a/package/opencv4/opencv4.mk
> +++ b/package/opencv4/opencv4.mk
> @@ -49,6 +49,7 @@ endif
>  # OpenCV build options
>  OPENCV4_CONF_OPTS += \
>  	-DBUILD_WITH_STATIC_CRT=OFF \
> +	-DENABLE_CCACHE=OFF \
>  	-DENABLE_COVERAGE=OFF \
>  	-DENABLE_FAST_MATH=ON \
>  	-DENABLE_IMPL_COLLECTION=OFF \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
