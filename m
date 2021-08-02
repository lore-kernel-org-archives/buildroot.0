Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAD7C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:29:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0590D60FC1
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 16:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0590D60FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF1B16082B;
	Mon,  2 Aug 2021 16:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aec_BYmUtgy; Mon,  2 Aug 2021 16:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC7B60644;
	Mon,  2 Aug 2021 16:29:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D64A71BF34B
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C579360644
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 16:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Qy2KdofHeiP for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 16:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDC3760635
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 16:29:36 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y12so25300955edo.6
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EA/EItTk/cKatOSXtVUy6kUTmRKQO7iv0gfoiWIORfU=;
 b=VDCfwkUVfsAwRlT7vRX04APsA0jVRtwHFjRJN8Zo9vhJZ5kRXYh26EUh6Qvbx/eJYv
 xtdqoKUaZPUzHsULn3dj40NCzNB8HM8/1gZxZ7hvj8sP3i/4FQ02QfJZys867maM+FV/
 NFV8hezFDNfTorDwK+D94FY8r7hJWGZwxYDsoeYbfkOPVqGeuuJc0fb/URVpcEZknhFc
 03XjXmN0oEVYh4KEi3BUd+1tD5WHneNcO/UjwlwHK+ifYvQg9ITjtoLFXprdCkh5SE1f
 HptCvPV0mEU228oLCnHC+4a/3CXai+kk4rXoWKcqW5BqHO1Aeq0jF5zHpj3NBXHwdgGB
 cXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EA/EItTk/cKatOSXtVUy6kUTmRKQO7iv0gfoiWIORfU=;
 b=PPdjsP6T3Z0MOfRzNWZPqpQhINVgQhwv7bpzYx5zyn3ahbKh79k55Xvoy/9n0mUU3H
 EpJlQ6+UMhO8ATZnTWRCbP8tkATfEu7b+E8NHrN1TXIcHfua7so5DJPkN2fYz0zdbJfM
 7sIE1jwxw++EK6keIy0+tYDNExn+q/VBP8Sxs7UH5NkkiU6KrTy5EJTb5JqiRHGkjyme
 /awwsnErmaJpHrG03/QYKUzxr5ccQGPMXoKb65mOSGij6AsG3I24jEuI5IW2XelkC3ja
 CTjmqUbIa6XoaNpOLyb3dmh27lzJCayH28lHCy2IhZwPEUeyyVA+IW1mdZcTz+H1ug16
 ji8w==
X-Gm-Message-State: AOAM530MEiVfRAWNztlbPvxWJ/Dzehl26A0kyfTj3DRHo/NZZ8EUxPco
 zREtTmqJb8KeAg9cF6lLGUwAA4sq+fRi4gRIRcg=
X-Google-Smtp-Source: ABdhPJza95kMa6h0OHDWBFP9kMEYiE/UYrGWuvHUrTmq6Jvwkska00HWezdHRmX2PpAlcV3gTSQgLA==
X-Received: by 2002:a50:f61b:: with SMTP id c27mr19873252edn.96.1627921775063; 
 Mon, 02 Aug 2021 09:29:35 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id g19sm6592374edu.75.2021.08.02.09.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 09:29:34 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210801212949.382493-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <100a9d35-dbfc-51b3-53bc-63785bd9c17c@mind.be>
Date: Mon, 2 Aug 2021 18:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801212949.382493-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb: fix build with gcc 11
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



On 01/08/2021 23:29, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 11:
> 
> In file included from details/shared-ptr/base.cxx:5:
> ../odb/details/shared-ptr/base.hxx:38:49: error: ISO C++17 does not allow dynamic exception specifications
>    38 | operator new (std::size_t, odb::details::share) throw (std::bad_alloc);
>       |                                                 ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cfd5f92f0aa923815edba5fbfcd5b7b312d9d40e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/libodb/libodb.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libodb/libodb.mk b/package/libodb/libodb.mk
> index f36d8957c0..11ca9de866 100644
> --- a/package/libodb/libodb.mk
> +++ b/package/libodb/libodb.mk
> @@ -11,5 +11,6 @@ LIBODB_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_VERSION_MAJOR)
>  LIBODB_INSTALL_STAGING = YES
>  LIBODB_LICENSE = GPL-2.0
>  LIBODB_LICENSE_FILES = LICENSE
> +LIBODB_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>  
>  $(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
