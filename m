Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF0CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:12:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8557760EB9
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8557760EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38E5340164;
	Wed,  4 Aug 2021 21:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCwTG3lQpx9P; Wed,  4 Aug 2021 21:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F3BD400D9;
	Wed,  4 Aug 2021 21:12:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3D321BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1AAA400D9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUCZGbPkj9PO for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62304400B5
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:12:02 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id gs8so5689022ejc.13
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EjlY7YQOrk0neU5D15AVdhlSUzCw5+xM8/+EjAASR/g=;
 b=Jvi1rJ0+Up6fbfgzGAXaBexO+RUL3hbQHFwAX3r/u2mkoOI68aNc9fZuI4bCnpG7H5
 O3d/X/bb/T/vZbH/sQFzOohyzIPmY25NGVmoBQC+si74tIntRfLa1c6Lf0bLIIwTIVmJ
 1wxfUNylDJOGcRNu7o1osbg0LAZIftsS+ibJfwMyqX/cH30j+cT3cFCnBA8kEtaGNc0C
 n2PhVXz0PtRbuQ0dR9Mzxs/NDoQmBfU/rtiDwSy+IiATFMWX4aCOEEP2VfUf4aDPb6Qu
 /Qvv8DvGpyjq6Epp1qc013je6lxMyNKVolqpZeSrDo+Es40boICQ5mmBqF9IEcL/gR8o
 WbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EjlY7YQOrk0neU5D15AVdhlSUzCw5+xM8/+EjAASR/g=;
 b=iMzehmR7rnY6SR6vYmA/ENl/RWI7QISWqWzl84Qkgw0itqloi2akjaP/EuTgqS26lc
 i1qTA6yHb9TVMHnnvBJBs3PxvTd4FjUp0vz034oF+vZXs/DdbYUMQvFheBiNeSoVDxSM
 f5oSyoLAFXzer1X8aEfDpwkG9r3WY5KwdLW12BY/SL2bvp9S4DPgQXNAtHYJfzh6r0Rv
 5JUXfXNNZvKWwaJKv6lsHEiP5O5+K5qvFSxW3VKHNc4o3gi40/ccJFMWeLM/WQxTZf45
 yI+EQ0ghSwDjGQlNbgAvhb4hzZ0an+mcr5TuawsTIi3hRfqaA/om3lt5V5s+UDStfWFs
 tyFA==
X-Gm-Message-State: AOAM5308SoA+mZMVmI34Cq4XoMUVDhFfWYPVYIYNPS0aO8de0VR6T8S9
 e/jxG9TegoYbdtTD5d+DQfVSTg==
X-Google-Smtp-Source: ABdhPJw5fbg9TdNmKQQxOHtrAM3LmIrCLOQsqRw0A18ro0QTKHIrLM1Ppd//HLhgYVB2e7D3xJd68Q==
X-Received: by 2002:a17:906:b750:: with SMTP id
 fx16mr1114396ejb.108.1628111520374; 
 Wed, 04 Aug 2021 14:12:00 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id c22sm1425359eds.1.2021.08.04.14.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 14:12:00 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210803232110.285603-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <2e697208-a994-445a-56e6-a2da9b0f3a44@mind.be>
Date: Wed, 4 Aug 2021 23:11:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803232110.285603-1-james.hilliard1@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/2] package/desktop-file-utils: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 04/08/2021 01:21, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

 We're in the stabilisation period so we normally don't accept new packages on
master. However:

- this is needed for a fix in patch 2/2;
- it's just a host package anyway

so both applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/desktop-file-utils/desktop-file-utils.hash |  3 +++
>  package/desktop-file-utils/desktop-file-utils.mk   | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 package/desktop-file-utils/desktop-file-utils.hash
>  create mode 100644 package/desktop-file-utils/desktop-file-utils.mk
> 
> diff --git a/package/desktop-file-utils/desktop-file-utils.hash b/package/desktop-file-utils/desktop-file-utils.hash
> new file mode 100644
> index 0000000000..48623831cc
> --- /dev/null
> +++ b/package/desktop-file-utils/desktop-file-utils.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated:
> +sha256  b26dbde79ea72c8c84fb7f9d870ffd857381d049a86d25e0038c4cef4c747309  desktop-file-utils-0.26.tar.xz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/desktop-file-utils/desktop-file-utils.mk b/package/desktop-file-utils/desktop-file-utils.mk
> new file mode 100644
> index 0000000000..12f000edf2
> --- /dev/null
> +++ b/package/desktop-file-utils/desktop-file-utils.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# desktop-file-utils
> +#
> +################################################################################
> +
> +DESKTOP_FILE_UTILS_VERSION = 0.26
> +DESKTOP_FILE_UTILS_SOURCE = desktop-file-utils-$(DESKTOP_FILE_UTILS_VERSION).tar.xz
> +DESKTOP_FILE_UTILS_SITE = https://www.freedesktop.org/software/desktop-file-utils/releases
> +DESKTOP_FILE_UTILS_LICENSE = GPL-2.0+
> +DESKTOP_FILE_UTILS_LICENSE_FILES = COPYING
> +HOST_DESKTOP_FILE_UTILS_DEPENDENCIES = host-libglib2
> +
> +$(eval $(host-meson-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
